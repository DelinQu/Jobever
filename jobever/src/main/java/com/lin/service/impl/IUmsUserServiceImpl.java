package com.lin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lin.common.exception.ApiAsserts;
import com.lin.jwt.JwtUtil;
import com.lin.mapper.BmsFollowMapper;
import com.lin.mapper.BmsPostMapper;
import com.lin.mapper.ConfirmTokenMapper;
import com.lin.mapper.UmsUserMapper;
import com.lin.model.dto.LoginDTO;
import com.lin.model.dto.RegisterDTO;
import com.lin.model.entity.BmsFollow;
import com.lin.model.entity.BmsPost;
import com.lin.model.entity.ConfirmToken;
import com.lin.model.entity.UmsUser;
import com.lin.model.vo.PostVO;
import com.lin.model.vo.ProfileVO;
import com.lin.service.IUmsUserService;
import com.lin.utils.MD5Utils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import java.util.Date;



@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class IUmsUserServiceImpl extends ServiceImpl<UmsUserMapper, UmsUser> implements IUmsUserService {

    @Autowired
    private BmsPostMapper bmsPostMapper;
    @Autowired
    private BmsFollowMapper bmsFollowMapper;
    @Autowired
    private UmsUserMapper umsUserMapper;
    @Autowired
    private ConfirmTokenMapper confirmTokenMapper;

    @Override
    public UmsUser executeRegister(RegisterDTO dto) {
        //查询是否有相同用户名的用户
        LambdaQueryWrapper<UmsUser> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(UmsUser::getUsername, dto.getName()).or().eq(UmsUser::getEmail, dto.getEmail());
        // 伪注册用户
        UmsUser umsUser = umsUserMapper.selectOne(wrapper);
        if (!ObjectUtils.isEmpty(umsUser)) {
            if(umsUser.getActive())
                ApiAsserts.fail("账号或邮箱已存在！");
            else{   // 否则要判断验证码是否正确
                ConfirmToken cf = confirmTokenMapper.selectOne(new LambdaQueryWrapper<ConfirmToken>().eq(ConfirmToken::getUserId, umsUser.getId()));
                if (ObjectUtils.isEmpty(cf))
                    ApiAsserts.fail("请发送验证码！");
                else{
                    if(!cf.getToken().equals(dto.getCode())){
                        ApiAsserts.fail("验证码错误！");
                    }
                    else{
                        umsUser.setActive(true);
                        umsUserMapper.updateById(umsUser);
                        // 清除记录验证码
                        confirmTokenMapper.deleteById(cf.getId());
                    }
                }
            }
        }
        else
            ApiAsserts.fail("请发送验证码！");
        return umsUser;
    }

    // 密码找回
    @Override
    public UmsUser resetAccount(RegisterDTO dto) {
        //查询是否有相同用户名的用户
        LambdaQueryWrapper<UmsUser> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(UmsUser::getUsername, dto.getName()).or().eq(UmsUser::getEmail, dto.getEmail());
        // 伪注册用户
        UmsUser umsUser = umsUserMapper.selectOne(wrapper);
        if (!ObjectUtils.isEmpty(umsUser)) {
            if(!umsUser.getActive())
                ApiAsserts.fail("账号或邮箱不存在！");
            else{   // 否则要判断验证码是否正确
                ConfirmToken cf = confirmTokenMapper.selectOne(new LambdaQueryWrapper<ConfirmToken>().eq(ConfirmToken::getUserId, umsUser.getId()));
                if (ObjectUtils.isEmpty(cf))
                    ApiAsserts.fail("请发送验证码！");
                else{
                    if(!cf.getToken().equals(dto.getCode())){
                        ApiAsserts.fail("验证码错误！");
                    }
                    else{ // 更新密码并且删除记录
                        umsUser.setPassword(MD5Utils.getPwd(dto.getPass()));
                        umsUserMapper.updateById(umsUser);
                        // 清除记录验证码
                        confirmTokenMapper.deleteById(cf.getId());
                    }
                }
            }
        }
        else
            ApiAsserts.fail("帐号不存在！");
        return umsUser;
    }

    @Override
    public UmsUser getUserByUsername(String username) {
        return baseMapper.selectOne(new LambdaQueryWrapper<UmsUser>().eq(UmsUser::getUsername, username));
    }

    @Override
    public String executeLogin(LoginDTO dto) {
        String token = null;
        try {
            UmsUser user = getUserByUsername(dto.getUsername());
            String encodePwd = MD5Utils.getPwd(dto.getPassword());
            if(!encodePwd.equals(user.getPassword()))
            {
                throw new Exception("密码错误");
            }
            token = JwtUtil.generateToken(String.valueOf(user.getUsername()));
        } catch (Exception e) {
            log.warn("用户不存在or密码验证失败=======>{}", dto.getUsername());
        }
        return token;
    }

    @Override
    public ProfileVO getUserProfile(String id) {
        ProfileVO profile = new ProfileVO();
        UmsUser user = baseMapper.selectById(id);
        BeanUtils.copyProperties(user, profile);
        // 用户文章数
        int count = bmsPostMapper.selectCount(new LambdaQueryWrapper<BmsPost>().eq(BmsPost::getUserId, id));
        profile.setTopicCount(count);

        // 粉丝数
        int followers = bmsFollowMapper.selectCount((new LambdaQueryWrapper<BmsFollow>().eq(BmsFollow::getParentId, id)));
        profile.setFollowerCount(followers);

        return profile;
    }
}

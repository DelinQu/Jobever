package com.lin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lin.common.exception.ApiAsserts;
import com.lin.mapper.ConfirmTokenMapper;
import com.lin.model.dto.RegisterDTO;
import com.lin.model.entity.BmsPost;
import com.lin.model.entity.ConfirmToken;
import com.lin.model.entity.UmsUser;
import com.lin.service.ConfirmTokenSercive;
import com.lin.service.IUmsUserService;
import com.lin.utils.MD5Utils;
import com.lin.utils.TokenUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import java.util.Date;

@Slf4j
@Service
public class ConfirmTokenSerciveImpl extends ServiceImpl<ConfirmTokenMapper, ConfirmToken> implements ConfirmTokenSercive {

    @Autowired
    IUmsUserService iUmsUserService;

    @Autowired
    ConfirmTokenMapper confirmTokenMapper;

    @Autowired
    private EmailSenderService emailSenderService;

    @Value("${msg.send}")
    private String sendMsg;

    @Value("${msg.sendBack}")
    private String sendBackMsg;

    @Override
    @Transactional
    public String send(RegisterDTO dto) {
        //查询是否有相同用户名的用户
        LambdaQueryWrapper<UmsUser> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(UmsUser::getUsername, dto.getName()).or().eq(UmsUser::getEmail, dto.getEmail());
        // 已注册用户
        UmsUser umsUser = iUmsUserService.getBaseMapper().selectOne(wrapper);
        if (!ObjectUtils.isEmpty(umsUser)) {
            if(umsUser.getActive() == true)
                ApiAsserts.fail("账号或邮箱已存在！");
            else {
                // false
                // 已经存在但没有激活，则修改数据库的验证码记录
                String token= TokenUtil.creatToken();
                ConfirmToken cf = confirmTokenMapper.selectOne(new LambdaQueryWrapper<ConfirmToken>().eq(ConfirmToken::getUserId, umsUser.getId()));
                cf.setToken(token);
                confirmTokenMapper.updateById(cf);
                //发送邮箱校验
                SimpleMailMessage mailMessage = new SimpleMailMessage();
                mailMessage.setTo(umsUser.getEmail());
                mailMessage.setSubject("Complete Registration!");
                mailMessage.setFrom("qdl.cs@aliyun.com");
                mailMessage.setText(sendMsg+"\n\n"+token);
                //发送
                emailSenderService.sendEmail(mailMessage);
                return "sucess";
            }
        }
        else{
            // 没有记录，插入新的没有注册的用户，并且插入验证码
            UmsUser addUser = UmsUser.builder()
                    .username(dto.getName())
                    .alias(dto.getName())
                    .password(MD5Utils.getPwd(dto.getPass()))
                    .email(dto.getEmail())
                    .createTime(new Date())
                    .active(false)
                    .status(true)
                    .build();
            iUmsUserService.getBaseMapper().insert(addUser);
            UmsUser user = iUmsUserService.getBaseMapper().selectOne(new LambdaQueryWrapper<UmsUser>().eq(UmsUser::getEmail,addUser.getEmail()));
            // 插入验证码记录
            String token= TokenUtil.creatToken();
            ConfirmToken cf = ConfirmToken.builder()
                    .token(token)
                    .createTime(new Date())
                    .userId(user.getId())
                    .build();
            confirmTokenMapper.insert(cf);
            //发送邮箱校验
            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setTo(user.getEmail());
            mailMessage.setSubject("Complete Registration!");
            mailMessage.setFrom("qdl.cs@aliyun.com");
            mailMessage.setText(sendMsg+"\n\n"+token);
            //发送
            emailSenderService.sendEmail(mailMessage);
            return "sucess";
        }
        return null;
    }

    @Override
    public String sendBack(String email) {
        //查询是否有相同用户名的用户
        LambdaQueryWrapper<UmsUser> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(UmsUser::getEmail, email).or();
        // 已注册用户
        UmsUser umsUser = iUmsUserService.getBaseMapper().selectOne(wrapper);
        if (!ObjectUtils.isEmpty(umsUser)) {
            if(umsUser.getActive() == false)
                ApiAsserts.fail("账号不存在！");
            else {
                String token= TokenUtil.creatToken();
                ConfirmToken cf = confirmTokenMapper.selectOne(new LambdaQueryWrapper<ConfirmToken>().eq(ConfirmToken::getUserId, umsUser.getId()));
                if(!ObjectUtils.isEmpty(cf)){
                    // 已经有了验证码
                    cf.setToken(token);
                    confirmTokenMapper.updateById(cf);
                }
                else{// 直接插入
                    cf = ConfirmToken.builder()
                            .token(token)
                            .createTime(new Date())
                            .userId(umsUser.getId())
                            .build();
                    confirmTokenMapper.insert(cf);
                }

                //发送邮箱校验
                SimpleMailMessage mailMessage = new SimpleMailMessage();
                mailMessage.setTo(umsUser.getEmail());
                mailMessage.setSubject("Complete Verification!");
                mailMessage.setFrom("qdl.cs@aliyun.com");
                mailMessage.setText("用户"+umsUser.getUsername()+sendBackMsg+"\n\n"+token);
                //发送
                emailSenderService.sendEmail(mailMessage);
            }
        }
        else{
            // 没有记录
            ApiAsserts.fail("账号不存在！");
        }
        return "sucess";
    }
}

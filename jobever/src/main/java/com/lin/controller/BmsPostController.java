package com.lin.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lin.common.api.ApiResult;
import com.lin.common.exception.ApiAsserts;
import com.lin.mapper.BmsFollowMapper;
import com.lin.model.dto.CreateTopicDTO;
import com.lin.model.dto.StatusDTO;
import com.lin.model.entity.*;
import com.lin.model.vo.PostVO;
import com.lin.service.*;
import com.vdurmont.emoji.EmojiParser;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.validation.Valid;

import java.util.*;

import static com.lin.jwt.JwtUtil.USER_NAME;


@RestController
@RequestMapping("/post")
public class BmsPostController extends BaseController {

    @Resource
    private IBmsPostService iBmsPostService;
    @Resource
    private IUmsUserService umsUserService;
    @Resource
    private IBmsCommentService iBmsCommentService;
    @Resource
    private IBmsFollowPostService iBmsFollowPostService;
    @Resource
    private IBmsTopicTagService iBmsTopicTagService;
    @Resource
    private IBmsTagService iBmsTagService;

    @GetMapping("/list")
    public ApiResult<Page<PostVO>> list(@RequestParam(value = "tab", defaultValue = "latest") String tab,
                                        @RequestParam(value = "status", defaultValue = "1") Integer status,
                                        @RequestParam(value = "pageNo", defaultValue = "1")  Integer pageNo,
                                        @RequestParam(value = "size", defaultValue = "10") Integer pageSize) {
        Page<PostVO> list = iBmsPostService.getList(new Page<>(pageNo, pageSize), tab,status);
        return ApiResult.success(list);
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ApiResult<BmsPost> create(@RequestHeader(value = USER_NAME) String userName
            , @RequestBody CreateTopicDTO dto) {
        UmsUser user = umsUserService.getUserByUsername(userName);
        BmsPost topic = iBmsPostService.create(dto, user);
        return ApiResult.success(topic);
    }

    @GetMapping()
    public ApiResult<Map<String, Object>> view(@RequestParam("id") String id) {
        Map<String, Object> map = iBmsPostService.viewTopic(id);
        return ApiResult.success(map);
    }

    @GetMapping("/recommend")
    public ApiResult<List<BmsPost>> getRecommend(@RequestParam("topicId") String id) {
        List<BmsPost> topics = iBmsPostService.getRecommend(id);
        return ApiResult.success(topics);
    }

    @PostMapping("/update")
    public ApiResult<BmsPost> update(@RequestHeader(value = USER_NAME) String userName, @Valid @RequestBody BmsPost post) {
        UmsUser umsUser = umsUserService.getUserByUsername(userName);
        Assert.isTrue(umsUser.getId().equals(post.getUserId()), "只能修改自己的话题哦～");
        post.setModifyTime(new Date());
        post.setContent(EmojiParser.parseToAliases(post.getContent()));
        iBmsPostService.updateById(post);
        return ApiResult.success(post);
    }

    @DeleteMapping("/delete/{id}")
    public ApiResult<String> delete(@RequestHeader(value = USER_NAME) String userName, @PathVariable("id") String id) {
        UmsUser umsUser = umsUserService.getUserByUsername(userName);
        BmsPost byId = iBmsPostService.getById(id);
        Assert.notNull(byId, "来晚一步，话题已不存在");
        Assert.isTrue(byId.getUserId().equals(umsUser.getId()), "只能删除自己的话题哦～");
        // A.删评论
        iBmsCommentService.remove(new LambdaQueryWrapper<BmsComment>().eq(BmsComment::getTopicId,id));
        /*
        B.删标签
        1.根据id找tagIds
        2.将所有的tag找出来，设置count-1
        3.删除所有tag.count <=0 的tag
        * */
        //1.根据id找tagIds
        List<BmsTopicTag> bmsTopicTags = iBmsTopicTagService.selectByTopicId(id);
        //2.将所有的tag找出来，设置count-1
        List<String> idList = new ArrayList<>();
        bmsTopicTags.forEach(bmsTopicTag -> idList.add(bmsTopicTag.getTagId()));
        List<BmsTag> bmsTags = iBmsTagService.listByIds(idList);
        bmsTags.forEach(bmsTag -> bmsTag.setTopicCount(bmsTag.getTopicCount() - 1));
        //3.删除所有tag.count <=0 的tag
        iBmsTagService.updateBatchById(bmsTags);
        iBmsTagService.remove(new LambdaQueryWrapper<BmsTag>().eq(BmsTag::getTopicCount,0));

        // C.删关注话题
        iBmsFollowPostService.remove(new LambdaQueryWrapper<BmsFollowPost>().eq(BmsFollowPost::getPostId,id));

        // D.删文章
        iBmsPostService.removeById(id);
        return ApiResult.success(null,"删除成功");
    }


    //管理员进行文章状态修改
    @PostMapping("/admin/status")
    public ApiResult<BmsPost> status(@RequestHeader(value = USER_NAME) String userName, @Valid @RequestBody StatusDTO statusDTO) {
        UmsUser umsUser = umsUserService.getUserByUsername(userName);
        Assert.isTrue(umsUser.getId().equals(statusDTO.getUser_id()), "只能修改自己的话题状态哦～");

        BmsPost post = iBmsPostService.getById(statusDTO.getTopic_id());
        Assert.notNull(post, "来晚一步，话题已不存在");
        post.setStatus(statusDTO.getStatus());
        post.setModifyTime(new Date());

        iBmsPostService.updateById(post);
        return ApiResult.success(post);
    }

    //普通用户进行修改,只能开启或关闭
    @PostMapping("/status")
    public ApiResult<Map<String, Object>> statusOpen(@RequestHeader(value = USER_NAME) String userName,
                                                     @Valid @RequestBody StatusDTO statusDTO) {
        UmsUser umsUser = umsUserService.getUserByUsername(userName);
        if(!umsUser.getId().equals(statusDTO.getUser_id()))
            ApiAsserts.fail("只能修改自己的话题状态哦～😃");
        BmsPost post = iBmsPostService.getById(statusDTO.getTopic_id());
        Assert.notNull(post, "来晚一步，话题已不存在");
        if(statusDTO.getStatus() == 1){
            if(post.getStatus()==1)
                ApiAsserts.fail("话题已开启！");
            else if(post.getStatus()==2)
                post.setStatus(1);
        }
        else if(statusDTO.getStatus() == 2){
            if(post.getStatus()==2)
                ApiAsserts.fail("话题已关闭！");
            else if(post.getStatus()==1)
                post.setStatus(2);
        }
        post.setModifyTime(new Date());
        iBmsPostService.updateById(post);
        Map<String, Object> map = new HashMap<>(16);
        map.put("status",post.getStatus());
        return ApiResult.success(map);
    }
}

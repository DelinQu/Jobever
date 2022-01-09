package com.lin.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lin.model.vo.PostVO;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
class IBmsPostServiceTest {

    @Autowired
    IBmsPostService iBmsPostService;


    @Test
    void selectfollowPost() {
        Page<PostVO> list = iBmsPostService.selectfollowPost(new Page<>(1, 10),"1362340485431238658");
        System.out.println(list.countId());
    }
}
package com.lin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lin.model.dto.RegisterDTO;
import com.lin.model.entity.ConfirmToken;


public interface ConfirmTokenSercive extends IService<ConfirmToken> {

    //邮箱发送
    public String send(RegisterDTO dto);

    //密码找回发送
    public String sendBack(String email);
}

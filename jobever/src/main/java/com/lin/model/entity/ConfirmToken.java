package com.lin.model.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Data
@Builder
@TableName("confirm_token")
public class ConfirmToken {
    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private String id;

    @TableField("token")
    private String token;

    @TableField(value = "create_time", fill = FieldFill.UPDATE)
    private Date createTime;

    @TableField(value ="user_id")
    private String userId;
}

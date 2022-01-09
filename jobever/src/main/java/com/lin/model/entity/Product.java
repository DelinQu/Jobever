package com.lin.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Data
@Builder
@Accessors(chain = true)
@TableName("product")         //存取器。通过该注解可以控制getter和setter方法的形式,chain 若为true，则setter方法返回当前对象
@NoArgsConstructor
@AllArgsConstructor
public class Product implements Serializable {

  private static final long serialVersionUID = 1L;

  @TableId(type = IdType.AUTO)
  private long pid;

  @TableField("pname")
  private String pname;

  @TableField("price")
  private double price;
}

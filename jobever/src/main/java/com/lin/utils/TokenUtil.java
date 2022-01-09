package com.lin.utils;

import java.util.Random;

// 生成4位随机验证码
public class TokenUtil {
    public static String creatToken(){

        String s="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder token=new StringBuilder(6);

        for(int i=0;i<6;i++)
        {
            char ch=s.charAt(new Random().nextInt(s.length()));
            token.append(ch);
        }

        return token.toString();
    }
}

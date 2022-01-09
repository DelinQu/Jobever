package com.lin.controller;

import com.lin.common.api.ApiResult;
import com.lin.model.dto.RegisterDTO;
import com.lin.service.ConfirmTokenSercive;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/token")
public class ConfirmTokenController extends BaseController {

    @Resource
    private ConfirmTokenSercive confirmTokenSercive;

    @RequestMapping(value = "/send", method = RequestMethod.POST)
    public ApiResult<Map<String, Object>> send(@Valid @RequestBody RegisterDTO dto) {
        Map<String, Object> map = new HashMap<>();
        String msg = confirmTokenSercive.send(dto);
        map.put("msg",msg);
        return ApiResult.success(map);
    }

    @RequestMapping(value = "/sendBack", method = RequestMethod.POST)
    public ApiResult<Map<String, Object>> sendBack(@Valid @RequestBody RegisterDTO dto) {
        Map<String, Object> map = new HashMap<>();
        String msg = confirmTokenSercive.sendBack(dto.getEmail());
        map.put("msg",msg);
        return ApiResult.success(map);
    }
}

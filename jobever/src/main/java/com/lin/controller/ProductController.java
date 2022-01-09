package com.lin.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.lin.common.api.ApiResult;
import com.lin.model.entity.BmsBillboard;
import com.lin.model.entity.Product;
import com.lin.service.IBmsBillboardService;
import com.lin.service.ProductService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/product")
public class ProductController extends BaseController {

    @Resource
    private ProductService productService;

    @GetMapping("/get")
    public ApiResult<List<Product>> getNotices(){
        List<Product> list = productService.getBaseMapper().selectList(
                new LambdaQueryWrapper<Product>());
        return ApiResult.success(list);
    }
}

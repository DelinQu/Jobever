package com.lin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lin.mapper.BmsBillboardMapper;
import com.lin.mapper.ProductMapper;
import com.lin.model.entity.BmsBillboard;
import com.lin.model.entity.Product;
import com.lin.service.IBmsBillboardService;
import com.lin.service.ProductService;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl extends ServiceImpl<ProductMapper, Product> implements ProductService {
}

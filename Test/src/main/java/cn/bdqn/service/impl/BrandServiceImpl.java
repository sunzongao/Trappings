package cn.bdqn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.BrandMapper;
import cn.bdqn.pojo.Brand;
import cn.bdqn.service.BrandService;

@Service
public class BrandServiceImpl implements BrandService{

	@Autowired
	private BrandMapper brandMapper;
	
	public List<Brand> queryBrand() {
		return brandMapper.queryBrand();
	}

}

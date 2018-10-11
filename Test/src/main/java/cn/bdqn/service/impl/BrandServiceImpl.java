package cn.bdqn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.bdqn.mapper.BrandMapper;
import cn.bdqn.pojo.Brand;
import cn.bdqn.service.BrandService;
@Service("brandService")
public class BrandServiceImpl implements BrandService {

	@Resource(name="brandMapper")
	private BrandMapper brandMapper;
	
	@Override
	public List<Brand> queryBrand() {
		return brandMapper.queryBrand();
	}

}

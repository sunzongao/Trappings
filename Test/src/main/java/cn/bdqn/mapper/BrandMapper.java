package cn.bdqn.mapper;

import java.util.List;

import cn.bdqn.pojo.Brand;

/**
 * 商品品牌接口
 * @author GCL105659
 *
 */
	//查询品牌
public interface BrandMapper {
	//查询品牌表所
	public List<Brand> queryBrand();
}

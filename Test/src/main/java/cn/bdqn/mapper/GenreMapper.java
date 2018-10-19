package cn.bdqn.mapper;

import java.util.List;

import cn.bdqn.pojo.Genre;

/**
 * 商品类别接口
 * @author GCL105659
 *
 */
public interface GenreMapper {
	//查询类别
	public List<Genre> queryGenre();
}

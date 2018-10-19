package cn.bdqn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.GenreMapper;
import cn.bdqn.pojo.Genre;
import cn.bdqn.service.GenreService;
@Service
public class GenreServiceImpl implements GenreService{
		
	@Autowired
	private GenreMapper genreMapper;

	public List<Genre> queryGenre() {
		return genreMapper.queryGenre();
	}
	
}

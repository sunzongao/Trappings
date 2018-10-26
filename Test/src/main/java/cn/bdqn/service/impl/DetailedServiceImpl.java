package cn.bdqn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.bdqn.mapper.DetailedMapper;
import cn.bdqn.pojo.Detailed;
import cn.bdqn.service.DetailedService;

@Service
public class DetailedServiceImpl implements DetailedService{
	
	@Autowired
	private DetailedMapper detailedMapper;
	
	public List<Detailed> query(String procurementId) {
		return detailedMapper.query(procurementId);
	}

	

	public int deleteDetailed(Integer id) {
		return detailedMapper.deleteDetailed(id);
	}

	public Detailed getDetailedById(int id) {
		return detailedMapper.getDetailedById(id);
	}



	public int addDetailed(String procurementId, String commodityId, Integer number, Double price) {
		return detailedMapper.addDetailed(procurementId, commodityId, number, price);
	}



	public Detailed getDetailedById(Integer id) {
		return detailedMapper.getDetailedById(id);
	}



	public int updateDetailed(Integer id, Double price, Integer number) {
		return detailedMapper.updateDetailed(id, price, number);
	}

}

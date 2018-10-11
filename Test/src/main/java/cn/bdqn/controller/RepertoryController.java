package cn.bdqn.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.bdqn.pojo.Brand;
import cn.bdqn.pojo.Repertory;
import cn.bdqn.pojo.Storehouse;
import cn.bdqn.pojo.Unit;
import cn.bdqn.service.BrandService;
import cn.bdqn.service.RepertoryService;
import cn.bdqn.service.StorehouseService;
import cn.bdqn.service.UnitService;
import cn.bdqn.util.PageUtil;

@Controller	
public class RepertoryController {

	@Resource(name="repertoryService")
	private RepertoryService repertoryService;
	
	@Resource(name="storehouseService")
	private	StorehouseService storehouseService;
	
	@Resource(name="unitService")
	private UnitService unitService;
	
	@Resource(name="brandService")
	private BrandService brandService;
	
	@RequestMapping("/jsp/repertoryList.html")
	public String repertoryList(String laidTime, @RequestParam(defaultValue
			="0")int unitId, @RequestParam(defaultValue="0")int brandId,
			@RequestParam(defaultValue="0")int storehouseId,
			@RequestParam(defaultValue="1")int currenntPage,Model model) {
		List<Storehouse> storehouses = storehouseService.queryStorehouse();
		List<Unit> units = unitService.queryUnit();
		List<Brand> brands = brandService.queryBrand();
		PageUtil<Repertory> pageUtil = repertoryService.queryRepertory(laidTime, unitId, brandId, storehouseId, currenntPage, 2);
		model.addAttribute("laidTime", laidTime);
		model.addAttribute("unitId", unitId);
		model.addAttribute("brandId", brandId);
		model.addAttribute("storehouseId", storehouseId);
		model.addAttribute("storehouses", storehouses);
		model.addAttribute("currenntPage", currenntPage);
		model.addAttribute("units", units);
		model.addAttribute("brands", brands);
		model.addAttribute("pageUtil", pageUtil);
		return "repertoryList";
	}
	
}

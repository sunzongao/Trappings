package cn.bdqn.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.pojo.Brand;
import cn.bdqn.pojo.Commodity;
import cn.bdqn.pojo.Data;
import cn.bdqn.pojo.Repertory;
import cn.bdqn.pojo.Storehouse;
import cn.bdqn.pojo.Unit;
import cn.bdqn.service.BrandService;
import cn.bdqn.service.CommodityService;
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
	
	@Resource(name="commodityService")
	private CommodityService commodityService;
	
	//��ѯ����ҳ
	@RequestMapping("/jsp/repertoryList.html")
	public String repertoryList(String laidTime, @RequestParam(defaultValue
			="0")int unitId, @RequestParam(defaultValue="0")int brandId,
			@RequestParam(defaultValue="0")int storehouseId,
			@RequestParam(defaultValue="1")int currenntPage,
			Model model) {
		//��ȡ�ֿ⼯��
		List<Storehouse> storehouses = storehouseService.queryStorehouse();
		//��ȡ��Ʒ��λ����
		List<Unit> units = unitService.queryUnit();
		//��ȡ��ƷƷ�Ƽ���
		List<Brand> brands = brandService.queryBrand();
		//�����Ʒ��ż���
		List<Commodity> commoditys = commodityService.queryCommodityIdAndCName();
		PageUtil<Repertory> pageUtil = repertoryService.queryRepertory(laidTime, unitId, brandId, storehouseId, currenntPage, 2);
		model.addAttribute("laidTime", laidTime);
		model.addAttribute("unitId", unitId);
		model.addAttribute("brandId", brandId);
		model.addAttribute("storehouseId", storehouseId);
		model.addAttribute("storehouses", storehouses);
		model.addAttribute("currenntPage", currenntPage);
		model.addAttribute("units", units);
		model.addAttribute ("brands", brands);
		model.addAttribute("commoditys", commoditys);
		model.addAttribute("pageUtil", pageUtil);
		return "repertoryList";
	}
	
	
	//��Ʒ��Ŷ�������
	@RequestMapping(value="/AjaxErJiLianDong",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String xianshi(String CommodityId,String cName,Model model) {
		Commodity commodity = commodityService.getCommodityIdByCName(CommodityId);
		return commodity.getcName();
	}
	/**
	 * �������
	 * @param repertory
	 * @return
	 */
	@RequestMapping("/jsp/addRepertory")
	@ResponseBody
	public Object addRepertory(Repertory repertory) {
		if(repertoryService.addRepertory(repertory)>0) {
			SimpleDateFormat st = new SimpleDateFormat("yyyy-MM-dd");
			String laidTime = st.format(new Data());
			repertory.setLaidTime(laidTime);
			return 1;
		}
		return 0;
	}
	
}

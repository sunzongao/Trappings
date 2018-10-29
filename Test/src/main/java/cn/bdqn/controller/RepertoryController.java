package cn.bdqn.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.sql.visitor.functions.If;

import cn.bdqn.pojo.Brand;
import cn.bdqn.pojo.Commodity;
import cn.bdqn.pojo.Data;
import cn.bdqn.pojo.Detail;
import cn.bdqn.pojo.Repertory;
import cn.bdqn.pojo.Storehouse;
import cn.bdqn.pojo.Supplier;
import cn.bdqn.pojo.Unit;
import cn.bdqn.service.BrandService;
import cn.bdqn.service.CommodityService;
import cn.bdqn.service.DetailService;
import cn.bdqn.service.RepertoryService;
import cn.bdqn.service.StorehouseService;
import cn.bdqn.service.SupplierService;
import cn.bdqn.service.UnitService;
import cn.bdqn.util.PageUtil;

/**
 * 库存表控制器
 * 
 * @author Administrator
 *
 */
@Controller
public class RepertoryController {

	@Autowired
	private RepertoryService repertoryService;

	@Autowired
	private StorehouseService storehouseService;

	@Autowired
	private UnitService unitService;

	@Autowired
	private BrandService brandService;

	@Autowired
	private CommodityService commodityService;

	@Autowired
	private SupplierService supplierService;
	

	// 查询、分页
	@RequestMapping("/jsp/repertoryList.html")
	public String repertoryList(String laidTime, @RequestParam(defaultValue = "0") int unitId,
			@RequestParam(defaultValue = "0") int brandId, @RequestParam(defaultValue = "0") int storehouseId,
			@RequestParam(defaultValue = "1") int currenntPage, Model model) {
		// 获取仓库集合
		List<Storehouse> storehouses = storehouseService.queryStorehouse();
		// 获取商品单位集合
		List<Unit> units = unitService.queryUnit();
		// 获取商品品牌集合
		List<Brand> brands = brandService.queryBrand();
		// 获得商品编号集合
		List<Commodity> commoditys = commodityService.queryCommodityIdAndCName();
		// 获得供应商集合
		List<Supplier> suppliers = supplierService.queryByName();
		PageUtil<Repertory> pageUtil = repertoryService.queryRepertory(laidTime, unitId, brandId, storehouseId,
				currenntPage);
		model.addAttribute("laidTime", laidTime);
		model.addAttribute("unitId", unitId);
		model.addAttribute("brandId", brandId);
		model.addAttribute("storehouseId", storehouseId);
		model.addAttribute("suppliers", suppliers);
		model.addAttribute("storehouses", storehouses);
		model.addAttribute("currenntPage", currenntPage);
		model.addAttribute("units", units);
		model.addAttribute("brands", brands);
		model.addAttribute("commoditys", commoditys);
		model.addAttribute("pageUtil", pageUtil);
		return "repertoryList";
	}

	// 商品编号二级联动
	@RequestMapping(value = "/AjaxErJiLianDong", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String xianshi(String CommodityId, String cName, Model model) {
		Commodity commodity = commodityService.getCommodityIdByCName(CommodityId);
		if (commodity == null) {
			return "0";
		} else {
			return commodity.getcName();
		}
	}

	/**
	 * 新增库存
	 * 
	 * @param repertory
	 * @return
	 */
	@RequestMapping("/jsp/addRepertory")
	@ResponseBody
	public String addRepertory(Repertory repertory, Model model) {
		if (repertoryService.addRepertory(repertory) > 0) {
			return "true";
		}
		return "false";
	}

	/**
	 * 删除库存
	 * 
	 * @param commodityId
	 * @return
	 */
	@RequestMapping("/jsp/deleteRepertory")
	@ResponseBody
	public String deleteRepertory(String commodityId, int inventory) {
		if (repertoryService.deleteRepertoy(commodityId, inventory) > 0) {
			return "true";
		} else {
			return "false";
		}
	}

	/**
	 * 跳转修改页面
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/repertoryUpdate")
	public String getById(String id, Model model) {
		id = id.substring(12, id.length());
		Repertory repertory = repertoryService.getById(id);
		// 获取仓库集合
		List<Storehouse> storehouses = storehouseService.queryStorehouse();
		// 获取商品单位集合
		List<Unit> units = unitService.queryUnit();
		// 获取商品品牌集合
		List<Brand> brands = brandService.queryBrand();
		// 获得商品编号集合
		List<Commodity> commoditys = commodityService.queryCommodityIdAndCName();
		// 获得供应商集合
		List<Supplier> suppliers = supplierService.queryByName();
		model.addAttribute("repertory", repertory);
		model.addAttribute("storehouses", storehouses);
		model.addAttribute("units", units);
		model.addAttribute("brands", brands);
		model.addAttribute("commoditys", commoditys);
		model.addAttribute("suppliers", suppliers);
		return "repertoryUpdate";
	}

	/**
	 * 处理修改页面
	 * @param repertory
	 * @return
	 */
	@RequestMapping("/jsp/doRepertoryUpdate")
	@ResponseBody
	public String updateRepertory(Repertory repertory) {
		if (repertoryService.updateRepertory(repertory) > 0) {
			return "true";
		}
		return "false";
	}

	/**
	 * 根据commodityId查重
	 * @param commodityId
	 * @return
	 */
	@RequestMapping("/jsp/chaChong")
	@ResponseBody
	public String chaChong(String commodityId) {
		if (repertoryService.getById(commodityId) != null) {
			return "true";
		}
		return "false";
	}

	/**
	 * 跳转到修改最低库存页面
	 * @param repertorys
	 * @return
	 */
	@RequestMapping("/jsp/toUpdateRepertoryAllMinimumStock")
	public String toUpdateRepertoryAllMinimumStock(Repertory repertorys) {
		return "updateRepertoryAllMinimumStock";
	}

	/**
	 * 修改最低库存
	 * @param repertory
	 * @return
	 */
	@RequestMapping("/jsp/updateRepertoryAllMinimumStock")
	@ResponseBody
	public String updateRepertoryAllMinimumStock(Repertory repertory) {
		if (repertoryService.updateRepertoryAllMinimumStock(repertory) > 0) {
			return "true";
		}
		return "false";
	}


	

}

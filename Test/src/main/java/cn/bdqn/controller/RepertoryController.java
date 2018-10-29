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
 * ���������
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
	

	// ��ѯ����ҳ
	@RequestMapping("/jsp/repertoryList.html")
	public String repertoryList(String laidTime, @RequestParam(defaultValue = "0") int unitId,
			@RequestParam(defaultValue = "0") int brandId, @RequestParam(defaultValue = "0") int storehouseId,
			@RequestParam(defaultValue = "1") int currenntPage, Model model) {
		// ��ȡ�ֿ⼯��
		List<Storehouse> storehouses = storehouseService.queryStorehouse();
		// ��ȡ��Ʒ��λ����
		List<Unit> units = unitService.queryUnit();
		// ��ȡ��ƷƷ�Ƽ���
		List<Brand> brands = brandService.queryBrand();
		// �����Ʒ��ż���
		List<Commodity> commoditys = commodityService.queryCommodityIdAndCName();
		// ��ù�Ӧ�̼���
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

	// ��Ʒ��Ŷ�������
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
	 * �������
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
	 * ɾ�����
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
	 * ��ת�޸�ҳ��
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/repertoryUpdate")
	public String getById(String id, Model model) {
		id = id.substring(12, id.length());
		Repertory repertory = repertoryService.getById(id);
		// ��ȡ�ֿ⼯��
		List<Storehouse> storehouses = storehouseService.queryStorehouse();
		// ��ȡ��Ʒ��λ����
		List<Unit> units = unitService.queryUnit();
		// ��ȡ��ƷƷ�Ƽ���
		List<Brand> brands = brandService.queryBrand();
		// �����Ʒ��ż���
		List<Commodity> commoditys = commodityService.queryCommodityIdAndCName();
		// ��ù�Ӧ�̼���
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
	 * �����޸�ҳ��
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
	 * ����commodityId����
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
	 * ��ת���޸���Ϳ��ҳ��
	 * @param repertorys
	 * @return
	 */
	@RequestMapping("/jsp/toUpdateRepertoryAllMinimumStock")
	public String toUpdateRepertoryAllMinimumStock(Repertory repertorys) {
		return "updateRepertoryAllMinimumStock";
	}

	/**
	 * �޸���Ϳ��
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

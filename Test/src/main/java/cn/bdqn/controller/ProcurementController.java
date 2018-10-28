package cn.bdqn.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.pojo.Commodity;
import cn.bdqn.pojo.Detailed;
import cn.bdqn.pojo.Procurement;
import cn.bdqn.pojo.Storehouse;
import cn.bdqn.pojo.Supplier;
import cn.bdqn.pojo.User;
import cn.bdqn.service.CommodityService;
import cn.bdqn.service.DetailedService;
import cn.bdqn.service.ProcurementService;
import cn.bdqn.service.StorehouseService;
import cn.bdqn.service.SupplierService;
import cn.bdqn.service.UserService;
import cn.bdqn.util.JSONUtils;
import cn.bdqn.util.PageUtil;


/**
 * 采购表
 * @author GCL105659
 *
 */
@Controller
public class ProcurementController {
	
	@Autowired
	private ProcurementService procurementService;
	
	@Autowired
	private SupplierService supplierService;
	
	@Autowired
	private StorehouseService storehouseService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommodityService commodityService;
	
	@Autowired
	private DetailedService detailedService;
	/**
	 * 显示采购单
	 * @param pageindex
	 * @param procurementId
	 * @param begintime
	 * @param endtime
	 * @param condition
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/procurement_list.html")
	public String procurementList(String pageindex,String procurementId,String begintime, String endtime,Integer condition,Model model) {
		int temp=1;
		if(pageindex!=null) {
			temp=Integer.parseInt(pageindex);
		}
		PageUtil<Procurement> pageUtil = procurementService.queryProcurement(procurementId, -1, begintime, endtime, temp);
		model.addAttribute("pageUtil",pageUtil);
		model.addAttribute("procurementId",procurementId);
		model.addAttribute("begintime",begintime);
		model.addAttribute("endtime",endtime);
		model.addAttribute("condition",condition);
		return "Procurement_list";
	}
	/**
	 * 显示采购单审核页面
	 * @param pageindex
	 * @param procurementId
	 * @param begintime
	 * @param endtime
	 * @param condition
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/procurement_lists.html")
	public String procurementLists(String pageindex,String procurementId,String begintime, String endtime,Integer condition,Model model) {
		int temp=1;
		if(pageindex!=null) {
			temp=Integer.parseInt(pageindex);
		}
		PageUtil<Procurement> pageUtil = procurementService.queryProcurement(procurementId, 2, begintime, endtime, temp);
		model.addAttribute("pageUtil",pageUtil);
		model.addAttribute("procurementId",procurementId);
		model.addAttribute("begintime",begintime);
		model.addAttribute("endtime",endtime);
		model.addAttribute("condition",condition);
		return "Procurement_lists";
	}
	/**
	 * 显示仓管员创建采购单页面
	 * @param pageindex
	 * @param procurementId
	 * @param begintime
	 * @param endtime
	 * @param condition
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/procurement_list1.html")
	public String procurementList1(String pageindex,String procurementId,String begintime, String endtime,Integer condition,Model model) {
		int temp=1;
		if(pageindex!=null) {
			temp=Integer.parseInt(pageindex);
		}
		PageUtil<Procurement> pageUtil = procurementService.queryProcurement(procurementId, -2, begintime, endtime, temp);
		model.addAttribute("pageUtil",pageUtil);
		model.addAttribute("procurementId",procurementId);
		model.addAttribute("begintime",begintime);
		model.addAttribute("endtime",endtime);
		model.addAttribute("condition",condition);
		model.addAttribute("flag",1);
		return "Procurement_list1";
	}
	
	
	/**
	 * 显示采购单审核页面
	 * @param pageindex
	 * @param procurementId
	 * @param begintime
	 * @param endtime
	 * @param condition
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/procurement_list2.html")
	public String procurementList2(String pageindex,String procurementId,String begintime, String endtime,Integer condition,Model model) {
		int temp=1;
		if(pageindex!=null) {
			temp=Integer.parseInt(pageindex);
		}
		PageUtil<Procurement> pageUtil = procurementService.queryProcurement(procurementId, 6, begintime, endtime, temp);
		model.addAttribute("pageUtil",pageUtil);
		model.addAttribute("procurementId",procurementId);
		model.addAttribute("begintime",begintime);
		model.addAttribute("endtime",endtime);
		model.addAttribute("condition",condition);
		return "Procurement_list2";
	}
	
	/**
	 * 审核采购单
	 * @param employee
	 * @return
	 */
	@RequestMapping("/jsp/procurement_shen.html")
	@ResponseBody
	public String procurementShen(Procurement p) {
		if(procurementService.update(p)>0) {
			return "true";
		}else {
			return "false";
		}
	}
	
	/**
	 * 发布采购单
	 * @param employee
	 * @return
	 */
	@RequestMapping("/jsp/procurement_fabu.html")
	@ResponseBody
	public String procurementFaBu(Procurement p) {
		if(procurementService.update(p)>0) {
			return "true";
		}else {
			return "false";
		}
	}
	
	
	/**
	 * 签收采购单
	 * @param employee
	 * @return
	 */
	@RequestMapping("/jsp/procurement_qianshou.html")
	@ResponseBody
	public String procurementQianshou(Procurement p) {
		if(procurementService.updateSign(p)>0) {
			return "true";
		}else {
			return "false";
		}
	}
	
	
	/**
	 * 显示采购单详细信息
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/procurement_show.html")
	public String procurementShow(String id,Model model) {
		id=id.substring(12, id.length());
		Double sum=0.0;
		
		List<Procurement> procurement=procurementService.getProcurementByCode(id);
		for (Detailed d : procurement.get(0).getdList()) {
			sum+=d.getPrice()*d.getNumber();
		}
		sum = (double)Math.round(sum*100)/100;
		model.addAttribute("sum",sum);
		model.addAttribute("procurement",procurement.get(0));
		return "procurement_show";
	}
	
	
	/**
	 * 进入创建采购单页面
	 * @param model
	 * @param commodityId
	 * @return
	 */
	@RequestMapping("/jsp/procurement_toadd.html")
	public String procurementToAdd(Model model) {
		List<Supplier> suppliers=supplierService.querySuppliers();
		List<Storehouse> storehouses=storehouseService.queryStorehouse();
		List<User> users=userService.queryUsers();
		model.addAttribute("suppliers",suppliers);
		model.addAttribute("storehouses",storehouses);
		model.addAttribute("users",users);
		return "add_procurement";
	}
	
	
	/**
	 * 创建采购单
	 * @param employee
	 * @return
	 */
	@RequestMapping("/jsp/procurement_doadd.html")
	@ResponseBody
	public String procurementDoAdd(Procurement p) {
		if(procurementService.addProcurement(p)>0) {
			return "true";
		}else {
			return "false";
		}
	}
	
	
	/**
	 * 商品查询
	 * @return
	 */
	@RequestMapping(value="/jsp/show_procurement.html",produces="text/html;charset=UTF-8;")
	@ResponseBody
	public String showProcurement(String commodityId,String supplierId){
		List<Commodity> commodities=commodityService.queryCommodityById(commodityId,supplierId);
		return JSONUtils.beanToJson(commodities);
	}
	
	
	
	
	/**
	 * 进入修改页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/procurement_toupdate.html")
	public String procurementToUpdate(String id,Model model) {
		Double sum=0.0;
		List<Procurement> procurement=procurementService.getProcurementById(id);
		for (Detailed d : procurement.get(0).getdList()) {
			sum+=d.getPrice()*d.getNumber();
		}
		sum = (double)Math.round(sum*100)/100;
		model.addAttribute("sum",sum);
		model.addAttribute("procurement",procurement.get(0));
		List<Storehouse> storehouses=storehouseService.queryStorehouse();
		List<User> users=userService.queryUsers();
		model.addAttribute("storehouses",storehouses);
		model.addAttribute("users",users);
		return "procurement_update";
	}
	
	
	/**
	 * 删除采购单商品
	 * @param supplierId
	 * @return
	 */
	@RequestMapping("/jsp/detailed_delete.html")
	@ResponseBody
	public String deleteDetailed(int id) {
		if (detailedService.deleteDetailed(id)>0) {
			return "true";
		} else {
			return "false";
		}
	}
	
	
	/**
	 * 修改采购信息
	 * @param s
	 * @return
	 */
	@RequestMapping("/jsp/procurement_doupdate.html")
	@ResponseBody
	public String procurementDoUpdate(Procurement p,String id,String price,
			String number) {
		String[] split1 = number.split(",");
		String[] split2 = price.split(",");
		String[] split = id.split(",");
		if(procurementService.updateProcurement(p)>0) {
			for (int i = 0; i < split.length && i < split1.length && i < split2.length; i++) {
				detailedService.updateDetailed(Integer.parseInt(split[i]), Double.parseDouble(split2[i]),Integer.parseInt(split1[i]));
			}
			return "true";
		}else {
			return "false";
		}
	}
	
	
}

package cn.bdqn.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.SmartInitializingSingleton;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.pojo.Employee;
import cn.bdqn.pojo.Supplier;
import cn.bdqn.service.SupplierService;
import cn.bdqn.util.PageUtil;

/**
 * 供应商控制层
 * @author GCL105659
 *
 */
@Controller
public class SupplierController {
	
	@Autowired
	private SupplierService supplierService;
	
	
	/**
	 * 查看供应商列表
	 * @param pageindex
	 * @param sName
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/supplier_list.html")
	public String supplierList(String pageindex,String sName,Model model) {
		int temp=1;
		if(pageindex!=null) {
			temp=Integer.parseInt(pageindex);
		}
		
		PageUtil<Supplier> pageUtil = supplierService.querySupplier(sName, temp);
		model.addAttribute("pageUtil",pageUtil);
		model.addAttribute("sName",sName);
		return "supplier_list";
	}
	
	
	
	@RequestMapping("/jsp/supplier_show.html")
	public String supplierShow(String id,Model model) {
		id=id.substring(12, id.length());
		Supplier supplier=supplierService.getSupplierById(id);
		model.addAttribute("supplier",supplier);
		return "supplier_show";
	}
	
	@RequestMapping("/jsp/supplier_toupdate.html")
	public String supplierToUpdate(String id,Model model) {
		id=id.substring(12, id.length());
		Supplier supplier=supplierService.getSupplierById(id);
		model.addAttribute("supplier",supplier);
		return "supplier_update";
	}
	
	@RequestMapping("/jsp/supplier_doupdate.html")
	@ResponseBody
	public String supplierToUpdate(Supplier s) {
		
		return "supplier_update";
	}
	
	
}

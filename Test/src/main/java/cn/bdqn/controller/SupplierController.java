package cn.bdqn.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.pojo.Employee;
import cn.bdqn.pojo.Supplier;
import cn.bdqn.service.SupplierService;
import cn.bdqn.util.PageUtil;

/**
 * ��Ӧ�̿��Ʋ�
 * @author GCL105659
 *
 */
@Controller
public class SupplierController {
	
	@Autowired
	private SupplierService supplierService;
	
	
	/**
	 * �鿴��Ӧ���б�
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
	
	
	/**
	 * ��ʾ��Ӧ����ϸ��Ϣ
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/supplier_show.html")
	public String supplierShow(String id,Model model) {
		id=id.substring(12, id.length());
		Supplier supplier=supplierService.getSupplierById(id);
		model.addAttribute("supplier",supplier);
		return "supplier_show";
	}
	
	
	/**
	 * �����޸�ҳ��
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/supplier_toupdate.html")
	public String supplierToUpdate(String id,Model model) {
		id=id.substring(12, id.length());
		Supplier supplier=supplierService.getSupplierById(id);
		model.addAttribute("supplier",supplier);
		return "supplier_update";
	}
	
	
	/**
	 * �޸Ĺ�Ӧ����Ϣ
	 * @param s
	 * @return
	 */
	@RequestMapping("/jsp/supplier_doupdate.html")
	@ResponseBody
	public String supplierToUpdate(Supplier s) {
		if(supplierService.updateSupplier(s)>0) {
			return "true";
		}else {
			return "false";
		}
	}
	
	/**
	 * ɾ����Ӧ��
	 * @param supplierId
	 * @return
	 */
	@RequestMapping("/jsp/supplier_delete.html")
	@ResponseBody
	public String deleteSupplier(String supplierId) {
		if (supplierService.deleteSupplier(supplierId)>0) {
			return "true";
		} else {
			return "false";
		}
	}
	
	/**
	 * ����ɾ��
	 */
	@RequestMapping("/jsp/supplier_todelete.html")
	@ResponseBody
	public String deleteitem(String id) {
		String[] split = id.split(",");
		String a = "";
		for (int i = 0; i < split.length; i++) {
			if (supplierService.deleteSupplier(split[i]) > 0) {
				a = "true";
			} else {
				a = "false";
			}
		}
		return a;
	}
	
	/**
	 * ��ӹ�Ӧ��ҳ��
	 * @return
	 */
	@RequestMapping("/jsp/add_tosupplier.html")
	public String toAddSupplier() {
		return "add_supplier";
	}
	
	/**
	 * ������Ӧ��
	 * @param employee
	 * @return
	 */
	@RequestMapping("/jsp/add_dosupplier.html")
	@ResponseBody
	public String doAddSupplier(Supplier s) {
		if(supplierService.addSupplier(s)>0) {
			return "true";
		}else {
			return "false";
		}
	}
	
	/**
	 * ��Ų���
	 */
	@RequestMapping("/jsp/supplier_checkid.html")
	@ResponseBody
	public String checkId(String supplierId) {
		if(supplierService.getSupplierById(supplierId)!=null) {
			return "true";
		}else {
			return "false";
		}
	}
	
	
}

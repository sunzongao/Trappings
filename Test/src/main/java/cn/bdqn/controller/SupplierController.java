package cn.bdqn.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	@RequestMapping("/jsp/supplierList.html")
	public String supplierList(HttpServletRequest request,Model model) {
		String sName=request.getParameter("sName");
		Map<String, Object> map =new HashMap<String,Object>();
		map.put("pageSize", 5);
		map.put("sName", sName);
		String currentPage=request.getParameter("currentPage");
		
		if(currentPage==null)
		map.put("currentPage", 1);
		else
		map.put("currentPage", Integer.parseInt(currentPage));
		PageUtil<Supplier> pageUtil=supplierService.querySupplier(map);
		model.addAttribute("page", pageUtil);
			
		return "supplier_list";
	}
	
	
}

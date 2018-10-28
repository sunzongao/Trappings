package cn.bdqn.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.pojo.Customer;
import cn.bdqn.pojo.Customertype;
import cn.bdqn.service.CustomerService;
import cn.bdqn.service.CustomertypeService;
import cn.bdqn.util.PageUtil;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	@Autowired
	private CustomertypeService customertypeService;
	
	 
	@RequestMapping("/jsp/customerShow.html")
	public String customerShow(String cName,@RequestParam(defaultValue="0")int cId,Model model,@RequestParam(defaultValue="1")int currentPage)throws Exception{
		List<Customertype>lists = customertypeService.query();
		
		PageUtil<Customer> pageUtils = customerService.queryAll(cName, cId, currentPage, 2);
		model.addAttribute("pageUtils", pageUtils);
		model.addAttribute("lists", lists);
		model.addAttribute("cName", cName);
		model.addAttribute("cId", cId);
		return "customerShow";
	}
	
//	
//	@RequestMapping("/jsp/toadd.html")
//	public String toadd(Model model)throws Exception{
//		List<Customertype>lists = customertypeService.query();
//		model.addAttribute("lists", lists);
//		return "customerAdd";
//	}
	
	@RequestMapping(value="/jsp/doadd", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doadd(Customer customer,Model model){	
		List<Customertype> lists = customertypeService.query();
		model.addAttribute("lists", lists);
		if(customerService.add(customer)>0) {
			return "true";	
		}
		return "false";
	}
	
	@RequestMapping("/jsp/del")
	@ResponseBody
	public String delete(String customerId){
		if(customerService.delete(customerId)>0) {
			return "true";
		}
		return "false";
	}
	
	
	@RequestMapping("/jsp/doupdate.html")
	public String doupdate(String customerId,Model model)throws Exception{
		List<Customertype>lists = customertypeService.query();
    	model.addAttribute("lists", lists);
    	Customer customer = customerService.updateById(customerId);
		model.addAttribute("customerId", customerId);
		model.addAttribute("customer", customer);
		return "customerUpdate";
	}
	
	@RequestMapping("/jsp/update.html")
	@ResponseBody
	public String update(Customer customer,Model model){
		if(customerService.update(customer)>0){
			return "true";
		}
		return "false";
	}
	
}

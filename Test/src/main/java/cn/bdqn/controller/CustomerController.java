package cn.bdqn.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	@Resource(name="customerService")
	private CustomerService customerService;
	@Resource(name="customertypeService")
	private CustomertypeService customertypeService;
	
	
	@RequestMapping("/jsp/customerShow.html")
	public String customerShow(String cName,@RequestParam(defaultValue="0")int cId,Model model,@RequestParam(defaultValue="1")int currentPage)throws Exception{
		List<Customertype>lists = customertypeService.query();
		
		PageUtil<Customer> pageUtils = customerService.queryAll(cName, cId, currentPage, 2);
		model.addAttribute("pageUtils", pageUtils);
		model.addAttribute("lists", lists);
		model.addAttribute("cName", cName);
		model.addAttribute("cId", cId);
		return "Advertising_sort";
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
	public Object doadd(Customer customer,Model model)throws Exception{	
		List<Customertype>lists = customertypeService.query();
    	model.addAttribute("lists", lists);
		int result=customerService.add(customer);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("result", result);
		return map;
	}
	
	@RequestMapping("/jsp/del")
	public Object delete(int customerId)throws Exception{
		if(customerService.delete(customerId)>0) {
			return 1;
		}
		return 0;
	}
	
	
	@RequestMapping("/jsp/doupdate/{id}")
	public String doupdate(@PathVariable int id,Model model,HttpServletRequest request)throws Exception{
		List<Customertype>lists = customertypeService.query();
    	model.addAttribute("lists", lists);
    	Customer customer = customerService.updateById(id);
		model.addAttribute("id", id);
		model.addAttribute("customer", customer);
		return "customerUpdate";
	}
	@RequestMapping("/jsp/update.html")
	public String update(Customer customer,Model model)throws Exception{
		if(customerService.update(customer)>0){
			return "forward:/show.html";
		}
		return "update";
	}
	
}

package cn.bdqn.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
	@RequestMapping("/Advertising_sort.html")
	public String customerShow(String cName,@RequestParam(defaultValue="0")int cId,Model model,@RequestParam(defaultValue="1")int currentPage)throws Exception{
		PageUtil<Customer> pageUtils = customerService.queryAll(cName, cId, currentPage, 2);
		model.addAttribute("pageUtils", pageUtils);
		List<Customertype>lists = customertypeService.query();
		model.addAttribute("lists", lists);
		model.addAttribute("cName", cName);
		model.addAttribute("cId", cId);
		return "Advertising_sort";
	}
	
	@RequestMapping("/toadd.html")
	public String toadd(Model model)throws Exception{
		List<Customertype>lists = customertypeService.query();
		model.addAttribute("lists", lists);
		return "customerAdd";
	}
	
	@RequestMapping("/doadd.html")
	public String doadd(Customer customer)throws Exception{
		if(customerService.add(customer)>0){
			return "redirect:/customerShow.html";
		}
		return "customerAdd";
	}
}

package cn.bdqn.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.bdqn.pojo.Badoverflow;
import cn.bdqn.pojo.Storehouse;
import cn.bdqn.service.BadoverflowService;
import cn.bdqn.service.StorehouseService;
import cn.bdqn.util.PageUtil;

@Controller
public class BadoverflowController {

	@Autowired
	private BadoverflowService badoverflowService;
	
	@Autowired
	private StorehouseService storehouseService;
	
	@RequestMapping("/jsp/badoverflowList.html")
	public String badoverflowList(@RequestParam(defaultValue="0")int storehouseId,@RequestParam(defaultValue="1")int currenntPage,Model model){
		List<Storehouse> storehouse = storehouseService.queryStorehouse();
		PageUtil<Badoverflow> pageUtil = badoverflowService.queryBadoverflow(storehouseId, currenntPage, 1);
		model.addAttribute("storehouse", storehouse);
		model.addAttribute("currenntPage", currenntPage);
		model.addAttribute("storehouseId", storehouseId);
		model.addAttribute("pageUtil",pageUtil);
		return "badoverflowList";
	}
	
}

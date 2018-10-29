package cn.bdqn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.bdqn.pojo.Procurement;
import cn.bdqn.util.PageUtil;

@Controller
public class PutController {
	
	
	
	
	/**
	 * œ‘ æ»Îø‚µ•
	 * @param pageindex
	 * @param procurementId
	 * @param begintime
	 * @param endtime
	 * @param condition
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/put_list.html")
	public String procurementList(String pageindex,String procurementId,String begintime,Model model) {
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
}

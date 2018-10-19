package cn.bdqn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.bdqn.pojo.Detailed;
import cn.bdqn.pojo.Procurement;
import cn.bdqn.pojo.Supplier;
import cn.bdqn.service.ProcurementService;
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
		PageUtil<Procurement> pageUtil = procurementService.queryProcurement(procurementId, condition, begintime, endtime, temp);
		model.addAttribute("pageUtil",pageUtil);
		model.addAttribute("procurementId",procurementId);
		model.addAttribute("begintime",begintime);
		model.addAttribute("endtime",endtime);
		model.addAttribute("condition",condition);
		return "Procurement_list";
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
		model.addAttribute("sum",sum);
		model.addAttribute("procurement",procurement.get(0));
		return "procurement_show";
	}
	
	@RequestMapping("/jsp/procurement_toadd.html")
	public String procurementToAdd() {
		return "add_procurement";
	}
	
}

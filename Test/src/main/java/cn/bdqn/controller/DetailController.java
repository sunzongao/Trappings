package cn.bdqn.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.pojo.Check;
import cn.bdqn.pojo.Detail;
import cn.bdqn.pojo.Storehouse;
import cn.bdqn.pojo.User;
import cn.bdqn.service.DetailService;
import cn.bdqn.service.StorehouseService;
import cn.bdqn.service.UserService;
import cn.bdqn.util.PageUtil;

@Controller
public class DetailController {

	@Autowired
	private DetailService detailService;
	@Autowired
	private UserService userService;
	@Autowired
	private StorehouseService storehouseService;
	
	
	/**
	 * 添加报损或报溢
	 * @param detail
	 * @return
	 */
	@RequestMapping("jsp/addDetail")
	@ResponseBody
	public String  addDetail(Detail detail) {
		String userName = SecurityUtils.getSubject().getPrincipal().toString();//获取用户名
		User user = userService.queryUser(userName);
		detail.setUserId(user.getId());
		if(detailService.addDetail(detail)>0) {
			return "true";
		}
		return "false";
	}
	
	/**
	 * 查询库存详细信息、分页
	 * @param storehouseId  仓库Id
	 * @param currenntPage 当前第几页
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/InventoryInDetail.html")
	public String getByCheckIdAndAetails(@RequestParam(defaultValue = "1") int overflowOrBreakage,
			@RequestParam(defaultValue = "1") int currentPage, Model model) {
		PageUtil<Detail> pageUtil = detailService.getByAetailAndCheck(overflowOrBreakage, currentPage);
		model.addAttribute("overflowOrBreakage", overflowOrBreakage);
		model.addAttribute("pageUtil", pageUtil);
		return "InventoryInDetail";
	}
	
}

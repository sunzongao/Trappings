package cn.bdqn.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.pojo.Allocatedetailed;
import cn.bdqn.pojo.Storehouse;
import cn.bdqn.pojo.User;
import cn.bdqn.service.AllocatedetailedService;
import cn.bdqn.service.StorehouseService;
import cn.bdqn.service.UserService;
import cn.bdqn.util.PageUtil;

/**
 * 库存调拨详细控制器
 * 
 * @author Administrator
 *
 */
@Controller
public class AllocatedetailedController {

	@Autowired
	private AllocatedetailedService allocatedetailedService;
	@Autowired
	private UserService userService;
	@Autowired 
	private StorehouseService storehouseService;

	/**
	 * 添加库存详细信息
	 * 
	 * @param allocatedetailed
	 * @return
	 */
	@RequestMapping("/jsp/addAllocatedetailed.html")
	@ResponseBody
	public String addAllocatedetailed(Allocatedetailed allocatedetailed) {
		String userName = SecurityUtils.getSubject().getPrincipal().toString();// 获取用户名
		User user = userService.queryUser(userName);
		allocatedetailed.setUserId(user.getId());
		if (allocatedetailedService.addAllocatedetailed(allocatedetailed) > 0) {
			return "true";
		}
		return "false";
	}

	@RequestMapping("/jsp/allocateDetailed.html")
	public String queryAllocatedetailedList(String allocateTime, @RequestParam(defaultValue = "1") int currentPage,
			Model model) {
		PageUtil<Allocatedetailed> pageUtil = allocatedetailedService.queryAllocatedetailed(allocateTime, currentPage);
		model.addAttribute("allocateTime", allocateTime);
		model.addAttribute("pageUtil", pageUtil);
		return "allocatedetailedList";
	}

}

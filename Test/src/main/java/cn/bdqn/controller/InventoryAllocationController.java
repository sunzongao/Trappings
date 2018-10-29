package cn.bdqn.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.pojo.Check;
import cn.bdqn.pojo.Repertory;
import cn.bdqn.pojo.Storehouse;
import cn.bdqn.pojo.Transfersrecords;
import cn.bdqn.pojo.User;
import cn.bdqn.service.CheckService;
import cn.bdqn.service.RepertoryService;
import cn.bdqn.service.StorehouseService;
import cn.bdqn.service.TransfersrecordsService;
import cn.bdqn.service.UserService;
import cn.bdqn.util.PageUtil;

/**
 * 库存调拨控制器
 * 
 * @author Administrator
 *
 */
@Controller
public class InventoryAllocationController {

	@Autowired
	private RepertoryService repertoryService;
	@Autowired
	private UserService userService;
	@Autowired
	private TransfersrecordsService transfersrecordsService;
	@Autowired
	private StorehouseService storehouseService;

	// 库存调拨查询、分页
	@RequestMapping("/jsp/inventoryAllocation.html")
	public String repertoryList(String laidTime, @RequestParam(defaultValue = "0") int unitId,
			@RequestParam(defaultValue = "0") int brandId, @RequestParam(defaultValue = "1") int storehouseId,
			@RequestParam(defaultValue = "1") int currenntPage, Transfersrecords transfersrecords, HttpSession session,
			Model model) {

		// 获取随机数
		Random rand = new Random();
		String pd = "DB";
		String allocateId = pd += rand.nextInt(1000000000) + 1;
		// 当进入库存调拨时，自动给调拨表加入数据
		String userName = SecurityUtils.getSubject().getPrincipal().toString();// 获取用户名
		User user = userService.queryUser(userName);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String allocateTime = sdf.format(new Date());
		transfersrecords.setAllocateTime(allocateTime);
		transfersrecords.setUserId(user.getId());
		transfersrecords.setAllocateId(allocateId);
		transfersrecordsService.addTransfersrecords(transfersrecords);
		// 获取仓库集合
		List<Storehouse> storehouses = storehouseService.queryStorehouse();
		PageUtil<Repertory> pageUtil = repertoryService.queryRepertory(laidTime, unitId, brandId, storehouseId,
				currenntPage);
		session.setAttribute("storehouseId", storehouseId);
		session.setAttribute("storehouses", storehouses);
		session.setAttribute("currenntPage", currenntPage);
		session.setAttribute("pageUtil", pageUtil);
		model.addAttribute("allocateId", allocateId);
		return "inventoryAllocation";
	}
	
	/**
	 * 库存调拨
	 * @param repertory
	 * @return
	 */
	@RequestMapping("/jsp/updateInventoryAllocationRepertoryDetail")
	@ResponseBody
	public String updateInventoryAllocationRepertoryDetail(Repertory repertory) {
		if (repertoryService.updateInventoryAllocation(repertory) > 0) {
			return "true";
		}
		return "false";
	}
}

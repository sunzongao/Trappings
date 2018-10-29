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
 * ������������
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

	// ��������ѯ����ҳ
	@RequestMapping("/jsp/inventoryAllocation.html")
	public String repertoryList(String laidTime, @RequestParam(defaultValue = "0") int unitId,
			@RequestParam(defaultValue = "0") int brandId, @RequestParam(defaultValue = "1") int storehouseId,
			@RequestParam(defaultValue = "1") int currenntPage, Transfersrecords transfersrecords, HttpSession session,
			Model model) {

		// ��ȡ�����
		Random rand = new Random();
		String pd = "DB";
		String allocateId = pd += rand.nextInt(1000000000) + 1;
		// �����������ʱ���Զ����������������
		String userName = SecurityUtils.getSubject().getPrincipal().toString();// ��ȡ�û���
		User user = userService.queryUser(userName);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String allocateTime = sdf.format(new Date());
		transfersrecords.setAllocateTime(allocateTime);
		transfersrecords.setUserId(user.getId());
		transfersrecords.setAllocateId(allocateId);
		transfersrecordsService.addTransfersrecords(transfersrecords);
		// ��ȡ�ֿ⼯��
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
	 * ������
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

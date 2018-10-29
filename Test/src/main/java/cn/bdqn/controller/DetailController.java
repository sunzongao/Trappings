package cn.bdqn.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.mapper.RepertoryMapper;
import cn.bdqn.pojo.Check;
import cn.bdqn.pojo.Detail;
import cn.bdqn.pojo.Repertory;
import cn.bdqn.pojo.Storehouse;
import cn.bdqn.pojo.User;
import cn.bdqn.service.DetailService;
import cn.bdqn.service.RepertoryService;
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
	private RepertoryService repertoryService;

	/**
	 * ��ӱ������
	 * 
	 * @param detail
	 * @return
	 */
	@RequestMapping("jsp/addDetail")
	@ResponseBody
	public String addDetail(Detail detail) {
		String userName = SecurityUtils.getSubject().getPrincipal().toString();// ��ȡ�û���
		User user = userService.queryUser(userName);
		detail.setUserId(user.getId());
		if (detailService.addDetail(detail) > 0) {
			return "true";
		}
		return "false";
	}

	/**
	 * ��ѯ�����ϸ��Ϣ����ҳ
	 * 
	 * @param storehouseId
	 *            �ֿ�Id
	 * @param currenntPage
	 *            ��ǰ�ڼ�ҳ
	 * @param model
	 * @return
	 */
	@RequestMapping("/jsp/InventoryInDetail.html")
	public String getByCheckIdAndAetails(@RequestParam(defaultValue = "1") int overflowOrBreakage,
			@RequestParam(defaultValue = "1") int currentPage,Model model) {
		PageUtil<Detail> pageUtil = detailService.getByAetailAndCheck(overflowOrBreakage, currentPage);
		model.addAttribute("overflowOrBreakage", overflowOrBreakage);
		model.addAttribute("pageUtil", pageUtil);
		return "InventoryInDetail";
	}

	/**
	 * �޸Ŀ��Ŀ���� �ӱ�����������ݼ�������������
	 * @param repertory
	 * @return
	 */
	@RequestMapping("/jsp/updateRepertoryInventoryJia.html")
	@ResponseBody
	public String updateRepertoryInventoryJia(Repertory repertory) {
		if (repertoryService.updateRepertoryInventoryJia(repertory) > 0) {
			return "true";
		}
		return "false";
	}
	
	/**
	 * �޸Ŀ��Ŀ���� �ÿ������ȥ�������������
	 * @param repertory
	 * @return
	 */
	@RequestMapping("/jsp/updateRepertoryInventoryjian.html")
	@ResponseBody
	public String updateRepertoryInventoryjian(Repertory repertory) {
		if(repertoryService.updateRepertoryInventoryjian(repertory)>0) {
			return "true";
		}
		return "false";
	}

}

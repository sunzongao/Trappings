package cn.bdqn.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
/**
 * ����̵������
 * @author Administrator
 *
 */
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.bdqn.pojo.Check;
import cn.bdqn.pojo.Repertory;
import cn.bdqn.pojo.Storehouse;
import cn.bdqn.pojo.User;
import cn.bdqn.service.CheckService;
import cn.bdqn.service.RepertoryService;
import cn.bdqn.service.StorehouseService;
import cn.bdqn.service.UserService;
import cn.bdqn.util.PageUtil;

/**
 * �̵�������
 * 
 * @author Administrator
 *
 */
@Controller
public class CheckController {

	@Autowired
	private RepertoryService repertoryService;
	@Autowired
	private StorehouseService storehouseService;
	@Autowired
	private CheckService checkService;

	@Autowired
	private UserService userService;

	// ��ѯ����ҳ
	@RequestMapping("/jsp/check.html")
	public String repertoryList(String laidTime, @RequestParam(defaultValue = "0") int unitId,
			@RequestParam(defaultValue = "0") int brandId, @RequestParam(defaultValue = "1") int storehouseId,
			@RequestParam(defaultValue = "1") int currenntPage, Check check, HttpSession session, Model model) {
		// ��ȡ�����
		Random rand = new Random();
		String pd = "PD";
		String checkId = pd += rand.nextInt(1000000000) + 1;
		// ���������̵�ʱ���Զ����̵���������
		String userName = SecurityUtils.getSubject().getPrincipal().toString();// ��ȡ�û���
		User user = userService.queryUser(userName);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String checkTime = sdf.format(new Date());
		check.setCheckTime(checkTime);
		check.setUserId(user.getId());
		check.setCheckId(checkId);
		checkService.addCheck(check);
		// ��ȡ�ֿ⼯��
		List<Storehouse> storehouses = storehouseService.queryStorehouse();
		PageUtil<Repertory> pageUtil = repertoryService.queryRepertory(laidTime, unitId, brandId, storehouseId,
				currenntPage);
		session.setAttribute("storehouseId", storehouseId);
		session.setAttribute("storehouses", storehouses);
		session.setAttribute("currenntPage", currenntPage);
		session.setAttribute("pageUtil", pageUtil);
		model.addAttribute("checkId", checkId);
		return "checkList";
	}

	
}

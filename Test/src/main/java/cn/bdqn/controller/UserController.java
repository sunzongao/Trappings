package cn.bdqn.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.pojo.Data;
import cn.bdqn.pojo.Permission;
import cn.bdqn.pojo.Role;
import cn.bdqn.pojo.User;
import cn.bdqn.service.UserService;
import cn.bdqn.util.MyPasswordEncrypt;

@Controller
public class UserController {
	@Autowired
	private UserService userservice;

	/**
	 * ��¼
	 * 
	 * @param name
	 * @param password
	 * @param code
	 * @param remberme
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/loginUrl", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String login(@RequestParam("name") String name, @RequestParam("password") String password,
			@RequestParam("code") String code, @RequestParam("remberme") boolean remberme, HttpSession session) {
		if(name==null) {
			return "login";
		}
		String message = "";	
		boolean b = false;
		try {			
			if (!code.equalsIgnoreCase(session.getAttribute("code").toString())) {
				message = "��֤�벻��ȷ";
				b = true;
			} else {
				// ����token
				// ת������
				password = MyPasswordEncrypt.encryptPassword(password);
				UsernamePasswordToken token = new UsernamePasswordToken(name, password);
				// ����rememberme
				if (remberme) {
					token.setRememberMe(remberme);
				}
				SecurityUtils.getSubject().login(token);
			}
		} catch (Exception e) {
			message = e.getMessage();
			return message;
		}
		if (!b) {
			message = "list";
		}
		return message;
	}
	/**
	 * չʾ��½
	 * @return
	 */
	@RequestMapping("/login.html")
	public String tologin() {
		return "forward:login.jsp";
	}
	/**
	 * ��ҳ���չʾ
	 */
	@RequestMapping("/toshops_index.html")
	public String showList(Model model) {
		return "shops_index";
	} 

	@RequestMapping(value="/getdata", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getedata() {
		// ��ȡ�û���
		String name = (String) SecurityUtils.getSubject().getPrincipal();
		// ��ȡ�û���ӵ�е�����Ȩ��
		List<Permission> a = userservice.queryAllRoleAndPermissions(name);
		List<Data> data=new ArrayList<>();
		Data d;
		for(int i=0;i<a.size();i++) {
				d=new Data();
				d.setIcon(a.get(i).getIcon());
				d.setId(a.get(i).getId());
				d.setName(a.get(i).getPermission());
				d.setPid(a.get(i).getPid());
				d.setUrl(a.get(i).getUrl());
				data.add(d);
		}
		return cn.bdqn.util.JSONUtils.beanToJson(data);
	}
	@RequestMapping("/toaddFilter.html")
	public String toshow() {
		return "index";
	}
	/**
	 * �ǳ�
	 * @return
	 */
	@RequestMapping("/loginout")
	public String loginOut() {
		SecurityUtils.getSubject().logout();
		return "forward:login.jsp";
	}
	/**
	 * �ж��˺��Ƿ񱻽���
	 */
	@RequestMapping("/getUserState")
	@ResponseBody
	public String getUserState(String uname){
		User user = userservice.queryUser(uname);
		if(user==null) {
			return "-1";
		}
		return user.getState()+""; 
	}
}

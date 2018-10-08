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
import cn.bdqn.pojo.Role;
import cn.bdqn.service.UserService;
import cn.bdqn.util.MyPasswordEncrypt;

@Controller
public class UserController {
	@Autowired
	private UserService userservice;

	/**
	 * 登录
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
		System.out.println(remberme);
		boolean b = false;
		try {
			if (!code.equalsIgnoreCase(session.getAttribute("code").toString())) {
				message = "验证码不正确";
				b = true;
			} else {
				// 生成token
				// 转换成盐
				password = MyPasswordEncrypt.encryptPassword(password);
				UsernamePasswordToken token = new UsernamePasswordToken(name, password);
				// 设置rememberme
				if (remberme) {
					token.setRememberMe(remberme);
				}
				SecurityUtils.getSubject().login(token);
				session.setAttribute("login", 1);//表示已登陆
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
	 * 展示登陆
	 * @return
	 */
	@RequestMapping("/login.html")
	public String tologin() {
		return "forward:login.jsp";
	}
	/**
	 * 首页外层展示
	 */
	@RequestMapping("/toshops_index.html")
	public String showList(Model model) {
		return "shops_index";
	}

	@RequestMapping(value="/getdata", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getedata() {
		// 获取用户名
		String name = (String) SecurityUtils.getSubject().getPrincipal();
		// 获取用户所拥有的所有角色
		List<Role> a = userservice.queryAllRoleAndPermissions(name);
		List<Data> data=new ArrayList<>();
		Data d;
		for(int i=0;i<a.size();i++) {
			d=new Data();
			d.setId(a.get(i).getId());
			d.setIcon(a.get(i).getIcon());
			d.setName(a.get(i).getRname());
			d.setPid(0);
			d.setUrl("#");
			data.add(d);
			for(int j=0;j<a.get(i).getPermissions().size();j++) {
				d=new Data();
				d.setId(a.get(i).getPermissions().get(j).getId()+30);
				d.setIcon("fa fa-angle-double-right");
				d.setName(a.get(i).getPermissions().get(j).getPermission());
				d.setPid(a.get(i).getId());
				d.setUrl(a.get(i).getPermissions().get(j).getUrl());
				data.add(d);
			}
		}
		return cn.bdqn.util.JSONUtils.beanToJson(data);
	}
	@RequestMapping("/toaddFilter.html")
	public String toshow() {
		return "index";
	}
	/**
	 * 登出
	 * @return
	 */
	@RequestMapping("/loginout")
	public String loginOut() {
		SecurityUtils.getSubject().logout();
		return "forward:login.jsp";
	}
}

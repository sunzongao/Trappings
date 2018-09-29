package cn.bdqn.controller;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.service.UserService;
import cn.bdqn.util.MyPasswordEncrypt;



@Controller
public class UserController {
	@Autowired
	private UserService service;

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
		String message = "";
		System.out.println(remberme);
		boolean b = false;
		try {
			if (!code.equalsIgnoreCase(session.getAttribute("code").toString())) {
				message = "��֤�벻��ȷ";
				b = true;
			} else {
				// ����token
				//ת������
				password=MyPasswordEncrypt.encryptPassword(password);
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
	 * ��ҳ���չʾ
	 */
	@RequestMapping("/toshops_index")
	public String showList() {
		return "shops_index";
	}

	
}

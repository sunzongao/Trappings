package cn.bdqn.realm;

import java.util.Map;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import cn.bdqn.pojo.User;
import cn.bdqn.service.UserService;
import cn.bdqn.util.MyPasswordEncrypt;

public class UserRealm extends AuthorizingRealm {
	@Autowired
	private UserService service;
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		System.out.println("1.登陆认证");
		// 登录认证
		String username = (String) token.getPrincipal();// 获取用户名
		User vo = null;
		try {
			vo = this.service.queryUser(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (vo == null) {
			throw new UnknownAccountException("用户名不存在！");
		} else {
			String password =new String((char[]) token.getCredentials());
			// 与数据可进行比较
			if (vo.getUpassword().equals(password)) {
				AuthenticationInfo auth = new SimpleAuthenticationInfo(username, password, this.getName());
				return auth;
			} else {
				throw new IncorrectCredentialsException("密码不正确！");
			}
		}
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		System.out.println("授权认证");
		String name = (String) principals.getPrimaryPrincipal();// 获取用户名
		SimpleAuthorizationInfo auth = new SimpleAuthorizationInfo();
		try {
			Map<String, Object> map = service.queryRole(name);
			auth.setRoles((Set<String>) map.get("allRoles"));
			auth.setStringPermissions((Set<String>) map.get("allPremission"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return auth;
	}

}

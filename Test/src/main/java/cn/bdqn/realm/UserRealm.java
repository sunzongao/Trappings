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
		System.out.println("1.��½��֤");
		// ��¼��֤
		String username = (String) token.getPrincipal();// ��ȡ�û���
		User vo = null;
		try {
			vo = this.service.queryUser(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (vo == null) {
			throw new UnknownAccountException("�û��������ڣ�");
		} else {
			String password =new String((char[]) token.getCredentials());
			// �����ݿɽ��бȽ�
			if (vo.getUpassword().equals(password)) {
				AuthenticationInfo auth = new SimpleAuthenticationInfo(username, password, this.getName());
				return auth;
			} else {
				throw new IncorrectCredentialsException("���벻��ȷ��");
			}
		}
	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		System.out.println("��Ȩ��֤");
		String name = (String) principals.getPrimaryPrincipal();// ��ȡ�û���
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

package cn.bdqn.util;


public class MyPasswordEncrypt {
	//��ֵ(http://baidu.com)
	private final static String SALT="aHR0cDovL2JhaWR1LmNvbQ==";
	public static String encryptPassword(String password) {
		return new MD5Code( ).getMD5ofStr(password+"{{"+SALT+"}}");
	}
}

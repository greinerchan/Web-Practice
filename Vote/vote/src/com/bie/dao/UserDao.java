package com.bie.dao;

import com.bie.po.User;

/** 
* @author BieHongLi 
* @version 创建时间：2017年2月21日 上午10:38:40 
* 创建一个接口用于声明用户登陆注册的方法
*/
public interface UserDao {

	/***
	 * 用户登陆的方法声明
	 * @param user
	 * @return
	 */
	public User login(User user);
	
	/***
	 * 用户注册的方法声明
	 * @param user
	 * @param vCode 
	 * @return
	 */
	public boolean register(User user, String vCode);
}

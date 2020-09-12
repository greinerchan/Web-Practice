package com.bie.po;
/** 
* @author BieHongLi 
* @version 创建时间：2017年2月21日 上午9:59:03 
* 用户的实体类
*/
public class User {

	private Integer id;
	private String name;
	private String password;
	private int active;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	
	
}

package com.bie.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bie.dao.UserDao;
import com.bie.po.User;
import com.database.DB;

/** 
* @author BieHongLi 
* @version 创建时间：2017年2月21日 上午10:38:56 
* 
*/
public class UserDaoImpl implements UserDao{

	@Override
	public User login(User user) {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			DB db = new DB();
			con=db.getCon();//1:获取数据库的连接
			//2:书写sql语句
			String sql="select * from user where name=? and password=? ";
			ps=con.prepareStatement(sql);//3：预编译
			//4：设置值
			ps.setString(1, user.getName());
			ps.setString(2, user.getPassword());
			rs=ps.executeQuery();//5:执行sql语句
			User users=null;
			if(rs.next()){
				users=new User();
				//从数据库中获取值设置到实体类的setter方法中
				users.setId(rs.getInt("id"));
				users.setName(rs.getString("name"));
				users.setPassword(rs.getString("password"));
				if (!db.checkUserStatus(user.getName())) {
					return null;
				}
				
				return user;
			}else{
				return null;
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/***
	 * 插入的方法，即注册
	 */
	@Override
	public boolean register(User user, String vCode) {
		String sql = null;
		List<Object> list = null;
		DB db = new DB();
		Connection con=null;
		PreparedStatement ps=null;

		sql="insert into user values(0,?,?,?) ";
		list=new ArrayList<Object>();
		list.add(user.getName());
		list.add(user.getPassword());
		list.add(1);
				
		boolean flag=db.addUpdateDelete(sql,list.toArray(), vCode);
		
		try {
			con = db.getCon();
			PreparedStatement statement = con.prepareStatement("update verify set active = 0 where vCode = ?");  
			statement.setString(1, vCode);
			statement.executeUpdate();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(flag){
			return true;
		}else{
			return false;
		}
	}

	
}

package com.database;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.valuebean.UserSingle;
import com.valuebean.voteSingle;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DB {
	private String className;
	private String url;
	private String username;
	private String password;
	private Connection con;
	private Statement st;
	private ResultSet res;
	public DB() {
		className="com.mysql.jdbc.Driver";
		url="jdbc:mysql://localhost:3306/votedb";
		username = "root";
		password = "19930131";
	}
	public void loadDriver() {
		try {
			Class.forName(className);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("加载数据库驱动失败！");
			e.printStackTrace();
		}
	}
	public void getConnection() {
		loadDriver();
		try {
			con = (Connection) DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("连接数据库失败！");
			e.printStackTrace();
		}
	}
	
	
	/***
	 * 连接数据库的方法
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Connection getCon() throws ClassNotFoundException, SQLException{
		loadDriver();
		System.out.println("测试加载数据库成功");
		Connection con=(Connection) DriverManager.getConnection(url, username, password);
		System.out.println("测试数据库链接成功");
		return con;
	}
	
	public void getStatement() {
		getConnection();
		try {
			st = (Statement) con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("获取statement对象失败");
			e.printStackTrace();
		}
	}
	public void getResultSet(String sql) {
		if(sql != null && !sql.equals("")) {
			getStatement();
			try {
				res = st.executeQuery(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("查询数据库失败！");
				e.printStackTrace();
			}
		}
	}
	public void closed() {
		try {
			if(res != null) {
				res.close();
			}
			if(con != null) {
				con.close();
			}
			if(st != null) {
				st.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("关闭数据库失败！");
			e.printStackTrace();
		}
	}
	public int update(String sql) {
		int i = -1;
		if(sql != null && !sql.equals("")) {
			getStatement();
			try {
				i = st.executeUpdate(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("数据库更新失败！");
				e.printStackTrace();
			}finally {
				closed();
			}
		}
		return i;
	}
	public ArrayList<voteSingle> getVotes(){
		String sql = "select * from vote";
		getResultSet(sql);
		ArrayList<voteSingle> votes = new ArrayList<voteSingle>();
		try {
			while(res.next()) {
				voteSingle v = new voteSingle();
				v.setId(res.getString(1));
				v.setTitle(res.getString(2));
				v.setNum(res.getString(3));
				votes.add(v);
			}
			res.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return votes;
	}
	public ArrayList<UserSingle> getUsers(){
		String sql = "select * from users";
		getResultSet(sql);
		ArrayList<UserSingle> users = new ArrayList<UserSingle>();
		try {
			while(res.next()) {
				UserSingle u = new UserSingle();
				u.setId(res.getString(1));
				u.setIp(res.getString(2));
				u.setLastTime(res.getLong(3));
				users.add(u);
			}
			res.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
	}
	public UserSingle findUser(String ip) {
		UserSingle u = null;
		String sql = "select * from users where ip = " + ip;
		getResultSet(sql);
		if(res != null) {
			try {
				while(res.next()) {
					u = new UserSingle();
					u.setId(res.getString(1));
					u.setIp(res.getString(2));
					u.setLastTime(res.getLong(3));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("封装users表中数据失败！finduser函数");
				e.printStackTrace();
			}finally {
				closed();
			}
		}
		return u;
	}
	public voteSingle findvote(int id) {
		voteSingle u = new voteSingle();
		String sql = "select * from vote where id = " + id;
		getResultSet(sql);
		if(res == null) {
			u = null;
			return u;
		}else {
			try {
				while(res.next()) {
					u.setId(res.getString(1));
					u.setTitle(res.getString(2));
					u.setNum(res.getString(3));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return u;
		}
	}
	
	/***
	 * 同意增删改的方法
	 * @param sql
	 * @param arr
	 * @return
	 */
	public boolean addUpdateDelete(String sql,Object[] arr, String vCode){
		Connection con=null;
		PreparedStatement ps=null;
		DB db = new DB();
		
		try {
			if (!db.checkVCode(vCode)) {
				return false;
			}
			con= db.getCon();
			ps=con.prepareStatement(sql);//第二步：预编译
			//第三步：设置值
			if(arr!=null && arr.length!=0){
				for(int i=0;i<arr.length;i++){
					ps.setObject(i+1, arr[i]);
				}
			}
			int count=ps.executeUpdate();//第四步：执行sql语句
			if(count>0){
				return true;
			}else{
				return false;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean checkVCode(String vCode) {
		ResultSet resultSet = null;
		try {
			DB db = new DB();
			Connection con= db.getCon();
			PreparedStatement statement = con.prepareStatement("Select * from verify where vCode = ? and active = 1");  
			statement.setString(1, vCode);
			resultSet = statement.executeQuery();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    
		try {
			if (resultSet.isBeforeFirst()) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean checkUserStatus(String string) {
		ResultSet resultSet = null;
		try {
			DB db = new DB();
			Connection con= db.getCon();
			PreparedStatement statement = con.prepareStatement("Select * from user where name = ? and active = 1");  
			statement.setString(1, string);
			resultSet = statement.executeQuery();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    
		try {
			if (resultSet.isBeforeFirst()) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
//	public static void main(String[] args) {
//		try {
//			Connection aaa = null;
//			DB db = new DB();
//			aaa=db.getCon();//第一步 ：连接数据库的操作
//			System.out.println("测试数据库链接成功");
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
}

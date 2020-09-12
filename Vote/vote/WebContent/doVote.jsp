<%@page import="com.valuebean.voteSingle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="com.valuebean.UserSingle"%>
<%@page import="com.toolbean.MyTool"%>
<jsp:useBean id="db" class = "com.database.DB" scope = "session"></jsp:useBean>
<%
	long cc = 0, dd = 0;

	String[] str_id = request.getParameterValues("like");
	if (str_id == null) {
		String[] sb = {"-1"};
		str_id = sb;
	} 
	int[] id = new int[str_id.length];
	for (int i = 0; i < str_id.length; i++) {
		id[i] = MyTool.strToInt(str_id[i]);
	}
	int flag = -1, i = -1;
	String sql = "";
	Date date = new Date();
	long today = date.getTime();
	voteSingle v1 = null;
	voteSingle v2 = null;
	if (id.length == 2) {
		v1 =db.findvote(id[0]);
		v2 =db.findvote(id[1]);
	} else {
		v1 = db.findvote(id[0]);
		v2 = db.findvote(id[0]);
	}
	String mes = "";
	long lastTime = 0;
	String ip = "005";
	//String ip = request.getRemoteAddr();
	UserSingle u = db.findUser(ip);
	if(u == null){
		u = new UserSingle();
		u.setIp(ip);
		u.setLastTime(today);
		flag = 0;
	}else{
		lastTime = u.getLastTime();
		cc = today;
		dd = lastTime;
		if((today - lastTime) >= 5 * 1000){
			flag  = 1;
		}else{
			flag = 2;
		}
	}
	if(flag == 0){
		sql = "insert into users(ip, lastTime) values('"+ip+"','+"+today+"')";
		i = db.update(sql);
		if(i < 0){
			System.out.println("插入user失败！");
			i = -1;
		}
		if (id.length == 2) {
			sql = "update vote set num=num+1 where id="+id[0] + " or id=" + id[1];
		} else if (id.length == 1 && id[0] != -1){
			sql = "update vote set num=num+1 where id="+id[0];
		} else {
			sql = "";
		}
		i = db.update(sql);
		if(i < 0){
			System.out.println("更新vote表失败（num+1）");
			i = -1;
		}
	}
	if(flag == 1){
		if (id.length == 2) {
			sql = "update vote set num=num+1 where id="+id[0] + " or id=" + id[1];
		} else if (id.length == 1 && id[0] != -1) {
			sql = "update vote set num=num+1 where id="+id[0];
		} else {
			sql = "";
		}
		i = db.update(sql);
		if(i < 0){
			System.out.println("更新vote表失败（num+1）");
			i = -1;
		}
		sql = "update users set lastTime ="+today+" where ip= '"+ip+ "'";
		i = db.update(sql);
		if(i < 0){
			System.out.println("更新user表失败lastTime=today");
			i = -1;
		}
	}
	if(flag == 2){
		if (id.length == 2) {
			mes = u.getIp()+" 为  "+v1.getTitle()+" 和 "+v2.getTitle()+" 投票失败，距离上一次投票不足一分钟，上一次投票时间为"+MyTool.formatDate(lastTime);
		} else if (id[0] == -1) {
			mes = "恭喜您投了个空气!";
		} else {
			mes = u.getIp()+" 为  "+v1.getTitle()+" 投票失败，距离上一次投票不足一分钟，上一次投票时间为"+MyTool.formatDate(lastTime);
		}
	}
	if(flag == 1){
		if (id.length == 2) {
			mes = u.getIp()+" 为  "+v1.getTitle()+" 和 "+v2.getTitle()+"  投票成功，当前投票时间为：" + MyTool.formatDate(today);
		} else if (id[0] == -1) {
			mes = "恭喜您投了个空气!";
		} else {
			mes = u.getIp()+" 为  "+v1.getTitle()+" 投票成功，当前投票时间为：" + MyTool.formatDate(today);
		}
	}
	if(flag == 0){
		if (id.length == 2) {
			mes = u.getIp()+" 为 "+v1.getTitle()+" 和 "+v2.getTitle()+" 首次投票成功，当前投票时间为：" + MyTool.formatDate(today);
		} else if (id[0] == -1) {
			mes = "恭喜您投了个空气!";
		} else {
			mes = u.getIp()+" 为  "+v1.getTitle()+" 投票成功，当前投票时间为：" + MyTool.formatDate(today);
		}
	}
	session.setAttribute("mes", mes);
	response.sendRedirect("message.jsp");
%>
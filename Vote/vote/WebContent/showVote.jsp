<%@page import="com.toolbean.MyTool"%>
<%@page import="com.valuebean.voteSingle"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class = "com.database.DB" scope = "session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投票结果</title>
</head>
<body>
<script type='text/javascript'>
    window.history.forward();
    window.onbeforeunload=function (){ 
}
</script>
		<table align="center" style="width:100px;">
	<%
		ArrayList<voteSingle> votes = db.getVotes();
		int numAll = 1;
		float picLen = 0;
		if(votes == null || votes.size() == 0){
	%>
			<tr>
				<td>无内容可以显示</td>
			</tr>
	<%
		}else{
			for(int i = 0, length = votes.size(); i < length; i++){
				numAll += MyTool.strToInt(votes.get(i).getNum());
			}
			for(int i = 0, length = votes.size(); i < length; i++){
				picLen = MyTool.strToInt(votes.get(i).getNum()) * 145 / numAll;
	%>
	<tr class = "a">
		<td class = "a">
			<%= votes.get(i).getTitle() %>
		</td>
		<td class = "a">
			<img src="img/l.jpg" width="<%=picLen%>" height = "20"/>
		</td>
		<td class = "a">
			<%=votes.get(i).getNum()%>
		</td>
	</tr>
		<br/>
	<%
		}
	}
	%>
	<tr>
		<td>
			<a href = "vote.jsp">
				<input type = "button" value = "返回投票界面">
			</a>
		</td>
		<td>
			<a href = "login.jsp">
				<input type = "button" value = "返回主界面">
			</a>
		</td>
	</tr>
	</table>
</body>
</html>
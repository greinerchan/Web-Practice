<%@ page contentType="text/html; charset=UTF-8"%>
<%
  String message=(String)session.getAttribute("mes");
  session.invalidate();
%>
<html>
	<head>
    	<title>投好了</title> 
    	<style>
    	.center {
		  display: block;
		  margin-left: auto;
		  margin-right: auto;
		  width: 30%;
		}
    	</style>	
	</head>
	<body bgcolor="#F0F0F0">
	<img src="images/message.gif" class="center" border="0">
	<br>
	  <table align="center">
	  	<tr>
	  		<td>
	  			<%=message %>
	  		</td>
	  	</tr>
	  	<tr height="114">
           <td align="center" valign="top">
			   <a href="login.jsp"><input type = "button" value = "返回首页"></a>
			   <a href="vote.jsp"><input type = "button" value = "返回投票"></a>
			   <a href="showVote.jsp"><input type = "button" value = "查看结果"></a>
           </td>
        </tr>
	  </table>
	</body>
</html>

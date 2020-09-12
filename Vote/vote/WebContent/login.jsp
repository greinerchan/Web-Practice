<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>锄地帮K歌网</title>
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="app.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<style type="text/css">
h1{text-align:center; height="100px";}
h4{text-align:left;color:red;}
body{background:url(images/1.jpg);
	background-size: cover;
	background-position: center;
	font-family: 'Lato', sans-serif;}
a{text-decoration:none;font-size:20px;color:black;}
a:hover{text-decoration:underline;font-size:24px;color:red;}
#content {
	text-align: center;
	padding-top: 15%;
	text-shadow: 0px 4px 3px rgba(0,0,0,0.4),
				 0px 8px 13px rgba(0,0,0,0.1),
				 0px 18px 23px rgba(0,0,0,0.1);
}
html {
	height: 100%
}
h1, h3 {
	color: white;
}
h1 {
	font-weight: 700;
	font-size: 3em;
}
hr {
	width: 400px;
	border-top: 1px solid #f8f8f8;
	border-bottom: 1px solid rgba(0,0,0,0.2);
}
</style>

</head>
<body>
<form action="user/userlogin" method="post">
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div id="content">
				<h1>锄地帮K歌大赛评审团登陆</h1>
				<h3>你不锄，我不锄，田里早晚长害虫 <i class="fas fa-bug"></i></h3>
				<hr>	
			</div>			
		</div>
	</div>
</div>
	<table frame="void" align="center">
		<tr>
			<td>账号：</td>
			<td><input type="text" name="name" id="name"></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><input type="password" name="password" id="password"></td>
		</tr>
		<tr>
			<td colspan="1">
			</td>
			<td>
				<input type="submit" value="登陆"/>
				<input type="reset" value="重置"/>
				<a href="register.jsp" target="_blank">注册</a>
			</td>
		</tr>
	</table>

</form>
</body>
</html>
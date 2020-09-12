<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>锄地农注册</title>

<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="app.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<style type="text/css">
body{background:url(images/2.jpg);
	background-size: cover;
	background-position: center;
	font-family: 'Lato', sans-serif;}
a{text-decoration:none;font-size:20px;color:yellow;}
a:hover{text-decoration:underline;font-size:24px;color:red;}
#content {
	text-align: center;
	padding-top: 10%;
	text-shadow: 0px 4px 3px rgba(0,0,0,0.4),
				 0px 8px 13px rgba(0,0,0,0.1),
				 0px 18px 23px rgba(0,0,0,0.1);
}
.reg {
    color: black;
    font-size: 20px;
    font-weight: bold;
}

#bbt {
    color: black;
    font-size: 20px;
    font-weight: bold;
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
/* #yy {
	color: yellow;
} */
</style>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//alert("测试jQuery是否能用");
		$("#form1").submit(function(){
			var name=$("#name").val();//获取提交的值
			if(name.length==0){//进行判断，如果获取的值为0那么提示账号不能为空
				//alert("aa");//测试使用
				$("#nameError").html("账号不能为空");
				return false;
			}
			
			//密码进行验证不能为空
			var password=$("#password").val();//获取提交的密码的值
			if(password.length==0){
				$("#passwordError").html("密码不能为空");
				return false;
			}
			
			//确认密码进行验证
			var relpassword=$("#relpassword").val();//获取提交的确认密码的值
			if(relpassword.length==0){
				$("#relpasswordError").html("确认密码不能为空哦");
				return false;
			}
			
			if(password!=relpassword){
				$("#relpasswordError").html("确认密码输入不正确，请重新输入");
				return false;
			}
		});
	
	});
</script>
</head>
<body>
<form action="user/userregister" method="post" id="form1">
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div id="content">
				<h1>锄地农应征处</h1>
				<h3>点击加入锄地农大军</h3>
				<hr>
			</div>			
		</div>
	</div>
</div>



<div class="reg">
	<table align="center">
		<tr>
			<td>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</td>
			<td>
				<input type="text" name="name" id="name"/>
				<div id="nameError" style="display:inline;color:red;"></div>
			</td>
		</tr>
		<tr>
			<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
			<td>
				<input type="password" name="password" id="password">
				<div id="passwordError" style="display:inline;color:red;"></div>
			</td>
		</tr>
		<tr>
			<td>确认密码：</td>
			<td>
				<input type="password" name="relpassword" id="relpassword">
				<div id="relpasswordError" style="display:inline;color:red;"></div>
			</td>
		</tr>
		<tr>
			<td>邀请码：</td>
			<td><input type="text" name="vCode" id="vCode"></td>
		</tr>
		<tr>
			<td colspan="1">
			</td>
			
			
			<td>
			<span id="bbt">
				<input type="submit" value="注册"/>
				<input type="reset" value="重置"/>
			</span>
				<a id="yy" href="login.jsp" target="_blank">登陆</a>		
			</td>			
		</tr>
	</table>
</div>
</form>
</body>
</html>
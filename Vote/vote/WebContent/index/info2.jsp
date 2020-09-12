<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="app.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>哦豁，你失败了</title>
<style type="text/css">
h1{text-align:center;}
h4{text-align:left;color:red;}
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}

</style>
</head>
<body>
<!-- <h1>用户登陆成功或者失败的提示页面</h1> -->
<h4>哈哈，想混进来没门..</h4>
<hr/>
<h1>${info}</h1>
<br>
<img src="../images/info2.gif" class="center" border="0">
<br><br>
<div>
<a href = "../login.jsp"><input type ="button" class="btn btn-primary btn-lg btn-block" value = "返回登陆界面"/></a>
</div>
</body>
</html>
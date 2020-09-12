<%@page import="com.valuebean.UserSingle"%>
<%@page import="com.valuebean.voteSingle"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class = "com.database.DB" scope = "session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="app.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	#tab{
	font-size: 20px;
    font-weight: bold;
	}
@import url('https://fonts.googleapis.com/css?family=Pangolin');

body {
  width: 100%;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #ffcfcc;
  overflow: hidden;
}

.controller {
  position: relative;
  width: 180px;
  height: 70px;
}

.controller label {
  position: relative;
  display: block;
  width: 80%;
  height: 80%;
  background-color: #ffcfcc;
  border: 2px solid #e34444;
  border-radius: 32px 32px 32px 32px;
}

.controller label:before {
  content: 'On';
  position: absolute;
  left: 10%;
  top: 35%;
  text-transformation: uppercase;
  color: #FE6860;
  text-shadow: 1px 1px rgba(0,0,0,0.5);
  opacity: 0.7;
  z-index: 0;
  font-family: 'Pangolin', cursive;
}
.controller label:after {
  content: 'Off';
  position: absolute;
  right: 10%;
  top: 35%;
  color: #FE6860;
  text-shadow: 1px 1px rgba(0,0,0,0.5);
  opacity: 0.7;
  z-index: 0;
  font-family: 'Pangolin', cursive;
  font-size: 1em;
}

.controller input ~ label span {
  position: absolute;
  z-index: 1;
  left: 2%;
  top: 2%;
  display: block;
  background-color: #FE6860;
  width: 52px;
  height: 52px;
  border-radius: 50%;
  box-shadow: inset 2px -2px #fe3e34,
              inset 4px -2px #ff584d,
              inset -2px 1px #ffcfcc;
  border: 1px solid #ff584d;
  animation: moveAnimBack 2s backwards;
}

.controller input {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0; right: 0; bottom: 0; left: 0;
  z-index: 2;
  cursor: pointer;
  opacity: 0;
}

.controller input:checked ~ label span {
  left: 60%;
  animation: moveAnim 2s ease forwards;
}

@keyframes moveAnim {
  0% {
    left: 0%;
  }
  5% {
    border-radius: 60% 40% 60% 40%;
  }
  10% {
    border-radius: 40% 60% 40% 60%;
  }
  15% {
    border-radius: 50%;
  }
  20% {
    border-radius: 60% 40% 60% 40%;
  }
  25% {
    border-radius: 40% 60% 40% 60%;
  }
  30% {
    border-radius: 50%;
  }
  40% {
    left: 63%;
  }
  41% {
    border-radius: 70% 60% 60% 70%;
  }
  46% {
    border-radius: 80% 70% 70% 80%;
  }
  51% {
    border-radius: 50%;
  }
  56% {
    border-radius: 60% 40% 60% 40%;
  }
  61% {
    border-radius: 40% 60% 40% 60%;
  }
  66% {
    border-radius: 50%;
  }
  70% {
    left: 60%;
  }
}

@keyframes moveAnimBack {
  0% {
    left: 62%;
  }
  5% {
    border-radius: 40% 60% 40% 60%;
  }
  10% {
    border-radius: 60% 40% 60% 40%;
  }
  15% {
    border-radius: 50%;
  }
  20% {
    border-radius: 40% 60% 40% 60%;
  }
  25% {
    border-radius: 60% 40% 60% 40%;
  }
  30% {
    border-radius: 50%;
  }
  40% {
    left: 0%;
  }
  41% {
    border-radius: 60% 70% 70% 60%;
  }
  46% {
    border-radius: 80% 60% 70% 80%;
  }
  51% {
    border-radius: 50%;
  }
  56% {
    border-radius: 40% 60% 40% 60%;
  }
  61% {
    border-radius: 60% 40% 60% 40%;
  }
  66% {
    border-radius: 50%;
  }
  70% {
    left: 2%;
  }
}

#content {
	text-align: center;
	padding-top: 15%;
	text-shadow: 0px 4px 3px rgba(0,0,0,0.4),
				 0px 8px 13px rgba(0,0,0,0.1),
				 0px 18px 23px rgba(0,0,0,0.1);
}

p {
	color: white;
}
p {
	text-align:middle;
	font-weight: 700;
	font-size: 1.5em;
}

}
</style>
<title>选我选我！！！</title>
</head>
<body>


<script language="javascript">

function chkbox(elm)
	{
	    var obj=document.getElementsByName("like");
	    var num=0;
	    for (var i=0;i<obj.length ;i++ )
	        if (obj[i].checked) num++;
	
	    if (num>2){
	        alert("想多选？没门！！！");
	        for (var i=0;i<obj.length ;i++){
	            elm.checked=false;
	        }
	    }
	}
</script>

	<form action="doVote.jsp" method = "post">
	<table>
	<%
		ArrayList<voteSingle> votes = db.getVotes();
		if(votes == null || votes.size() == 0){
	%>
			<tr>
				<td>无内容可以显示</td>
			</tr>
	<%
		}else{
			for(int i = 0, length = votes.size(); i < length; i++){
	%>



	<tr>	
		<td>
			<div id="tab">
			<%= votes.get(i).getTitle() %>
			</div>
		</td>
		<td>
			<div id="tab">
			<div class="controller">
			<input onclick="chkbox(this)" type = "checkbox" name = "like" value="<%=votes.get(i).getId()%>"></input>
			 <label for="toggle"><span></span></label>
			</div>
			</div>
		</td>	
	</tr>



	
	<%
		}
	}
	%>
	<tr>
		<td>
			<input type = "submit" value = "提交"/>
		</td>
		<td>
			<input type = "reset" value = "重置"/>
		</td>
		<td>
			<a href = "showVote.jsp">
				<input type = "button" value = "显示投票结果">
			</a>
		</td>
	</tr>
	<p>请选择两名受害者(调到ON为选择)，当然你也可以只投一个或者不投</p>	
	</table>
	</form>

</body>
</html>
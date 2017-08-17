<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link href="/z-System/WebContent/WEB-INF/css/public.css"  rel="stylesheet" type="text/css">   外联居然不好使？！-->
 <style type="text/css">
.header{
	background-color: #C6D580;
	width:100%;
	height:90px;
}

.footer{
	background-color: #C6D580;
	width:100%;
	height:70px;
	position:fixed;
	left:0px;
	bottom:0px;
}

</style>
<title>登录页面</title>
</head>
<body>
<div class="header"></div>
<br><br><br>
<div>
<table width="100%" height="200">
  <tr height="50" align="center">
  <td>
    <h2 style="color:#C69">登陆</h2>
  </td>
  </tr>
  <tr align="center">
  <td>
<form action="user/login"  method="post">
 <table width="200" align="center">
  <tr>
    <td>Username:</td>
	<td><input type="text"  name="username"/></td>
  </tr>
  <tr>
    <td>Password:</td>
    <td><input  type="password"  name="password"/></td>
  </tr>
  <tr><td colspan="2" align="center"><br><input type="submit" value=登录  /></td></tr>
  </table>
</form>
</td>
</tr>
</table>

</div>

<div class="footer"></div>
</body>
</html>
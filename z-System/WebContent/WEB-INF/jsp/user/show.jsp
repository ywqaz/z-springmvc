 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="header"></div>
<div>
<table width="100%" height="300" border="1">
<tr>
 <td width="250" valign="top">
   <%@ include file="left.jsp"%>
 </td>
<td width="800" align="center" valign="top">
<table width="400" >
  <tr height="50">
  <td>
    <h2 style="color:#C69"><br>查询信息</h2>
  </td>
  </tr>
  <tr align="center">
  <td>
    <form>
      <table width="600" align="center" >
        <tr>
          <td width="100">Username:</td><td>${user.username}</td>         
        </tr>
        <tr>
          <td>Password:</td><td>${user.password}</td>
        </tr>
        <tr>
          <td>Nickname:</td><td>${user.nickname}</td>
        </tr>
        <tr>
          <td>Email:</td><td>${user.email}</td>
        </tr>        
        <tr>
          <td colspan="2" align="center" onClick="javascript:history.back(-1);"><br><br><input type="button" value="返回"></td>
        </tr>
      </table>
    </form>
  </td>
  </tr>
</table>
</td>

</tr>
</table>
</div>
<div class="footer"></div>
</body>
</html>
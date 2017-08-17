 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
    <%@taglib prefix="sf"  uri="http://www.springframework.org/tags/form" %>
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
<sf:form  method="post"   modelAttribute="user"><!-- 在加载页面时就得把user的值都设置好 -->
<table>
	<tr>
		<td>Username:</td><td><sf:input path="username"/><sf:errors path="username"/></td>
	</tr>
	<tr>
		<td>Password:</td><td><sf:input path="password"/><sf:errors path="password"/></td>
	</tr>
	<tr>
		<td>Nickname:</td><td><sf:input path="nickname"/></td>
	</tr>
	<tr>
		<td>Email:</td><td><sf:input path="email"/><sf:errors path="email"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit"  value="修改用户"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返回" onClick="javascript:history.back(-1);"></td>
	</tr>
</table>
</sf:form>
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
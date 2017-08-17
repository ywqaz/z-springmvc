 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="sf"  uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 在加载页面时就得把user的值都设置好 -->
<sf:form  method="post"   modelAttribute="user"  enctype="multipart/form-data"><!-- 这里没有写action，就是提交给自己 -->
	Username:<sf:input path="username"/><sf:errors path="username"/><br/>
	Password:<sf:input path="password"/><sf:errors path="password"/><br/>
	Nickname:<sf:input path="nickname"/><br/>
	Email:<sf:input path="email"/><sf:errors path="email"/><br/>
	Attach:<input type="file" name="attach"/><br><!-- 这里没有sf:file，不可能为一个属性来设file？？没有使用path时，input name值只能在参数中传才能接收？？ -->
	<input type="submit"  value="添加用户"/>
</sf:form>

</body>
</html>
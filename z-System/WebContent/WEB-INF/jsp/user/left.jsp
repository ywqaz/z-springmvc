<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<table width="200" align="center">
  <tr>
    <td>
      <h2 style="color:#F69">学生模块</h2>
    </td>
  </tr>
  <tr>
    <td>
      <a href="${loginUser.username}">学生信息</a>
    </td>
  </tr>
  <tr>
    <td>
      <a href="${loginUser.username}/update">信息更改</a>
    </td>
  </tr>
</table>


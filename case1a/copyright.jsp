<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>頁尾</title>
    <%! int visits = 0; %>
<style type="text/css">
font{
color: red;
}
</style>
  </head><body>
    <font size="2">
    <%  visits++ ; // 計數加1 %>
    <%= "JSP程式的訪客計數：<b>" + visits +"</b>" %>
	</font>
  </body>
  
</html>
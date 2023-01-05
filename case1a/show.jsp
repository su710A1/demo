<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>顯示資料</title>

<style type="text/css">
h3{
color: #036;
}
</style>
</head>
<body>
<% 
	String file = "copyright.jsp";  // 指定引入的檔案
%>
<% request.setCharacterEncoding("utf-8"); %>
<h3>選擇欄位為：<b>
<% 
String[] hobby = request.getParameterValues("music");
String cols ="";
if(hobby != null){
    for(int i = 0; i < hobby.length; i++){
    	if(i!=hobby.length-1)
        	out.print(hobby[i] + ",");
    	else
    		out.print(hobby[i]);
    }
}
%>
</b></h3>
<jsp:include page="showDB.jsp" flush="true"></jsp:include>
<jsp:include page="<%= file %>" flush="true"/>
</body>
</html>
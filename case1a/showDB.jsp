<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.rowset.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
b{
color: blue;
font-weight: bold;
}
.m00{
color: #0dd;
}
.f00{
color: #d0d;
}
</style>
</head>
<body>
<%
//資料庫物件
JdbcRowSet rowset = null;
//驅動程式參數
String sDriver = "org.mariadb.jdbc.Driver";

String user = "root";
String password = "1234";
String url = "jdbc:mariadb://127.0.0.1/mydb";
String sql = "select * from employee";

//取得傳入的參數
String[] hobby = request.getParameterValues("music");
String cols ="";
cols += String.join( ",", hobby );//out.println(cols+"<br>");
sql = "select "+cols+" from employee order by num";
out.println("<h3>此次向資料庫查詢的指令：<b>"+sql+"</b></h3>");


try {//載入 JDBC driver
  Class.forName(sDriver);
} catch (Exception e) {
  out.println("無法載入驅動程式");
  return;
}

rowset = RowSetProvider.newFactory().createJdbcRowSet();

rowset.setUrl(url);
rowset.setUsername(user);
rowset.setPassword(password);
rowset.setCommand(sql);
rowset.execute();

//out.println("NUM &emsp; NAME &emsp; SEX &emsp; BIRTH &emsp; AGE &emsp; ADDRESS <br>");
//out.println("=======================================================<br>");
while (rowset.next()) {//out.print(rowset.next()+"<br>");
	for(int i = 0; i < hobby.length; i++){
		String show=hobby[i];//out.print(show+"<br>");
		switch(show){
			case "num":
				out.print(rowset.getString("NUM")+"&emsp;");
				break;
			case "name":
				out.print(rowset.getString("NAME")+"&emsp;");
				break;
			case "sex":
				  String gender = rowset.getString("SEX");
				  if (gender.equals("M")) {
				      out.print("<span class='m00'>先生</span> &emsp;");
				  } else {
				      out.print("<span class='f00'>小姐</span> &emsp;");
				  }
				break;
			case "birth":
				  out.print(rowset.getDate("BIRTH")+"&emsp;");
				break;
			case "age":
				out.print(rowset.getByte("AGE")+"&emsp;");
				break;
			case "address":
				out.print(rowset.getString("ADDRESS"));
				break;
			default:
				break;
		}
		if((i+1)==hobby.length){
			out.print("<br>");
		}
    }
/**
  out.print(rowset.getString("NUM")+"&emsp;");
  out.print(rowset.getString("NAME")+"&emsp;");
  
  //out.print(rowset.getString("SEX"));//out.print("\t");
  String gender = rowset.getString("SEX");
  if (gender.equals("M")) {
      out.print("先生 &emsp;");
  } else {
      out.print("小姐 &emsp;");
  }
  
  out.print(rowset.getDate("BIRTH")+"&emsp;");
  out.print(rowset.getByte("AGE")+"&emsp;");
  out.println(rowset.getString("ADDRESS")+"<br>");
*/
}

%>
</body>
</html>
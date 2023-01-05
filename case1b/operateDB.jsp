<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.rowset.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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

request.setCharacterEncoding("utf-8");
//資料庫物件
JdbcRowSet rowset = null;
//驅動程式參數
String sDriver = "org.mariadb.jdbc.Driver";

String user = "root";
String password = "1234";
String url = "jdbc:mariadb://127.0.0.1/mydb";
String sql = request.getParameter("sqlS");
//取得傳入的參數
String[] cols = request.getParameter("column").split(",");

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

String result="";
while (rowset.next()) {
	for(int i = 0; i < cols.length; i++){
		String show=cols[i];
		switch(show){
			case "num":
				//out.print(rowset.getString("NUM")+ "&emsp;");
				result+=rowset.getString("NUM")+"&emsp;";
				break;
			case "name":
				//out.print(rowset.getString("NAME")+"&emsp;");
				result+=rowset.getString("NAME")+"&emsp;";
				break;
			case "sex":
				  String gender = rowset.getString("SEX");
				  if (gender.equals("M")) {
				      //out.print("<span class='m00'>先生</span> &emsp;");
						result+="<span class='m00'>先生</span> &emsp;";
				  } else {
				      //out.print("<span class='f00'>小姐</span> &emsp;");
						result+="<span class='f00'>小姐</span> &emsp;";
				  }
				break;
			case "birth":
				  //out.print(rowset.getDate("BIRTH")+"&emsp;");
					result+=rowset.getString("BIRTH")+"&emsp;";
				break;
			case "age":
				//out.print(rowset.getByte("AGE")+"&emsp;");
				result+=rowset.getString("AGE")+"&emsp;";
				break;
			case "address":
				//out.print(rowset.getString("ADDRESS"));
				result+=rowset.getString("ADDRESS")+"&emsp;";
				break;
			default:
				break;
		}
		if((i+1)==cols.length){
			//out.print("<br>");
			result+="<br>";
		}
    }
	
}
out.print("<p><b>"+result+"</b></p>");

%>

</body>
</html>
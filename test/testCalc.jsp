<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>JSP</title>
  </head>
  <body>
	<%
	  request.setCharacterEncoding("utf-8");
	  String num1=request.getParameter("num1");
	  String num2=request.getParameter("num2");
	  String op=request.getParameter("op");
	  double result=0,n1,n2;

	  n1=Double.parseDouble(num1);
	  n2=Double.parseDouble(num2);
	  switch(op)
	  {
		case "1":
			result=n1+n2;
			out.print(result);
			break;
		case "2":
			result=n1-n2;
			out.print(result);
			break;
		case "3":
			result=n1*n2;
			out.print(result);
			break;
		case "4":
			if(n2==0.0){
				out.print("除數不得為0");	
			}
			else{
				result=n1/n2;
				out.print(result);
			}	
	  }
	  
	%>
  </body>
  
</html>
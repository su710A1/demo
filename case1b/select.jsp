<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>選擇欄位</title>
</head>
<body>

    <form action="show.jsp" method="post">
      <fieldset style="width:500px;border-width:2px">
        <legend>選取欄位</legend>
		<input type="checkbox" name="music" value="num">編號
		<input type="checkbox" name="music" value="name">姓名
		<input type="checkbox" name="music" value="sex">性別
		<input type="checkbox" name="music" value="age">年紀
		<input type="checkbox" name="music" value="birth">生日
		<input type="checkbox" name="music" value="address">地址
      </fieldset>
      <p>
      <input type="submit" value="傳送">
      <input type="reset" value="重填">
    </form>

</body>
</html>
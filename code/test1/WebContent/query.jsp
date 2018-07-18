<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>制作试卷</title>
</head>
<body>
<h1 align="center">制作试卷</h1>

<form action="doExam" method="post">
<h2>试卷题目：<input type="text" name="quTitle"></h2>

<input type="submit" value="下一步" onclick="window.location='subject.jsp'">
</form>
</body>
</html>
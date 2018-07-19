<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.action.Create"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>开始答题</title>
</head>
<body>
<form id="frm" action="doScore?id=<%=request.getParameter("id") %>" method="post">
<div id="timer" style="position:fixed; top:60px; right: 0; width: 150px; height: 40px;color: #FF4040; background: #E0FFFF;"></div>

<% 
String eid = request.getParameter("id");
Create create = new Create();
StringBuilder s = create.createStudentQuestion(eid);//id
out.println(s);
%>

<input type="submit" value="提交">
</form>

<script>
  /*   var times = 45 * 60;//剩余时间,单位秒
    var timeDiv = document.getElementById("time");
    var timeObj = null;
    function timer(){
        if(times == 0){
            //倒计时结束，提交表单
            document.getElementById("frm").submit();
            window.clearInterval(timeObj);
            return;
        }
        var t = Math.floor(times/60) +"分"+times%60+"秒"
        timeDiv.innerHTML = t;
        times --;
    }
    timeObj = window.setInterval(timer,1000); */
    
    var maxtime;
    if(window.name==''){
  	  maxtime = 1*60;//1分钟
    }else{
   	  maxtime = window.name;
    }
    function CountDown(){
  	  if(maxtime>=0){ 
  	    var time2="2018年7月18日18:30";
   		 minutes = Math.floor(maxtime/60);   
 	     seconds = Math.floor(maxtime%60);
    	 /* msg = "距离考试结束还有"+minutes+"分"+seconds+"秒"; */
   		 msg = "截止时间： <br> "+time2;
    	 document.all["timer"].innerHTML = msg;
        if(maxtime == 5*60) alert('注意，还有5分钟!');
  	    --maxtime;
       window.name = maxtime;    
      }    
      else{     
        clearInterval(timer);     
	    return;
      }    
    }    
    timer = setInterval("CountDown()",1000);
</script>







</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.action.Create"%>
<%@page import="com.dao.UserDao" %>
<%@page import="com.pojo.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
String ownerid = (String)request.getSession().getAttribute("ownerid");
UserDao ud=new UserDao();
User u=ud.dologin(ownerid);
String owmername = u.getUname();
%>
<title><%=owmername + "（" + ownerid + "）" %>老师的试卷</title>
<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css'>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<link href="css/header.css" rel='stylesheet' type='text/css'>
<link href="css/browseQ.css" rel='stylesheet' type='text/css'>
<link href="css/button.css" rel='stylesheet' type='text/css'>
</head>
<body>
<!-- 顶部菜单 -->
<div class="header">

    <a class="head1" href="home.jsp">主界面</a>

    <a class="head2" style="cursor:default;"><img src="ImageDisplay?id=user" width="75px" height="75px"></a>
        
    <a class="head3" style="cursor:default;"><%=request.getSession().getAttribute("username") %></a>

    <a class="head4" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">反馈</a>


</div>
<div class="content">


  <table class="mytable" >
   <%
  	String id=(String)request.getSession().getAttribute("ownerid");
    //String id="111";
	Create cv=new Create();
	StringBuilder s=cv.browseExam(id);
	out.println(s);
  %>
<!-- 		<tr>
		  <td><a href="tQuery.jsp">标题1</a></td>
		  	<td><input type="button" value="发布" class="btn btn-default btn1 pull-left" data-toggle="modal" data-target="#applyModal"></td>
		  	<td><input type="button" value="查看成绩" onclick="window.location='totGrade.jsp'"></td><td><input type="button" value="删除"></td>
		</tr>
		<tr>
		  <td><a href="tQuery.jsp">标题2</a></td>
		  	<td><input type="button" value="发布" class="btn btn-default btn1 pull-left" data-toggle="modal" data-target="#applyModal"></td>
		  	<td><input type="button" value="查看成绩" onclick="window.location='totGrade.jsp'"> <td><input type="button" value="删除"></td>
		</tr> -->
  </table>	
  
  <!-- 
<input type="button" value="添加" onclick="window.location='query.jsp'">


		<div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="applyModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog_1">
				<div class="modal-content">
							    	
				    <div class="modal-header">
					    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					    <h4 class="modal-title" id="myModalLabel">
					        <p>时长</p>
			            </h4>
					</div>
					      	
	                <div class="modal-body">
                        <form name=row action="" method="post" onsubmit="return check();">
                             
                                <input type="text" name="min" id="min" placeholder="请填入分钟，无则填0">分  
                         
                                <input type="text" name="sec" id="sec" placeholder="请填入秒数，无则填0">秒
                    
                            <div class="section">
                                <div class="submit">
                                    <input type="submit" name="submit" value="提交">
                                </div>
                            </div>
                               
                        </form>
                    </div>
				</div>
		    </div>
		</div>
		<script>
		function check(){
			var x=document.getElementById("min").value;
			var y=document.getElementById("sec").value;
			if(x==""){
				alert("分钟不能为空");
			    return false;
			}
			if(y==""){
			    alert("秒数无则填0");
			    return false;
			}	        
			return true;
		}
			
		</script>
		-->
</div>
</body>
</html>
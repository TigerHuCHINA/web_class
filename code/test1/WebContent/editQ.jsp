<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.action.Create"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑试卷</title>
<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css'>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
<h1 align="center">编辑试卷</h1>

  <table width="300">
   <%
  	String id=(String)request.getSession().getAttribute("userid");
	Create cv=new Create();
	StringBuilder s=cv.createExam(id);
	out.println(s);
  %>
		<tr>
		  <td><a href="tQuery.jsp">标题1</a></td>
		  	<td><input type="button" value="发布" class="btn btn-default btn1 pull-left" data-toggle="modal" data-target="#applyModal"></td>
		  	<td><input type="button" value="查看成绩" onclick="window.location='totGrade.jsp'"></td><td><input type="button" value="删除"></td>
		</tr>
		<tr>
		  <td><a href="tQuery.jsp">标题2</a></td>
		  	<td><input type="button" value="发布" class="btn btn-default btn1 pull-left" data-toggle="modal" data-target="#applyModal"></td>
		  	<td><input type="button" value="查看成绩" onclick="window.location='totGrade.jsp'"> <td><input type="button" value="删除"></td>
		</tr>
  </table>	
<input type="button" value="添加" onclick="window.location='query.jsp'">

		<!-- -------------弹出框-------------------------	 -->
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
</body>
</html>
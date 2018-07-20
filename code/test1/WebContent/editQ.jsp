<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="com.action.Create"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑试卷</title>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css'>
<link href="css/header.css" rel='stylesheet' type='text/css'>
<link href="css/editQ.css" rel='stylesheet' type='text/css'>
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


<form action="doPublish" method="post">
<input type= "hidden" id="exam" name="exam">
<input name="min" id="txt1" type="text" placeholder="请输入截止时间（多少分钟）">
  <table id="myTable" width="500">
<% 
Create create = new Create();
StringBuilder s = create.createExam((String)request.getSession().getAttribute("userid"));
out.println(s);
%>
  </table>	
</form>  
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
</div>
</body>
</html>
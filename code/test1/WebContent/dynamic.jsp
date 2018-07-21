<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.* ,javax.servlet.* ,java.util.* ,java.awt.* ,com.action.*, com.comm.* ,com.dao.* ,com.pojo.*"%>
<%if(request.getSession().getAttribute("userid")==null)response.sendRedirect("home.jsp"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link href="css/header.css" rel='stylesheet' type='text/css'>
<link href="css/dynamic.css" rel='stylesheet' type='text/css'>
<title>动态界面</title>
</head>
<body>

<!-- 顶部菜单 -->
<div class="header">


    <a class="head1" href="home.jsp">主界面</a>

    <a class="head2" href="homePage.jsp"><img src="ImageDisplay?id=user" width="100%" height="100%"></a>
        
    <a class="head3">尊敬的<%=request.getSession().getAttribute("username") %>欢迎光临</a>

    <a class="head4" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">反馈</a>


</div>

<!-- -----------------------------------------切换开始---------------------- -->
<div class="container">
    <div class="tab-wrap">
            <input type="radio" id="tab1" name="tabGroup1" class="tab" checked>
            <label for="tab1">点赞</label>

			<input type="radio" id="tab2" name="tabGroup1" class="tab">
            <label for="tab2">关注</label>
            
            <input type="radio" id="tab3" name="tabGroup1" class="tab">
            <label for="tab3">收藏</label>

            <input type="radio" id="tab4" name="tabGroup1" class="tab">
            <label for="tab4">私信</label>

            <input type="radio" id="tab5" name="tabGroup1" class="tab">
            <label for="tab5">评论</label>
            
            <input type="radio" id="tab6" name="tabGroup1" class="tab">
            <label for="tab6">好友列表</label>
            
            <input type="radio" id="tab7" name="tabGroup1" class="tab">
            <label for="tab7">好友动态</label>

            <div class="tab__content">
                
            	<div class="dianzan">
            		<ul>
            		<%
					String id=(String)request.getSession().getAttribute("userid");
            		//String id1="11";
					Create cv1=new Create();
					StringBuilder s1=cv1.createAgree(id);
					out.println(s1);
					%>
            		</ul>
            	</div>   
            </div>

			<div class="tab__content">
            	<div class="guanzhu">
            		<ul>
            		<%
					//String id2=(String)request.getSession().getAttribute("userid");
            		//String id2="11";
					Create cv2=new Create();
					//Follow follow = new Follow();
					//String userId = follow.getFollowerid();
					StringBuilder s2=cv2.createFollow(id);
					out.println(s2);
					%>
            		</ul>
            	</div>   
            </div>
            
            <div class="tab__content">
            	<div class="shoucang">
            		<ul>
            		<%
					//String id3=(String)request.getSession().getAttribute("userid");
            		//String id3="11";
					Create cv3=new Create();
					//Follow follow = new Follow();
					//String userId = follow.getFollowerid();
					StringBuilder s3=cv3.createCollection(id);
					out.println(s3);
					%>
            		</ul>
            	</div>   
            </div>

            <div class="tab__content">
                <div class="sixin">
                <%
                //String id4="11";
                //String id4=(String)request.getSession().getAttribute("userid");
                Create cv4=new Create();
				StringBuilder s4=cv4.createMessage(id);
				out.println(s4);
                %>
                </div>
         </div>
            
           <div class="tab__content">
                <div class="pinglun">
           <%
           		//String id5="11";
	           	//String id5=(String)request.getSession().getAttribute("userid");
	           	Create cv5=new Create();
				
				StringBuilder s5=cv5.createCommentR(id);
				out.println(s5);
           %>    
           </div> 
           </div>
           
           <div class="tab__content">
           		<div class="haoyou">
           		<ul>
           <%
           		//String id6=(String)request.getSession().getAttribute("userid");
           		Create cv6=new Create();
           		StringBuilder s6=cv6.createFriend(id);
           		out.println(s6);
           %>
           </ul>
           </div>
			</div>
    		<div class="tab__content">
           		<div class="dongtai">
           		<ul>
           <%
           		//String id7=(String)request.getSession().getAttribute("userid");
           		Create cv7=new Create();
           		StringBuilder s7=cv7.createExamPublish(id);
           		out.println(s7);
           %>
           </ul>
           </div>
    </div>
    
</div>
<!-- --------------------------------TAB切换结束---------------------------------------------- -->
<script>
function  check()
{
	var content=$("te").value;
	content=trim(content);
	if(content.length<1)
	{
		alert("请输入内容");
		return false;
	}
	var infoid=<%=session.getAttribute("infoid")%>;
	if(infoid!=null){
		alert("回复成功！");
		document.getElementById("te").value="";
		return true;
	}
}			
function $(id){
	return document.getElementById(id);
}
function trim(str){ //删除左右两端的空格
	return str.replace(/(^\s*)|(\s*$)/g, "");
}

</script>

</body>
</html>
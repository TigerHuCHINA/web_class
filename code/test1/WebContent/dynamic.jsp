<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.* ,javax.servlet.* ,java.util.* ,java.awt.* ,com.action.*, com.comm.* ,com.dao.* ,com.pojo.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>动态界面</title>
<!-- --------------------------------TAB切换------------------------- -->
 <style type="text/css">
        .tab-wrap {
            -webkit-transition: 0.3s box-shadow ease;
            transition: 0.3s box-shadow ease;
            border-radius: 6px;
            max-width: 100%;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-flex-wrap: wrap;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            position: relative;
            list-style: none;
            background-color: #fff;
            margin: 40px 0;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
        }
        .tab-wrap:hover {
            box-shadow: 0 12px 23px rgba(0, 0, 0, 0.23), 0 10px 10px rgba(0, 0, 0, 0.19);
        }

        .tab {
            display: none;
        }
        .tab:checked:nth-of-type(1) ~ .tab__content:nth-of-type(1) {
            opacity: 1;
            -webkit-transition: 0.5s opacity ease-in, 0.8s transform ease;
            transition: 0.5s opacity ease-in, 0.8s transform ease;
            position: relative;
            top: 0;
            z-index: 100;
            -webkit-transform: translateY(0px);
            transform: translateY(0px);
            text-shadow: 0 0 0;
        }
        .tab:checked:nth-of-type(2) ~ .tab__content:nth-of-type(2) {
            opacity: 1;
            -webkit-transition: 0.5s opacity ease-in, 0.8s transform ease;
            transition: 0.5s opacity ease-in, 0.8s transform ease;
            position: relative;
            top: 0;
            z-index: 100;
            -webkit-transform: translateY(0px);
            transform: translateY(0px);
            text-shadow: 0 0 0;
        }
        .tab:checked:nth-of-type(3) ~ .tab__content:nth-of-type(3) {
            opacity: 1;
            -webkit-transition: 0.5s opacity ease-in, 0.8s transform ease;
            transition: 0.5s opacity ease-in, 0.8s transform ease;
            position: relative;
            top: 0;
            z-index: 100;
            -webkit-transform: translateY(0px);
            transform: translateY(0px);
            text-shadow: 0 0 0;
        }
        .tab:checked:nth-of-type(4) ~ .tab__content:nth-of-type(4) {
            opacity: 1;
            -webkit-transition: 0.5s opacity ease-in, 0.8s transform ease;
            transition: 0.5s opacity ease-in, 0.8s transform ease;
            position: relative;
            top: 0;
            z-index: 100;
            -webkit-transform: translateY(0px);
            transform: translateY(0px);
            text-shadow: 0 0 0;
        }
        .tab:checked:nth-of-type(5) ~ .tab__content:nth-of-type(5) {
            opacity: 1;
            -webkit-transition: 0.5s opacity ease-in, 0.8s transform ease;
            transition: 0.5s opacity ease-in, 0.8s transform ease;
            position: relative;
            top: 0;
            z-index: 100;
            -webkit-transform: translateY(0px);
            transform: translateY(0px);
            text-shadow: 0 0 0;
        }
        .tab:first-of-type:not(:last-of-type) + label {
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
        }
        .tab:not(:first-of-type):not(:last-of-type) + label {
            border-radius: 0;
        }
        .tab:last-of-type:not(:first-of-type) + label {
            border-top-left-radius: 0;
            border-bottom-left-radius: 0;
        }
        .tab:checked + label {
            background-color: #fff;
            box-shadow: 0 -1px 0 #fff inset;
            cursor: default;
        }
        .tab:checked + label:hover {
            box-shadow: 0 -1px 0 #fff inset;
            background-color: #fff;
        }
        .tab + label {
            box-shadow: 0 -1px 0 #eee inset;
            border-radius: 6px 6px 0 0;
            cursor: pointer;
            display: block;
            text-decoration: none;
            color: #333;
            -webkit-box-flex: 3;
            -webkit-flex-grow: 3;
            -ms-flex-positive: 3;
            flex-grow: 3;
            text-align: center;
            background-color: #f2f2f2;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            text-align: center;
            -webkit-transition: 0.3s background-color ease, 0.3s box-shadow ease;
            transition: 0.3s background-color ease, 0.3s box-shadow ease;
            height: 50px;
            box-sizing: border-box;
            padding: 15px;
        }
        .tab + label:hover {
            background-color: #f9f9f9;
            box-shadow: 0 1px 0 #f4f4f4 inset;
        }
        .tab__content {
            padding: 10px 25px;
            background-color: transparent;
            position: absolute;
            width: 100%;
            z-index: -1;
            opacity: 0;
            left: 0;
            -webkit-transform: translateY(-3px);
            transform: translateY(-3px);
            border-radius: 6px;
        }

        /* boring stuff */
        body {
            font-family: 'Maven Pro', sans-serif;
            background-color: #e7e7e7;
            color: #777;
            padding: 30px 0;
        }

        .container {
            margin: 0 auto;
            display: block;
            max-width: 800px;
        }
        .container > *:not(.tab-wrap) {
            padding: 0 80px;
        }

        h1,
        h2 {
            margin: 0;
            color: #444;
            text-align: center;
        }

        h2 {
            font-size: 1em;
            margin-bottom: 30px;
        }

        p {
            line-height: 1.6;
            margin-bottom: 20px;
        }
        </style>

<!-- ---------------------------------切换结束------------------------------- -->
<style>
.content {
	width:450px;
	line-height:20px;
	font-size:14px;
	margin-left:70px;
}
.name {
	color:#eb7350;
}
.good:after {
	clear:both;
	content:'';
	display:block;
	width:0;
	height:0;
	visibility:hidden;
}
.good {
	*zoom:1;
}
.date {
	float:left;
	color:#808080;
}
.good a {
	float:right;
	color:#808080;
}
.people {
	background:#F7F7F7;
	height:28px;
	line-height:28px;
	padding-left:10px;
	margin:5px 0;
}
.comment:after {
	clear:both;
	content:'';
	display:block;
	width:0;
	height:0;
	visibility:hidden;
}
.comment {
	*zoom:1;
	padding:10px 0;
	border-top:1px solid #eee;
}
.comment-left {
	width:30px;
	float:left;
	display:inline;
	margin-right:10px;
}
.comment-left img {
	width:30px;
	height:30px;
}
.comment-right {
	float:left;
	width:410px;
}
.comment-text {
	line-height:18px;
}
.comment-text span {
	color:#eb7350;
}
.comment-date {
	font-size:12px;
	line-height:14px;
	color:#ccc;
	position:relative;
}
.comment-zan {
	position:absolute;
	right:40px;
	bottom:0;
	color:#808080;
}
</style>
</head>
<body>
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

            <div class="tab__content">
                <h3>点赞</h3>
            	<div class="dianzan">
            		<ul>
            		<%
					String id1=(String)request.getSession().getAttribute("userid");
            		//String id1="11";
					Create cv1=new Create();
					StringBuilder s1=cv1.createAgree(id1);
					out.println(s1);
					%>
            		</ul>
            	</div>   
            </div>

			<div class="tab__content">
                <h3>关注</h3>
            	<div class="guanzhu">
            		<ul>
            		<%
					String id2=(String)request.getSession().getAttribute("userid");
            		//String id2="11";
					Create cv2=new Create();
					//Follow follow = new Follow();
					//String userId = follow.getFollowerid();
					StringBuilder s2=cv2.createFollow(id2);
					out.println(s2);
					%>
            		</ul>
            	</div>   
            </div>
            
            <div class="tab__content">
                <h3>收藏</h3>
            	<div class="guanzhu">
            		<ul>
            		<%
					String id3=(String)request.getSession().getAttribute("userid");
            		//String id3="11";
					Create cv3=new Create();
					//Follow follow = new Follow();
					//String userId = follow.getFollowerid();
					StringBuilder s3=cv3.createCollection(id3);
					out.println(s3);
					%>
            		</ul>
            	</div>   
            </div>

            <div class="tab__content">
                <h3>私信</h3>
                <%
                //String id4="11";
                String id4=(String)request.getSession().getAttribute("userid");
                Create cv4=new Create();
				StringBuilder s4=cv4.createMessage(id4);
				out.println(s4);
                %>
         </div>
            
            <div class="tab__content">
                <h3>评论</h3>
           <%
           		//String id5="11";
	           	String id5=(String)request.getSession().getAttribute("userid");
	           	Create cv5=new Create();
				
				StringBuilder s5=cv5.createCommentR(id5);
				out.println(s5);
           %>     
<!-- 
            	<ul id="pn">
  				 <li class="list">
      			  <div class="content">
      			      <div class="comment-list">
              		  <div class="comment">
               	      <div class="comment-right">
                        <div class="comment-text"><span class="user"><%//评论人 %></span><%//说了什么 %></div>
                        <div class="comment-date">02-14 22:00 <input type="button" class="comment-zan" onclick="dianzan()" value="23 赞">
                   		    <a class="comment-dele" href="#C2">回复</a>
                        </div>
                  	 </div>
              		</div>
          			</div>
     			    <form name="form1" method="post" action="">
         			   <div class="hf">
          			   <textarea name="C2" id="te" class="hf-text" autocomplete="off" maxlength="100" rows="10" cols="50"></textarea>
         	 		   <input type="submit" class="comment-dele" value="提交回复" onclick="return check()"/>
               		   <span class="hf-nub">0/100</span> </div>
         		   </form>
     			 </div>
   			   </li>
			</ul> 
-->			
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
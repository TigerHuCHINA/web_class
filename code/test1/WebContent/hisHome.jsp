<%@page import="com.pojo.UserEdit"%>
<%@page import="com.action.getInfo"%>
<%@page import="com.action.UserCountAction" %>
<%@page import="java.sql.* ,javax.servlet.* ,java.util.* ,java.awt.* ,com.action.*, com.comm.* ,com.dao.* ,com.pojo.*" %>
<%if(request.getSession().getAttribute("userid")==null)response.sendRedirect("home.jsp"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<%
String ownerid=(String)request.getParameter("ownerid");
UserEditDao ued=new UserEditDao();
UserEdit ue=ued.getInfoById(ownerid);
UserDao ud=new UserDao();
User u=ud.dologin(ownerid);
String ownername=u.getUname();
String birthday=ue.getUbirthday();
String sex=ue.getUsex();
String school=ue.getUschool();
String profession=ue.getUprofession();
String introduce=ue.getUintroduce();
String province = ue.getUprovince();
String city = ue.getUcity();
String follow = ue.getFollow();
String view = ue.getView();
request.getSession().setAttribute("ownerid",ownerid);
%>

<link href="css/button.css" rel='stylesheet' type='text/css'>
<link href="css/header.css" rel='stylesheet' type='text/css'>
<link href="css/homePageStyle.css" rel='stylesheet' type='text/css'>
<link href="css/video.css" rel='stylesheet' type='text/css'>
<!-- <link href="css/style.css" rel='stylesheet' type='text/css'> -->

<script src="js/calender.js"></script>
<script src="js/location.js"></script>

<title><%=ownername + "（" + ownerid + "）" %>的个人主页</title>
	

</head>
<body>

<%
	
	/*getInfo get = new getInfo();
	String name = (String)session.getAttribute("userid");
	UserEdit u = get.getInfoById(name);
	String id = String.valueOf(11);
	String id0= String.valueOf(11);
	UserCountAction usercount = new UserCountAction();
	usercount.doo(id,id0);*/
if(((String)request.getSession().getAttribute("userid")).equals((String)request.getParameter("ownerid")))
		{
			response.sendRedirect("homePage.jsp");
		}

%>

<!----------------顶部菜单--------------->
<div class="header">


    <a class="head1" href="home.jsp">主界面</a>

    <a class="head2" href="homePage.jsp"><img src="ImageDisplay?id=user"  width="100%" height="100%"></a>
     
    <a class="head3">尊敬的<%=request.getSession().getAttribute("username") %>欢迎光临</a>

    <a class="head4" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">反馈</a>


</div>


<!-- 个人头像与信息 -->
<div class="myinformation">
    <div class="image">
        <img src="ImageDisplay?id=owner"/>    
    </div>
    <div class="informationbox">
        <div id="username" class="info">
            <tr>
                <td>用户名: </td>
                <td><%=ownername%></td>
            </tr>
        </div>
    
        <div id="userid" class="info">
            <tr>
                <td>用户账号: </td>
                <td><%=ownerid%></td>
            </tr>
        </div>
    
        <div id="userlocation" class="info">
            <tr>
                <td>所在地: </td>
                <td><%=province%> <%//=city %></td>
            </tr>
        </div>
    
        <div id="userdate" class="info">
            <tr>
                <td>生日: </td>
                <td><%=birthday %></td>
            </tr>
        </div>
    
        <div id="usersex" class="info">
            <tr>
                <td>性别: </td>
                <td><%=sex%></td>
            </tr>
        </div>
    
        <div id="userschool" class="info">
            <tr>
                <td>学校: </td>
                <td><%=school%></td>
            </tr>
        </div>
    
        <div id="userclass" class="info">
            <tr>
                <td>专业: </td>
                <td><%=profession%></td>
            </tr>
        </div>
        <div id="userinformation" class="info">
            <tr>
                <td>个人简介: </td>
                <td><%=introduce%></td>
            </tr>
        </div>
        <div id="userfocus" class="info">
            <tr>
                <td>关注量: </td>
                <td><%=follow %></td>
            </tr>
        </div>
    
        <div id="userread" class="info">
	        <tr>
	            <td>浏览量: </td>
	            <td><%=view %></td>
	        </tr>
        </div>
           
    </div>
    <canvas id="canv"></canvas>
</div>


<div class="mybuttons">
    <div>
	    <a class="mybtn1 btn btn-medium type2" href = "javascript:void(0)" onclick = "document.getElementById('light1').style.display='block';document.getElementById('fade').style.display='block'">私信</a>
    </div>



<!-- -----------------------------------关注、收藏----------------------------------- -->

<div>
<%
FollowDao fd=new FollowDao();
boolean hasfollow=fd.hasFollow((String)request.getSession().getAttribute("ownerid"),(String)request.getSession().getAttribute("userid"));
if(hasfollow){
out.print("<a class='mybtn1 btn btn-medium type1' onmouseover=\"mOver(this)\" onmouseout=\"mOut(this)\" href='doFollow?flag=de' onclick='focus();'>已关注</a>");
}else{
out.print("<a class='mybtn1 btn btn-medium type1' href='doFollow?flag=add' onclick='focus();'>关注</a>");
}
%>

</div>

<div>
	    <a class="mybtn1 btn btn-medium type3" href = "browseQ.jsp">查看题库</a>
    </div>

<script>
function mOver(obj)
{
obj.innerHTML="取消关注"
}

function mOut(obj)
{
obj.innerHTML="已关注"
}
</script>

<!-- ---------------------------------------------私信----------------------------------------------- 
<div class="sixin"><a href="#" onclick="return PopLayer(this)">私信</a></div>
<div id="lightbox2"></div>
<div id="pop2" style="background-image:url(picture/back.jpg)">-->




<!-- 隐藏界面1 -->
<div id="light1">
    <a href = "javascript:void(0)" id= "close1" onclick = "document.getElementById('light1').style.display='none';document.getElementById('fade').style.display='none'">×</a>  
    <form action = "doMessage" method = "post">
        <div class="char">
        	<textarea name="content" id="te" rows="11" cols="45"></textarea>
        </div>
        <div>
        	<input class="check" type="submit" value="提交" onclick="check()"/>
        </div>
	</form>
</div> 
</div>

<div class="videos">
    <div class="myvideo">
        <div class="title1">他的视频： 共
    <%
        VideoDao dao = new VideoDao();
        out.print(dao.getInfoByUserId(ownerid).size());
     %>    
        个视频</div>
    </div>
    <%
Create c=new Create();
StringBuilder s=c.createUploadVideo(ownerid);
out.println(s);
%>

<div id="fade" class="black_overlay"></div> 

<%
	/*String id1 = String.valueOf(11);
	String id2= String.valueOf(11);
	UserCountAction visitorcount = new UserCountAction();
	visitorcount.doo(id1,id2);*/
%>   
<%
	getInfo get = new getInfo();
	String name = (String)request.getSession().getAttribute("userid");
	String id = String.valueOf(name);
	String id0= String.valueOf((String)request.getSession().getAttribute("ownerid"));
	UserCountAction usercount = new UserCountAction();
	usercount.doo(id,id0);
%>




<!-- 个人信息动态 -->
<script>
var num = 200;
var w = window.innerWidth;
var h = window.innerHeight;
var max = 100;
var _x = 0;
var _y = 0;
var _z = 150;
var dtr = function(d) {
  return d * Math.PI / 180;
};

var rnd = function() {
  return Math.sin(Math.floor(Math.random() * 360) * Math.PI / 180);
};
var dist = function(p1, p2, p3) {
  return Math.sqrt(Math.pow(p2.x - p1.x, 2) + Math.pow(p2.y - p1.y, 2) + Math.pow(p2.z - p1.z, 2));
};

var cam = {
  obj: {
    x: _x,
    y: _y,
    z: _z
  },
  dest: {
    x: 0,
    y: 0,
    z: 1
  },
  dist: {
    x: 0,
    y: 0,
    z: 200
  },
  ang: {
    cplane: 0,
    splane: 0,
    ctheta: 0,
    stheta: 0
  },
  zoom: 1,
  disp: {
    x: w / 2,
    y: h / 2,
    z: 0
  },
  upd: function() {
    cam.dist.x = cam.dest.x - cam.obj.x;
    cam.dist.y = cam.dest.y - cam.obj.y;
    cam.dist.z = cam.dest.z - cam.obj.z;
    cam.ang.cplane = -cam.dist.z / Math.sqrt(cam.dist.x * cam.dist.x + cam.dist.z * cam.dist.z);
    cam.ang.splane = cam.dist.x / Math.sqrt(cam.dist.x * cam.dist.x + cam.dist.z * cam.dist.z);
    cam.ang.ctheta = Math.sqrt(cam.dist.x * cam.dist.x + cam.dist.z * cam.dist.z) / Math.sqrt(cam.dist.x * cam.dist.x + cam.dist.y * cam.dist.y + cam.dist.z * cam.dist.z);
    cam.ang.stheta = -cam.dist.y / Math.sqrt(cam.dist.x * cam.dist.x + cam.dist.y * cam.dist.y + cam.dist.z * cam.dist.z);
  }
};

var trans = {
  parts: {
    sz: function(p, sz) {
      return {
        x: p.x * sz.x,
        y: p.y * sz.y,
        z: p.z * sz.z
      };
    },
    rot: {
      x: function(p, rot) {
        return {
          x: p.x,
          y: p.y * Math.cos(dtr(rot.x)) - p.z * Math.sin(dtr(rot.x)),
          z: p.y * Math.sin(dtr(rot.x)) + p.z * Math.cos(dtr(rot.x))
        };
      },
      y: function(p, rot) {
        return {
          x: p.x * Math.cos(dtr(rot.y)) + p.z * Math.sin(dtr(rot.y)),
          y: p.y,
          z: -p.x * Math.sin(dtr(rot.y)) + p.z * Math.cos(dtr(rot.y))
        };
      },
      z: function(p, rot) {
        return {
          x: p.x * Math.cos(dtr(rot.z)) - p.y * Math.sin(dtr(rot.z)),
          y: p.x * Math.sin(dtr(rot.z)) + p.y * Math.cos(dtr(rot.z)),
          z: p.z
        };
      }
    },
    pos: function(p, pos) {
      return {
        x: p.x + pos.x,
        y: p.y + pos.y,
        z: p.z + pos.z
      };
    }
  },
  pov: {
    plane: function(p) {
      return {
        x: p.x * cam.ang.cplane + p.z * cam.ang.splane,
        y: p.y,
        z: p.x * -cam.ang.splane + p.z * cam.ang.cplane
      };
    },
    theta: function(p) {
      return {
        x: p.x,
        y: p.y * cam.ang.ctheta - p.z * cam.ang.stheta,
        z: p.y * cam.ang.stheta + p.z * cam.ang.ctheta
      };
    },
    set: function(p) {
      return {
        x: p.x - cam.obj.x,
        y: p.y - cam.obj.y,
        z: p.z - cam.obj.z
      };
    }
  },
  persp: function(p) {
    return {
      x: p.x * cam.dist.z / p.z * cam.zoom,
      y: p.y * cam.dist.z / p.z * cam.zoom,
      z: p.z * cam.zoom,
      p: cam.dist.z / p.z
    };
  },
  disp: function(p, disp) {
    return {
      x: p.x + disp.x,
      y: -p.y + disp.y,
      z: p.z + disp.z,
      p: p.p
    };
  },
  steps: function(_obj_, sz, rot, pos, disp) {
    var _args = trans.parts.sz(_obj_, sz);
    _args = trans.parts.rot.x(_args, rot);
    _args = trans.parts.rot.y(_args, rot);
    _args = trans.parts.rot.z(_args, rot);
    _args = trans.parts.pos(_args, pos);
    _args = trans.pov.plane(_args);
    _args = trans.pov.theta(_args);
    _args = trans.pov.set(_args);
    _args = trans.persp(_args);
    _args = trans.disp(_args, disp);
    return _args;
  }
};

(function() {
  "use strict";
  var threeD = function(param) {
    this.transIn = {};
    this.transOut = {};
    this.transIn.vtx = (param.vtx);
    this.transIn.sz = (param.sz);
    this.transIn.rot = (param.rot);
    this.transIn.pos = (param.pos);
  };

  threeD.prototype.vupd = function() {
    this.transOut = trans.steps(

      this.transIn.vtx,
      this.transIn.sz,
      this.transIn.rot,
      this.transIn.pos,
      cam.disp
    );
  };

  var Build = function() {
    this.vel = 0.04;
    this.lim = 360;
    this.diff = 200;
    this.initPos = 100;
    this.toX = _x;
    this.toY = _y;
    this.go();
  };

  Build.prototype.go = function() {
    this.canvas = document.getElementById("canv");
    this.canvas.width = window.innerWidth;
    this.canvas.height = window.innerHeight;
    this.$ = canv.getContext("2d");
    this.$.globalCompositeOperation = 'source-over';
    this.varr = [];
    this.dist = [];
    this.calc = [];

    for (var i = 0, len = num; i < len; i++) {
      this.add();
    }

    this.rotObj = {
      x: 0,
      y: 0,
      z: 0
    };
    this.objSz = {
      x: w / 5,
      y: h / 5,
      z: w / 5
    };
  };

  Build.prototype.add = function() {
    this.varr.push(new threeD({
      vtx: {
        x: rnd(),
        y: rnd(),
        z: rnd()
      },
      sz: {
        x: 0,
        y: 0,
        z: 0
      },
      rot: {
        x: 20,
        y: -20,
        z: 0
      },
      pos: {
        x: this.diff * Math.sin(360 * Math.random() * Math.PI / 180),
        y: this.diff * Math.sin(360 * Math.random() * Math.PI / 180),
        z: this.diff * Math.sin(360 * Math.random() * Math.PI / 180)
      }
    }));
    this.calc.push({
      x: 360 * Math.random(),
      y: 360 * Math.random(),
      z: 360 * Math.random()
    });
  };

  Build.prototype.upd = function() {
    cam.obj.x += (this.toX - cam.obj.x) * 0.05;
    cam.obj.y += (this.toY - cam.obj.y) * 0.05;
  };

  Build.prototype.draw = function() {
    this.$.clearRect(0, 0, this.canvas.width, this.canvas.height);
    cam.upd();
    this.rotObj.x += 0.1;
    this.rotObj.y += 0.1;
    this.rotObj.z += 0.1;

    for (var i = 0; i < this.varr.length; i++) {
      for (var val in this.calc[i]) {
        if (this.calc[i].hasOwnProperty(val)) {
          this.calc[i][val] += this.vel;
          if (this.calc[i][val] > this.lim) this.calc[i][val] = 0;
        }
      }

      this.varr[i].transIn.pos = {
        x: this.diff * Math.cos(this.calc[i].x * Math.PI / 180),
        y: this.diff * Math.sin(this.calc[i].y * Math.PI / 180),
        z: this.diff * Math.sin(this.calc[i].z * Math.PI / 180)
      };
      this.varr[i].transIn.rot = this.rotObj;
      this.varr[i].transIn.sz = this.objSz;
      this.varr[i].vupd();
      if (this.varr[i].transOut.p < 0) continue;
      var g = this.$.createRadialGradient(this.varr[i].transOut.x, this.varr[i].transOut.y, this.varr[i].transOut.p, this.varr[i].transOut.x, this.varr[i].transOut.y, this.varr[i].transOut.p * 2);
      this.$.globalCompositeOperation = 'lighter';
      g.addColorStop(0, 'hsla(255, 255%, 255%, 1)');
      g.addColorStop(.5, 'hsla(' + (i + 2) + ',85%, 40%,1)');
      g.addColorStop(1, 'hsla(' + (i) + ',85%, 40%,.5)');
      this.$.fillStyle = g;
      this.$.beginPath();
      this.$.arc(this.varr[i].transOut.x, this.varr[i].transOut.y, this.varr[i].transOut.p * 2, 0, Math.PI * 2, false);
      this.$.fill();
      this.$.closePath();
    }
  };
  Build.prototype.anim = function() {
    window.requestAnimationFrame = (function() {
      return window.requestAnimationFrame ||
        function(callback, element) {
          window.setTimeout(callback, 1000 / 60);
        };
    })();
    var anim = function() {
      this.upd();
      this.draw();
      window.requestAnimationFrame(anim);
    }.bind(this);
    window.requestAnimationFrame(anim);
  };

  Build.prototype.run = function() {
    this.anim();

    window.addEventListener('mousemove', function(e) {
      this.toX = (e.clientX - this.canvas.width / 2) * -0.8;
      this.toY = (e.clientY - this.canvas.height / 2) * 0.8;
    }.bind(this));
    window.addEventListener('touchmove', function(e) {
      e.preventDefault();
      this.toX = (e.touches[0].clientX - this.canvas.width / 2) * -0.8;
      this.toY = (e.touches[0].clientY - this.canvas.height / 2) * 0.8;
    }.bind(this));
    window.addEventListener('mousedown', function(e) {
      for (var i = 0; i < 100; i++) {
        this.add();
      }
    }.bind(this));
    window.addEventListener('touchstart', function(e) {
      e.preventDefault();
      for (var i = 0; i < 100; i++) {
        this.add();
      }
    }.bind(this));
  };
  var app = new Build();
  app.run();
})();
window.addEventListener('resize', function() {
  canvas.width = w = window.innerWidth;
  canvas.height = h = window.innerHeight;
}, false);
</script>


</body>
</html>
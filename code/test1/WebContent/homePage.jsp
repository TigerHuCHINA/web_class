<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人主页</title>
<link rel="stylesheet" href="http://imgcache.gtimg.cn/tencentvideo_v1/vstyle/web/v3/style/base.css?t=20160323">
<link rel="stylesheet" href="http://imgcache.gtimg.cn/tencentvideo_v1/vstyle/web/v3/style/personal/ordinary.css?t=20160323" />
<script type="text/javascript">
		if(~window.location.protocol.indexOf('https')) {
		window.location.href = window.location.href.replace(/^https/g, 'http')
		}
		try{
		document.domain="qq.com"
		}catch(e){}
		function picerr(obj,i){
		obj.onerror=null;
		var src = '';
		switch(i) {
		case 1: src = 'http://i.gtimg.cn/qqlive/images/20150608/pic_v.png'; break; // 竖图
		case 2: src = 'http://i.gtimg.cn/qqlive/images/20150608/pic_h.png'; break; // 横图
		default: src = 'http://i.gtimg.cn/qqlive/images/20150608/pic_h.png'; break;
		}
		obj.src = src;
		}
		var d0 = new Date();
		var timePoints=new Array();
		function _sreport(){
		if(Math.random()<0.1){ 
				var s = [];
				for(var i=0;i<timePoints.length;i++)
				if(!!timePoints[i]){
					s.push((i+1)+"="+(timePoints[i]-d0));
				}
				var url = "http://isdspeed.qq.com/cgi-bin/r.cgi?flag1=1422&flag2=202&flag3=33&"+s.join("&");		 
				window._speed_img = new Image();
				window._speed_img.src=url;
			}
		}

</script>
<style type='text/css'>
		.mod_box{
		float: none;
		width: auto;
		}
</style>	
</head>
<body>
 <div class="site_head_simple site_head_simple_promotion" id="head_v3">
	<div class="head_inner">
  </div> 
		<!-- 快捷入口 开始 -->
		<div class="mod_quick cf">
		<div class="quick_item quick_user" id="mod_head_user">
		 <a class="quick_link _checklogin" _hot="{pagetype}.mini.mytv" id="mod_head_notice_trigger"><img src="http://imgcache.gtimg.cn/tencentvideo_v1/vstyle/web/v3/style/images/default_avatar.png" data-type="avatar" data-avatarsize="40"><i class="ico_vip_grey" data-type="viplogo" style="display:none;"></i><i class="icon_account_qq20" data-type="account_type_logo" style="display: none;"></i><sup class="dot_notice" id="mod_nav_user_notice_dot" style="display:none;"></sup></a>
		 </div>
	</div>
<div class="site_cover">
	<div class="site_bg">
		<img src="http://i.gtimg.cn/qqlive/images/20160329/i1459243403_1.jpg" onerror="this.src=null;this.error=null;">
	</div>
	<div class="cover_inner">
		<div class="cover_user cf">
		<div class="user_avatar"><a href="javascript:void(0);" class="img_wrap" ><img src="http://www.qqw21.com/article/uploadpic/2012-9/201291893228996.jpg" /></a></div>
		<div class="user_info">
		<div class="user_info_inner">
		<h2 class="user_info_name">username</h2>
	<!-- 	<p><a class="" href="#" onclick="return PopLayer(this)">编辑资料</a></p>	 -->
		<p><a class="" href="information.jsp">编辑资料</a></p>
	</div>
		<div class="user_info_inner">
		<ul class="user_count">
		<li class="user_count_sub" style="display: none;">
		<span class="count_num j_rss_count">0</span>
		<span>关注</span>
		</li>
		</ul>
		</div>
		<div class="user_info_inner" vmode="guest" id="rss_mod_ugc" style="display: none;">
		<a href="javascript:void(0);" class="btn_user j_rss" data-act="set" style="display: none;">关注</a>
		<a href="javascript:void(0);" class="btn_user j_rssed btn_rssed" data-act="del" style="display: none;">
		<span class="toggle_show"><i class="icon_yes"></i><span class="btn_rssed_inner" >已关注</span></span>
		<span class="toggle_hide"><i class="icon_yes"></i><span class="btn_rssed_inner">取消关注</span></span>
		</a>
		</div>
		</div>
		<div class="user_more" style="display:none;">
		<div class="user_qr">
		<div id="qrcode_info_header"></div>
		
		</div>
		</div>
		</div>
	</div>
</div>
<div class="site_container">
	<div class="site_tab">
		<div class="tab_inner">
		<ul class="tab_list" id="pagetype_tab">
		<li class="current">
		<a href="javascript:void(0);"><span>视频</span></a>
		</li>
		</ul>
		<div class="tab_control" vmode="host" style="display:none;">
		<a href="http://v.qq.com/u/videos" class="tab_link link_manage" target="_blank"><i class="ico_setting_16"></i><span class="link_inner">管理视频</span></a>
		</div>
		</div>
	</div>
	<div class="container_inner cf">
		<div class="wrapper">
		<div class="mod_box">
		<div class="mod_hd">
		<h3 class="title"><span class="title_inner">共0个视频</span></h3>
		<div class="title_control">
		<div class="mod_listorder">
		<ul class="listorder_list">
		<li class="active _reset_order" sorttype="0" orderflag="0"><a href="javascript:void(0);" class="order_btn">上传时间</a><i class="ico_arrow_down"></i></li>
		<li sorttype="1" orderflag="0"><a href="javascript:void(0);" class="order_btn">播放量</a><i class="ico_arrow_down"></i></li>
		</ul>
		</div>
		</div>
		</div>
		</div>
		</div>
	</div>
</div>
<script type="text/tpl" id="videolst_tpl">
{for item in videolst}
<li class="list_item">
	<a href="${item.url}" title="${item.title}" class="figure" tabindex="-1" target="_blank">
		<img src="${item.pic}" alt="" data-pinit="registered" onerror="picerr(this, 2);" />
		<span class="figure_mask"><em class="mask_txt">${item.duration}</em></span>
	</a>
	<strong class="figure_title figure_title_two_row"><a href="${item.url}" target="_blank">${item.title}</a></strong>
	<div class="figure_info">
		<span class="figure_info_play"><i class="ico_play_12"></i><span class="info_inner">${item.play_count}</span></span>
		<span class="figure_info_time">${item.uploadtime}</span>
	</div>
</li>
{/for}
</script>
<script type="text/javascript" src="http://qzs.qq.com/tencentvideo_v1/js/txv.core.min.js?t=20160323" id="seajsnode"></script>
<script type="text/javascript" src="http://qzs.qq.com/tencentvideo_v1/js/txv.vchannel.extend.min.js?t=20160323"></script>
<script type="text/javascript">
	var g_config = {
		visited_uin : '34806',
		visited_euin : 'a0fe3e64f20a7b58a39457fb',
		visited_addr : 'http://v.qq.com/vplus/a0fe3e6d257fb'
	};
</script>
<script type="text/javascript">
seajs.config(
	{
		alias:{
		"txv_vchannel_main":"http://qzs.qq.com/tencentvideo_v1/script/vplus/vchannel/main.js"
		}
	}
);
seajs.use("txv_vchannel_main",function(vchannel){
	vchannel.init({
		userInfo : {
		motto : "",
		pic_bg : "",
		social_network : {weibo:"",qq:""},
		dress : {top:"",fixed:""}
		},
		pageConfig : {
		pagerEleId : 'mode_page_list'
		},
		flagConfig : {
		initPlayer : false
		},
		dataConfig : {
		totalVideoNum : '0',
		pageSize : 30
		},
		pagerAndSortConfig : {
		initFlag : true,
		qm : 1,
		sorttype : 0,
		pagerContId : 'mode_page_list',
		tplId : 'videolst_tpl',
		contId : 'videolst_cont'
		}
	});
});
</script>
 

</body>
</html>
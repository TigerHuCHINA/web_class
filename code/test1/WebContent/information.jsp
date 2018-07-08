<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<!-- SEO -->
<title>111</title>
<link rel="stylesheet" href="//css.mgtv.com/standard/standard.css?" type="text/css" data-merge="true"><link href="//css.mgtv.com/imgotv-member/global/page/setting-index.css" type="text/css" rel="stylesheet">
<script src="//honey.mgtv.com/honey-2.0/honey.hunantv.imgo.js?"></script>
<link rel="stylesheet" href="//css.mgtv.com/imgotv-member/page/user-new/setting-default.css?" type="text/css">
<link rel="stylesheet" href="//honey.mgtv.com/hunantv.imgotv/css/page/webucenter/datetimepicker.css?" type="text/css" media="screen" charset="utf-8">
	<script>
	window.VIDEOINFO = {
		city:'武汉',prc:'湖北'
	}
	</script>
 <script>honey.config({DEV:!1,ROOT:"//js.mgtv.com/imgotv-member/",PUBROOT:"//honey.mgtv.com/honey-2.0/"});</script>
</head>
<body>
<script>honey.go("lib:jquery, lib:honey.header.v5.bundle",function(){});</script>

				<!-- 关联本li的click事件取索引切换.user-setting-module索引为当前显示 -->
<div class="user-setting-sidebar" style="position:relative">
				<!-- 基本资料 -->
				<div class="user-setting-primary">
					<div class="user-setting-profile user-setting-module">
	<form action="" class="m-form">
	
		<p class="tr">
			<span class="th">昵称</span>
			<input class="td text nicname" node-type="set-name" type="text" value="112233">
		</p>
		<p class="tr" id="city_2">
			<span class="th">地区</span>
			<select class="td select province prov">
			</select>
			<select class="td select city">
			</select>
		</p>
		<p class="tr">
			<span class="th">性别</span>
			<input class="td choose" type="radio" node-type="" id="sex-male" name="sex" value="1" >
			<label class="td label" for="sex-male">男</label>
			<input class="td choose" type="radio" id="sex-female" name="sex" value="2" checked="checked">
			<label class="td label" for="sex-female">女</label>
			<input class="td choose" type="radio" id="sex-secret" name="sex" value="0"  >
			<label class="td label" for="sex-secret">保密</label>
		</p>
		<p class="tr">
			<span class="th">生日</span>
			<input class="td text birthday" type="text" id="birthday" value="">
		</p>

		<a href="#" class="btn btn-save" action-type="set-submit">保存</a>
	</form>
	
</div>
	</div>
</div>	
<script type="text/javascript">honey.go("lib:jquery,plugin_bootstrap-datetimepicker,plugin_bootstrap-datetimepicker.zh-CN,mod_city,mod_cityselect,mod_zzsc,user-new_user-set-info",function(){(function(){H.modSetting()}).call(this)});</script></body>
</html>
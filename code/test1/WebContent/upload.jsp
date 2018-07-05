<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传视频</title>
<meta name="robots" content="index, follow"/>
<meta name="googlebot" content="index, follow"/>
<link href="http://res9.weplay.cn/app/www/templates/download/../common/img/common/style.css" rel="stylesheet" type="text/css"/>
<link href="http://res9.weplay.cn/app/www/templates/download/../common/css/jmCustomScrollbar.css" rel="stylesheet" type="text/css"/>
<link href="http://res9.weplay.cn/app/www/templates/download/img/up_v5/up_v6.css?20180409" rel="stylesheet" type="text/css"/>    
<link href="http://res9.weplay.cn/app/www/templates/download/cropper/cropper.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="http://res9.weplay.cn/app/www/templates/download/../common/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="http://res9.weplay.cn/app/www/templates/download/../common/js/pop_dialog.js"></script>
<script type="text/javascript" src="http://res9.weplay.cn/app/www/templates/download/../common/js/AC_RunActiveContent.js"></script>
<script type="text/javascript" src="http://res9.weplay.cn/app/www/templates/download/../common/js/jmCustomScrollbar.js"></script>
<script src="http://res9.weplay.cn/app/www/templates/download/cropper/cropper.min.js"></script>
   
</head>
<body>
<!--=S mainTop -->
        
    <link href="http://res9.weplay.cn/app/www/templates/common/css/head_new.css?20170721" rel="stylesheet" type="text/css"/>
    <div class="top_head_wrapper">
       
    </div>
    <script type="text/javascript" src="http://res9.weplay.cn/app/www/templates/common/js/header_new.js?20170729"></script>
    <script type="text/javascript">
                    var useseajs = 0;
                //<![CDATA[
        if(useseajs === 0){
            document.write('<scr'+'ipt type="text/javascript" src="http://res9.weplay.cn/app/www/templates/common/js/login_new.js"></scr'+'ipt>');
        }
        //]]>
    </script>
    <!--=E mainTop -->

    <!-- S wrapper -->
    <div class="wrapper">
        <div class="tab_cont">
            <!--上传作品-->
            <div class="cont step1 show">   
                <div class="upload_top">
                    <div class="left_gg">
                        <div id="container" class="sub_btn webUpdata">
                            <div class="sub_btn_l">
                                <div id="pickfiles" class="bigBtn">
                                    <span class="logo"></span>
                                    <p>
                                        <span class="tit">网页上传</span>
                                        <span class="txt">仅支持FLV或MP4文件格式</span>
                                    </p>
                                    
                                </div>
                                <p class="drag_tip">拖拽视频到此也可上传</p>
                                <p class="ie_tips">（暂不支持您的低版本浏览器，请升级！）</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 填写资料 -->
            <div class="cont step2">
                <input type="hidden" id="categoryid" class="vinfo1" value=""/>
                <input type="hidden" class="vinfo2" value=""/>
                <input type="hidden" class="reprint" value=""/>
                <input type="hidden" class="videoId" value=""/>
                <input type="hidden" class="fileKey" value=""/>
                <input type="hidden" name="propPic" id="input-propPic" class="needed"/>
                <input type="hidden" class="fileName" value=""/>
                <input type="hidden" class="hasupload" value=""/>
                <input type="hidden" value=""/>
                <div class="video">
                    <div class="video-upload-info" style="display:none">
                        <table class="table table-striped table-hover text-left">
                            <tbody id="fsUploadProgress">
                                <!-- <td>
                                <div class="pro_info">  //barbox
                                    <div class="progress progress-striped">   //barwrapper
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuemax="100" aria-valuenow="70" aria-valuein="0" style="width:70%"></div>
                                        <div class="progress-bg" style="width:70%">
                                            <span class="pbg_l"></span>
                                        </div>
                                    </div>
                                    <div class="upload_status">
                                        <span class="status">上传速度：<b>135k/s</b></span>
                                        <span class="progressCancel">取消上传</span>
                                        <span class="pro_num">70%</span>
                                    </div>
                                </div>
                            </td> -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="sub_input">
                    <div class="info_left">
                        <div class="cover">
                            <label class="cover_img" for="upload_pic">
                                <input type="hidden" class="bigPic" value=""/>
                                <input type="hidden" class="smallPic" value=""/>
                                <input id="upload_pic" class="upload_pic" name="upload_pic" type="file" accept="image/png, image/jpeg" style="display: none;"/>
                                <div class="cover_img_bg">
                                    <img id="uploaded_img" src="" alt="预览图"/>
                                    <div id="uploaded_tips" class="uploaded_tips"></div>
                                </div>
                            </label>
                            <div class="cover_txt">
                                <p>建议上传比例为 16:9，尺寸 ≥800*450；</p>
                                <p>图片≤5M，仅支持JPG与PNG格式；</p>
                                <p class="imp">精美封面图有助于吸引观看，并且更易获得小编推荐；</p>
                                <p>没有上传图片，将自动截取视频生成封面。</p>
                            </div>
                        </div>
                    </div>

                    <div class="info_right">
                        <div class="type">
                            <label class="label_tit"><b>*</b>所属类别：</label>
                           <!--  <input type="text" class="video_type" maxlength="20" value="" readonly="readonly"/> -->
                            <input type="text" class="video_type" maxlength="20" value=""/>
                            <span class="err_tips hidden">类别不能为空！</span>
                        </div>
                       <!--   <div class="title">
                            <label class="label_tit"><b>*</b>所属类别：</label>
                             <div class="inp_txt">
                              <span class="txt_num">0/20</span>
                            <input type="text" class="video_title" value=""/>
                          
                            </div>
                              <span class="err_tips hidden">类别不能为空！</span>
                        </div>  -->

                        <div class="title">
                            <label class="label_tit"><b>*</b>视频标题：</label>
                            <div class="inp_txt">
                                <span class="txt_num">0/30</span>
                                <input type="text" class="video_title" value=""/>
                            </div>
                            <span class="err_tips hidden">视频标题不能为空！</span>
                        </div>

                        <div class="album">
                            <label class="label_tit">所属专辑：</label>
                            <div class="zhuanji">
                                <p class="zj_txt"><span></span><em></em></p>
                                <div class="zj_list">
                                    <ul class="list_con no_list">
                                        <p>还没有专辑，先<span>新建</span>一个吧~</p>
                                    </ul>
                                </div>
                            </div>
                            <span class="new_zhuanji"><i></i>新建专辑</span>
                        </div>

                        <div class="info">
                            <label class="label_tit">视频简介：</label>
                            <textarea class="video_info" value="" placeholder=""></textarea>
                            <span class="txt_num">0/200</span>
                            <span class="err_tips hidden">简介含有不当词语，请修改</span>
                        </div>

                        <div class="tag">
                            <label class="label_tit">视频标签：</label>
                            <div class="tag_box">
                                <input type="text" class="video_tag" maxLength="5"/>
                                <input type="text" class="video_tag" maxLength="5"/>
                                <input type="text" class="video_tag" maxLength="5"/>
                                <input type="text" class="video_tag" maxLength="5"/>
                                <input type="text" class="video_tag" maxLength="5"/>
                                <input type="text" class="video_tag" maxLength="5"/>
                            </div>
                            <span class="err_tips hidden">标签含有不当词语，请修改</span>
                            <div class="tag_tips">
                                <div class="txt">每标签最多5个字，最多填写6个标签。标签是根据视频内容、属性所概括出的一组关键词。标签可以让别人更快速、准确的搜索到您的视频！</div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="sub_box">
                    <span class="btn">提&nbsp;交</span>
                </div>
                <div class="suc_box">
                    <p><i class="suc_ico"></i>视频上传完成后将自动为您发布，在此期间请勿关闭网页。<span class="editAgain">我要修改</span></p>
                    <p><a href="home.jsp">直接提交</a></p>
                </div>
                <input type="hidden" class="video_ready" value=""/>
            </div>

            <!-- 发布作品 -->
            <div class="cont step3">
                <div class="ret_txt">
                    <div class="suc_icon"></div>
                    <h3>上传成功！!</h3>
                    <p>您的视频已进入审核，将在一个工作日内反馈结果</p>
                </div>
                <ul class="list">
                    <li>
                        <a href="http://mlog.aipai.com/r.gif?eid=imyxh5w&rd=eyJidG4iOiJQQ1_op4bpopHkuIrkvKBf57un57ut5LiK5LygIn0=&redirecturl=aHR0cDovL3d3dy5haXBhaS5jb20vcGNVcGxvYWQucGhw"><img src="http://res9.weplay.cn/app/www/templates/download/img/up_v5/pic1.png" alt=""/></a>
                    </li>
                    <li>
                        <a class="myhome_btn" href="" target="_balnk"><img src="http://res9.weplay.cn/app/www/templates/download/img/up_v5/pic2.png" alt=""/></a>
                    </li>
                 
                </ul>
            </div>
        </div>
    </div>
    <!-- E wrapper -->


    <!-- footer S -->
            <link href="http://res9.weplay.cn/app/www/templates/common/css/footer/foot_v1.css?20180126" rel="stylesheet" type="text/css"/>
    <div class="wrap_footer" id="wrap_footer">
        <div class="w1200">
                <div class="sect1 wrapfix">
       
        <div class="line line1"></div>
        <div class="line line2"></div>
        <div class="line line3"></div>
    </div>
        
        </div>
    </div>
     <!--    <script>
        (function() {
            var timer = null,
                btnWechat = document.getElementById("btnWechat"),
                btnWeibo = document.getElementById("btnWeibo"),
                popWechat = document.getElementById("popWechat"),
                popWeibo = document.getElementById("popWeibo");

            // btnWechat & btnWeibo hover
            function hover(ele, pop) {
                ele.onmouseover = function() {
                    clearTimeout(timer);

                    // pop
                    popWechat.style.display = "none";
                    popWeibo.style.display = "none";
                    pop.style.display = "block";
                }
                ele.onmouseout = function() {
                    clearTimeout(timer);
                    timer = setTimeout(function() {
                        pop.style.display = "none";
                    }, 100);
                }
            }

            // popWechat & popWeibo hover
            function hover2(ele) {
                ele.onmouseover = function() {
                    clearTimeout(timer);
                    ele.style.display = "block";
                }
                ele.onmouseout = function() {
                    clearTimeout(timer);
                    timer = setTimeout(function() {
                        ele.style.display = "none";
                    }, 100);
                };
            }

            hover(btnWechat, popWechat);
            hover(btnWeibo, popWeibo);
            hover2(popWechat);
            hover2(popWeibo);
        })();
    </script> -->

    <!--mlog start-->
    <script>
        //处理https访问时拿不到静态资源
        var _urlHttps = location.href,
        httpsStr = "https";
        if(new RegExp(httpsStr).test(_urlHttps)){
            _urlHttps = _urlHttps.replace(httpsStr,"http");
            location.href = _urlHttps;
        }
                var ap_mlog_page = 'pc_other';
                var ap_mlog_track = function(){};
    </script>
    <script src="http://mlog.aipai.com/apweb.min.js?20150911"></script>
    <div style="display:none;">
        <script src="http://w.cnzz.com/c.php?id=30071949" language="JavaScript"></script>
    </div>
    <!--mlog end-->

    <script src="http://res9.weplay.cn/app/www/templates/common/js/footer/mlog_pc.js"></script>
   
        <!--上传封面图片-->
        <div id="flash_upload" style="display: none;">
            <div class="flash-upload">
                <h2>上传封面图片</h2>
                <span class="close-flash"></span>
                <div class="my-flash-box">
                    <span id="myFlash" class="testadin"></span>
                </div>
            </div>
        </div>

    </div>

    <div id="pop_content" class="pop_upload"></div>

    <div id="cropper_pop" class="cropper_pop">
        <div class="cropper_pop_content">
            <div class="cropper_pop_content_hd">
                <h2>编辑封面</h2>
            </div>
            <div class="cropper_pop_content_bd">
                <div class="preview_left" id="preview_left"></div>
                <div class="preview_right" id="preview_right">
                    <p class="cut_preview_txt">预览</p>
                    <div id="cut_preview" class="cut_preview"></div>
                </div>
            </div>
            <div class="cropper_reselect"><a>重新选择</a></div>
            <div class="cropper_pop_content_ft">
                <span class="cropper_submit">确定</span>
                <span class="cropper_cancle">取消</span>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var isVip = 0,
            _bid = Cookies.get('b');

        $('.step3 .list a').eq(1).attr('href', 'http://home.aipai.com/' + _bid + '?action=card');
    </script>
    <script type="text/javascript" src="http://res9.weplay.cn/app/www/templates/download/upload_js/moxie.js"></script>
    <script type="text/javascript" src="http://res9.weplay.cn/app/www/templates/download/upload_js/plupload.dev.js"></script>
    <script type="text/javascript" src="http://res9.weplay.cn/app/www/templates/download/upload_js/ui_v5.js"></script>
    <script type="text/javascript" src="http://res9.weplay.cn/app/www/templates/download/upload_js/qiniu.js"></script>
    <script type="text/javascript" src="http://res9.weplay.cn/app/www/templates/download/upload_js/swfobject.js"></script>
    <script type="text/javascript" src="http://res9.weplay.cn/app/www/templates/download/upload_js/uploadVideo_v6.js"></script>

</body>
</html>
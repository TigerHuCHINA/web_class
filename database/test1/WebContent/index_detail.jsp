<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>网站主界面</title>
<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/style.css" rel='stylesheet' type='text/css' />

<link href='https://fonts.googleapis.com/css?family=Oswald:300,400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Fugaz+One' rel='stylesheet' type='text/css'>

<script>
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
});
</script>
</head>

<body>
<div class="header">
		<div class="container">
		    <div class="col-sm-9 logo_right">
			<span class="menu"></span>
			<div class="top-menu">
				<ul>
					<li><a href="#" class="btn btn-default btn-default_2 pull-left" data-toggle="modal" data-target="#applyModal">登录</a></li>
					<li><a href="#" class="btn btn-default btn-default_2 pull-left" data-toggle="modal" data-target="#applyModal_1">注册</a></li>
				</ul>
			</div>
		
			<div class="clearfix"> </div>
				<div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="applyModalLabel" aria-hidden="true">
				  	<div class="modal-dialog modal-dialog_2">
				    	<div class="modal-content">
					      	<div class="modal-header">
					        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
					        	<h4 class="modal-title" id="myModalLabel">
					        		<div class="head_4">
			                          <p>login</p>
			                        </div>
			                    </h4>
					      	</div>
	                        <div class="modal-body">
                             <form class="register">
                               <div class="section">
                                <label for="username" class="field prepend-icon">
                                    <input type="text" name="username" id="username" placeholder="Username">
                                    <label for="username" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                               </div>
                               <div class="section">
                                <label for="password" class="field prepend-icon">
                                    <input type="password" name="password" id="password" placeholder="Password">
                                    <label for="password" class="field-icon">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                </label>
                             </div>
                             <div class="section">
                                <div class="submit"><input type="submit" onclick="myFunction()" value="登录"></div>
                             </div>
                             <ul class="new">
                                <li class="new"><p class="sign">没有账号 ?&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#applyModal_1">注册</a></p></li>
								
								<div class="clearfix"></div>
						     </ul>
                           </form>
                        </div>
				    </div>
				 </div>
				</div>
				 <!-- Modal -->
				<div class="modal fade" id="applyModal_1" tabindex="-1" role="dialog" aria-labelledby="applyModalLabel" aria-hidden="true">
				  	<div class="modal-dialog dialog_3">
				    	<div class="modal-content">
					      	<div class="modal-header">
					        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					        	<h4 class="modal-title" id="myModalLabel"><div class="head_4">
			                         <p>注册</p>
			                        </div></h4>
					      	</div>
					      	<form name="row" method="post" class="register">
					      		<div class="radio radio_1">
									<input id="leader" type="radio" value="1">
									<label for="leader">学生用户</label>
									<input id="company" type="radio" value="2">
									<label for="company">教师用户</label>
	                            </div>
	                            <div class="section">
                                  <label for="username" class="field prepend-icon">
                                    <input type="text" name="email id" id="Email id" placeholder="Email id">
                                    <label for="email id" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                  </label>
                               </div>
                               <div class="section">
                                 <label for="password" class="field prepend-icon">
                                    <input type="password" name="password" id="password" placeholder="Password">
                                    <label for="password" class="field-icon">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                 </label>
                               </div>
                               <div class="section">
                                  <label for="username" class="field prepend-icon">
                                    <input type="text" name="mobile number" id="Mobile Number" placeholder="Mobile Number">
                                    <label for="mobile number" class="field-icon">
                                        <i class="fa fa-phone"></i>
                                    </label>
                                  </label>
                               </div>
                               <div class="section">
                                  <label for="name" class="field prepend-icon">
                                    <select path="country" id="country" class="form-control input-sm">
				                        <option value="">Select Country</option>
				                        <option value="">Japan</option>
				                        <option value="">Kenya</option>
				                        <option value="">Dubai</option>
				                        <option value="">Italy</option>
				                        <option value="">Greece</option> 
				                        <option value="">Iceland</option> 
				                        <option value="">China</option> 
				                        <option value="">Doha</option> 
				                        <option value="">Irland</option> 
				                        <option value="">Srilanka</option> 
				                        <option value="">Russia</option> 
				                        <option value="">Hong Kong</option> 
				                        <option value="">Germany</option>
				                        <option value="">Canada</option>  
				                        <option value="">Mexico</option> 
				                        <option value="">Nepal</option>
				                        <option value="">Norway</option> 
				                        <option value="">Oman</option>
				                        <option value="">Pakistan</option>  
				                        <option value="">Kuwait</option> 
				                        <option value="">Indonesia</option>  
				                        <option value="">Spain</option>
				                        <option value="">Thailand</option>  
				                        <option value="">Saudi Arabia</option> 
				                        <option value="">Poland</option> 
				                    </select>
                                    <label for="name" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                  </label>
                               </div>
                               <div class="section">
                                  <div class="submit"><input type="submit" onclick="myFunction()" value="提交"></div>
                               </div>
                               <div class="checkbox check_1">
									<input id="check1" type="checkbox" name="check" value="check1">
									<label for="check1">我同意服务条款和隐私政策</label>
							   </div>
						  </form>
                     </div>
		         </div>
		     </div>
			<div class="clearfix"></div>
		 </div>
	   </div>
</div>

</body>
</html>
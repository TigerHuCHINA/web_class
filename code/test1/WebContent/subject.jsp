<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>录入题目</title>
</head>
<body>
<div class="maincontentinner">
	   <!-- -----------------------------------------切换开始---------------------- -->
<script type="text/javascript">
 function test(){
 
 document.getElementById('a').style.display='none';
 document.getElementById('b').style.display='none';
 var value=document.getElementById('select').value;
 document.getElementById(value).style.display='block';
 }
 </script>

<form class="stdform" action="subjectAdd.action" method="post">
<select name="questionType" id="select" onchange="test()">
 <option value="a" selected>单选题</option>
 <option value="b">填空题</option>
 </select>
 
 <div id="a" style="display:block">
 	<div class="widget">
							<h4 class="widgettitle">添加试题</h4>
							<div class="widgetcontent">
									<p>
										<label>试题题目</label>
										 <span class="field"><textarea name="stTitle" cols="80" rows="3" class="span5" required="required"></textarea></span> 
									</p>
									<p>
										<label>选项A:</label>
										<span class="field"><input type="text" name="stOptionA"  class="input-large" placeholder="选项A"required="required"></span>
									</p>
									<p>
										<label>选项B:</label>
										<span class="field"><input type="text" name="stOptionB" class="input-large" placeholder="选项B"required="required"></span>
									</p>
									<p>
										<label>选项C:</label>
										<span class="field"><input type="text" name="stOptionC" class="input-large" placeholder="选项C"required="required"></span>
									</p>
									<p>
										<label>选项D:</label>
										<span class="field"><input type="text" name="stOptionD" class="input-large" placeholder="选项D"required="required"></span>
									</p>
									<p>
										<label>答案</label>
										<input name="stAnswer" type="radio" value="A"/>A
										<input name="stAnswer" type="radio" value="B"/>B
										<input name="stAnswer" type="radio" value="C"/>C
										<input name="stAnswer" type="radio" value="D"/>D
									</p>
									<p>
										<label>试题解析</label>
										 <span class="field"><textarea name="stParse" cols="80" rows="5" class="span5"></textarea></span> 
									</p>
									
									<p>
										<label>分值设定</label>
										 <span class="field"><input name="score" type="text"></span> 
									</p>
								
									<p class="stdformbutton">
										<input type="submit" value="录入">
										<input type="reset" value="重置">
										<input type="button" value="完成" onclick="window.location='home.jsp'"/>
									</p>
							</div>
							<!--widgetcontent-->
						</div>
						<!--widget-->
 </div>
 <div id="b" style="display:none">
 	<div class="widget">
							<h4 class="widgettitle">添加试题</h4>
							<div class="widgetcontent">
									<p>
										<label>试题题目</label>
										 <span class="field"><textarea id="table2" name="stTitle" cols="80" rows="3" class="span5" required="required"></textarea></span> 
									</p>
									<p>
										<label>答案</label>
										<span id="table"><input name="stAnswer" placeholder="答案1" type="text"/></span>
									</p>
									<p>
										<label>试题解析</label>
										 <span class="field"><textarea name="stParse" cols="80" rows="5" class="span5" required="required"></textarea></span> 
									</p>
								
									<p>
										<label>分值设定</label>
										 <span class="field"><input type="text"></span> 
									</p>
								
									<p class="stdformbutton">
										<input type="button" value="增加空" onclick="createQuestion();" />
										<input type="submit" value="录入"/>
										<input type="button" value="重置" onclick="replaceDoc()">
										<input type="button" value="完成" onclick="window.location='home.jsp'"/>
									</p>
							</div>
							<!--widgetcontent-->
						</div>
						<!--widget-->
 </div>
		
</form>
</div>
<!--maincontentinner-->

<!-- ----------------------动态增加文本框-------------------------------------- -->
<script>
var qus = new Array();

function Question() {
	this.qno = qus.length+2;
	this.ono = 0;
	this.create = function(table) {
		var qstr = "";
		qstr += "<b id=\"qu" + this.qno + "><div class=\"\" id=\"qu" + this.qno + "\">";
		qstr += "<input type=\"text\" name=\"questions[" + this.qno + "]\" required=\"required\" placeholder=\"答案" + this.qno + "\" />";
		qstr += "</div>";
		table.innerHTML += qstr;
		
		//table2
		document.getElementById('table2').innerHTML += '____'; 
	}
}

function createQuestion() {
	var qu = new Question();
	qus.push(qu);
	qu.create(document.getElementById('table'));
}
function replaceDoc()
{
    window.location.replace("subject.jsp")
}

</script>

</body>
</html>
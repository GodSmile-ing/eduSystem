<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<title>��ʦ����</title>
<script type="text/javascript" src="/eduSystem/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
function teacherList(){
	$("#main").load("teacherlist.jsp");
}
function addteacher(){
	$("#main").load("addTeacher.jsp");
}
</script>
<style type="text/css">
#left {
	width: 125px;
	float: left; /*���ø�����ʵ�ֶ���Ч����div+Css�����к���Ҫ��*/
	background-color:#E0EEE0;
	min-height:600px;
	height:auto;
}
ul, ol {
	list-style:none;
}
#left ul li a{
    text-decoration:none;
	text-align:center;
	margin-top:20px;
	float:left;
	width:125px;
	height:40px;
    font-size:20px;
	position:relative;
	color:#00688B;
}
#main{
margin-left:10px;
width:865px;
float:left;
height:auto;
}
#left ul li a:hover{
background:#008B8B;
color:#E0EEE0;
}
</style>
<div id="left">
	<ul>
	     <li>&nbsp;</li>
		<li><a href="javascript:addteacher()">��ӽ�ʦ</a></li>
		<li><a href="javascript:teacherList()">�鿴��ʦ</a></li>
	</ul>
</div>
<div id="main"></div>
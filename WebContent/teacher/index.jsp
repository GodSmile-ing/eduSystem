<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script type="text/javascript" src="/eduSystem/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
	function studentlist() {
		$("#main-content").load("studentlist.jsp");
	}
	function getNotice() {
		$("#main-content").load("../include/noticeContent.jsp");
	}
	function getInfo() {
		$("#main-content").load("info.jsp");
	}
	function findPass() {
		$("#main-content").load("findPass.jsp");
	}
	$(document).ready(function() {
		$(".hover ul li").hover(function() {
			$(this).children("dl").slideDown(300)
		}, function() {
			$(this).children("dl").slideUp(100)
		});
	});
</script>
<link type="text/css" rel="stylesheet" href="../css/header.css" />
<style type="text/css">
* {
	font-family: ΢���ź�, �ź�;
	margin: 0;
	padding: 0;
}

#container {
	width: 1000px;
	margin: 0px auto;
}

#header {
    position:relative;
    z-index:1;
	width: 100%;
	margin: 0px auto;
}

#main-content {
	padding-bottom: 200px; /*��Ҫ����footerԤ���Ŀռ�*/
}

#footer {
	position: absolute;
	bottom: 0; /* �ؼ� */
	left: 0; /* IE��һ��Ҫ�ǵ� */
	height: 60px; /* footer�ĸ߶�һ��Ҫ�ǹ̶�ֵ*/
}

.Clear {
	clear: both;
}

table {
	width: 1000px;
	font-family: verdana, arial, sans-serif;
	font-size: 15px;
	color: #333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}

table th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}

table td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}
</style>
</head>
<body>
	<div id="container">
		<div id="header">
			<img src="/eduSystem/images/scau.jpg" name="the_pic" width=1000px
				height=137 border="0" />
			<div class="main_nav hover">
				<ul>
					<li><a href="index.jsp">��ҳ</a></li>
					<li><a href="javascript:studentlist()">����ѧ���ɼ�</a></li>
					<li><a href="#">��Ϣά��</a>
						<dl>
							<dd>
								<a href="javascript:getInfo()">������Ϣ</a>
							</dd>
							<dd>
								<a href="javascript:findPass()">�޸�����</a>
							</dd>
						</dl></li>

					<li><a href="javaScript:getNotice()">������</a></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
		</div>
		<div id="main-content">
			<%@include file="../include/indexContent.jsp"%>
		</div>
		<div class="Clear">
			<!--����������õ�float,���沼�ֿ�ʼǰ������һ�¡�-->
		</div>
		<%@include file="../include/footer.jsp"%>
	</div>
</body>
</html>
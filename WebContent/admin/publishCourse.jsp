<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>����ѡ��</title>
<script type="text/javascript" src="/eduSystem/js/jquery-2.1.1.min.js"></script>
<script>
	$(document).ready(
			function() {
				$.getJSON("/eduSystem/loadClassroom.do", function(data) {
					var text;
					for (var i = 0; i < data.length; i++) {
						text += "<option value="+data[i].name+">"
								+ data[i].name + "</option>";
					}
					$("#classroom").html(text);
				});
				$.getJSON("/eduSystem/loadDay.do", function(data) {
					var text;
					for (var i = 0; i < data.length; i++) {
						text += "<option value="+data[i].day+">"
								+ data[i].day + "</option>";
					}
					$("#day").html(text);
				});
				$.getJSON("/eduSystem/loadTime.do", function(data) {
					var text;
					for (var i = 0; i < data.length; i++) {
						text += "<option value="+data[i].time+">"
								+ data[i].time + "</option>";
					}
					$("#time").html(text);
				});
				$("#add").click(function() {
					var text ="<dt>"+$("#dl dt:last").html()+"</dt>";
					$("#dl").append(text);
				});
				$("#del").click(function() {
					if ($("#dl dt").length > 1)
						$("#dl dt:last").remove();
				});
				$("#sub").click(function() {
					if ($('input[name="teacherid"]').val() == "") {
						alert("����������!");
						return;
					}
					if ($('input[name="name"]').val() == "") {
						alert("������γ�����!");
						return;
					}
					if ($('input[name="total"]').val() == "") {
						alert("������ѡ������!");
						return;
					}
					$.ajax({
						type : "post",
						url : "/eduSystem/addCourse.do",
						data : $("#form1").serialize(),
						global : false,
						success : function(data) {
							$("#pc_content").text(data);
						}
					});
				});
			});
</script>
<style>
#publish_course {
	margin-top: 10px;
}

#pc_content {
	margin-left: auto;
	padding-top: 20px;
	margin-top: 20px;
	text-align: center;
	border-top-width: 2px;
	border-top-color: #CDC5BF;
	border-top-style: solid;
}

#pc_content table {
	margin: auto;
	width: 860px;
	text-align: left;
}

#pc_content table tr td {
	height: 35px;
	text-align: left;
}
dl dt{
height:30px;
}
</style>
<div id="publish_course">
	<span style="font-size: 23px; font-family: ΢���ź�;">����ѡ��</span>
	<div id="pc_content">
		<form action="#" method="post" id="form1">
			<table id="table1">
				<tr>
					<td>�ο���ʦ��ţ�</td>
					<td><input type="text" name="teacherid"></td>
				</tr>
				<tr>
					<td>�γ����ƣ�</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>ѡ��������</td>
					<td><input type="text" name="total"></td>
				</tr>
				<tr>
					<td>�Ͽεص㣺</td>
					<td><select name="classroom" id="classroom">
					</select></td>
				</tr>
				<tr>
					<td>�Ͽ�ʱ�䣺</td>
					<td>
						<dl id="dl">
							<dt>
								<select name="days" id="day"></select>								
								<select name="times"id="time"></select>
							</dt>
						</dl>
						<input type="button" id="add" value="+"style="width: 20px; height: 20px">
						<input type="button" id="del" value="-" style="width: 20px; height: 20px">
					</td>
				</tr>
			</table>
			<input type="button" id="sub" value="�ύ"
				style="width: 40px; height: 20px;">
		</form>
	</div>
</div>
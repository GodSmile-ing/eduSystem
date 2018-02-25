<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>������Ϣ</title>
<style type="text/css">
#portrait {
	text-align: center;
	float: left;
	background-color: #F5F5F5;
	width: 250px;
	height: 300px;
}

#infodata {
	margin-top: 10px;
	float: left;
	margin-left: 10px;
	width: 740px;
}

#basicinfo table {
	text-align: left;
    width:740px;
}

#basicinfo table tr {
	height: 35px;
}

#basicinfo table input {
	background-color: #c4c4c4;
}
</style>
<script type="text/javascript" src="/eduSystem/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.getJSON("/eduSystem/loadInfo.do", function(data) {
            $('input[name="id"]').val(data.teacherid);
            $('input[name="name"]').val(data.name);
            $('input[name="college"]').val(data.college);
            $('input[name="birthday"]').val(data.birthday);
            $('input[name="phone"]').val(data.phone);
		});
	});
</script>
<div id="info">
	<div id="portrait">
		<img src="/eduSystem/images/portrait.jpg"
			style="width: 100px; height: 100px; border-style: solid; border-color: #FFFFFF; border-width: 5px; margin-top: 40px;">
	</div>
	<div id="infodata">
		<span style="font-size: 23px; font-family: ΢���ź�;">&nbsp;&nbsp;&nbsp;��������</span>
		<div id="basicinfo"
			style="padding-top: 10px; margin-top: 10px; border-top-border: 1; border-top-style: solid; border-top-color: #CDC5BF; border-top-width: 2px;">
			<table>
				<tr>
					<td>�̹��ţ�</td>
					<td><input name="id" type="text" value="" disabled="disabled"></td>
				</tr>
				<tr>
					<td>������</td>
					<td><input name="name" type="text" value=""
						disabled="disabled"></td>
				</tr>
				<tr>
					<td>ѧԺ��</td>
					<td><input name="college" type="text" value=""
						disabled="disabled"></td>
				</tr>
				<tr>
					<td>�绰��</td>
					<td><input name="phone" type="text" value=""
						disabled="disabled"></td>
				</tr>
				<tr>
					<td>�������ڣ�</td>
					<td><input name="birthday" type="text" value="" disabled="disabled"></td>
				</tr>
			</table>
		</div>
	</div>
</div>
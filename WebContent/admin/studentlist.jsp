<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>�鿴ѧ��</title>
<script type="text/javascript" src="/eduSystem/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
var pageCount;
var pageNo;
var rowsCount;
function showPage(students){	
	 var text;
	  text="<tr><th>ѧ��ѧ��</th><th>ѧ������</th><th>����ѧԺ</th><th>�����༶</th><th>�绰����</th><th>��ѧ����</th><th>����</th></tr>";
	    for(var i=0;i<students.length;i++)
	    {
	       text+="<tr><td>"+students[i].studentid+"</td><td>"+students[i].name+"</td><td>"+students[i].college+"</td><td>"+students[i].classname+"</td><td>"+students[i].phone+"</td><td>"+students[i].inrolltime+"</td><td>"+deleteLink(students[i].studentid)+"</td></tr>";
	    }
	    $("#table").html(text);
	    $("#pageNo").text(pageNo);
	    $("#pageCount").text(pageCount);
	    $("#rowsCount").text(rowsCount);
	}
	function gotoPage(page){
		$.getJSON("/eduSystem/loadStudent.do",{"pageNo":page,"college":$("#college").find("option:selected").val(),"classname":$("#class").find("option:selected").val(),"studentid":$('input[name="studentid"]').val(),"name":$('input[name="name"]').val()},function(json){  
			 pageCount=json.pageCount;
		      pageNo=json.pageNo;
		      rowsCount=json.rowsCount;
			  showPage(json.students);
			});
	}
function doConfirm(){
	if(confirm("���Ҫɾ��������¼��?")){
		return true;
		}else{
		return false;
		}
}
function doDelete(studentid){
 $.getJSON("/eduSystem/delStudent.do?studentid="+studentid);
 gotoPage(1);
 gotoPage(1);
 gotoPage(1);
}
function deleteLink(id){

	var link="<a onclick=\"return doConfirm()\" href=\"javascript:doDelete('"+id+"')\">ɾ��</a>";
	return link;
}

$(document).ready(function(){
	$.getJSON("/eduSystem/loadCollege.do",function(data){  
		var text;
		text="<option value='' selected>��ѡ��</option>";
		for(var i=0;i<data.length;i++){
				text+="<option value="+data[i].name+">"+data[i].name+"</option>";	
			}
			$("#college").html(text);
		});
$("#college").change(function(){
	$('input[name="studentid"]').val("");
	$('input[name="name"]').val("");
	$.getJSON("/eduSystem/loadClass.do",{"college":$("#college").find("option:selected").val()},function(data){  
		var text;
		 text+="<option value='' selected>��ѡ��</option>";
		if(data){
			for(var i=0;i<data.length;i++){
			 text+="<option value="+data[i].name+">"+data[i].name+"</option>";
			}
		 }
			$("#class").html(text);
			gotoPage(1);
		});

});
	gotoPage(1);
	$("#class").change(function(){
		$('input[name="studentid"]').val("");
		$('input[name="name"]').val("");
		gotoPage(1);
	});
	$("#next").click(function(){
		gotoPage(pageNo+1);
	});
	$("#pre").click(function(){
		gotoPage(pageNo-1);
	});
	$("#top").click(function(){
	   gotoPage(1);
	});
	$("#tail").click(function(){
	   gotoPage(pageCount);
	});
	$("#goto").click(function(){
		gotoPage($('input[name="pageNo"]').val())
	});
	$("#findbyid").click(function(){
		$('input[name="name"]').val("");
		gotoPage(1);
	});
	$("#findbyname").click(function(){
		$('input[name="studentid"]').val("");
		gotoPage(1);
	})
	
});
</script>
<style>
#studentlist{

margin-top:10px;
width:865px;
}
#sl_content{
padding-top:10px;
margin-top:10px;
border-top-width:2px;
border-top-style:solid;
border-top-color:#CDC5BF;
}
p{
padding-top:5px;
height:30px;
}
#search{
background-color:#F2F2F2;
height:80px;

}
table{
width:865px;
}
#page_control{
position:absolute;
bottom:0;
height:40px;
background-color:#F5F5F5;
width:865px;
}
</style>
<div id="studentlist">
	<span style="font-size: 23px; font-family: ΢���ź�;">�鿴ѧ��</span>
<div id="sl_content">
	<div id="search">
	<p>����ѧԺ��<select class="selector" id="college"><option value="" selected>��ѡ��</option></select> �����༶��<select class="selector" id="class"><option value="" selected>��ѡ��</option></select></p>
	<p><span>����ѧ�Ų�ѯ��<input type="text" name="studentid"><input id="findbyid" type="button" value="ȷ��" ></span>
	<span>����������ѯ��<input type="text" name="name"><input id="findbyname" type="button" value="ȷ��" ></span></p>
	</div>
	<div id="list_content">
	<table id="table">
	</table>
	</div>
	<div id="page_control">
	<p>
	��<span id="pageNo"></span>ҳ/��<span id="pageCount"></span>ҳ                             �ܹ� <span id="rowsCount"></span>����¼ &nbsp; &nbsp; &nbsp;
	��ת��<input type="text" name="pageNo" style="width:40px">  <input type="button" id="goto" value="go">&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
	<input id="top" type="button" value="��ҳ">  <input id="pre" type="button" value="��һҳ">  <input id="next" type="button" value="��һҳ">  <input id="tail" type="button" value="βҳ">
	</p>
   </div>
</div>
</div>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>ѧ���б�</title>
<style>
#studentlist{
float:left;
margin-top:10px;
width:1000px;
}
#sl_content{
position:relative;
height:500px;
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
input{
width:50px;
}
#search{
background-color:#F2F2F2;
height:80px;

}
#page_control{
position:absolute;
bottom:0;
height:40px;
background-color:#F5F5F5;
width:1000px;
}
</style>
<script type="text/javascript">
var pageCount;
var pageNo;
var rowsCount;
var flag=true;
function editScore(score){
	var text="<input class='scores'name='scores' type=text value='"+score+"' disabled='disabled'>";
	return text;
}
function showPage(scores){	
	 var text;
	  text="<tr><th>�γ�����</th><th>ѧ��ѧ��</th><th>ѧ������</th><th>ѧ���༶</th><th>�γ̳ɼ�</th></tr>";
	  var hiddenid="";
	     for(var i=0;i<scores.length;i++)
	    {
	    	 hiddenid+="<input name='studentids' type=hidden value='"+scores[i].studentid+"'>";
	    	text+="<tr><td>"+scores[i].coursename+"</td><td>"+scores[i].studentid+"</td><td>"+scores[i].studentname+"</td><td>"+scores[i].classname+"</td><td>"+editScore(scores[i].score)+"</td></tr>";
	    } 
	    $("#hidden").html(hiddenid);
	    $("#table").html(text);
	    $("#pageNo").text(pageNo);
	    $("#pageCount").text(pageCount);
	    $("#rowsCount").text(rowsCount);
	}
	function gotoPage(page){
		$.getJSON("/eduSystem/loadMyCourse.do",{"pageNo":page,"courseid":$("#coursename").find("option:selected").val(),"classname":$('input[name="classname"]').val()},function(json){  
			 pageCount=json.pageCount;
		      pageNo=json.pageNo;
		      rowsCount=json.rowsCount;
			  showPage(json.scores);
			});
	}
$(document).ready(function(){

	$.getJSON("/eduSystem/loadMyCourse2.do",function(data){  
		var courses=data.courses;
		var text="";
		for(var i=0;i<courses.length;i++){
				text+="<option value="+courses[i].courseid+">"+courses[i].name+"</option>";	
			}
			$("#coursename").html(text);
		});
	$("#coursename").change(function(){
		if(!flag){
		if(confirm("ȷ��Ҫ����ɼ���"))
		{
		var scores= $("input[name='scores']").serialize();
		var studentids=$("input[name='studentids']").serialize();
		 $.get("/eduSystem/editScore.do",scores+"&"+studentids+"&courseid="+$("#coursename").find("option:selected").val(),function(data){
			alert(data);
		}) 
		}
		$('input.scores').attr("disabled",true); 
		$("input#edit").val("�༭");
		flag=!flag;
		}
		
		gotoPage(1);
	});
	$(".pageControl").change(function(){
		if(!flag){
			if(confirm("ȷ��Ҫ����ɼ���"))
			{
			var scores= $("input[name='scores']").serialize();
			var studentids=$("input[name='studentids']").serialize();
			 $.get("/eduSystem/editScore.do",scores+"&"+studentids+"&courseid="+$("#coursename").find("option:selected").val(),function(data){
				alert(data);
			}) 
			}
			$('input.scores').attr("disabled",true); 
			$("input#edit").val("�༭");
			flag=!flag;
		}
	});
	gotoPage(1);
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
	$("#edit").click(function(){	
		if(flag)
		{
			$("input.scores").removeAttr("disabled");
			$("input#edit").val("����");
		}
		else
		{
			if(confirm("ȷ��Ҫ����ɼ���"))
			{
			var scores= $("input[name='scores']").serialize();
			var studentids=$("input[name='studentids']").serialize();
			 $.get("/eduSystem/editScore.do",scores+"&"+studentids+"&courseid="+$("#coursename").find("option:selected").val(),function(data){
				alert(data);
			}) 
			}
			$('input.scores').attr("disabled",true); 
			$("input#edit").val("�༭");
		}
		flag=!flag;
	});
	$("#sub").click(function(){
	 if(confirm("�ύ��ÿγ�����ѧ���ĳɼ��������޸ģ���ȷ���Ƿ��ύ��"))
		 {
		 $.post("/eduSystem/publishScore.do?&courseid="+$("#coursename").find("option:selected").val(),function(data){
				alert(data);
				gotoPage(1);
			});
			gotoPage(1);
		 }
	});
});
</script>
<div id="studentlist">
	<span style="font-size: 23px; font-family: ΢���ź�;">����ѧ���ɼ�</span>
<div id="sl_content">
	<div id="search">
		<p>�γ����ƣ�<select name="courseid" id="coursename"></select> ѧ���༶:<select name="classname" id="classname"></select></p>
	</div>
	<div id="list_content">
	<div id="hidden">
	
	</div>
	<table id="table">
	</table>
	</div>
	<div id="page_control">
	<p>
	��<span id="pageNo"></span>ҳ/��<span id="pageCount"></span>ҳ                             �ܹ� <span id="rowsCount"></span>����¼ &nbsp; &nbsp; &nbsp;
	��ת��<input  type="text" name="pageNo" style="width:40px">  <input class="pageControl" id="goto" type="button" value="go">&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
	<input class="pageControl" type="button" id="top" value="��ҳ">  <input class="pageControl" id="pre" type="button" value="��һҳ">  <input class="pageControl" id="next" type="button" value="��һҳ">  <input class="pageControl" id="tail" type="button" value="βҳ">&nbsp;&nbsp;&nbsp;&nbsp;
	<input class="pageControl" id="edit" type="button" value="�༭"/> <input id="sub" type="button" value="�ύ"/>
	</p>
   </div>
</div>
</div>
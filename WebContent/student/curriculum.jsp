<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>���˿α�</title>
<script type="text/javascript">
var days=new Array("��һ","�ܶ�","����","����","����");
var times=new Array("1,2��","3,4��","5,6��","7,8��","9,10��","11,12��","11,12,13��");
function printTimetable(data){
   var table="<tr><th>����һ</th><th>���ڶ�</th><th>������</th><th>������</th><th>������</th></tr>";
   var names=data.names;
   var classTimes=data.classTimes;
   var flag;
	for(var i=0;i<times.length;i++){
		table+="<tr>";
		for(var j=0;j<days.length;j++)
			{
			 flag=0;
			 for( var k=0;k<names.length;k++)
				 {
       
				   if(classTimes[k].time==times[i]&&classTimes[k].day==days[j])
					   {
					     flag=1;
					     table+="<td>"+names[k]+"<br>"+classTimes[k].time+"</td>";
					     break;
					   }
				 }
			 if(flag==0)
				 table+="<td></td>";
			}
		table+="</tr>";
	}
	$("#table").html(table);
}
$(document).ready(function(){
	$.getJSON("/eduSystem/loadClassTime.do",function(data){
		printTimetable(data);
	})
})
</script>
<style>
#curriculum{
margin-top:10px;
}
#content{
padding-top:20px;
margin-top:20px;
}
#curriculum{
float:left;
}
table{
width:1000px;
text-align:center;
}
table tr td{
height:60px;
width:200px;
}
table tr th{
height:30px;
}
</style>
<div id="curriculum">
<span style="font-size:23px;font-family:΢���ź�;">���˿α�</span>
<div id="content" style="border-top-width:2px;border-top-color:#CDC5BF;border-top-style:solid;">
<table id="table">

</table>
</div>
</div>
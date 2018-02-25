package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import beanMgr.CourseMgr;
import beanMgr.SelectCourseMgr;
import beans.ClassTime;
import beans.Course;
import beans.SelectCourse;
import beans.User;

@Controller
public class SelectController {
@RequestMapping("/selectCourse.do")
public void selectCourse(int[] courseids,HttpSession session,HttpServletResponse response){
User user=(User)session.getAttribute("user");
String studentid=user.getUserid();
List<Course> courses=CourseMgr.findByStudentid(studentid);//��ȡ�Ѿ�ѡ�ĿΣ��鿴�Ͽ�ʱ���Ƿ��ͻ
String handleResult="";
//TODO Ӳ����
if(courses.size()+courseids.length>=10){
handleResult="ѡ���������࣡";	
}
else{
List<SelectCourse> selectCourses=new ArrayList<>();//��ȡ�γ���Ϣ
for(int i=0;i<courseids.length;i++){
	selectCourses.add(SelectCourseMgr.find(courseids[i]));
}
boolean flag=isConflict(courseids,selectCourses,courses,studentid);

if(flag)
{
	for(SelectCourse scourse:selectCourses){
		Course course=new Course();
		course.setCourseid(scourse.getCourseid());
		course.setName(scourse.getName());
		course.setStudentid(studentid);
		course.setTeacherid(scourse.getTeacherid());
		course.setScore(-1);
		SelectCourseMgr.updateSurplus(scourse.getCourseid(),scourse.getSurplus()-1);
		CourseMgr.add(course);
	}
	handleResult="ѡ�γɹ�!";
}
else
	handleResult="�Ͽ�ʱ���ͻ!";
}
try {
	response.setHeader("content-type", "text/html;charset=GBK");
	response.setCharacterEncoding("GBK");
	response.getWriter().print(handleResult);
} catch (IOException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
}
/*
 * ����Ƿ��г�ͻ
 */
private boolean isConflict(int[] courseids,List<SelectCourse> selectCourses,List<Course> courses,String studenid){
	boolean flag=true;
	outer:
	for(int i=0;i<courseids.length;i++){
		Set<ClassTime> classTimes=selectCourses.get(i).getClassTimes();
		for(Course course:courses){
			Set<ClassTime> cs=SelectCourseMgr.find(course.getCourseid()).getClassTimes();
			if((cs.removeAll(classTimes)))//
			{
				flag=false;
				break outer;
			}
		}

	}
	return flag;
}
}

package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import beanMgr.ContentMgr;
import beanMgr.CourseMgr;
import beanMgr.UserMgr;
import beans.Content;
import beans.User;

@Controller
public class UpdateController {
@RequestMapping("/changePassword")
public void changePassword(HttpSession session,String password,HttpServletResponse response){
	User user=(User)session.getAttribute("user");
	UserMgr.changePw(user.getUserid(), password);
	String handleResult="�޸�����ɹ���";
	try {
		response.setHeader("content-type","text/html;charset=GBK");
		response.setCharacterEncoding("GBK");
		response.getWriter().print(handleResult);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

@RequestMapping("/editScore")
public void editScore(int courseid,String[] studentids,float[] scores,HttpServletResponse response,HttpSession session){

	User user=(User)session.getAttribute("user");
	String teacherid=user.getUserid();
	for(int i=0;i<studentids.length;i++)
	{
		CourseMgr.updateScore(courseid,teacherid, studentids[i], scores[i]);
	}
	String handleResult="�޸ĳɼ��ɹ�!";
	try {
		response.setHeader("content-type","text/html;charset=GBK");
		response.setCharacterEncoding("GBK");
		response.getWriter().print(handleResult);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
@RequestMapping("/publishScore")
public void publishScore(int courseid,HttpSession session,HttpServletResponse response){
	User user=(User)session.getAttribute("user");
	CourseMgr.publishScore(user.getUserid(),courseid);
	String handleResult="�γ̳ɼ��Ѿ�����!";
	try {
		response.setHeader("content-type","text/html;charset=GBK");
		response.setCharacterEncoding("GBK");
		response.getWriter().print(handleResult);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}	@RequestMapping("/saveNotice")
public void SaveNotice(HttpServletResponse response,String notice){
	Content content=new Content();
	content.setId(1);
	content.setContent(notice);
	ContentMgr.save(content);
	try {
		response.setHeader("content-type", "text/html;charset=GBK");

		response.setCharacterEncoding("GBK");
		response.getWriter().print("�޸Ĺ���ɹ���");
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}

package beanMgr;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.junit.Test;

import beans.Student;

public class StudentMgrTest {

	@Test
	public void testAdd() throws ParseException {
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		Date date = df.parse("2015-9-1");
		Student stu=new Student();
		stu.setStudentid("012016006");
		stu.setClassname("����3��");
		stu.setCollege("��ѧ����ϢѧԺ");
		stu.setInrolltime(date);
		stu.setName("���ü�");
		stu.setPhone("23323323323");
		StudentMgr.add(stu);
	}
  @Test
  public void testGenerateId(){
	 System.out.println(StudentMgr.generateId());
  }
  @Test
  public void testFind(){
	  Student student=StudentMgr.find("012016001");
	  System.out.println(student.getName());
  }
  @Test
  public void testUpdate() throws ParseException{
	  Student student=new Student();
	  student.setStudentid("012016001");
	  student.setClassname("����3��");
	  student.setCollege("��ѧ����ϢѧԺ");
	  student.setInrolltime(new SimpleDateFormat("yyyy-MM-dd").parse("2015-09-01"));
	  student.setName("�ֵ���");
	  student.setPhone("15625153096");
	  StudentMgr.update(student);
  }
  @Test
  public void testDel(){
	  String id="012016006";
	  StudentMgr.del(id);
  }
}

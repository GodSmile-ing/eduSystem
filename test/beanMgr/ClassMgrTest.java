package beanMgr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import beans.Class;
public class ClassMgrTest {

	@Test
	public void testGetByCollege() {
		List<Class> classes=ClassMgr.findByCollege("��ѧ����ϢѧԺ");
		for(Class clas:classes){
			System.out.println(clas.getName());
		}
	}
	@Test
	public void testGetList(){
		Map<String,Object> map=new HashMap();
		map.put("college", "��ѧ����ϢѧԺ");
		map.put("classid", 5);
		List<Class> classes=ClassMgr.getSelectiveData(map, 0, 5);
		for(Class clas:classes){
			System.out.println(clas.getName());
		}
	}
}

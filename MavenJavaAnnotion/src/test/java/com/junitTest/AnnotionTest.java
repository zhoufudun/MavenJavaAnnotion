package com.junitTest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.baseJunit4.BaseJunit4Test;
import com.zhoufudun.entity.Employee;
import com.zhoufudun.mappers.AnnotationMapper;

public class AnnotionTest extends BaseJunit4Test {
	@Autowired
	private AnnotationMapper annotationMapper;
	/**
	 * 增------同时获取增加后的主键(JUnit测试)
	 */
	@Test
	public void singleInsertTestOne(){
		Employee e = new Employee("王麻子", 60, "男");
		int result = annotationMapper.singleInsertAndId(e);
		System.out.println("成功插入數據"+result+"條");
		System.out.println("插入的主鍵id="+e.getId());
	}
	/**
	 * 增------简单增(JUnit测试)
	 */
	@Test
	public void singleInsertTestTwo(){
		Employee e = new Employee("王麻子", 24, "男");
		int result = annotationMapper.singleInsertAndGetNumber(e);
		System.out.println(result);
	}
	@Test
	public void singleInsertTestThree(){
		Employee e = new Employee("王麻子", 24, "男");
		int result = annotationMapper.addEmployeeSelectKey(e);
		System.out.println(result);
	}
	/**
	 * 
	 * 增------参数既有对象,又有普通参数(JUnit测试)
	 */
	@Test
	public void singleInsertTestFour(){
		Employee e = new Employee("王麻子", 24, "男");
		int result = annotationMapper.singleInsertMultiParam(e,"王麻子2", 22, "男");
		System.out.println("成功插入數據"+result+"條");
		System.out.println("插入的主鍵id="+e.getId());
	}
	/**
	 * 删------简单删(JUnit测试)
	 *
	 * @date 
	 */
	@Test
	public void singleDelete() {
		int result = annotationMapper.singleDelete(5);
		System.out.println(result);
	}
	/**
	 * 改------简单改(JUnit测试)
	 *
	 * @date 
	 */
	@Test
	public void singleUpdate() {
		int result = annotationMapper.singleUpdate("haha","女",2);
		System.out.println(result);
	}
	/**
	 * 查詢數據放入實體中
	 */
	@Test
	public void singleSelectByName() {
		Employee e = annotationMapper.singleSelectAcceptDataByObject("haha");
		System.out.println(e.getId());
	}
	/**
	 * 查詢數據放入實體中
	 */
	@Test
	public void singleSelectByNameTwo() {
		Map<String,Object> map = annotationMapper.singleSelectAcceptDataByMap("haha");
		Set<String> ks=map.keySet();
		for(String key:ks){
			System.out.println(key+"："+map.get(key));
		}
	}
	@Test
	public void singleSelectByNameThree() {
		Integer result = annotationMapper.singleSelectAcceptDataByString("haha");
		System.out.println(result);
	}
	@Test
	public void singleSelectAcceptDataByListTest() {
		List<Employee> list = annotationMapper.singleSelectAcceptDataByList(5);
		System.out.println("集合长度:" + list.size());
		for (Employee em : list) {
			System.out.println(em.toString());
			System.out.println("---------------------");
		}
	}
	/**
	 * 增------单参数动态增(JUnit测试)
	 *
	 * @date 
	 */
	@Test
	public void dynamicInsertTest() {
		Employee em = new Employee("xx", 77, "男");
		int result = annotationMapper.dynamicInsert(em);
		System.out.println(result);
		System.out.println(em.getId());
	}
	/**
	 * 增------多参数动态增(JUnit测试)
	 *
	 * @date 
	 */
	@Test
	public void dynamicInsertMultiParamTest() {
		Map<String, Object> map = new HashMap<>(8);
		map.put("id", null);
		map.put("name", "xx");
		map.put("age", 8);
		map.put("gender", null);
		int result = annotationMapper.dynamicInsertMultiParam(map);
		System.out.println(result);
		System.out.println("返回的主键值为："+map.get("id"));
	}
	/**
	 * 增------动态增,同时获得主键(JUnit测试)
	 *
	 * @date 
	 */
	@Test
	public void dynamicInsertMeanwhileGetKeyTest() {
		Employee em = new Employee("小小", 2, "女");
		int result = annotationMapper.dynamicInsertMeanwhileGetKey(em);
		System.out.println(result);
		System.out.println(em.getId());
	}
	/**
	 * 增------批量增(JUnit测试)
	 * @date 2018年6月21日 下午15:54:50
	 */
	@Test
	public void batchInsertTest() {
		Employee em0 = new Employee("小", 1, "女");
		Employee em1 = new Employee("丫", 2, "女");
		Employee em2 = new Employee("头", 3, "女");
		Employee em3 = new Employee("气", 4, "女");
		Employee em4 = new Employee("死", 5, "女");
		Employee em5 = new Employee("人", 6, "女");
		List<Employee> list = new ArrayList<>(8);
		list.add(em0);
		list.add(em1);
		list.add(em2);
		list.add(em3);
		list.add(em4);
		list.add(em5);
		Map<String, List<Employee>> map = new HashMap<>();
		map.put("listTest", list);
		int result = annotationMapper.batchInsert(map);
		System.out.println("插入数据条数为"+result);
	}
	/**
	 * 增------批量增,并批量获取主键(JUnit测试)
	 *
	 * @date 注意这里获取的是Employee中的id
	 */
	@Test
	public void batchInsertAutoGetKeyTest() {
		Employee em0 = new Employee("小", 1, "女");
		Employee em1 = new Employee("丫", 2, "女");
		Employee em2 = new Employee("头", 3, "女");
		Employee em3 = new Employee("气", 4, "女");
		Employee em4 = new Employee("死", 5, "女");
		Employee em5 = new Employee("人", 6, "女");
		List<Employee> list = new ArrayList<>(8);
		list.add(em0);
		list.add(em1);
		list.add(em2);
		list.add(em3);
		list.add(em4);
		list.add(em5);
		Map<String, List<Employee>> map = new HashMap<>();
		map.put("listTest", list);
		int result = annotationMapper.batchInsertAutoGetKey(map);
		System.out.println(result);
		for (Employee employee : list) {
			System.out.println(employee.getId());  //注意这里获取的是Employee中的id!!!!!测试失败？？？？？？
		}
	}
	/**
	 * 删------动态删(JUnit测试)
	 *
	 * @date 
	 */
	@Test
	public void dynamicDeleteTest() {
		Employee em = new Employee(null, 60, null);
		int result = annotationMapper.dynamicDelete(em);
		System.out.println(result);
	}
	/**
	 * 改------动态改(JUnit测试)
	 *
	 * @date
	 */
	@Test
	public void dynamicUpdateTest() {
		Employee em = new Employee("小苗", 16, "女");
		int result = annotationMapper.dynamicUpdate(em);
		System.out.println(result);
	}
	/**
	 * 查------动态查(JUnit测试)
	 *
	 * @date 
	 */
	@Test
	public void dynamicSelectTest() {
		List<Employee> list = annotationMapper.dynamicSelect(80);
		System.out.println("集合长度:" + list.size());
		for (Employee em : list) {
			System.out.println(em.toString());
			System.out.println("---------------------");
		}
	}
	/**
	 * 查------动态查(多个参数&模糊查询&以Map接收)测试
	 *
	 * @date 
	 */
	@Test
	public void dynamicSelectMultiParamTest() {
		List<Map<String, Object>> resultMapList = annotationMapper.dynamicSelectMultiParam("麻子", null, null);
		System.out.println(resultMapList.size());
		for (Map<String, Object> resultMap : resultMapList) {
			// 如果查询结果使用@Results指定对应property了的话,那么对应的property就位key;
			// 如果查询结果没有使用@Results指定对应property了的话,那么对应的列名就位key;
			System.out.print(resultMap.get("id")+":");
			System.out.print(resultMap.get("name")+":");
			System.out.print(resultMap.get("age")+":");
			System.out.println(resultMap.get("gender")+":");
		}
	}
	/**
	 * 直接以List作为参数
	 *
	 * @date 
	 */
	@Test
	public void  dynamicInsertListParamsTest() {
		Employee e1 = new Employee("1", 1, "女");
		Employee e2 = new Employee("2", 2, "男");
		Employee e3 = new Employee("3", 3, "女");
		Employee e4 = new Employee("4", 4, "男");
		List<Employee> list = new ArrayList<>();
		list.add(e1);
		list.add(e2);
		list.add(e3);
		list.add(e4);
		int result =annotationMapper.dynamicInsertListParams(list);
		System.out.print(result);
	}
	/**
	 * sql代理方法,形参同事有Map、String测试
	 *
	 * @date 
	 */
	@Test
	public void  insertMultiParamsMapAndStringTest() {
		Map<String, Object> map = new HashMap<>();
		map.put("age", 121);
		map.put("gender", "女");
		String name = "薰悟空";
		annotationMapper.insertMultiParamsMapAndString(map, name);
	}
	/**
	 * 当然也可以使用注解来直接执行脚本，如:执行script脚本
	 * @date 
	 */
	@Test
	public void  executeSQLScriptTest() {
		List<Integer> list = new ArrayList<>(8);
		list.add(1);
		list.add(3);
		list.add(5);
		list.add(7);
		list.add(9);
		List<Employee> result = annotationMapper.executeSQLScript(list);
		System.out.println(result);
	}
}

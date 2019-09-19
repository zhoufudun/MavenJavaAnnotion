package com.zhoufudun.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.zhoufudun.entity.Employee;
import com.zhoufudun.sqlProvider.sqlProvider;
/**
 * 
 * @author 19026404
 * 从mybatis3.4.0开始加入了@Mapper注解，目的就是为了不再写mapper映射文件
 */
@Mapper
public interface AnnotationMapper {
	
	/**
	 * 增------简单增
	 * @param employee
	 *   插入记录，数据库生成主键
	 * @return 返回成功插入的條數
	 * 
	 * 配置@Options(useGeneratedKeys=true, keyProperty="对象.属性") 这个的作用是设置是否使用JDBC的getGenereatedKeys()方法获取主键并赋值到keyProperty设置的对象的属性中，
	 * 说白了就是把自增长的主键值赋值给对象相应的属性 
	 * 在插入后，使用对象.主键属性的getXX属性()方法 获取主键值
	 * userGeneratordKeys表示要使用自增主键，keyProperty用来指定主键字段的字段名。
	 */
	@Insert("insert into t_employee(name,age,gender) values(#{e.name},#{e.age},#{e.gender})")
	@Options(useGeneratedKeys = true, keyProperty = "e.id",keyColumn="id")
	public int singleInsertAndId(@Param("e") Employee employee);
	/**
	 * 增------简单增
	 * @param employee
	 * 插入记录，手动分配主键
	 * @return 返回成功插入的條數
	 */
	@Insert("insert into t_employee(name,age,gender) values(#{e.name},#{e.age},#{e.gender})")
	public int singleInsertAndGetNumber(@Param("e") Employee employee);
	/**
	 * 插入记录，选择主键
	 * @param employee
	 * @return
	 */
	@Insert("insert into t_employee(name,age,gender) values(#{e.name},#{e.age},#{e.gender})")
	@SelectKey(statement ="SELECT UNIX_TIMESTAMP(NOW())", keyColumn ="id", keyProperty ="id", resultType = Long.class, before =true)
	int addEmployeeSelectKey(@Param("e") Employee employee);
	/**
	 * 增------参数既有对象,又有普通参数(这里使用@Options,则该对象可获得主键)
	 *
	 * @param employee
	 *            员工实体模型
	 * @param name
	 *            名字
	 * @param age
	 *            年龄
	 * @param gender
	 *            性别
	 * @return 受影响行数
	 */
	@Insert("INSERT INTO t_employee (name,age,gender) VALUES (#{e.name},#{e.age},#{e.gender}),(#{name1},#{age1},#{gender1})")
	@Options(useGeneratedKeys = true, keyProperty = "e.id", keyColumn = "id")
	int singleInsertMultiParam(@Param("e") Employee employee, @Param("name1") String name, @Param("age1") Integer age,
			@Param("gender1") String gender);
	
	/*
	 * 除了用@Options获取增加后的主键外，家可以用@SelectKey来获取主键
	 *
	 * @Insert("INSERT INTO t_employee (name,age,gender)" +
	 * " VALUES(#{e.name},#{e.age},#{e.gender})")
	 *
	 * @SelectKey(statement="select last_insert_id()",keyProperty="e.id",
	 * resultType=Integer.class, before=false) 
	 * singleInsertAutoGetKey(@Param("e") Employee employee);
	 */
	/**
	 * 删------简单删
	 *
	 * @param id
	 *            员工id
	 * @return 受影响条数
	 */
	@Delete("DELETE FROM t_employee WHERE id = #{id}")
	int singleDelete(@Param("id") Integer id);
	/**
	 * 改
	 * @param string
	 * @param i
	 * @return
	 */
	@Update("update t_employee set name=#{name},gender=#{gender} where id = #{id}")
	public int singleUpdate(@Param("name") String name,@Param("gender") String gender,@Param("id") int id);
	
	/**
	 * 查------以 对象模型 接收数据
	 *
	 * @param name
	 *            员工姓名
	 * @return 该员工对象模型
	 */
	@Select("select e.id,e.age from t_employee e where name=#{e_name}")
	//一下两个哪一个都行
	//@Results({@Result(column="id",id=true,property="id"),@Result(column="age",property="age")})
	@ResultType(Employee.class)
	public Employee singleSelectAcceptDataByObject(@Param("e_name") String name);
	/**
	 * 查------以 Map模型 接收数据
	 *
	 * @param name
	 *            员工姓名
	 * @return 将值存进Map中(注:如果没指定，那么column即为key;如果指定了，那么property即为key)
	 */
	@Select("select e.id,e.age from t_employee e where name=#{e_name}")
	@Results({@Result(column="id",id=true,property="id"),@Result(column="age",property="age")})
	public Map<String,Object> singleSelectAcceptDataByMap(@Param("e_name") String name);
	/**
	 * 查------以 一般类型 接收数据
	 *
	 * @param name
	 *         员工姓名
	 * @return 员工id
	 */
	@Select("SELECT e.id FROM t_employee e WHERE e.name = #{e_name}")
	@Results({ @Result(column = "id", property = "id") })
	Integer singleSelectAcceptDataByString(@Param("e_name") String name);
	/**
	 * 查------以 List 接收多个实体模型数据
	 *
	 * @param maxId
	 *            员工id上限
	 * @return 集合List
	 */
	@Select("select * from t_employee  where id<#{maxId}")
	@ResultMap("employee")
	public List<Employee> singleSelectAcceptDataByList(@Param("maxId")Integer maxId); 
	/**
	 * 复用@Results，起个别名为employee，通过@ResultMap("employee")直接引用
	 * @param maxId
	 * @return
	 */
	@Results(id="employee",value={
			@Result(column="id",id=true,property="id"),
			@Result(column="age",property="age"),
			@Result(column="gender",id=true,property="gender"),
			@Result(column="name",property="name")}
	)
	@Select("select * from t_employee  where id<#{maxId}")
	public List<Employee> findEmployeeById(@Param("maxId")Integer maxId);
	/**
	 * 增------动态增(单个参数，同时获得主键值)
	 *
	 * @param em
	 *            员工实体类模型
	 * @return 受影响条数
	 */
	@InsertProvider(method="dynamicInsertProvider",type=sqlProvider.class)
	@SelectKey(statement="select last_insert_id()",keyProperty="id",resultType=Integer.class, before=false)//这个注解可以获得插入后的主键值
	public int dynamicInsert(Employee e);
	/**
	 * 增------动态增(多个参数)
	 *
	 * @param map
	 *            员工实体类模型
	 * @return 受影响条数
	 */
	@InsertProvider(type = sqlProvider.class, method = "dynamicInsertMultiParamProvider")
	@SelectKey(statement="select last_insert_id()",keyProperty="id",resultType=Integer.class, before=false)
	int dynamicInsertMultiParam(Map<String, Object> map);
	/**
	 * 增------动态增(单个参数，同时获得主键值--方式1)
	 *
	 * @param em
	 *            员工实体类模型
	 * @return 受影响条数
	 */
	@InsertProvider(type = sqlProvider.class, method = "dynamicInsertProvider")
	//@Options(useGeneratedKeys = true, keyProperty = "e.id",keyColumn="id") //无法获得主键值
	@Options(useGeneratedKeys = true, keyProperty = "id",keyColumn="id") 
	int dynamicInsertMeanwhileGetKey(Employee em);
	/**
	 * 增------动态增(单个参数，同时获得主键值--方式2)
	 *
	 * @param em
	 *            员工实体类模型
	 * @return 受影响条数
	 */
	/*
	 * 
	@InsertProvider(type = sqlProvider.class, method = "dynamicInsertProvider")
	@Options(useGeneratedKeys = true, keyColumn = "id")
	int dynamicInsertMeanwhileGetKey(Employee em);
	
	*/
	/**
	 * 增------批量增
	 *
	 * @param map
	 *            包含了员工集合的map
	 * @return 受影响条数
	 */
	@InsertProvider(type = sqlProvider.class, method = "batchInsertProvider")
	public int batchInsert(Map<String, List<Employee>> map);
	/**
	 * 增------批量增(同时获得主键)
	 *
	 * @param map
	 *            包含了员工集合的map
	 * @return 受影响条数
	 */
	@InsertProvider(type = sqlProvider.class, method = "batchInsertProvider")
	@Options(useGeneratedKeys = true,  keyColumn = "id",keyProperty = "id")
	int batchInsertAutoGetKey(Map<String, List<Employee>> map);
	/**
	 * 删------动态删
	 *
	 * @param em
	 *            员工实体类模型
	 * @return 受影响的行数
	 */
	@DeleteProvider(type = sqlProvider.class, method = "dynamicDeleteProvider")
	int dynamicDelete(Employee em);
	/**
	 * 改------动态改
	 *
	 * @param em
	 *            员工实体类模型
	 * @return 受影响的行数
	 */
	@UpdateProvider(type = sqlProvider.class, method = "dynamicUpdateProvider")
	int dynamicUpdate(Employee em);
	/**
	 * 查------动态查
	 *
	 * @param age
	 *            员工年龄
	 * @return 员工实体类模型
	 */
	@SelectProvider(type = sqlProvider.class, method = "dynamicSelectProvider")
	@ResultMap("employee")
	List<Employee> dynamicSelect(Integer age);
	/**
	 * 查------动态查(多个参数&模糊查询&以Map接收)
	 * 注:我们可以提前把这些参数放进Map传过去;也可以不放入Map中,直接传多个参数,MyBatis框架会自动将这些参数放入Map中
	 *
	 * @param name
	 *            员工姓名
	 * @param age
	 *            员工年龄
	 * @param gender
	 *            员工性别
	 * @return 查询结果(以List接收,每一行数据以键值对的形式存储接收)
	 */
	@SelectProvider(type = sqlProvider.class, method = "dynamicSelectProviderMultiParamProvider")
	List<Map<String, Object>> dynamicSelectMultiParam(@Param("name") String name, @Param("age") Integer age,
			@Param("gender") String gender);
	/**
	 * 直接传List; MyBatis会将List封装为Map,其中key为参数前的@Param,
	 * 注:此时@Param是必须要有的
	 *
	 * @param list
	 *            数据集合
	 * @return 受影响行数
	 */
	@InsertProvider(type = sqlProvider.class, method = "dynamicInsertListParamsProvider")
	public int dynamicInsertListParams(@Param("listTest") List<Employee> list);
	/**
	 * 传递多参(一个Map,一个普通参数) --- 测试
	 *
	 * @param map
	 *            map数据
	 * @param name
	 *            name
	 * @return 受影响行数
	 */
	@InsertProvider(type = sqlProvider.class, method = "insertMultiParamsMapAndStringProvider")
	int insertMultiParamsMapAndString(@Param("map1") Map<String, Object> map, @Param("name1") String name);
	/**
	 * 注解执行脚本 --- 测试    ？？？？？？？？？？？？？？？？？？？？？？？？？
	 *
	 * @param dataList
	 *            条件
	 * @return 查询到的数据
	 */
	//SELECT e.id,e.age,e.name,e.gender FROM t_employee e WHERE 1=1 and id IN(1,3,4,5,6,7,9)
	@Select("<script>"
			+ "SELECT e.id,e.age,e.name,e.gender FROM t_employee e WHERE 1=1"
				+ "<if test = 'list != null and list.size > 0' >"
					+ " and e.id IN "
					+ " <foreach collection = 'list' open = '(' close=')' separator =',' item = 'item' >"
						+ " #{item} "
					+ " </foreach> "
				+ "</if>"
			+ "</script>")
	List<Employee> executeSQLScript(@Param("list") List<Integer> dataList);
}

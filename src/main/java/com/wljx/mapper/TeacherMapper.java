package com.wljx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;

import com.wljx.bean.Teacher;
import com.wljx.utils.SqlProvider;

public interface TeacherMapper {

	@Select("select * from teacher where id=#{id} and password=#{password}")
	Teacher login(@Param("id")String id,@Param("password") String password);

	@Select("select * from teacher where id=#{id}")
	Teacher getTeacherById(String id);

	@Update("update teacher set url=#{url} where id=#{id}")
	void updateTeacherUrl(@Param("id")String id,@Param("url") String url);
	@Update("update teacher set password=#{password} where id=#{id}")
	void updateTeacherPwd(@Param("id")String id,@Param("password") String password);

	@Select("select * from teacher")
	List<Teacher> getTeachers();


	@UpdateProvider(type=SqlProvider.class,method="getSqlForUpdateTeacher")
	void updateTeacher(String id,String name,String password,String sex,Integer age,String url);

	@Insert("insert into teacher (id,name,password,age,sex,url)  values (#{id},#{name},#{password},#{age},#{sex},#{url})")
	void addTeacher(@Param("id")String id,@Param("name") String name,@Param("password") String password
			,@Param("age") Integer age,@Param("sex") String sex,@Param("url") String url);

	@Delete("delete from teacher where id=#{id}")
	void deleteTeacher(String id);
}

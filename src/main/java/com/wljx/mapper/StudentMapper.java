package com.wljx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.wljx.bean.Docdownload;
import com.wljx.bean.Student;
import com.wljx.bean.TeacherJob;
import com.wljx.utils.SqlProvider;

public interface StudentMapper {

	@Select("select * from student where id=#{id} and password=#{password}")
	@Results({
		@Result(column="banjiId",property="banji",one=@One(select="com.wljx.mapper.BanjiMapper.getBanjiById")),
		@Result(column="professionId",property="profession",one=@One(select="com.wljx.mapper.ProfessionMapper.getProfessionById"))
		
	})
	Student login(@Param("id")String id,@Param("password") String password);
	
	@Results({
		@Result(column="banjiId",property="banji",one=@One(select="com.wljx.mapper.BanjiMapper.getBanjiById")),
		@Result(column="professionId",property="profession",one=@One(select="com.wljx.mapper.ProfessionMapper.getProfessionById"))
		
	})
	@Select("select * from student where id=#{id}")
	Student getStuById(String id);
	
	
	@Select("select * from student where banjiId=#{banjiId}")
	List<Student> getStusByBanjiId(int banjiId);
	
	@Update("update student set url=#{url} where id=#{id}")
	void updateStuUrl(@Param("id")String id,@Param("url") String url);
	@Update("update student set password=#{password} where id=#{id}")
	void updateStuPwd(@Param("id")String id,@Param("password") String password);

	
	@Results({
		@Result(column="jobId",property="job",one=@One(select="com.wljx.mapper.JobMapper.getJobById")),
		@Result(column="teacherId" ,property="teacher",one=@One(select="com.wljx.mapper.TeacherMapper.getTeacherById"))
	})
	@Select("select * from teacher_job where stuId=#{stuId}")
	List<TeacherJob> getMyJob(String stuId);

	@Results({
		@Result(column="docdetailId",property="docdetail",one=@One(select="com.wljx.mapper.DocMapper.getDocdetailById"))
	})
	@Select("select * from doc_download where stuId=#{stuId}")
	List<Docdownload> getMyDown(String stuId);

	
	@Results({
		@Result(column="banjiId",property="banji",one=@One(select="com.wljx.mapper.BanjiMapper.getBanjiById")),
		@Result(column="professionId",property="profession",one=@One(select="com.wljx.mapper.ProfessionMapper.getProfessionById"))
		
	})
	@Select("select * from student")
	List<Student> getStus();

	
	
	@Insert("insert into student (id,name,password,sex,age,ruxueTime,url,banjiId,professionId)"
			+ " values (#{id},#{name},#{password},#{sex},#{age},#{ruxueTime},#{url},#{banjiId},#{professionId})")
	void addStudent(@Param("id")String id, @Param("name")String name,@Param("password") String password
			,@Param("sex") String sex,@Param("age") int age, @Param("ruxueTime")String ruxueTime
			, @Param("url")String url,@Param("banjiId")int banjiId, @Param("professionId")int professionId);

	@InsertProvider(type=SqlProvider.class,method="getSqlForUpdateStudent")
	void updateStudent(String id, String name, String password, String sex, Integer age, String ruxueTime, String url,
			Integer banjiId, Integer professionId);

	
	@Delete("delete from student where id=#{id}")
	void deleteStudent(String id);
}

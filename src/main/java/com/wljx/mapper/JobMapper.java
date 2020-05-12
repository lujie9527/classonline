package com.wljx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import com.wljx.bean.Job;
import com.wljx.bean.StuJob;
import com.wljx.utils.SqlProvider;
import com.wljx.utils.TeacherTijiao;

public interface JobMapper {

	@Insert("insert into job (name,url,uploadTime,lastTime,teacherId,banjiId,professionId) "
			+ "values (#{name},#{url},#{uploadTime},#{lastTime},#{teacherId},#{banjiId},#{professionId}) ")
	void teacherFabu(@Param("name") String name,@Param("url") String url,@Param("uploadTime") String uploadTime,
			@Param("lastTime") String lastTime,@Param("teacherId") String teacherId, 
			@Param ("banjiId") Integer banjiId,@Param("professionId") Integer professionId);

	@Select("select * from job where state=0 and banjiId=#{banjiId}")
	@Results({
		@Result(column="teacherId",property="teacher",one=@One(select="com.wljx.mapper.TeacherMapper.getTeacherById"))
	})
	List<Job> getAllJobs(int banjiId);
	@Select("select * from job where state=0 and banjiId=#{banjiId}")
	List<Job> getJobsByBanjiId(int banjiId);

	@Insert("insert into stu_job (url,finishTime,stuId,jobId) value (#{url},#{finishTime},#{stuId},#{jobId})")
	void stuTijiao(@Param("url")String url,@Param("finishTime") String finishTime,@Param("stuId") String stuId,@Param("jobId") Integer jobId);

	@SelectProvider(type=SqlProvider.class,method="getSqlForfindJobsByTeacherId")
	@Results({
		@Result(column="banjiId",property="banji",one=@One(select="com.wljx.mapper.BanjiMapper.getBanjiById")),
		@Result(column="professionId",property="profession",one=@One(select="com.wljx.mapper.ProfessionMapper.getProfessionById"))
	})
	List<Job> findJobsByTeacherId(String teacherId,String name, int professionId, int banjiId);

	@Select("select * from stu_job where jobId=#{id}")
	@Results({
		@Result(column="stuId",property="student",one=@One(select="com.wljx.mapper.StudentMapper.getStuById"))
	})
	List<StuJob> getStuJobsByJobId(int id);

	@Select("select id,name,banjiId,professionId from job where state=0 and teacherId=#{teacherId}")
	List<TeacherTijiao> findJobsForTeacherTijiao(String teacherId);

	//老师提交作业（改好了的）
	@Insert("insert into teacher_job (stuId,jobId,teacherId,url,grade,pigaiTime,banjiId,professionId)"
			+ " values (#{stuId},#{jobId},#{teacherId},#{url},#{grade},#{pigaiTime},#{banjiId},#{professionId})")
	void teacherTijiao(@Param("stuId") String stuId,@Param("jobId") int jobId,@Param("teacherId") String teacherId, 
			@Param("url") String url,@Param("grade") double grade,@Param("pigaiTime") String pigaiTime,
			@Param("banjiId") int banjiId,@Param("professionId") int professionId);

	@Select("select * from job where id=#{id}")
	Job getJobById(int id);

	@Results({
		@Result(column="teacherId",property="teacher",one=@One(select="com.wljx.mapper.TeacherMapper.getTeacherById")),
		@Result(column="banjiId",property="banji",one=@One(select="com.wljx.mapper.BanjiMapper.getBanjiById")),
		@Result(column="professionId",property="profession",one=@One(select="com.wljx.mapper.ProfessionMapper.getProfessionById"))
	})
	@Select("select * from job")
	List<Job> getJobs();

	@Delete("delete from job where id=#{id}")
	void deleteJob(Integer id);
}

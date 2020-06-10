package com.classonline.mapper;

import com.classonline.bean.Job;
import com.classonline.bean.StuJob;
import com.classonline.utils.SqlProvider;
import com.classonline.utils.TeacherTijiao2;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface JobMapper {

    //添加题目
    @Insert("insert into job2 (jobTitle,jobDetail,uploadTime,lastTime,teacherId,banjiId,professionId) "
            + "values (#{jobTitle},#{jobDetail},#{uploadTime},#{lastTime},#{teacherId},#{banjiId},#{professionId}) ")

    void teacherFabu(@Param("jobTitle") String jobTitle,@Param("jobDetail") String jobDetail,
                     @Param("uploadTime") String uploadTime, @Param("lastTime") String lastTime,
                     @Param("teacherId") String teacherId, @Param ("banjiId") Integer banjiId,
                     @Param("professionId") Integer professionId);


    //通过班级ID查找题目
    @Select("select * from job2 where banjiId=#{banjiId}")

    //当数据库字段名与实体类对应的属性名不一致时，可以使用@Results映射来将其对应起来。
    //column为数据库字段名，porperty为实体类属性名，jdbcType为数据库字段数据类型，id为是否为主键
    //名字相同的可以省略
    //@One注解主要在一对一的关联查询中使用
    @Results({
            @Result(column="teacherId",property="teacher",
                    one=@One(select="com.classonline.mapper.TeacherMapper.getTeacherById"))
    })

    List<Job> getAllJobs(int banjiId);



    @Select("select * from job2 where banjiId=#{banjiId}")

    List<Job> getJobsByBanjiId(int banjiId);


    //学生提交作业
    @Insert("insert into stu_job2 (homework,finishTime,stuId,stuName,jobId) " +
            "values (#{homework},#{finishTime},#{stuId},#{stuName},#{jobId})")

    void stuTijiao(@Param("homework")String homework,@Param("finishTime") String finishTime,
                   @Param("stuId") String stuId,@Param("stuName") String stuName,
                   @Param("jobId") Integer jobId);



    @SelectProvider(type= SqlProvider.class,method="getSqlForfindJobsByTeacherId")

    @Results({
            @Result(column="banjiId",property="banji",one=@One(select="com.classonline.mapper.BanjiMapper.getBanjiById")),
            @Result(column="professionId",property="profession",one=@One(select="com.classonline.mapper.ProfessionMapper.getProfessionById"))
    })

    List<Job> findJobsByTeacherId(String teacherId, String jobTitle, int professionId, int banjiId);


//根据作业编号查找学生作业
    @Select("select * from stu_job2 where jobId=#{jobId}")

    @Results({
            @Result(column="stuId",property="student",one=@One(select="com.classonline.mapper.StudentMapper.getStuById"))
    })

    List<StuJob> getStuJobsByJobId(Integer id);



    @Select("select id,jobTitle,banjiId,professionId from job2 where teacherId=#{teacherId}")

    List<TeacherTijiao2> findJobsForTeacherTijiao(String teacherId);



    //老师提交作业（改好了的）
    @Insert("insert into teacher_job (stuId,jobId,teacherId,jobDetail,grade,pigaiTime,banjiId,professionId)"
            + " values (#{stuId},#{jobId},#{teacherId},#{jobDetail},#{grade},#{pigaiTime},#{banjiId},#{professionId})")

    void teacherTijiao(@Param("stuId") String stuId,@Param("jobId") int jobId,@Param("teacherId") String teacherId,
                       @Param("jobDetail") String jobDetail,@Param("grade") double grade,@Param("pigaiTime") String pigaiTime,
                       @Param("banjiId") int banjiId,@Param("professionId") int professionId);



    @Select("select * from stu_job2 where jobId=#{jobId}")

    @Results({
            @Result(column="stuId",property="student",one=@One(select="com.classonline.mapper.StudentMapper.getStuById"))
    })
    List<StuJob> getStuJobById(Integer jobId);


    @Select("select * from job2 where id=#{id}")

    Job getJobById(Integer id);

    @Results({
            @Result(column="teacherId",property="teacher",one=@One(select="com.classonline.mapper.TeacherMapper.getTeacherById")),
            @Result(column="banjiId",property="banji",one=@One(select="com.classonline.mapper.BanjiMapper.getBanjiById")),
            @Result(column="professionId",property="profession",one=@One(select="com.classonline.mapper.ProfessionMapper.getProfessionById"))
    })

    @Select("select * from job2")
    List<Job> getJobs();


    @Delete("delete from job2 where id=#{id}")

    void deleteJob(Integer id);


    @Update("update stu_job2 set jobGrade=#{jobGrade} where id=#{id}")
    void uploadGrade(@Param("jobGrade") Integer jobGrade,@Param("id") Integer id);


    @Select("select * from stu_job2 where stuId=#{stuId}")

    @Results({
            @Result(column = "jobId",property = "job",one = @One(select = "com.classonline.mapper.JobMapper.getJobById")),
            @Result(column = "stuId",property = "student",one = @One(select = "com.classonline.mapper.StudentMapper.getStuById"))
    })
    List<StuJob> getStuHomework(String stuId);



    @Select("select state from job2 where id=#{id}")
    int getState(Integer id);

    @Update("update job2 set state=#{state} where id=#{id}")

    void updateState(@Param("state")Integer state,@Param("id") Integer id);

    //通过作业ID获取截止提交时间
    @Select("select lastTime from job2 where id=#{id}")

    String getlastTime(Integer id);

    @Select("select * from job2 where jobTitle=#{jobTitle}")

    List<Job> findJobByJobTitle(String jobTitle);

}

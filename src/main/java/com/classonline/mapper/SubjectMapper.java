package com.classonline.mapper;


import com.classonline.bean.Subject;
import com.classonline.utils.SqlProvider;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface SubjectMapper {

    @Insert("insert into subject (subjectId,subjectTitle,subjectOptionA,subjectOptionB,subjectOptionC,subjectOptionD,subjectAnswer,subjectParse)"
    +"values(#{subjectId},#{subjectTitle},#{subjectOptionA},#{subjectOptionB},#{subjectOptionC},#{subjectOptionD},#{subjectAnswer},#{subjectParse})")

    void addSubject(@Param("subjectId")int subjectId,@Param("subjectTitle") String subjectTitle, @Param("subjectOptionA") String subjectOptionA, @Param("subjectOptionB")
            String subjectOptionB,@Param("subjectOptionC")String subjectOptionC,@Param("subjectOptionD")String subjectOptionD,
                     @Param("subjectAnswer") String subjectAnswer,@Param("subjectParse")String subjectParse);

    //学生提交在线练习插入学生成绩
    @Insert("insert into student （id,grade） value (#{id},#{grade})")

    void subjectUpload(@Param("id")int id,@Param("grade")String grade);


    @Select("select * from subject where subjectId=#{subjectId}")

    @Results({
            @Result(column = "subjectId",property = "teacher",one = @One(select = "com.classonline.mapper.StudentMapper.getStuById"))
    })
     List<Subject> findSubjectById(int subjectId);


    @Select("select * from subject where subjectTitle=#{SubjectTitle}")

    Subject findSubjectByTitle(String subjectTitle);//根据试题标题查找试题



    @Delete("delete from subject where subjectId=#{subjectId}")

    void deleteSubject(Integer subjectId);



//    int findSubjecCount();//查询试题总量

    @UpdateProvider(type = SqlProvider.class,method = "getSqlForUpdateSubject")
    void updateSubject(int subjectId,String subjectTitle,String subjectOptionA,String subjectOptionB,String subjectOptionC,
                       String subjectOptionD,String subjectAnswer,String subjectParse);//更新试题


    @Select("select * from subject")
    List<Subject> getSubjects();


    //通过试题ID得到试题答案
    @Select("select subjectAnswer from subject where subjectId=#{subjectId}")
    String getSubAnswerById(int subjectId);


}

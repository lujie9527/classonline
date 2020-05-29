package com.classonline.mapper;

import com.classonline.bean.Subject;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface SubjectMapper {

    @Insert("insert into subject (subjectTitle,subjectOptionA,subjectOptionB,subjectOptionC,subjectOptionD,subjectAnswer,subjectParse) values (#{subjectTitle},#{subjectOptionA},#{subjectOptionB},#{subjectOptionC},#{subjectOptionD},#{subjectAnswer},#{subjectParse})")

    void addSubject(@Param("subjectTitle") String subjectTitle, @Param("subjectOptionA") String subjectOptionA,
                    @Param("subjectOptionB") String subjectOptionB,@Param("subjectOptionC") String subjectOptionC,
                    @Param("subjectOptionD") String subjectOptionD, @Param("subjectAnswer") String subjectAnswer,
                    @Param("subjectParse") String subjectParse);

    //学生提交在线练习插入学生成绩
    @Insert("insert into student (id,grade) value (#{id},#{grade})")

    void subjectUpload(@Param("id")int id,@Param("grade")String grade);


    @Select("select * from subject where subjectTitle like CONCAT('%',#{subjectTitle},'%')")

   List<Subject> findSubjectByTitle(@Param("subjectTitle") String subjectTitle);//根据试题标题查找试题


    @Select("select * from subject where subjectId=#{subjectId}")

    Subject findSubjectById(Integer subjectId);


    //根据标题编号删除试题
    @Delete("delete from subject where subjectId=#{subjectId}")

    void deleteSubject(Integer subjectId);




//    @UpdateProvider(type = SqlProvider.class,method = "getSqlForUpdateSubject")
//    void updateSubject(String subjectTitle,String subjectOptionA,String subjectOptionB,String subjectOptionC,
//                       String subjectOptionD,String subjectAnswer,String subjectParse);

    @Update("update subject set subjectTitle=#{subjectTitle},subjectOptionA=#{subjectOptionA},subjectOptionB=#{subjectOptionB}," +
            "subjectOptionC=#{subjectOptionC},subjectOptionD=#{subjectOptionD},subjectAnswer=#{subjectAnswer}," +
            "subjectParse=#{subjectParse} where subjectId=#{subjectId}")
    void updateSubject(@Param("subjectId")Integer subjectId,@Param("subjectTitle") String subjectTitle,@Param("subjectOptionA") String subjectOptionA,
                       @Param("subjectOptionB") String subjectOptionB,@Param("subjectOptionC") String subjectOptionC,
                       @Param("subjectOptionD") String subjectOptionD,@Param("subjectAnswer") String subjectAnswer,
                       @Param("subjectParse") String subjectParse);

    @Select("select * from subject")
    List<Subject> getSubjects();


    //通过试题ID得到试题答案
    @Select("select subjectAnswer from subject where subjectId=#{subjectId}")
    String getSubAnswerById(int subjectId);


}

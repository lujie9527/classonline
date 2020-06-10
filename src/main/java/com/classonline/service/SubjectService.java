package com.classonline.service;


import com.classonline.bean.Student;
import com.classonline.bean.Subject;


import java.util.ArrayList;
import java.util.List;

public interface SubjectService {


    /**
     * 增加试题
     * @param subjectTitle
     * @param subjectOptionA
     * @param subjectOptionB
     * @param subjectOptionC
     * @param subjectOptionD
     * @param subjectAnswer
     * @param subjectParse
     */

    void addSubject(String subjectTitle,String subjectOptionA,String subjectOptionB,String subjectOptionC,String subjectOptionD,
                    String subjectAnswer,String subjectParse);

    /**
     * 修改试题信息
     * @param subjectId
     * @param subjectTitle
     * @param subjectOptionA
     * @param subjectOptionB
     * @param subjectOptionC
     * @param subjectOptionD
     * @param subjectAnswer
     * @param subjectParse
     */

    void updateSubject(Integer subjectId,String subjectTitle,String subjectOptionA,String subjectOptionB,String subjectOptionC,String subjectOptionD,
                       String subjectAnswer,String subjectParse);


    /**
     * 根据试题标题查找试题
     * @param subjectTitle
     * @return
     */

    List<Subject> findSubjectByTitle(String subjectTitle);


    /**
     * 根据试题ID查找试题
     * @param subjectId
     * @return
     */

    Subject findSubjectById(Integer subjectId);

    /**
     * 单个删除试题
     * @param subjectId
     */

    void deleteSubject(Integer subjectId);

    /**
     * 批量删除试题（后台管理员）
     * @param subjectIds
     */

    void deleteSubjectByList(String[] subjectIds);

    /**
     * 更新学生成绩
     * @param id
     * @param grade
     */

    void subjectUpload(Integer id, String grade);

    /**
     * 计算学生分数
     * @param stuId
     * @param studentAnswers
     * @return
     */

    int accountResult(String stuId,ArrayList<String> studentAnswers);

    /**
     * 获取所有试题
     * @return
     */

    List<Subject> getSubjects();

    /**
     * 根据试题编号获取正确答案
     * @param subjectId
     * @return
     */

    String getAnswerById(int subjectId);
}

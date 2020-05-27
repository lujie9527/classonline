package com.classonline.service;


import com.classonline.bean.Student;
import com.classonline.bean.Subject;


import java.util.ArrayList;
import java.util.List;

public interface SubjectService {


    void addSubject(String subjectTitle,String subjectOptionA,String subjectOptionB,String subjectOptionC,String subjectOptionD,
                    String subjectAnswer,String subjectParse);

    void updateSubject(Integer subjectId,String subjectTitle,String subjectOptionA,String subjectOptionB,String subjectOptionC,String subjectOptionD,
                       String subjectAnswer,String subjectParse);


    List<Subject> findSubjectByTitle(String subjectTitle);


    void deleteSubject(String[] ids);


    void subjectUpload(Integer id, String grade);


    int accountResult(String stuId,ArrayList<String> studentAnswers);


    List<Subject> getSubjects();

//    List<Subject> getAllSubject(String subjectTitle);

    String getAnswerById(int subjectId);
}

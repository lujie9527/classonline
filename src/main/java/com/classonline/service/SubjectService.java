package com.classonline.service;


import com.classonline.bean.Student;
import com.classonline.bean.Subject;


import java.util.ArrayList;
import java.util.List;

public interface SubjectService {


    void addSubject(Subject subject);


    List<Subject> findSubjectById(Integer subjectId);


    Subject findSubjectByTitle(String subjectTitle);


    void deleteSubject(String[] ids);


    void subjectUpload(Integer id, String grade);


    void accountResult(String stuId,ArrayList<String> studentAnswers);


    List<Subject> getSubjects();

    String getAnswerById(int subjectId);
}

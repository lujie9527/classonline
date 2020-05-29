package com.classonline.service.impl;

import com.classonline.bean.Student;
import com.classonline.bean.Subject;
import com.classonline.mapper.StudentMapper;
import com.classonline.mapper.SubjectMapper;
import com.classonline.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.security.PublicKey;
import java.util.ArrayList;
import java.util.List;

@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectMapper subjectMapper;
    @Autowired
    private StudentMapper studentMapper;


    @Transactional
    //通常情况下我们在需要对一个service方法添加事务时，加上这个注解，如果发生unchecked exception，就会发生rollback
    @Override
    public void addSubject(String subjectTitle,String subjectOptionA,String subjectOptionB,String subjectOptionC,String subjectOptionD,
                           String subjectAnswer,String subjectParse){

        subjectMapper.addSubject(subjectTitle,subjectOptionA,subjectOptionB,subjectOptionC,subjectOptionD,
                subjectAnswer,subjectParse);


    }
    @Transactional
    @Override
    public void updateSubject(Integer subjectId,String subjectTitle,String subjectOptionA,String subjectOptionB,String subjectOptionC,String subjectOptionD,
                              String subjectAnswer,String subjectParse){

        subjectMapper.updateSubject(subjectId,subjectTitle,subjectOptionA,subjectOptionB,subjectOptionC,subjectOptionD,
                subjectAnswer,subjectParse);
    }


    @Override
    public List<Subject> findSubjectByTitle(String subjectTitle){

        List<Subject> subject = subjectMapper.findSubjectByTitle(subjectTitle);

        return subject;
    }
    @Override
    public Subject findSubjectById(Integer subjectId){
        Subject subject=subjectMapper.findSubjectById(subjectId);
        return subject;
    }

    @Override
    public void deleteSubject(Integer subjectId){
            subjectMapper.deleteSubject(Integer.valueOf(subjectId));
    }


    @Override
    public void subjectUpload(Integer id, String grade){

        subjectMapper.subjectUpload(id,grade);
    }

    @Override
    public int accountResult(String stuId, ArrayList<String> studentAnswers){
        int generalPoint = 0;
        for (int i = 0;i < 20;i++){
            String rightAnswer = subjectMapper.getSubAnswerById(i+1);
            System.out.println("这里是rightAnswer"+rightAnswer);
            if ((rightAnswer.equals(studentAnswers.get(i)))){
                generalPoint +=5;
            }
        }
        studentMapper.addGrade(generalPoint,stuId);
        return generalPoint;

    }

    @Override
    public List<Subject> getSubjects(){
        return subjectMapper.getSubjects();
    }
    @Override
    public String getAnswerById(int subjectId){
        return subjectMapper.getSubAnswerById(subjectId);
    }


}

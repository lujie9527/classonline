package com.classonline.service.impl;

import com.classonline.bean.Student;
import com.classonline.bean.Subject;
import com.classonline.mapper.StudentMapper;
import com.classonline.mapper.SubjectMapper;
import com.classonline.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectMapper subjectMapper;
    @Autowired
    private StudentMapper studentMapper;


//    public List<Subject> getSubjectTest(Integer subjectId, String subjectTitle, String subjectOptionA,
//                                        String subjectOptionB, String subjectOptionC, String subjectOptionD,
//                                        String subSubjectAnswer,String SubjectParse){
//
//        List<Subject> sub = subjectMapper.getAllSubject(subjectId);
//
//        List<Subject> subt = new ArrayList<>();
//
//        for(Subject subject : sub){
//
//            Subject sb = null;
//            sb.setSubjectTitle(subject.getSubjectTitle());
//            sb.setSubjectOptionA(subject.getSubjectOptionA());
//            sb.setSubjectOptionB(subject.getSubjectOptionB());
//            sb.setSubjectOptionC(subject.getSubjectOptionC());
//            sb.setSubjectOptionD(subject.getSubjectOptionD());
//            sb.setSubjectAnswer(subject.getSubjectAnswer());
//            sb.setSubjectParse(subject.getSubjectParse());
//
//            subt.add(sb);
//        }
//        return subt;
//    }
    @Transactional
    //通常情况下我们在需要对一个service方法添加事务时，加上这个注解，如果发生unchecked exception，就会发生rollback
    @Override
    public void addSubject(Subject subject){

        subjectMapper.addSubject(subject.getSubjectId(),subject.getSubjectTitle(),subject.getSubjectOptionA(),
                subject.getSubjectOptionB(),subject.getSubjectOptionC(),subject.getSubjectOptionD(),subject.getSubjectAnswer(),
                subject.getSubjectParse());


    }
    @Override
    public List<Subject> findSubjectById(Integer subjectId){

        return subjectMapper.findSubjectById(subjectId);
    }

    @Override
    public Subject findSubjectByTitle(String subjectTitle){

        return subjectMapper.findSubjectByTitle(subjectTitle);
    }

    @Override
    public void deleteSubject(String[] ids){
        for (String id:ids){
            subjectMapper.deleteSubject(Integer.valueOf(id));
        }
    }


    @Override
    public void subjectUpload(Integer id, String grade){

        subjectMapper.subjectUpload(id,grade);
    }

    @Override
    public void accountResult(String stuId, ArrayList<String> studentAnswers){
        System.out.println("这里是accountResult"+studentAnswers);
        System.out.println("这里是学生ID"+stuId);
        int generalPoint = 0;
        for (int i = 0;i < 20;i++){
            String rightAnswer = subjectMapper.getSubAnswerById(i+1);
            System.out.println("这里是rightAnswer"+rightAnswer);
            if ((rightAnswer.equals(studentAnswers.get(i)))){
                generalPoint +=5;
            }
        }
        studentMapper.addGrade(generalPoint,stuId);

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

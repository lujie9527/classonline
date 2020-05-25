package com.classonline.controller;

import com.classonline.bean.Student;
import com.classonline.bean.Subject;
import com.classonline.mapper.StudentMapper;
import com.classonline.service.StudentService;
import com.classonline.service.SubjectService;
import jdk.nashorn.internal.ir.RuntimeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/sub")
public class SubjectController {

    @Autowired
    private SubjectService subjectService;
    @Autowired
    private StudentService studentService;

//    @RequestMapping("/subject/all")
//    public String subjectList(HttpServletRequest request){
//        List<SubjectTest> sublist = subjectService.getSubjectTest(subjectId,subjectTitle,subjectOptionA,subjectOptionB,subjectOptionC,
//                subjectOptionD,subjectAnswer,subjectParse);
//    }


    @RequestMapping("/onlinehw")
    public String onlineHomework(HttpServletRequest request){
//        Object user = request.getSession().getAttribute("user");
//
//        if(user instanceof Student){
//            Student stu = (Student)user;
//            return "/qiantai/subjectTest/subTestindex";
//        }else{
//            Teacher tea = (Teacher) user;
//            return "/qiantai/subjectTest/subjectManage";
//        }
        HttpSession session = request.getSession();

        Integer flag=(Integer) session.getAttribute("isStu");
        if(flag!=null) { //学生
            return "/qiantai/subjectTest/subTestReady";
        }else {

            return "/qiantai/subjectTest/subjectManage";
        }
    }

    @RequestMapping(value = "/subresult",method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView subResult(HttpServletRequest request, @RequestBody ArrayList<String> subAnswers){

        Student student = (Student) request.getSession().getAttribute("user");
        subjectService.accountResult(student.getId(), subAnswers);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("qiantai/subjectTest/examResult");
        return modelAndView;
    }


    @RequestMapping("/addSub")
    public String addSubjectByTeacher(Subject subject){
        subjectService.addSubject(subject);
        return "200";
    }

    @RequestMapping("/getSubList")

    public ModelAndView getSubList()throws Exception{

        List<Subject> listSub = subjectService.getSubjects();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("subjectList",listSub);
        modelAndView.setViewName("/qiantai/subjectTest/subTestindex");
        return modelAndView;
    }


}

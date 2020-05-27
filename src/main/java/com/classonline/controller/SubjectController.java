package com.classonline.controller;

import com.classonline.bean.Student;
import com.classonline.bean.Subject;
import com.classonline.bean.Teacher;
import com.classonline.mapper.StudentMapper;
import com.classonline.service.StudentService;
import com.classonline.service.SubjectService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jdk.nashorn.internal.ir.RuntimeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
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

        HttpSession session = request.getSession();

        Integer flag=(Integer) session.getAttribute("isStu");
        if(flag!=null) { //学生
            return "/qiantai/subjectTest/subTestReady";
        }else {

            return "/qiantai/subjectTest/subjectManage";
        }
    }

    @RequestMapping(value = "/subresult",method = RequestMethod.POST)
//    @ResponseBody
    public void subResult(HttpServletRequest request, @RequestBody ArrayList<String> subAnswers){

        Student student = (Student) request.getSession().getAttribute("user");
        int stuGrade =  subjectService.accountResult(student.getId(), subAnswers);
    }


    @RequestMapping("/addSub")
    public String addSubjectByTeacher(String subjectTitle,String subjectOptionA,String subjectOptionB,String subjectOptionC,String subjectOptionD,
                                      String subjectAnswer,String subjectParse){
        subjectService.addSubject(subjectTitle,subjectOptionA,subjectOptionB,subjectOptionC,subjectOptionD,
                subjectAnswer,subjectParse);
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


    @RequestMapping("/allSub")
    public String getAllSubject(HttpServletRequest request,
                                Model model){
        Object user = request.getSession().getAttribute("user");
        if (user instanceof Teacher){
            Teacher teacher = (Teacher)user;
//            PageHelper.startPage(pageNum,10);
            List<Subject> list = subjectService.getSubjects();
//            PageInfo<Subject> pageInfo = new PageInfo<Subject>(list,10);
            model.addAttribute("manageSubList",list);
            System.out.println("麻烦你输出"+list);

        }
        return "qiantai/subjectTest/subjectManage";
    }


    @RequestMapping(value = "/findSub",produces = "application/json;charset=UTF-8")

    public String findSubjectByTitle(String subjectTitle,HttpServletRequest request){
       List<Subject> subject = subjectService.findSubjectByTitle(subjectTitle);

        request.setAttribute("findSubject",subject);
        System.out.println("运行到findSub了吗subject"+subject);
        System.out.println("运行到findSub了吗subjectitle"+subjectTitle);
        return "qiantai/subjectTest/subjectQuery";
    }


}

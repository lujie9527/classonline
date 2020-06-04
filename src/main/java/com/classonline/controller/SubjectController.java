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
import org.apache.ibatis.annotations.Param;
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
    @ResponseBody
    public List<String> subResult(HttpServletRequest request, @RequestBody ArrayList<String> subAnswers){

        Student student = (Student) request.getSession().getAttribute("user");
        subjectService.accountResult(student.getId(), subAnswers);
        System.out.println("LIST=="+subAnswers);
        return subAnswers;
    }


    @RequestMapping("/addSub")
    public String addSubjectByTeacher(String subjectTitle,String subjectOptionA,String subjectOptionB,String subjectOptionC,String subjectOptionD,
                                      String subjectAnswer,String subjectParse){
        subjectService.addSubject(subjectTitle,subjectOptionA,subjectOptionB,subjectOptionC,subjectOptionD,
                subjectAnswer,subjectParse);
        return "redirect:/sub/allSub";
    }

    @RequestMapping("/boom")
    public String boomAdd(){
        return "/qiantai/subjectTest/subjectAdd";
    }

    @RequestMapping("/boom2")
    public String boomGrade(){
        return "/qiantai/subjectTest/examResult";
    }

    @RequestMapping("/boom3")
    public String boomAnswer(Model model){
        List<Subject> listSub = subjectService.getSubjects();
        model.addAttribute("subjectList",listSub);
        return "/qiantai/subjectTest/showAnswer";
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
    public String getAllSubject(HttpServletRequest request, Model model){
        List<Subject> list = subjectService.getSubjects();
        model.addAttribute("manageSubList",list);
        return "qiantai/subjectTest/subjectManage";
    }


    @RequestMapping(value = "/findSub",produces = "application/json;charset=UTF-8")

    public String findSubjectByTitle(String subjectTitle,HttpServletRequest request){
       List<Subject> subject = subjectService.findSubjectByTitle(subjectTitle);

        request.setAttribute("findSubject",subject);

        return "qiantai/subjectTest/subjectQuery";
    }

    @RequestMapping("subShow")
    public ModelAndView showSubject(@RequestParam("subjectId")Integer subjectId){

        ModelAndView mv = new ModelAndView();
        mv.addObject("subjectId",subjectId);
        Subject sub = subjectService.findSubjectById(subjectId);
        mv.addObject("subjectOne",sub);
        mv.setViewName("/qiantai/subjectTest/subjectShow");
        return mv;
    }

    @RequestMapping("/subUpdate")
    public ModelAndView updateSubject(@RequestParam("subjectId") Integer subjectId){
        ModelAndView mv = new ModelAndView();
        mv.addObject("subjectId",subjectId);
        Subject sub = subjectService.findSubjectById(subjectId);
        mv.addObject("subjectUp",sub);
        mv.setViewName("/qiantai/subjectTest/subjectUpdate");
        return mv;
    }

    @RequestMapping("/subUpdate2")
    public ModelAndView updateSubject2(@RequestParam("subjectId")Integer subjectId,
                                       @RequestParam("subjectTitle")String subjectTitle,
                                       @RequestParam("subjectOptionA")String subjectOptionA,
                                       @RequestParam("subjectOptionB")String subjectOptionB,
                                       @RequestParam("subjectOptionC")String subjectOptionC,
                                       @RequestParam("subjectOptionD")String subjectOptionD,
                                       @RequestParam("subjectAnswer")String subjectAnswer,
                                       @RequestParam("subjectParse")String subjectParse){
        System.out.println("那答案能出来吗？"+subjectAnswer);
        System.out.println("解析去哪了？"+subjectParse);
        ModelAndView mv = new ModelAndView();
        subjectService.updateSubject(subjectId,subjectTitle,subjectOptionA,subjectOptionB,subjectOptionC,subjectOptionD,
                subjectAnswer,subjectParse);
        mv.setViewName("/qiantai/subjectTest/subjectUpdate");
        return mv;
    }

    @RequestMapping("/subDelete")
    public String deleteSubject(@RequestParam("subjectId") Integer subjectId){
        subjectService.deleteSubject(subjectId);
        return "redirect:/sub/allSub";
    }


}

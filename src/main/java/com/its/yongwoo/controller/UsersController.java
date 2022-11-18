package com.its.yongwoo.controller;

import com.its.yongwoo.dto.UsersDTO;
import com.its.yongwoo.service.UsersService;
import com.sun.tools.jdeprscan.scan.Scan;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class UsersController {
    @Autowired
    UsersService usersService;
    SqlSessionTemplate session;

    @GetMapping("/user/save")
    public String saveForm(){
        return "userView/userSave";
    }
    @PostMapping("/user/save")
    public String save(@ModelAttribute UsersDTO usersDTO) {
        usersService.save(usersDTO);

        return "index";
    }
    @GetMapping("/user/login")
    public String loginForm(){
        return "/userView/userLogin";
        }
    @PostMapping("/user/login")
    public String login(@ModelAttribute UsersDTO usersDTO, HttpSession session, Model model){
        UsersDTO loginResult = usersService.login(usersDTO);
        if(loginResult != null){
            session.setAttribute("loginName", loginResult.getUser_name());
            session.setAttribute("loginEmail", loginResult.getUser_email());
            session.setAttribute("loginProfile", loginResult.getStoredProfileName());
            return "index";
        }
        return "/userView/userLogin";
    }
    @GetMapping("/user/info")
    public String info(@RequestParam("email") String email, Model model){
        UsersDTO usersDTO = usersService.findByEmail(email);
        model.addAttribute("users", usersDTO);

        return "/userview/userInfo";
    }




}

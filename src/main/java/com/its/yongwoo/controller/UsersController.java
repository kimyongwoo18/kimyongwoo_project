package com.its.yongwoo.controller;

import com.its.yongwoo.dto.UsersDTO;
import com.its.yongwoo.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UsersController {
    @Autowired
    UsersService usersService;

    @GetMapping("/user/save")
    public String saveForm(){
        return "userView/userSave";
    }
    @PostMapping("/user/save")
    public String save(@ModelAttribute UsersDTO usersDTO){
         usersService.save(usersDTO);

            return "index";


    }


}

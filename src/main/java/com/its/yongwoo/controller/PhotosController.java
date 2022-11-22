package com.its.yongwoo.controller;

import com.its.yongwoo.dto.CameraDTO;
import com.its.yongwoo.dto.PhotosDTO;
import com.its.yongwoo.dto.UsersDTO;
import com.its.yongwoo.service.CameraService;
import com.its.yongwoo.service.PhotosService;
import com.its.yongwoo.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class PhotosController {
    @Autowired
    public PhotosService photosService;
    @Autowired
    public CameraService cameraService;
    @Autowired
    public UsersService usersService;
    @GetMapping("/photo/save")
    public String saveForm() {
        return "photoView/photoSave";
    }


    @PostMapping("/photo/save")
    public String save(@ModelAttribute PhotosDTO photosDTO, @ModelAttribute CameraDTO cameraDTO, @RequestParam("email") String email) {
       UsersDTO usersDTO = usersService.findByEmail(email);
       /*세션 아이디를 이용해서 계정의 Id값 가져와서 업로드하는 사진과 join시킨다.*/
       photosDTO.setUser_id(usersDTO.getId());
        photosService.save(photosDTO);

        cameraService.save(cameraDTO);

        return "/userView/userInfo";
    }
}

package com.its.yongwoo.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
public class UsersDTO {

    private Long id;
    private String user_email;
    private String user_name;
    private String user_password;
    private MultipartFile user_profile;
    private String user_intro;
    private String uploadProfileName;
    private String storedProfileName;

}

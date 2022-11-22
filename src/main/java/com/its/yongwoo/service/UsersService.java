package com.its.yongwoo.service;

import com.its.yongwoo.dto.UsersDTO;

import com.its.yongwoo.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class UsersService {
    @Autowired
    UsersRepository usersRepository;
    public void save(UsersDTO usersDTO) {
        if(!usersDTO.getUser_profile().isEmpty()){
            // 1. 업로드된 파일을 userProfile변수에 담는다.
            MultipartFile userProfile = usersDTO.getUser_profile();
            // 2. 업로드된 파일의 original이름을 변수에 담는다.
            String uploadProfileName = userProfile.getOriginalFilename();
            // 3. 업로드된 파일의 이름에 시간값 넣어서 storedProfileName 변수에 저장한다.
            String storedProfileName = System.currentTimeMillis() + "-" +uploadProfileName;
            // 4. usersDTO에 저장된 이름들을 setter를 이용하여 담는다.
            usersDTO.setUploadProfileName(uploadProfileName);
            usersDTO.setStoredProfileName(storedProfileName);
            // 5. 저장할 경로 지정
            String savePath = "D://project_img/" + storedProfileName;
            // 6. 지정된 경로로 파일 저장 만약 저장에 실패하면 기본프로필로 저장.
            try {
                userProfile.transferTo(new File(savePath));
            } catch (IOException e) {
                usersDTO.setStoredProfileName("indexProfile");
            }
            usersRepository.save(usersDTO);

        }else{
            //7. 프로필 사진 안넣어도 기본프로필로 저장.
            usersDTO.setStoredProfileName("indexProfile.jpg");
            usersRepository.save(usersDTO);
        }
    }

    public UsersDTO login(UsersDTO usersDTO) {
        UsersDTO result = usersRepository.login(usersDTO);
        return result;
    }

    public UsersDTO findByEmail(String user_email) {
        return usersRepository.findByEmail(user_email);
    }
}

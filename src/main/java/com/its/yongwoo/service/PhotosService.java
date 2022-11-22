package com.its.yongwoo.service;


import com.its.yongwoo.dto.PhotosDTO;
import com.its.yongwoo.dto.CameraDTO;
import com.its.yongwoo.dto.Photo_infoDTO;
import com.its.yongwoo.repository.PhotosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class PhotosService {
@Autowired
    PhotosRepository photosRepository;
    public void save(PhotosDTO photosDTO) {
        /*오리지날 파일네임 스토어드파일네임 저장해야하고; 업로드시간도 저장해야함.
        * 여기에서 메타데이터를 같이 저장한다. iso,shutterSpeed,iris,focal-length 이런것들..
        * */
            // 1. 업로드된 파일을 userProfile변수에 담는다.
            MultipartFile userPhotos = photosDTO.getPhotos();
            // 2. 업로드된 파일의 original이름을 변수에 담는다.
            String uploadProfileName = userPhotos.getOriginalFilename();
            // 3. 업로드된 파일의 이름에 시간값 넣어서 storedProfileName 변수에 저장한다.
            String storedProfileName = System.currentTimeMillis() + "-" + uploadProfileName;
            // 4. usersDTO에 저장된 이름들을 setter를 이용하여 담는다.
            photosDTO.setUploadProfileName(uploadProfileName);
            photosDTO.setStoredProfileName(storedProfileName);
            // 5. 저장할 경로 지정
            String savePath = "D://project_img/" + storedProfileName;
            photosRepository.save(photosDTO);

    }
}


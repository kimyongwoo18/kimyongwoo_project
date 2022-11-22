package com.its.yongwoo.service;

import com.its.yongwoo.dto.CameraDTO;
import com.its.yongwoo.repository.CameraRepository;
import com.its.yongwoo.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CameraService {
    @Autowired
    CameraRepository cameraRepository;
    @Autowired
    UsersRepository usersRepository;
    public void save(CameraDTO cameraDTO){

        cameraRepository.save(cameraDTO);
    }
}

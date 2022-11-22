package com.its.yongwoo.repository;

import com.its.yongwoo.dto.CameraDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CameraRepository {
@Autowired
    SqlSessionTemplate sql;

    public void save(CameraDTO cameraDTO) {
        sql.insert("user,save", cameraDTO);
    }
}

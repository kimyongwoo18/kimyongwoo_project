package com.its.yongwoo.repository;

import com.its.yongwoo.dto.PhotosDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PhotosRepository {
    @Autowired
    SqlSessionTemplate sql;

    public void save(PhotosDTO photosDTO) {
    sql.insert("user,save", photosDTO);
    }
}

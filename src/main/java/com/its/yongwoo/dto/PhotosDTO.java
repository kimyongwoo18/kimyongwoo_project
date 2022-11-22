package com.its.yongwoo.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
@Getter
@Setter
@ToString
public class PhotosDTO {

    private Long id;
    private Long user_id;
    private String photo_title;
    private String photo_contents;
    private MultipartFile photos;
    private String uploadProfileName;
    private String storedProfileName;
    private int total_like = 0;
    private int hits = 0;
    private Timestamp created_at;
    private Timestamp deleted_at;


}

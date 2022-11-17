package com.its.yongwoo.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;
@Getter
@Setter
@ToString
public class PhotosDTO {

    private Long id;
    private Long user_id;
    private String photo_title;
    private String photo_contents;
    private String photo_path;
    private int total_like;
    private int hits;
    private Timestamp created_at;
    private Timestamp deleted_at;


}

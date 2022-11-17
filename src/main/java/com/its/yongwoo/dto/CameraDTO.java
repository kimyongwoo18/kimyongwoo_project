package com.its.yongwoo.dto;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString

public class CameraDTO {
    private Long id;
    private String camera_model;
    private String camera_brand;
    private String camera_lens;
    private Long photos_id;

}


package com.its.yongwoo.dto;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
public class CameraDTO {
    private Long id;
    private String camera_model;
    private String camera_brand;
    private Long photos_id;

}


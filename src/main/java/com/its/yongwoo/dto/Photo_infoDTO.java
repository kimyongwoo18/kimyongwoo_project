package com.its.yongwoo.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Photo_infoDTO {
    private Long id;
    private Long photos_id;
    private String shutterSpeed;
    private String focal_length;
    private String iso;
    private String iris;

}

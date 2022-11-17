package com.its.yongwoo.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Photos_likeDTO {
    private Long id;
    private Long user_id;
    private Long photo_id;
    private int like_check;
}

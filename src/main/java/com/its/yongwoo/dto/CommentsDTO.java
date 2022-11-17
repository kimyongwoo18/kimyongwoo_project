package com.its.yongwoo.dto;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Time;
import java.sql.Timestamp;

@Setter
@Getter
@ToString
public class CommentsDTO {
    private Long id;
    private Long photo_id;
    private Long user_id;
    private Long bundle_id;
    private Long bundle_order;
    private int depth;
    private int is_deleted;
    private String nickname;
    private Timestamp created_at;
    private Timestamp deleted_at;
    private Timestamp updated_at;
    private String comment_contents;
}

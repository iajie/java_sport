package com.ajie.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @CreateAuthor ajie
 * @createTime 2022/3/3 20:54
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class WxRun {

    private String openid;

    private String time;

    private Integer step;

}

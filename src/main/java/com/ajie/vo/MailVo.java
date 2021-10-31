package com.ajie.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * 邮件对象
 * @author ajie
 * @createTime 2021年09月16日 22:06:00
 */
@Data
@ApiModel(value = "邮件发送内容")
public class MailVo implements Serializable {

    @ApiModelProperty(value = "是否是HTML格式")
    private boolean html = false;

    @ApiModelProperty(value = "接收人(可以多个)")
    private String[] receivers;

    @ApiModelProperty(value = "邮件主题")
    private String subject;

    @ApiModelProperty(value = "邮件内容")
    private String content;

}

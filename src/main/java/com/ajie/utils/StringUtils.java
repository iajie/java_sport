package com.ajie.utils;

/**
 * 字符串判断
 * @author ajie
 * @createTime 2021年08月15日 16:16:00
 */
public class StringUtils {
    /**
     * 字符串判断
     * @param str
     * @return
     */
    public static boolean isNotEmpty(String str) {
        return str != null && !"".equals(str);
    }
}

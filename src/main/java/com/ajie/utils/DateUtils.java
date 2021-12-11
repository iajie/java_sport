package com.ajie.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间工具类
 * @Author 阿杰
 * @create 2021-12-09 21:35
 */
public class DateUtils {

    private static final String YYYY_MM_DD = "yyyy-MM-dd";

    private static final String YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";

    /**
     * 返回当前时间字符串 年月日
     * @return
     */
    public static String getDate() {
        SimpleDateFormat format = new SimpleDateFormat(YYYY_MM_DD);
        return format.format(new Date());
    }

    /**
     * 返回当前时间字符串 年月日时分秒
     * @return
     */
    public static String getDateTime() {
        SimpleDateFormat format = new SimpleDateFormat(YYYY_MM_DD_HH_MM_SS);
        return format.format(new Date());
    }

    /**
     * 将时间字符串转换为时间对象
     * @param time
     * @return
     */
    public static Date formatDate(String time) {
        SimpleDateFormat format = new SimpleDateFormat();
        try {
            return format.parse(time);
        } catch (ParseException e) {
            return null;
        }
    }

}

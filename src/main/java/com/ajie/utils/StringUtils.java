package com.ajie.utils;

import java.util.Collection;
import java.util.Map;

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

    /**
     * 字符串判断
     * @param str
     * @return
     */
    public static boolean isEmpty(String str) {
        return str == null || "".equals(str);
    }

    /**
     * 集合判断
     * @param collection
     * @return
     */
    public static boolean isNotEmpty(Map collection) {
        return collection != null && collection.size() > 0;
    }

    /**
     * 集合判断
     * @param collection
     * @return
     */
    public static boolean isEmpty(Map collection) {
        return collection == null || collection.size() < 1;
    }

    /**
     * 集合判断
     * @param collection
     * @return
     */
    public static boolean isNotEmpty(Collection collection) {
        return collection != null && collection.size() > 0;
    }

    /**
     * 集合判断
     * @param collection
     * @return
     */
    public static boolean isEmpty(Collection collection) {
        return collection == null || collection.size() < 1;
    }

    /**
     * 对象判断
     * @param obj
     * @return
     */
    public static boolean isNotEmpty(Object obj) {
        return obj != null;
    }

    /**
     * 对象判断
     * @param obj
     * @return
     */
    public static boolean isEmpty(Object obj) {
        return obj == null;
    }


}

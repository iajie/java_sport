package com.ajie;

import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import com.ajie.entity.Food1;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author 阿杰
 * @create 2021-10-31 16:08
 */
public class Test {

    /**
     * 读取excel
     * @param file 导入的文件流
     * @param model 生成的类
     * @param <T>
     * @return 对象数组
     */
    /*public static<T> List<T> readExcel(InputStream file, Class<T> model) {
        List<T> list = new ArrayList<>();
        EasyExcel
                //读取的文件
                .read(file)
                //反射获取类型
                .head(model)
                //excel类型
                .excelType(ExcelTypeEnum.XLSX)
                //读取的excel左下角的名字
                .sheet(0)
                //注册监听器
                .registerReadListener(new AnalysisEventListener<T>() {
                    @Override
                    public void invoke(T t, AnalysisContext analysisContext) {
                        list.add(t);
                    }

                    @Override
                    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
                        System.out.println("读取完毕" + model);
                    }
                }).doRead();
        return list;
    }*/

    public static void main(String[] args) throws FileNotFoundException {
        /*long start = System.currentTimeMillis();
        List<Food2> food2s = readExcel(new FileInputStream(new File("D:\\Java-code\\sport\\excel\\food.xlsx")), Food2.class);
        long end = System.currentTimeMillis();
        food2s.forEach(System.out::println);
        System.err.println("读取：" + food2s.size() + "条");
        System.err.println("读取耗时：" + (end-start) / 1000 + "s");*/

        ImportParams params = new ImportParams();
        params.setTitleRows(1);
        params.setHeadRows(1);
        long start2 = System.currentTimeMillis();
        List<Food1> list = ExcelImportUtil.importExcel(new File("D:\\Java-code\\sport\\excel\\food.xlsx"), Food1.class, params);
        list.forEach(System.out::println);
        System.err.println("读取：" + list.size() + "条");
        System.err.println("easypoi读取耗时：" + (System.currentTimeMillis()-start2) / 1000 + "s");
    }

}

package com.ajie.controller;

import com.ajie.entity.SysUser;
import com.ajie.entity.WxRun;
import com.ajie.service.SportService;
import com.ajie.service.SysUserService;
import com.ajie.utils.DateUtils;
import com.ajie.utils.DecryptDataUtils;
import com.ajie.utils.Result;
import com.ajie.utils.StringUtils;
import com.ajie.vo.Encrypted;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 小程序接口
 * @Author 阿杰
 * @create 2021-12-11 22:24
 */
@Slf4j
@RestController
@RequestMapping("/mini")
@Api(tags = "小程序相关接口")
public class MiniController {

    @Value("${mini.appid}")
    private String appid;

    @Value("${mini.secret}")
    private String secret;

    @Autowired
    private SysUserService userService;

    @Autowired
    private SportService sportService;

    @ApiOperation(value = "微信小程序登录")
    @GetMapping("/login")
    public Result login(String code) throws IOException {
        if (StringUtils.isEmpty(code)) {
            return Result.fail("登录失败, 请联系管理员！");
        }
        // 创建一个client请求
        CloseableHttpClient client = HttpClientBuilder.create().build();
        // 构建get请求
        String url = "https://api.weixin.qq.com/sns/jscode2session?" + "appid=" +
                appid +
                "&secret=" +
                secret +
                "&js_code=" +
                code +
                "&grant_type=authorization_code";
        HttpGet get = new HttpGet(url);
        // 发送请求
        CloseableHttpResponse response = client.execute(get);
        log.info("请求响应码: {}", response.getStatusLine().getStatusCode());
        String result = EntityUtils.toString(response.getEntity());
        log.info("请求响应结果: --> {}", result);
        JSONObject jsonObject = JSON.parseObject(result);
        String openid = jsonObject.getString("openid");
        String sessionKey = jsonObject.getString("session_key");
        log.info("微信小程序唯一标识：{}", openid);
        return userService.miniLogin(openid, sessionKey);
    }

    @ApiOperation(value = "更新用户信息")
    @PostMapping("/update/info")
    public Result updateInfo(@RequestBody SysUser user) {
        return userService.updateByopenId(user);
    }

    @PostMapping("/wxrun")
    public Result getRunStep(@RequestBody Encrypted encrypted) {
        String data = DecryptDataUtils.decryptData(encrypted.getEncryptedData(), encrypted.getSessionKey(), encrypted.getIv());
        log.info("加密数据--> {}", data);
        JSONObject result = JSONObject.parseObject(data);
        JSONArray stepInfoList = result.getJSONArray("stepInfoList");
        List<WxRun> runs = new ArrayList<>();
        for (Object o : stepInfoList) {
            JSONObject obj = (JSONObject)o;
            Long timestamp = obj.getLong("timestamp");
            WxRun step = new WxRun(encrypted.getOpenid(), DateUtils.timeStampConvertString(timestamp), obj.getInteger("step"));
            runs.add(step);
        }
        return sportService.insertStep(runs);
    }

    @GetMapping("/step/report")
    public Result stepReport() {
        return sportService.stepReport();
    }

}

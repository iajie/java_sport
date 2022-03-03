import Vue from 'vue';
import axios from 'axios';
import { Message } from 'element-ui';
import router from '@/router';

/**
 * 创建ajax实例
 * 并设置请求超时时间
 */
const ajax = axios.create({
    baseURL: process.env.VUE_APP_BASE_URL,
    timeout: 100000
});

/**
 * 请求拦截器
 */
ajax.interceptors.request.use((config) => {
    const token = sessionStorage.getItem('token');
    if (token) {
        //给请求头加上token
        config.headers['Authorization'] = token;
    }
    return config;
}, (err) => {
    console.log('请求异常', err);
});


/**
 * 响应拦截器
 * 即后端响应的信息
 */
ajax.interceptors.response.use((res) => {
    if (!res.data.flag) {
        Message.error(res.data.message);
    }
    return res;
}, (err) => {
    // 三个等号： 绝对等于 0=0 0!='0'  双等号： 0=0 0='0'
    if (err.response.status === 400) {
        Message.error(err.response.data.message);
    } else if (err.response.status === 401) {
        Message.error('您未登录, 请登录后操作！');
        sessionStorage.clear();
        //跳转到登录
        router.replace('/login');
    } else if (err.response.status === 403) {
        Message.error(err.response.data.message);
    } else if (err.response.status === 404) {
        Message.error('后端接口未找到！');
    } else if (err.response.status === 405) {
        Message.warning('请求方法错误-->后端需要"' + err.response.headers.allow + '"请求');
    } else if (err.response.status === 500) {
        Message.error('后端异常-->' + err.response.data.message);
    } else {
        Message.error('未知错误！');
    }
});

Vue.prototype.$ajax = ajax;

//暴露ajax
export default ajax;
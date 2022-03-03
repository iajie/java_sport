import Vue from 'vue';
import store from '@/store';

/**
 * directive自定义指令的方法
 * 第一个参数是指令
 * 第二个实现方法
 */
Vue.directive('hasRole', {
    inserted(el, binding) {
        //获取指令传递过来的数据
        const { value } = binding;
        //获取vuex中的角色信息
        const roles = store.state.roles;
        //定义超级管理员可以查看所有
        const admin = 'SUPER_ADMIN';
        //判断指令是否传值 传递的值是否是一个数组 数组是否大于0
        if (value && value instanceof Array && value.length > 0) {
            /**
             * some:用于检测数组中的元素是否满足指定的条件，并不会改变原来的数组 返回true/flase
             */
            const hasRole = roles.some(item => {   
                /**
                 * includes: 用于判断字符串是否包涵某个指定的子字符串
                 */
                return item.code === admin || value.includes(item.code);
            });
            //如果没有该角色
            if (!hasRole) {
                //把对应的元素给删掉
                el.parentNode.removeChild(el);
            }
        } else {
            throw new Error(`请设置${value}对应角色标签`);
        }
    }
});

/**
 * 自定义权限指令
 */
Vue.directive('hasPermi', {
    inserted(el, binding) {
        const { value } = binding;
        //获取权限数据
        const permissions = store.state.permissions;
        //获取vuex中的角色信息
        const roles = store.state.roles;
        //定义超级管理员可以查看所有
        const admin = 'SUPER_ADMIN';
        //判断值是否存在 是否属于数组 是否大于0
        if (value && value instanceof Array && value.length > 0) {
            const hasPermi = permissions.some(item => {
                return value.includes(item.code);
            });
            const hasRole = roles.some(item => {
                return item.code === admin;
            });
            if (!hasPermi && !hasRole) {
                el.parentNode.removeChild(el);
            }
        } else {
            throw new Error(`请设置${value}对应的权限标签`)
        }
    }
});
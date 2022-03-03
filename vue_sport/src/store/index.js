import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
    state: {
        token: sessionStorage.getItem('token') || '',
        name: sessionStorage.getItem('name') || '',
        avatar: sessionStorage.getItem('avatar') || '',
        roles: [],
        menus: [],
        permissions: [],
    },
    mutations: {
        setToken(state, data) {
            state.token = data;
            sessionStorage.setItem('token', data);
        },
        setName(state, data) {
            state.name = data;
        },
        setAvatar(state, data) {
            state.avatar = data;
        },
        /**
         * 向vuex中存入角色信息
         * @param {*} state 
         * @param {*} data 
         */
        setRoles(state, data) {
            state.roles = data;
        },
        /**
         * 向vuex存菜单信息
         * @param {*} state 
         * @param {*} data 
         */
        setMenus(state, data) {
            state.menus = data;
        },
        /**
         * 存入权限数据：限制用户的操作
         * @param {*} state 
         * @param {*} data 
         */
        setPermissions(state, data) {
            state.permissions = data;
        },
    },
    actions: {},
    modules: {},
});

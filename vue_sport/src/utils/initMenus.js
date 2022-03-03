import Home from '@/views/Home';

/**
 * 格式化菜单，将菜单转换为组件
 * @param {Array} menus 传入菜单信息
 */
export const formatMenu = (menus) => {
    /**
     * 迭代菜单，并对菜单进行改造 返回格式化后的菜单
     * filter 创建一个新的数组，新数组中的元素通过指定数组符合的条件进行返回
     * let arr = [];
     * menus.forEach(item => { 条件... arr.push({}) });
     * return arr;
     */
    const route = menus.filter(item => {
        item.component = (item.component === 'home') ? Home : loadView(item.component);
        item.icon = item.icon;
        item.meta = {
            title: item.title
        };
        //处理子菜单
        if (item.children && item.children.length > 0) {
            formatMenu(item.children);
        }
        return true;
    });
    //将格式化后的菜单进行返回
    return route;
}

/**
 * 路由懒加载
 * @param {string} view 组件路径
 * @returns 返回路由组件
 */
const loadView = (view) => {
    return (resolve) => require([`@/views/${view}.vue`], resolve);
}

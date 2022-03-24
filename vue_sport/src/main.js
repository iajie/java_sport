import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import '@/utils/ajax';
//引入饿了么UI
import '@/utils/elementui';
// 引入全局样式
import '@/assets/global.css';
// 引入自定义指令
import '@/utils/permission';
// 图标库组件
import '@/utils/icons';
// 引入markdown
import '@/utils/markdown';
// 引入高亮
import '@/utils/highlight';
// 引入搜索组件
import Search from '@/compoent/Search';

Vue.prototype.$qiniu = 'http://xxx.xxx.com/';

Vue.component('search', Search);
Vue.config.productionTip = false;
// 是否在浏览器上开启vue调试工具
Vue.config.devtools = false;

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");

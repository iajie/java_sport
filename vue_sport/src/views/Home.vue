<template>
	<!-- 主容器 -->
	<el-container class="main-class">
		<!-- 头部信息 -->
		<el-header>
			<el-row style="height: 100%">
				<!-- 头像 -->
				<el-col :span="2" style="height: 100%">
					<el-avatar :size="60" :src="avatar.startsWith('https') ? avatar : this.$qiniu + avatar "/>
				</el-col>
				<!-- 项目名称 -->
				<el-col :span="15" class="title">
					个人运动管理平台<span>——管理员({{ name }})</span>
				</el-col>
				<!-- 退出按钮 -->
				<el-col :span="7" class="logout">
					<el-button type="info" @click="logout">退出登录</el-button>
				</el-col>
			</el-row>
		</el-header>
		<!-- 主体容器 -->
		<el-container>
			<!-- 侧边栏 -->
			<el-aside :width="menuActive ? '200px' : '60px'">
				<div class="menu-button" @click="menuActive = !menuActive">
					<i class="el-icon-s-fold"></i>
				</div>
                <!-- 菜单列表 unique-opened只展开一个子菜单 router让菜单为路由模式 会让菜单index属性为path进行跳转 -->
				<el-menu
					:default-active="activePath"
					class="el-menu-vertical-demo"
					background-color="#545c64"
					text-color="#fff"
                    active-text-color="#ffd04b"
                    unique-opened
                    router
					:collapse="!menuActive">
                    <!-- 一级菜单 -->
					<el-submenu :index="index + ''" v-for="(parentMenu, index) in menus" :key="index">
                        <template slot="title">
                            <i :class="parentMenu.icon" style="margin-right: 5px;"/>
                            <span>{{ parentMenu.title }}</span>
                        </template>
                        <el-menu-item :index="childrenMenu.path" v-for="(childrenMenu, i) in parentMenu.children" :key="i" @click="savePath(childrenMenu.path)">
                            <template slot="title">
                                <i :class="childrenMenu.icon" style="margin-right: 5px;"/>
                                <span>{{ childrenMenu.title }}</span>
                            </template>
                        </el-menu-item>
                    </el-submenu>
                </el-menu>
			</el-aside>
			<!-- 主体 -->
			<el-main>
				<el-breadcrumb separator-class="el-icon-arrow-right">
					<el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
					<el-breadcrumb-item v-for="(item, index) in $router.currentRoute.matched" :key="index">{{ item.meta.title }}</el-breadcrumb-item>
				</el-breadcrumb>
				<span v-show="$router.currentRoute.path === '/'" class="main-title">欢迎来到个人运动管理平台！</span>
                <!-- 作为主体的子路由 -->
                <router-view/>
			</el-main>
		</el-container>
	</el-container>
</template>

<script>
import { mapState } from 'vuex';

export default {
    //vue计算属性
    computed: {
        ...mapState(['name', 'avatar', 'menus'])
    },
	data() {
		return {
            // 是否展开菜单
			menuActive: true,
            // 激活的菜单
            activePath: sessionStorage.getItem('activePath'),
		}
	},
    methods: {
        /** 退出登录 */
        logout() {
            this.$confirm('您将退出系统, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                //调后端退出接口
                this.$ajax.get('/user/logout').then((res) => {
                    //清空本地缓存
                    sessionStorage.clear();
                    //跳转到登录页面
                    this.$router.replace('/login');
                    this.$message.success(res.data.message);
                    window.location.reload();
                });
            }).catch(() => {});
        },
        /** 保存被激活的链接 */
        savePath(path) {
            sessionStorage.setItem('activePath', path);
            this.activePath = path;
        }
    }
}
</script>

<style scoped>
/* scoped受保护的样式，当前style标签下的样式只在当前组件生效，其他组件无法使用，避免样式污染  */
.el-header {
	background-color: #B3C0D1;
	color: #333;
	text-align: center;
	line-height: 60px;
}

.el-aside {
	background-color: #545c64;
}

.el-main {
	background-color: #E9EEF3;
	color: #333;
	text-align: center;
}
/* 主容器样式 */
.main-class {
	height: 100%;
}

.title {
	text-align: left;
	font-size: 25px;
	font-family: 华文行楷;
}

.logout {
	text-align: right;
}

.menu-button {
	font-size: 20px; 
	background-color: #2e363f; 
	color: #fff;
	cursor: pointer;
}

.main-title {
	font-size: 50px;
	font-family: 华文行楷;
	color: sandybrown;
}

.el-submenu .el-menu-item {
    padding: 0;
}
</style>>
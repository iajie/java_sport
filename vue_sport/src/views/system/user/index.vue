<template>
    <div>
        <el-card class="main-card">
            <!--
                v-if 判断true/false 直接删除docment 造成性能问题 对标签元素进行删除和展示
                v-show 判断true/false 不管是否存在 元素都存在 只是加了dispaly属性
                应用场景： 经常对元素进行展示的，用v-show 反之v-if
             -->
            <div v-show="!open">
                <el-row>
                    <el-col :span="8">
                        <search :value="queryInfo.queryString" @search="querySearch"/>
                    </el-col>
                    <el-col :span="2">
                        <el-button style="margin-left: 10px;" @click="insert" v-hasPermi="['PRE_USER_INSERT']" type="primary">添加信息</el-button>
                    </el-col>
                </el-row>
                <el-table
                    :data="tableList"
                    stripe
                    v-loading="loading"
                    element-loading-spinner="el-icon-loading">
                    <el-table-column type="index" label="序号"/>
                    <el-table-column prop="name" label="用户名"/>
                    <el-table-column prop="sex" label="性别" :formatter="formatSex"/>
                    <el-table-column label="头像">
                        <template slot-scope="scope">
                            <el-image
                                style="width: 100px; height: 100px"
                                :src="scope.row.avatar.startsWith('https') ? scope.row.avatar : $qiniu + scope.row.avatar"
                                :preview-src-list="preview(scope.row.avatar)">
                            </el-image>
                        </template>
                    </el-table-column>
                    <el-table-column label="角色标签">
                        <template slot-scope="scope">
                            <el-tag size="mini" v-for="(item, index) in scope.row.roles" :key="index">{{ item.label }}</el-tag>
                        </template>
                    </el-table-column>
                    <el-table-column prop="email" label="邮箱"/>
                    <el-table-column prop="phoneNumber" label="电话号码"/>
                    <el-table-column prop="address" label="地址" show-overflow-tooltip/>
                    <el-table-column fixed="right" label="操作" width="150">
                        <template slot-scope="scope">
                            <el-button type="primary" @click="update(scope.row)" v-hasPermi="['USER_UPDATE']" size="small" icon="el-icon-edit" circle/>
                            <el-button type="danger" @click="deleteById(scope.row)" v-hasPermi="['USER_DELETE']" size="small" icon="el-icon-delete" circle/>
                        </template>
                    </el-table-column>
                </el-table>
                <el-pagination
                    v-if="total > 0"
                    @size-change="handlePageSize"
                    @current-change="handlePageNumber"
                    :current-page="queryInfo.pageNumber"
                    :page-sizes="[7, 15, 50, 100]"
                    :page-size="queryInfo.pageSize"
                    layout="total, sizes, prev, pager, next, jumper"
                    :total="total"/>
            </div>

            <handle v-show="open" :title="title" @cancel="cancel" :form="form"/>

        </el-card>
    </div>
</template>

<script>
import handle from './handle.vue';
export default {
    /** 注册组件 */
    components: {
        handle
    },
    data() {
        return {
            // 分页查询条件
            queryInfo: {
                // 页码
                pageNumber: 1,
                // 页数
                pageSize: 7,
                // 关键字
                queryString: null
            },
            // 表格数据
            tableList: [],
            // 总记录数
            total: 0,
            // 表单标题
            title: null,
            // 是否打开对话框
            open: false,
            // 表格加载
            loading: false,
            // 表单数据
            form: {},
        }
    },
    created() {
        this.findPage();
    },
    methods: {
        /** 分页查询 */
        findPage() {
            this.loading = true;
            this.$ajax.post('/user/findPage', this.queryInfo).then((res) => {
                this.loading = false;
                this.tableList = res.rows;
                this.total = res.total;
            });
        },
        querySearch(value) {
            this.queryInfo.queryString = value;
            this.findPage();
        },
        /** 页码改变事件 */
        handlePageNumber(newPageNumber) {
            // 将分页的新数据赋值给分页参数
            this.queryInfo.pageNumber = newPageNumber;
            // 调分页的方法
            this.findPage();
        },
        /** 页数改变的事件 */
        handlePageSize(newPageSize) {
            this.queryInfo.pageSize = newPageSize;
            this.findPage();
        },
        insert() {
            this.open = true;
            this.form = {};
            this.title = '添加用户';
        },
        /** 头像预览 */
        preview(src) {
            let arr = [];
            arr.push(src.startsWith('https') ? src : this.$qiniu + src);
            return arr;
        },
        /** 性别格式化 */
        formatSex(row) {
            if (row.sex === 0) {
                return '男';
            } else if (row.sex === 1) {
                return '女';
            } else {
                return '未知';
            }
        },
        /** 删除用户信息 */
        deleteById(row) {
            if (row.admin) return this.$message.warning('管理员角色不能操作！');
            this.$confirm('您将操作将永久删除编号为{' + row.id +'} 的数据, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                //调后端删除用户接口
                this.$ajax.delete(`/user/delete/${row.id}`).then((res) => {
                    this.$message.success(res.message);
                    this.queryInfo.pageNumber = 1;
                    this.findPage();
                });
            });
        },
        /** 用户点击取消 */
        cancel() {
            this.open = false;
            this.findPage();
        },
        /** 点击编辑按钮 */
        update(row) {
            this.form = row;
            this.title = '修改用户';
            this.open = true;
        }
    }
}
</script>

<style scoped>

</style>

<template>
    <div>
        <el-card>
            <el-row>
                <el-col :span="8">
                    <el-input placeholder="请输入内容" clearable v-model="queryInfo.queryString" @clear="findPage">
                        <el-button slot="append" icon="el-icon-search" @click="findPage"/>
                    </el-input>
                </el-col>
                <el-col :span="2">
                    <el-button style="margin-left: 10px;" v-hasPermi="['MENU_INSERT']" @click="insert" type="primary">添加信息</el-button>
                </el-col>
            </el-row>
            <el-table :data="tableList" stripe :tree-props="{children: 'children', hasChildren: 'hasChildren'}" row-key="id" v-loading="loading" element-loading-spinner="el-icon-loading">
                <el-table-column prop="path" label="前端路由"/>
                <el-table-column prop="icon" label="图标"/>
                <el-table-column prop="title" label="标题"/>
                <el-table-column prop="component" label="前端组件"/>
                <el-table-column label="是否启用" v-hasPermi="['MENU_UPDATE']">
                    <template slot-scope="scope">
                        <el-switch
                            @change="updateStatus(scope.row)"
                            v-model="scope.row.status"/>
                    </template>
                </el-table-column>
                <el-table-column fixed="right" label="操作" width="150">
                    <template slot-scope="scope">
                        <el-button type="primary" @click="update(scope.row)" v-hasPermi="['MENU_UPDATE']" size="small" icon="el-icon-edit" circle/>
                        <el-button type="danger" @click="deleteById(scope.row.id)" v-hasPermi="['MENU_DELETE']" size="small" icon="el-icon-delete" circle/>
                    </template>
                </el-table-column>
            </el-table>
            <el-pagination
                @size-change="handlePageSize"
                @current-change="handlePageNumber"
                :current-page="queryInfo.pageNumber"
                :page-sizes="[7, 15, 50, 100]"
                v-if="total > 0"
                :page-size="queryInfo.pageSize"
                layout="total, sizes, prev, pager, next, jumper"
                :total="total"/>
        </el-card>
        <!-- 表单添加/修改 -->
        <el-dialog :title="title" :visible.sync="open" width="40%" @close="dialogClose">
            <el-form :model="form" ref="form" :rules="rules" label-position="right" label-width="120px">
                <el-form-item label="是否是父级菜单" v-if="isChildrenMenu">
                    <el-checkbox style="margin-left: -90%" v-model="isChildrenMenu" :disabled="disMenuSelect"/>
                </el-form-item>
                <el-form-item label="父级菜单" prop="parentId" v-if="isChildrenMenu">
                    <el-select v-model="form.parentId" placeholder="请选择" style="width: 100%">
                        <el-option
                            v-for="(item, index) in parentList"
                            :key="index"
                            :label="item.title"
                            :value="item.id"
                            :disabled="!item.status"/>
                    </el-select>
                </el-form-item>
                <el-form-item label="前端路径" prop="path">
                    <el-input v-model="form.path"/>
                </el-form-item>
                <el-form-item label="图标" prop="icon">
                    <e-icon-picker v-model="form.icon"/>
                </el-form-item>
                <el-form-item label="标题" prop="title">
                    <el-input v-model="form.title"/>
                </el-form-item>
                <el-form-item label="前端组件" prop="component">
                    <el-input v-model="form.component"/>
                </el-form-item>
                <el-form-item label="是否启用" prop="status">
                    <el-radio-group v-model="form.status" class="status-calss">
                        <el-radio :label="true">是</el-radio>
                        <el-radio :label="false">否</el-radio>
                    </el-radio-group>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="clickCancel">取 消</el-button>
                <el-button type="primary" @click="clickOk">确 定</el-button>
            </div>
        </el-dialog>
    </div>
</template>

<script>
export default {
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
            loading: false,
            // 表单数据
            form: {
                status: true,
            },
            // 表单校验
            rules: {
                parentId: [
                    {
                        required: true,
                        //自定义表单校验
                        message: '请选择父级菜单',
                        trigger: 'change'
                    }
                ],
                path: [
                    { required: true, message: '请输入菜单路径', trigger: 'blur' },
                    { min: 1, max: 100, message: '菜单路径的长度为1~100', trigger: 'blur' }
                ],
                icon: [
                    { required: true, message: '请选择菜单图标', trigger: 'change' },
                ],
                title: [
                    { required: true, message: '请输入菜单标题', trigger: 'blur' },
                    { min: 1, max: 50, message: '菜单标题的长度为1~50', trigger: 'blur' }
                ],
                component: [
                    { required: true, message: '请输入菜单组件路径', trigger: 'blur' },
                    { min: 1, max: 50, message: '菜单路径的长度为1~50', trigger: 'blur' }
                ],
                status: [
                    { required: true, message: '请选择是否启用', trigger: 'change' },
                ],

            },
            // 父级菜单列表
            parentList: [],
            isChildrenMenu: true,
            disMenuSelect: false,
        }
    },
    created() {
        this.findPage();
        this.findParent();
    },
    methods: {
        findParent() {
            this.$ajax.get('/menu/findParent').then((res) => {
                this.parentList = res.data.data;
            });
        },

        /** 分页查询  */
        findPage() {
            this.loading = true;
            this.$ajax.post('/menu/findPage', this.queryInfo).then((res) => {
                this.loading = false;
                this.tableList = res.data.rows;
                this.total = res.data.total;
            });
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
        /** 改变菜单据的状态 */
        updateStatus(row) {
            this.$ajax.put('/menu/update', row).then((res) => {
                this.$message.success('状态更新成功！');
            });
        },
        /** 删除权限信息 */
        deleteById(id) {
            this.$confirm('您将操作将永久删除编号为{' + id +'} 的数据, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                //调后端删除权限接口
                this.$ajax.delete(`/menu/delete/${id}`).then((res) => {
                    this.$message.success(res.data.message);
                    this.queryInfo.pageNumber = 1;
                    this.findPage();
                });
            }).catch(() => {});
        },
        /** 点击新增 */
        insert() {
            this.title = '新增菜单';
            this.open = true;
        },
        /** 点击修改 */
        update(row) {
            this.title = '修改菜单';
            console.log(row);
            if (row.parentId === null) {
                //隐藏父级菜单下拉列表
                this.isChildrenMenu = false;
            } else {
                //禁用菜单级别选择
                this.disMenuSelect = true;
            }
            this.form = row;
            this.open = true;
        },
        /** 关闭对话框的事件 */
        dialogClose() {
            //将整个表单进行重置，并移除校验效果
            this.isChildrenMenu = true;
            this.disMenuSelect = false;
            this.$refs.form.resetFields();
        },
        /** 点击取消 */
        clickCancel() {
            //将整个表单进行重置，并移除校验效果
            this.form = {};
            this.open = false;
            this.isChildrenMenu = true;
            this.disMenuSelect = false;
            this.findPage();
        },
        /** 点击确定 */
        clickOk() {
            // 进行表单校验
            this.$refs.form.validate((valid) => {
                //校验不通过
                if (!valid) return this.$message.error('表单校验不通过，请检查后提交！');
                //校验通过 判断是否是新增
                if (this.form.id === undefined || this.form.id === null) {
                    this.$ajax.post('/menu/insert', this.form).then((res) => {
                        this.$message.success(res.data.message);
                        this.open = false;
                        this.findPage();
                    });
                } else {
                    this.$ajax.put('/menu/update', this.form).then((res) => {
                        this.$message.success(res.data.message);
                        this.open = false;
                        this.findPage();
                    });
                }

            });
        },
    }
}
</script>

<style scoped>
.status-calss {
    margin-left: -75%;
}
</style>

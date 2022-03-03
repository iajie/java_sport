<template>
    <div>
        <el-card>
            <el-row :gutter="25">
                <el-col :span="10">
                    <!-- 搜索添加 -->
                    <el-input placeholder="请输入搜索内容" v-model="queryInfo.queryString" clearable @clear="findPage">
                        <el-button slot="append" icon="el-icon-search" @click="findPage"/>
                    </el-input>
                </el-col>
                <el-col :span="2">
                    <el-button type="primary" @click="addShow">添加分类</el-button>
                </el-col>
            </el-row>
            <!-- 用户列表 -->
            <el-table :data="tableList" border stripe>
                <el-table-column type="index" label="序号" width="100px"/>
                <el-table-column label="分类名称" prop="title"/>
                <el-table-column label="分类图标" prop="icon"/>
                <el-table-column label="操作">
                    <template slot-scope="scope">
                        <!-- 修改 -->
                        <el-button type="primary" icon="el-icon-edit" size="mini" @click="editDialog(scope.row)"/>
                        <el-button type="danger" icon="el-icon-delete" size="mini" @click="deleteById(scope.row)"/>
                    </template>
                </el-table-column>
            </el-table>
            <!-- 分页 -->
            <el-pagination
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
                :current-page="queryInfo.pageNumber"
                :page-sizes="[5, 10, 20, 50]"
                :page-size="queryInfo.pageSize"
                layout="total, sizes, prev, pager, next, jumper"
                :total="total"/>

            <!-- 对话框 -->
            <el-dialog :title="title" v-loading="loading" :visible.sync="open" width="50%" @colse="dialogClosed">
                <el-form :model="dataForm" :rules="rulesDataForm" ref="dataForm" label-width="100px">
                    <el-form-item label="菜品名称" prop="title">
                        <el-input v-model="dataForm.title"/>
                    </el-form-item>
                    <el-form-item label="菜品图标" prop="icon">
                        <el-input v-model="dataForm.icon"/>
                    </el-form-item>
                </el-form>
                <span slot="footer" class="dialog-footer">
                    <el-button @click="clickCancel">取 消</el-button>
                    <el-button type="primary" @click="clickOk">确 定</el-button>
                </span>
            </el-dialog>
        </el-card>
    </div>
</template>

<script>
export default {
    props: ['active'],
    watch: {
        active: {
            handler(val, old) {
                if (val === 0) {
                    this.findPage();
                }
            },
            //初始化侦测
            immediate: true
        }
    },
    data() {
        return {
            queryInfo: {
                queryString: '',
                pageNumber: 1,
                pageSize: 5
            },
            //表格数据库
            tableList: [],
            //总记录数
            total: 0,
            //对话框状态
            open: false,
            //对话框标题
            title: '',
            //表单
            dataForm: {},
            //表格加载
            loading: false,
            rulesDataForm: {
                title: [
                    {required: true, message: "请输入菜品分类名称", trigger: "blur"},
                    {min: 1, max: 50, message: "长度在 1 到 50 个字符", trigger: "blur"},
                ],
                icon: [
                    {required: true, message: "请输入菜品分类图标，用于小程序端展示", trigger: "blur"},
                ]
            },
        }
    },
    created() {
    },
    methods: {
        findPage() {
            this.$ajax.post('/food/type/findPage', this.queryInfo).then((res) => {
                console.log(res);
                if (!res.data.flag) return this.$message.error(res.data.message);
                this.tableList = res.data.data.rows;
                this.total = res.data.data.total;
            });
        },
        handleSizeChange(newPageSize) {
            this.queryInfo.pageSize = newPageSize;
            this.findPage();
        },
        handleCurrentChange(newPageNumber) {
            this.queryInfo.pageNumber = newPageNumber;
            this.findPage();
        },
        addShow() {
            this.dataForm = {};
            this.open = true;
        },
        editDialog(row) {
            this.dataForm = row;
            this.open = true;
        },
        deleteById(row) {
            if (row.foods.length > 0) return this.$message.warning('请先删除该分类下的食物后操作！');
            this.$confirm('此操作将永久删除该食物分类信息, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                //delete请求遵循restful风格
                this.$ajax.delete(`/food/type/delete/${row.id}`).then((res) => {
                    if (!res.data.flag) return this.$message.error(res.data.message);
                    this.$message.success(res.data.message);
                    this.findPage();
                });
            }).catch(() => {
                // 成功删除为confirm 取消为 cancel
                return this.$message.info("操作已取消");
            });
        },
        dialogClosed() {
            //清空表单
            this.$refs.dataForm.resetFields();
        },
        clickCancel() {
            this.dialogClosed();
            this.open = false;
        },
        clickOk() {
            //表单校验
            this.$refs.dataForm.validate((valid) => {
                if (!valid) return this.$message.error('表单校验不通过，请认真填写后提交！');
                this.loading = true;
                //判断是修改还是添加
                if (this.dataForm.id === null || this.dataForm.id === undefined) {
                    //添加
                    this.$ajax.post('/food/type/insert', this.dataForm).then((res) => {
                        if (!res.data.flag) {
                            setTimeout(() => {
                                this.loading = false;
                            }, 6000);
                            return this.$message.error(res.data.message);
                        }
                        this.open = false;
                        this.loading = false;
                        this.$message.success(res.data.message);
                        this.findPage();
                    });
                } else {
                    //修改
                    this.$ajax.post('/food/type/update', this.dataForm).then((res) => {
                        if (!res.data.flag) {
                            setTimeout(() => {
                                this.loading = false;
                            }, 6000);
                            return this.$message.error(res.data.message);
                        }
                        this.open = false;
                        this.loading = false;
                        this.$message.success(res.data.message);
                        this.findPage();
                    });
                }
            });
        }
    }
};
</script>

<style scoped>

</style>

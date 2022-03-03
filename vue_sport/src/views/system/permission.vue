<template>
    <div>
        <el-card class="main-card">
            <el-row>
                <el-col :span="8">
                    <el-input placeholder="请输入内容" clearable v-model="queryInfo.queryString" @clear="findPage">
                        <el-button slot="append" icon="el-icon-search" @click="findPage"/>
                    </el-input>
                </el-col>
                <el-col :span="2">
                    <el-button style="margin-left: 10px;" @click="insert" v-hasPermi="['PRE_INSERT']" type="primary">添加信息</el-button>
                </el-col>
            </el-row>
            <el-table :data="tableList" stripe v-loading="loading" element-loading-spinner="el-icon-loading">
                <el-table-column type="index" label="序号"/>
                <el-table-column prop="label" label="权限标签"/>
                <el-table-column prop="code" label="权限标签值"/>
                <el-table-column label="是否启用" v-hasPermi="['PRE_UPDATE']">
                    <template slot-scope="scope">
                        <el-switch
                            @change="updateStatus(scope.row)"
                            v-model="scope.row.status"/>
                    </template>
                </el-table-column>
                <el-table-column fixed="right" label="操作" width="150">
                    <template slot-scope="scope">
                        <el-button type="primary" @click="update(scope.row)" v-hasPermi="['PRE_UPDATE']" size="small" icon="el-icon-edit" circle/>
                        <el-button type="danger" @click="deleteById(scope.row.id)" v-hasPermi="['PRE_DELETE']" size="small" icon="el-icon-delete" circle/>
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
        </el-card>
        <!-- 表单添加/修改 -->
        <el-dialog :title="title" :visible.sync="open" width="30%" @close="dialogClose">
            <el-form :model="form" ref="form" :rules="rules">
                <el-form-item label="权限标签" prop="label">
                    <el-input v-model="form.label"/>
                </el-form-item>
                <el-form-item label="权限标签值" prop="code">
                    <el-input v-model="form.code"/>
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
            form: {},
            // 表单校验
            rules: {
                label: [
                    { required: true, message: '请输入权限标签', trigger: 'blur' },
                    { min: 1, max: 50, message: '权限标签的长度为1~50之间', trigger: 'blur' }
                ],
                code: [
                    { required: true, message: '请输入权限标签值', trigger: 'blur' },
                    { min: 1, max: 20, message: '权限标签的长度为1~20之间', trigger: 'blur' }
                ],
                status: [
                    { required: true, message: '请选择状态', trigger: 'blur' },
                ],
            }

        }
    },
    /** 页面初始化调用方法  */
    created() {
        this.findPage();
    },
    methods: {
        insert() {
            this.title = '新增权限';
            this.open = true;
        },
        update(row) {
            console.log(row);
            this.form = row;
            this.title = '修改权限';
            this.open = true;
        },
        /** 分页查询  */
        findPage() {
            this.loading = true;
            this.$ajax.post('/permission/findPage', this.queryInfo).then((res) => {
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
        /** 删除权限信息 */
        deleteById(id) {
            this.$confirm('您将操作将永久删除编号为{' + id +'} 的数据, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                //调后端删除权限接口
                this.$ajax.delete(`/permission/delete/${id}`).then((res) => {
                    this.$message.success(res.data.message);
                    this.queryInfo.pageNumber = 1;
                    this.findPage();
                });
            }).catch(() => {});
        },
        /** 关闭对话框的事件 */
        dialogClose() {
            //将整个表单进行重置，并移除校验效果
            this.$refs.form.resetFields();
        },
        /** 点击取消 */
        clickCancel() {
            //将整个表单进行重置，并移除校验效果
            this.form = {};
            this.open = false;
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
                    this.$ajax.post('/permission/insert', this.form).then((res) => {
                        this.$message.success(res.data.message);
                        this.open = false;
                        this.findPage();
                    });
                } else {
                    this.$ajax.put('/permission/update', this.form).then((res) => {
                        this.$message.success(res.data.message);
                        this.open = false;
                        this.findPage();
                    });
                }
                
            });
        },
        /** 改变权限数据的状态 */
        updateStatus(row) {
            this.$ajax.put('/permission/update', row).then((res) => {
                this.$message.success('状态更新成功！');
            });
        }
    }
}
</script>

<style scoped>
.status-calss {
    text-align: left;
}
</style>
<template>
    <div>
        <el-card>
            <el-row>
                <el-col :span="8">
                    <search :value="queryInfo.queryString" @search="querySearch" />
                </el-col>
                <el-col :span="2">
                    <el-button style="margin-left: 10px;" @click="insert" type="primary">添加信息</el-button>
                </el-col>
            </el-row>
            <el-table :data="tableList" stripe v-loading="loading" element-loading-spinner="el-icon-loading">
                <el-table-column type="expand">
                    <template slot-scope="scope">
                        <div v-html="scope.row.content" v-hlzl/>
                    </template>
                </el-table-column>
                <el-table-column type="index" label="序号"/>
                <el-table-column prop="title" label="标题" show-overflow-tooltip/>
                <el-table-column prop="createTime" label="创建时间"/>
                <el-table-column prop="createName" label="创建者"/>
                <el-table-column prop="updateTime" label="更新时间"/>
                <el-table-column prop="updateName" label="更新者"/>
                <el-table-column fixed="right" label="操作" width="150">
                    <template slot-scope="scope">
                        <el-button type="primary" @click="update(scope.row)" size="small" icon="el-icon-edit" circle/>
                        <el-button type="danger" @click="deleteById(scope.row.id)" size="small" icon="el-icon-delete" circle/>
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

            <el-dialog :title="title" :visible.sync="open" width="60%" >
                <el-form ref="form" :model="form" :rules="rules" label-position="top">
                    <el-form-item prop="title" label="标题">
                        <el-input v-model="form.title" placeholder="请输入标题" style="width: 100%" maxlength="30"/>
                    </el-form-item>
                    <el-form-item prop="content" label="内容">
                        <mavon-editor ref="md" v-model="form.content" :toolbars="toolbars" @imgAdd="uploadImage"/>
                    </el-form-item>
                </el-form>
                <span slot="footer" class="dialog-footer">
                    <el-button @click="open = false">取 消</el-button>
                    <el-button type="primary" @click="clickOk">确 定</el-button>
                </span>
            </el-dialog>
        </el-card>
    </div>
</template>

<script>
import marked from 'marked';
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
            form: {},
            toolbars: {
                bold: true, // 粗体
                italic: true, // 斜体
                header: true, // 标题
                underline: true, // 下划线
                quote: true, // 引用
                ol: true, // 有序列表
                ul: true, // 链接
                imagelink: true, // 图片链接
                code: true, // code
                subfield: true, // 是否需要分栏
                fullscreen: true, // 全屏编辑
                /* 1.3.5 */
                undo: true, // 上一步
                trash: true, // 清空
                /* 1.4.2 */
                navigation: true // 导航目录
            },
            rules: {
                title: [
                    { required: true, message: '标题不能为空', trigger: 'blur' },
                    { max: 30, message: '标题最大不能超过30位', trigger: 'change' }
                ],
                content: [
                    { require: true, message: '内容不能为空', trigger: 'blur' }
                ],
            }
        }
    },
    created() {
        this.findPage();
    },
    methods: {
        /** 分页查询  */
        findPage() {
            this.loading = true;
            this.$ajax.post('/sport/findPage', this.queryInfo).then((res) => {
                this.loading = false;
                this.tableList = res.rows.filter(item => {
                    if (item.content && item.content !== '') {
                        item.content = marked(item.content);
                        item.remark = item.content;
                    }
                    return true;
                });
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
        /** 删除权限信息 */
        deleteById(id) {
            this.$confirm('您将操作将永久删除编号为{' + id +'} 的数据, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                //调后端删除权限接口
                this.$ajax.delete(`/sport/delete/${id}`).then((res) => {
                    this.$message.success(res.message);
                    this.queryInfo.pageNumber = 1;
                    this.findPage();
                });
            }).catch(() => {});
        },
        /** 点击新增 */
        insert() {
            this.title = '新增运动资讯';
            this.form = {};
            this.open = true;
        },
        update(row) {
            this.title = '修改运动资讯';
            this.form = row;
            this.form.content = row.remark;
            this.open = true;
        },
        /** 点击确定 */
        clickOk() {
            this.$refs.form.validate((valid) => {
                if (!valid) return this.$message.error('表单校验不通过，请检查后提交！');
                //校验通过 判断是否是新增
                if (this.form.id === undefined || this.form.id === null) {
                    this.$ajax.post('/sport/insert', this.form).then((res) => {
                        this.$message.success(res.message);
                        this.open = false;
                        this.findPage();
                    });
                } else {
                    this.$ajax.put('/sport/update', this.form).then((res) => {
                        this.$message.success(res.message);
                        this.open = false;
                        this.findPage();
                    });
                }
            });
        },
        uploadImage(pos, $e) {
            let formData = new FormData();
            formData.append('file', $e);
            this.$ajax.post('/tool/upload', formData).then((res) => {
                this.$refs.md.$img2Url(pos, this.$qiniu + res.data);
            });
        },
    }
}
</script>

<style scoped>

</style>

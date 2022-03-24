<template>
    <div>
        <!-- 卡片视图区 -->
        <el-card>
            <el-row :gutter="25">
                <el-col :span="10">
                    <search :value="queryInfo.queryString" @search="querySearch"/>
                </el-col>
                <el-col :span="2">
                    <!-- action上传路径 multiple是否支持多选 beforeUpload上传之前 handleSuccess上传成功 -->
                    <el-upload
                        class="upload-demo"
                        :action="uploadUrl"
                        :headers="headers"
                        name="goods"
                        :multiple="false"
                        :show-file-list="false"
                        :on-success="handleSuccess"
                        :before-upload="beforeUpload">
                        <el-button type="warning">批量导入</el-button>
                    </el-upload>
                </el-col>
                <el-col :span="2">
                    <el-button type="success" @click="batchExport">批量导出</el-button>
                </el-col>
            </el-row>
            <el-table :data="tableData" style="width: 100%">
                <el-table-column label="商品名称" prop="name" />
                <el-table-column label="商品价格" prop="price" />
                <el-table-column label="库存数量" prop="number" />
                <el-table-column label="商品图片">
                    <template slot-scope="props">
                        <div class="demo-image__preview">
                            <el-image
                                style="width: 100px; height: 100px"
                                :src="formatImage(props.row.imageUrl)"
                                :preview-src-list="[formatImage(props.row.imageUrl)]" />
                        </div>
                    </template>
                </el-table-column>
                <el-table-column label="特色功能" prop="characteristic" />
                <el-table-column label="操作">
                    <template slot-scope="scope">
                        <!-- 修改 -->
                        <el-button type="primary" icon="el-icon-edit" size="mini"
                                   @click="showEditDialog(scope.row)" />
                        <!-- 删除 -->
                        <el-button type="danger" icon="el-icon-delete" size="mini"
                                   @click="deleteById(scope.row.id)" />
                    </template>
                </el-table-column>
            </el-table>
            <!-- 分页 -->
            <el-pagination
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
                :current-page="queryInfo.pageNumber"
                :page-sizes="[4, 10, 20, 50]"
                :page-size="queryInfo.pageSize"
                layout="total, sizes, prev, pager, next, jumper"
                :total="total" />
        </el-card>
        <!-- 添加运动项目对话框 -->
        <el-dialog title="修改运动商品" :visible.sync="addDialogVisible" width="70%">
            <!-- 内容主体区域 -->
            <el-form :model="form" :rules="addFormRules" ref="addFormRef" label-width="80px">
                <!-- 运动名称 -->
                <el-row>
                    <el-col :span="12">
                        <el-form-item label="商品名称" prop="name">
                            <el-input v-model="form.name" />
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="商品图片" prop="imageUrl">
                            <el-input v-model="form.imageUrl">
                                <el-upload
                                    slot="append"
                                    class="upload-demo"
                                    :action="upload"
                                    :show-file-list="false"
                                    :headers="headers"
                                    :before-upload="beforeUpload2"
                                    :on-success="handleSuccess2">
                                    <el-button size="small">点击上传</el-button>
                                </el-upload>
                            </el-input>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="8">
                        <el-form-item label="商品数量" prop="number">
                            <el-input-number v-model="form.number" style="width: 100%" controls-position="right" />
                        </el-form-item>
                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="商品价格" prop="price">
                            <el-input-number style="width: 100%" v-model="form.price" :precision="2" :step="0.01" controls-position="right"/>
                        </el-form-item>
                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="适配机型" prop="modelType">
                            <el-input v-model="form.modelType" />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="8">
                        <el-form-item label="控制方式" prop="controlMode">
                            <el-input v-model="form.controlMode" />
                        </el-form-item>
                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="特色功能" prop="characteristic">
                            <el-input v-model="form.characteristic" />
                        </el-form-item>
                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="无线功能" prop="wifiFunction">
                            <el-input v-model="form.wifiFunction" />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="8">
                        <el-form-item label="电池规格" prop="battery">
                            <el-input v-model="form.battery" />
                        </el-form-item>
                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="主要功能" prop="mainFunction">
                            <el-input v-model="form.mainFunction" />
                        </el-form-item>
                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="外观尺寸" prop="size">
                            <el-input v-model="form.size" />
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="8">
                        <el-form-item label="其他功能" prop="other">
                            <el-input type="textarea" autosize v-model="form.other" />
                        </el-form-item>
                    </el-col>
                    <el-col :span="8">
                        <el-form-item label="备注" prop="remark">
                            <el-input type="textarea" autosize v-model="form.remark" />
                        </el-form-item>
                    </el-col>
                </el-row>

            </el-form>
            <!-- 内容底部区域 -->
            <span slot="footer" class="dialog-footer">
                <el-button @click="clickCancel">取 消</el-button>
                <el-button type="primary" @click="clickOk">确 定</el-button>
            </span>
        </el-dialog>
    </div>
</template>
<script>
export default {
    name: "Goods",
    data () {
        return {
            queryInfo: {
                pageNumber: 1,
                pageSize: 4,
                queryString: ""
            },
            uploadUrl: `${ process.env.VUE_APP_BASE_URL }/goods/batchImport`,
            upload: `${ process.env.VUE_APP_BASE_URL }/tool/upload`,
            headers: {
                Authorization: sessionStorage.getItem("token")
            },
            tableData: [],
            total: 0,
            form: {},
            addDialogVisible: false,
            addFormRules: {

            }
        };
    },
    created () {
        this.findPage();
    },
    methods: {
        async findPage() {
            await this.$ajax.post("/goods/findPage", this.queryInfo).then((res) => {
                this.tableData = res.rows;
                this.total = res.total;
            });
        },
        querySearch(value) {
            this.queryInfo.queryString = value;
            this.findPage();
        },
        //页数发生编码
        handleSizeChange(newPageSize) {
            this.queryInfo.pageSize = newPageSize;
            this.findPage();
        },
        //页码发生变化
        handleCurrentChange (newPageNumber) {
            this.queryInfo.pageNumber = newPageNumber;
            this.findPage();
        },
        beforeUpload (file) {
            let suffix = file.name.substring(file.name.lastIndexOf(".") + 1);
            if (suffix !== "xlsx" && suffix !== "xls") {
                this.$message.warning("请选择excel文件");
                return false;
            }
        },
        beforeUpload2 (file) {
            let suffix = file.name.substring(file.name.lastIndexOf(".") + 1);
            if (suffix.toLowerCase() !== "jpg" && suffix.toLowerCase() !== "jpeg" && suffix.toLowerCase() !== "png") {
                this.$message.warning("请选择后缀为jpg、png、jpeg的图片");
                return false;
            }
        },
        handleSuccess(res) {
            if (!res.flag) {
                this.$message.error(res.message);
            } else {
                this.$message.success(res.message);
                this.findPage();
            }
        },
        handleSuccess2(res) {
            this.$message.success(res.message);
            this.$set(this.form, 'imageUrl', res.data);
        },
        batchExport () {
            window.location.href = `${ process.env.VUE_APP_BASE_URL }/goods/batchExport`;
        },
        showEditDialog (row) {
            this.form = row || {};
            this.addDialogVisible = true;
        },
        clickCancel() {
            this.form = {};
            this.addDialogVisible = false;
        },
        deleteById (id) {
            this.$confirm("此操作将永久删除该项目, 是否继续?", "提示", {
                confirmButtonText: "确定",
                cancelButtonText: "取消",
                type: "warning"
            }).then(() => {
                this.$ajax.delete(`/goods/delete/${id}`).then((res) => {
                    this.$message.success(res.message);
                    this.findPage();
                });
            }).catch(() => {
                this.$message.info("已取消删除");
            });
        },
        clickOk() {
            this.$ajax.post('/goods/update', this.form).then((res) => {
                this.$message.success(res.message);
                this.addDialogVisible = false;
                this.findPage();
            });
        },
        formatImage(val) {
            if (val) {
                if (val.startsWith('http')) {
                    return val;
                } else {
                    return this.$qiniu + val;
                }
            }
        }
    }
};
</script>
<style scoped>
</style>

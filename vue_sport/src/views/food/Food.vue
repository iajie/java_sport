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
                    <el-button type="primary" @click="addShow" v-hasPermi="['ADD_FOOD']">添加食物</el-button>
                </el-col>
                <el-col :span="2" v-has-role="['ROLE_ADMIN']">
                    <el-upload
                        :action="importUrl"
                        :headers="headers"
                        name="file"
                        :multiple="false"
                        :show-file-list="false"
                        :on-success="importSuccess"
                        :before-upload="beforeUpload">
                        <el-button type="warning">批量导入</el-button>
                    </el-upload>
                </el-col>
            </el-row>
            <!-- 用户列表 -->
            <el-table :data="tableList" border stripe>
                <el-table-column type="index" label="序号"/>
                <el-table-column label="食物名称" prop="title"/>
                <el-table-column label="食物类别" prop="typeId"/>
                <el-table-column label="缩略图" align="center" width="130">
                    <template slot-scope="scope">
                        <el-image
                            v-if="scope.row.imageUrls"
                            style="width: 100px; height: 100px"
                            :src="$qiniu + scope.row.imageUrls.split(',')[0]"
                            :preview-src-list="previewImages(scope.row.imageUrls.split(','))"/>
                        <el-image
                            v-if="!scope.row.imageUrls"
                            style="width: 100px; height: 100px"
                            src=""/>
                    </template>
                </el-table-column>
                <el-table-column label="营养元素" prop="nutrient"/>
                <el-table-column label="热量" prop="heat"/>
                <el-table-column label="蛋白质" prop="protein"/>
                <el-table-column label="脂肪" prop="fat"/>
                <el-table-column label="碳水化合物" prop="carbonWater"/>
                <el-table-column label="膳食纤维" prop="dietaryFiber"/>
                <el-table-column label="维生素A" prop="vitaminA"/>
                <el-table-column label="维生素C" prop="vitaminC"/>
                <el-table-column label="维生素E" prop="vitaminE"/>
                <el-table-column label="胡萝卜素" prop="carrot"/>
                <el-table-column label="维生素B1" prop="vitaminB1"/>
                <el-table-column label="维生素B2" prop="vitaminB2"/>
                <el-table-column label="烟酸" prop="niacin"/>
                <el-table-column label="胆固醇" prop="cholesterol"/>
                <el-table-column label="镁" prop="magnesium"/>
                <el-table-column label="铁" prop="iron"/>
                <el-table-column label="钙" prop="calcium"/>
                <el-table-column label="锌" prop="zinc"/>
                <el-table-column label="铜" prop="copper"/>
                <el-table-column label="锰" prop="manganese"/>
                <el-table-column label="钾" prop="potassium"/>
                <el-table-column label="磷" prop="phosphorus"/>
                <el-table-column label="钠" prop="sodium"/>
                <el-table-column label="硒" prop="selenium"/>
                <el-table-column label="操作" width="120" fixed="right">
                    <template slot-scope="scope">
                        <!-- 修改 -->
                        <el-button type="primary" icon="el-icon-edit" size="mini" @click="editDialog(scope.row)"/>
                        <el-button type="danger" icon="el-icon-delete" size="mini" @click="deleteById(scope.row.id)"/>
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
            <el-dialog :title="title" v-loading="loading" :visible.sync="open" width="60%" @colse="dialogClosed">
                <el-form :model="dataForm" :rules="rulesDataForm" ref="dataForm" label-width="100px">
                    <el-row>
                        <el-col :span="8">
                            <el-form-item label="食物名称" prop="title">
                                <el-input
                                    v-model="dataForm.title"
                                    type="textarea"
                                    autosize/>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="食物类别" prop="typeId">
                                <el-select placeholder="请选择食物类别" style="width: 100%" v-model="dataForm.typeId" clearable>
                                    <el-option
                                        v-for="item in foodType"
                                        :key="item.id"
                                        :label="item.title"
                                        :value="item.id"/>
                                </el-select>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="营养元素" prop="nutrient">
                                <el-input v-model="dataForm.nutrient"/>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-form-item label="食物图片" prop="imageUrl">
                        <el-upload
                            list-type="picture-card"
                            :on-preview="handlePreview"
                            ref="imgs"
                            :action="uploadUrl"
                            :headers="headers"
                            :on-remove="handleRemove"
                            :before-upload="handleBefore"
                            :on-success="handleSuccess"
                            :file-list="fileList">
                            <i class="el-icon-plus"/>
                        </el-upload>
                    </el-form-item>
                    <el-row>
                        <el-col :span="8">
                            <el-form-item label="蛋白质" prop="protein">
                                <el-input v-model="dataForm.protein"/>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="脂肪" prop="fat">
                                <el-input v-model="dataForm.fat"/>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="碳水化合物" prop="carbonWater">
                                <el-input v-model="dataForm.carbonWater"/>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="8">
                            <el-form-item label="热量" prop="heat">
                                <el-input v-model="dataForm.heat"/>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="膳食纤维" prop="dietaryFiber">
                                <el-input v-model="dataForm.dietaryFiber"/>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="维生素A" prop="vitaminA">
                                <el-input v-model="dataForm.vitaminA"/>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="8">
                            <el-form-item label="维生素C" prop="vitaminC">
                                <el-input v-model="dataForm.vitaminC"/>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="维生素E" prop="vitaminE">
                                <el-input v-model="dataForm.vitaminE"/>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="胡萝卜素" prop="carrot">
                                <el-input v-model="dataForm.carrot"/>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="8">
                            <el-form-item label="维生素B1" prop="vitaminB2">
                                <el-input v-model="dataForm.vitaminB2"/>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="维生素B2" prop="vitaminE">
                                <el-input v-model="dataForm.vitaminE"/>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="烟酸" prop="niacin">
                                <el-input v-model="dataForm.niacin"/>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="8">
                            <el-form-item label="胆固醇" prop="cholesterol">
                                <el-input v-model="dataForm.cholesterol"/>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="镁" prop="magnesium">
                                <el-input v-model="dataForm.magnesium"/>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="铁" prop="iron">
                                <el-input v-model="dataForm.iron"/>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="8">
                            <el-form-item label="钙" prop="calcium">
                                <el-input v-model="dataForm.calcium"/>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="锌" prop="zinc">
                                <el-input v-model="dataForm.zinc"/>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="铜" prop="copper">
                                <el-input v-model="dataForm.copper"/>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="8">
                            <el-form-item label="锰" prop="manganese">
                                <el-input v-model="dataForm.manganese"/>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="钾" prop="potassium">
                                <el-input v-model="dataForm.potassium"/>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="磷" prop="phosphorus">
                                <el-input v-model="dataForm.phosphorus"/>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-row>
                        <el-col :span="8">
                            <el-form-item label="钠" prop="sodium">
                                <el-input v-model="dataForm.sodium"/>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="硒" prop="selenium">
                                <el-input v-model="dataForm.selenium"/>
                            </el-form-item>
                        </el-col>
                    </el-row>
                </el-form>
                <span slot="footer" class="dialog-footer">
                <el-button @click="clickCancel">取 消</el-button>
                <el-button type="primary" @click="clickOk">确 定</el-button>
            </span>
            </el-dialog>
            <!-- 图片预览对话框 -->
            <el-dialog :visible.sync="picDialog">
                <img width="100%" :src="dialogImageUrl"/>
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
                if (val === 1) {
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
            //图片对话框
            picDialog: false,
            //对话框标题
            title: '',
            //表单
            dataForm: {},
            //食物类别
            foodType: [],
            //上传地址
            uploadUrl: process.env.VUE_APP_BASE_URL +  '/tool/upload',
            headers: {
                Authorization : sessionStorage.getItem('token')
            },
            //图片列表
            fileList: [],
            //上传文件名
            fileNames: [],
            //表格加载
            loading: false,
            rulesDataForm: {
                title: [
                    { required: true, message: "请输入菜品分类名称", trigger: "blur" },
                    { min: 1, max: 50, message: "长度在 1 到 50 个字符", trigger: "blur" },
                ],
                typeId: [
                    { required: true, message: "请选择食物类别", trigger: "change" },
                ],
                nutrient: [
                    { required: true, message: "请输入营养元素，如：每100g、每1杯、每1碗", trigger: "blur" },
                ],
                fat: [
                    { required: true, message: "请输入脂肪，单位(g)", trigger: "blur" },
                ],
                carbonWater: [
                    { required: true, message: "请输入碳水化合物，单位(g)", trigger: "blur" },
                ],
                protein: [
                    { required: true, message: "请输入蛋白质，单位(g)", trigger: "blur" },
                ],
            },
            //导入地址
            importUrl: process.env.VUE_APP_BASE_URL + '/food/batchImport',
            //预览图片地址
            dialogImageUrl: '',
        }
    },
    created() {
        /** 初始化查询菜品分类 */
        this.$ajax.get('/food/typeAll').then((res) => {
            if (!res.data.flag) return this.$message.error(res.data.message);
            this.foodType = res.data.data;
        });
    },
    methods: {
        findPage() {
            this.$ajax.post('/food/findPage', this.queryInfo).then((res) => {
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
            this.fileNames = [];
            this.fileList = [];
            this.title = '新增';
            this.dataForm = {};
            this.open = true;
        },
        editDialog(row) {
            this.dataForm = {};
            this.fileNames = [];
            this.fileList = [];
            if (row.imageUrls) {
                let urls = row.imageUrls.split(',');
                urls.forEach(item => {
                    let url = {url: this.$qiniu + item};
                    this.fileList.push(url);
                    this.fileNames.push(item);
                });
            }
            this.title = '修改';
            this.dataForm = row;
            this.open = true;
        },
        deleteById(id) {
            this.$confirm('此操作将永久删除ID为 '+ id +' 的信息, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                //delete请求遵循restful风格
                this.$ajax.delete(`/food/delete/${id}`).then((res) => {
                    if (!res.data.flag) return this.$message.error(res.data.message);
                    this.$message.success(res.data.message);
                    this.findPage();
                });
            }).catch(() => {
                // 成功删除为confirm 取消为 cancel
                return this.$message.info("操作已取消");
            });
        },
        //移除上传的图片
        handleRemove(file, fileList) {
            console.log(fileList);
            console.log('before --> ' + this.fileNames);
            this.fileNames.forEach((item, index) => {
                if (file.response) {
                    if (item === file.response.data) {
                        this.fileNames.splice(index, 1);
                    }
                } else {
                    this.fileNames = [];
                    // this.fileNames.push();
                    fileList.forEach(item => {
                        let name = item.url.substring(item.url.lastIndexOf('/') + 1);
                        this.fileNames.push(name);
                    });
                }

            });
            console.log('after --> ' + this.fileNames);
        },
        //预览上传的图片
        handlePreview(file) {
            this.dialogImageUrl = file.url;
            this.picDialog = true;
        },
        /** 上传之前 */
        handleBefore(file) {
            let files = this.$refs.imgs.uploadFiles;
            if (files.length > 3) {
                this.$message.warning('最多上传3张图片哟！');
                return false;
            }
        },
        /** 上传成功 */
        handleSuccess(res, file, fileList) {
            this.fileNames.push(res.data);
        },
        dialogClosed() {
            this.fileNames = [];
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
                //校验通过验证图片是否上传
                if (this.fileNames.length < 1) return this.$message.error('请上传食物图片，至少一张，至多4张！');
                this.dataForm.imageUrls = this.fileNames.join(',');
                this.loading = true;
                //判断是修改还是添加
                if (this.dataForm.id === null || this.dataForm.id === undefined) {
                    //添加
                    this.$ajax.post('/food/insert', this.dataForm).then((res) => {
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
                    }).catch(() => {
                        setTimeout(() => {
                            this.loading = false;
                        }, 6000);
                    });
                } else {
                    //修改
                    this.$ajax.post('/food/update', this.dataForm).then((res) => {
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
                    }).catch(() => {
                        setTimeout(() => {
                            this.loading = false;
                        }, 6000);
                    });
                }
            });
        },
        //批量导入之前
        beforeUpload(file) {
            let fileName = file.name;
            let suffix = fileName.substring(fileName.lastIndexOf('.') + 1);
            if (suffix !== 'xls' && suffix !== 'xlsx') {
                this.$message.warning('请选择Excel文件，进行导入');
                return false;
            }
        },
        importSuccess(res, file) {
            if (!res.flag) return this.$message.error(res.message);
            //导入成功
            this.$message.success(res.message);
            this.findPage();
        },
        //预览图片列表
        previewImages(list) {
            let arr = [];
            list.forEach(item => {
                arr.push(this.$qiniu + item);
            });
            return arr;
        }
    }
};
</script>

<style scoped>

</style>

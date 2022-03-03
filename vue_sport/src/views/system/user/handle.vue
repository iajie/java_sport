<template>
    <el-card>
        <div slot="header" class="clearfix">
            <span>{{ title }}</span>
            <el-button style="float: right;" size="small" @click="$emit('cancel')">返回</el-button>
        </div>
        <div>
            <el-form :model="form" ref="form" :rules="rules" label-width="80px">
                <el-row>
                    <el-col :span="11">
                        <el-form-item label="登录名" prop="userName">
                            <el-input v-model="form.userName" placeholder="请输入登录名" style="width: 80%"/>
                        </el-form-item>
                    </el-col>
                    <el-col :span="11" v-if="this.form.id == null">
                        <el-form-item label="密码" prop="password">
                            <el-input v-model="form.password" type="password" placeholder="请输入登录密码" style="width: 80%"/>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="11">
                        <el-form-item label="性别" prop="sex">
                            <el-select v-model="form.sex" placeholder="请选择性别" style="width: 80%">
                                <el-option :value="0" label="男"/>
                                <el-option :value="1" label="女"/>
                            </el-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="11">
                        <el-form-item label="用户昵称" prop="nickName">
                            <el-input v-model="form.nickName" style="width: 80%"/>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="11">
                        <el-form-item label="电话号码" prop="phoneNumber">
                            <el-input v-model="form.phoneNumber" style="width: 80%" placeholder="请输入电话号码"/>
                        </el-form-item>
                    </el-col>
                    <el-col :span="11">
                        <el-form-item label="电子邮箱" prop="email">
                            <el-input v-model="form.email" style="width: 80%" placeholder="请输入电子邮箱"/>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="11">
                        <el-form-item label="用户角色" prop="roles">
                            <el-select v-model="roleIds" placeholder="请选择角色信息" style="width: 80%" multiple>
                                <el-option 
                                    v-for="(item, index) in roleList"
                                    :key="index"
                                    :label="item.label"
                                    :value="item.id"/>
                            </el-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="11">
                        <el-form-item label="是否启用" prop="status">
                            <el-radio-group v-model="form.status">
                                <el-radio :label="true">是</el-radio>
                                <el-radio :label="false">否</el-radio>
                            </el-radio-group>
                        </el-form-item>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="11">
                        <el-form-item label="居住地址" prop="address">
                            <el-input
                                type="textarea"
                                style="width: 80%"
                                show-word-limit
                                :maxlength="100"
                                :autosize="{ minRows: 3, maxRows: 5 }"
                                placeholder="请输入居住地址"
                                v-model="form.address"/>
                        </el-form-item>
                    </el-col>
                    <el-col :span="11">
                        <el-form-item label="用户头像" prop="avatar">
                            <!-- 
                                action: 用户上传地址
                                show-file-list： 是否展示列表
                            -->
                            <el-upload
                                class="avatar-uploader"
                                :action="action"
                                :headers="headers"
                                :show-file-list="false"
                                :on-success="handleSuccess"
                                :before-upload="beforeUpload">
                                <img v-if="imageUrl" :src="imageUrl" class="avatar">
                                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                            </el-upload>
                        </el-form-item>
                    </el-col>
                </el-row>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="$emit('cancel')">取 消</el-button>
                <el-button type="primary" @click="clickOk">确 定</el-button>
            </div>
        </div>
    </el-card>
</template>

<script>
export default {
    /** 接受父组件传递的值 */
    props: ['title', 'form'],
    /** 属性监听 */
    watch: {
        'form': {
            handler(val, old) {
                this.roleIds = [];
                console.log('表单值', val);
                this.form.userName = val.name;
                this.imageUrl = val.avatar.startsWith('https') ? val.avatar : this.$qiniu + val.avatar;
                // 回显角色
                if (val.roles && val.roles.length > 0) {
                    val.roles.forEach(item => {
                        this.roleIds.push(item.id);
                    });
                }
            }
        }
    },
    data() {
        return {
            rules: {
                userName: [
                    { required: true, message: '请输入登录名', trigger: 'blur' },
                    { min: 2, max: 50, message: '登录名的长度为2~20之间', trigger: 'blur' }
                ],
                password: [
                    { required: true, message: '请输入登录密码', trigger: 'blur' },
                ],
                sex: [
                    { required: true, message: '请选择性别', trigger: 'blur' },
                ],
                phoneNumber: [
                    { required: true, message: '请输入电话号码', trigger: 'blur' },
                    { message: '手机号码输入不正确', trigger: 'blur', pattren: /^1(3[0-9]|5[0-3,5-9]|7[1-3,5-8]|8[0-9])\d{8}$/ }
                ],
                avatar: [
                    { 
                        required: true, 
                        validator: (rule, value, callback) => {
                            console.log(this.form.avatar);
                            if (this.form.avatar === null || this.form.avatar === '' || this.form.avatar === undefined) {
                                callback(new Error('请上传用户头像'));
                            } else {
                                callback();
                            }
                        }, 
                        trigger: 'change' 
                    },
                ],
            },
            imageUrl: null,
            action: '/tool/upload',
            headers: {
                Authorization: sessionStorage.getItem('token')
            },
            roleList: [],
            roleIds: [],
        }
    },
    created() {
        this.$ajax.get('/role/findAll').then((res) => {
            this.roleList = res.data.data;
        });
    },
    methods: {
        /**
         * 上传成功
         * res：返回的参数
         * file： 上传的文件信息
         */
        handleSuccess(res, file) {
            this.imageUrl = this.$qiniu + res.data;
            this.form.avatar = res.data;
        },
        /** 上传之前 file可以判断文件类型、文件大小 */
        beforeUpload(file) {
            // 判断文件大小 不能操作10M
            if (file.size > 10 * 1024 * 1024) {
                this.$message.warning('文件大小不能操作10M！')
                return false;
            }
            let index = file.name.lastIndexOf('.');
            let suffix = file.name.substring(index + 1);
            if (suffix !== 'jpg' && suffix !== 'png' && suffix !== 'jpeg') {
                this.$message.warning('请上传jpg、jpeg、png格式的图片！');
                return false;
            }
        },
        /** 点击ok */
        clickOk() {
            console.log(this.form);
            this.$refs.form.validate((valid) => {
                if (!valid) return this.$message.error('表单校验不通过，请检查后提交！');
                let arr = [];
                this.roleIds.forEach(item => {
                    arr.push({ id: item });
                });
                this.form.roles = arr;
                // 判断是添加还是修改
                if (!this.form.id) {
                    this.$ajax.post('/user/insert', this.form).then((res) => {
                        this.$message.success(res.data.message);
                        return this.$emit('cancel');
                    });
                } else {
                    this.$ajax.put('/user/update', this.form).then((res) => {
                        this.$message.success(res.data.message);
                        return this.$emit('cancel');
                    });
                }
            });
        }
    }
}
</script>

<style scoped>
.avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 20px;
    color: #8c939d;
    width: 130px;
    height: 130px;
    line-height: 130px;
    text-align: center;
  }
  .avatar {
    width: 130px;
    height: 130px;
    display: block;
  }

.clearfix {
    text-align: left;
}
</style>
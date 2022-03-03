<template>
    <div>
        <div class="form-class">
            <img class="logo" src="../assets/logo.png" alt/>
            <el-card>
                <el-form :model="form" :rules="rules" ref="form" label-width="80px">
                    <div v-if="!forgetPwd">
                        <!-- 账号密码登录 -->
                        <div v-if="form.type == '1'">
                            <el-form-item label="账号" prop="username">
                                <el-input v-model="form.username"/>
                            </el-form-item>
                            <el-form-item label="密码" prop="password">
                                <el-input type="password" v-model="form.password"/>
                            </el-form-item>
                        </div>
                        <!-- 手机验证码登录 -->
                        <div v-if="form.type == '2'">
                            <el-form-item label="手机号码" prop="phoneNumber">
                                <el-input v-model="form.phoneNumber"/>
                            </el-form-item>
                            <el-form-item label="验证码" prop="code">
                                <el-input v-model="form.code" placeholder="请输入验证码">
                                    <el-button slot="append" @click="sendSms" :disabled="codeDisabled">{{ codeText }}</el-button>
                                </el-input>
                            </el-form-item>
                        </div>
                        <el-form-item>
                            <el-button type="primary" @click="submit" :loading="load" style="width: 100%">{{ loginText }}</el-button>
                            <el-button type="text" @click="forget">忘记密码？</el-button>
                            <el-button type="text" @click="clickPhone">手机验证码登录</el-button>
                        </el-form-item> 
                    </div>
                    <div v-else>
                        <el-form-item label="邮箱" prop="email">
                            <el-input v-model="form.email" placeholder="请输入忘记密码账号的邮箱"/>
                        </el-form-item>
                        <el-button type="primary" @click="findPassword" style="width: 100%">找回密码</el-button>
                    </div>
                </el-form>
            </el-card>
        </div>
    </div>
</template>

<script>
    export default {
        name: "login",
        data() {
            return {
                //表单对象
                form: {
                    username: null,
                    password: null,
                    // 1、账号密码登录 2、手机验证码登录
                    type: '1',
                    phoneNumber: null,
                    code: null
                },
                //表单校验规则
                rules: {
                    //用户名表单校验
                    username: [
                        {required: true, message: '请输入用户名', trigger: 'blur'},
                        {min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur'}
                    ],
                    password: [
                        {required: true, message: '请输入密码', trigger: 'blur'}
                    ],
                    email: [
                        { required: true, message: '请输入邮箱', trigger: 'blur' },
                        { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }
                    ],
                    phoneNumber: [
                        { required: true, message: '请输入手机号码', trigger: 'blur' },
                        { message: '请输入正确的邮手机号码', trigger: ['blur', 'change'], pattren: /^1(3[0-9]|5[0-3,5-9]|7[1-3,5-8]|8[0-9])\d{8}$/ }
                    ],
                    code: [
                        { required: true, message: '请输入验证码', trigger: 'blur' },
                    ],
                },
                // 登录按钮文字
                loginText: '登           录',
                // 登录状态
                load: false,
                // 忘记密码
                forgetPwd: false,
                codeText: '发送验证码',
                codeDisabled: false,
            }
        },
        /** 页面加载函数 */
        created() {

        },
        /** 存放所有的方法 */
        methods: {
            /** 登录的方法 */
            submit() {
                this.$refs.form.validate((valid) => {
                    if (!valid) return this.$message.error('数据校验失败，请检查后提交！');
                    this.load = true;
                    this.loginText = '登录中...';
                    //如果数据检验成功，则向后端发送请求，进行登录
                    this.$ajax.post('/user/login', this.form).then((res) => {
                        const tokenBody = res.data.data;
                        let tokenHead = tokenBody.tokenHead;
                        let token = tokenBody.token;
                        this.$store.commit('setToken', tokenHead + token);
                        this.$router.push('/');
                    }).catch(() =>{
                        this.load = false;
                    this.loginText = '登           录';
                    });
                });
            },
            /** 忘记密码 */
            forget() {
                this.forgetPwd = true;
            }, 
            /** 找回密码，发送邮件 */
            findPassword() {
                this.$refs.form.validate((valid) => {
                    if (!valid) return this.$message.error('数据校验失败，请检查后提交！');
                    //如果数据检验成功，则向后端发送请求，进行登录
                    this.$ajax.post('/tool/forget/password', { receivers: [this.form.email] }).then((res) => {
                        if (res.data.flag) {
                            this.$message.success(res.data.message);
                            this.forgetPwd = false;
                        }
                    });
                });
            },
            /** 点击手机验证码登录 */
            clickPhone() {
                console.log(this.form.type);
                if (this.form.type == '1') {
                    this.form.type = '2';
                } else {
                    this.form.type = '1';
                }
                // 移除校验结果
                this.$refs.form.clearValidate();
            },
            /** 发送验证码 */
            sendSms() {
                const pattren = /^1(3[0-9]|5[0-3,5-9]|7[1-3,5-8]|8[0-9])\d{8}$/;
                // 判断手机号码是否填写
                if (!this.form.phoneNumber) return this.$message.error('请输入手机号码！');
                if (!pattren.test(this.form.phoneNumber)) return this.$message.error('请输入正确的手机号码！');
                // 发送验证码
                this.$ajax.post(`tool/sms?phoneNumber=${this.form.phoneNumber}`).then((res) => {
                    if (res.data.flag) {
                        /*
                        * setInterval: 每隔多少秒执行一次
                        * setTimeout: 在多少秒后执行一次
                        */
                        let time = 60;
                        const timer = setInterval(() => {
                            this.codeDisabled = true;
                            time--;
                            if (time) {
                                this.codeText = '(' + time + '秒)后重新发送';
                            } else {
                                clearInterval(timer);
                                this.codeText = '重新发送验证码';
                                this.codeDisabled = false;
                            }
                        }, 1000);
                    }
                });

            }
        }
    }
</script>

<style scoped>
    .form-class {
        width: 30%;
        margin: 200px 500px auto;
    }

    .logo {
        width: 100px;
        height: 100px;
    }
</style>
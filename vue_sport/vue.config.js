module.exports = {
    // vue代理后端接口配置
    devServer: {
        //设置端口信息
        port: 80,
        //设置是否启动时打开浏览器
        open: true,
        //设置代理
        proxy: {
            //代理的根路径
            [process.env.VUE_APP_BASE_URL] : {
                //代理的后端路径
                target: 'http://localhost:8000',
                //是否开启根路径转换  123
                changeOrigin: true,
                //代理路径更改
                pathRewrite: {
                    ['^' + process.env.VUE_APP_BASE_URL]: '/'
                }
            }
        }
    },
    // vue打包配置

    //配置公共路径(必须的)
    publicPath: '/',
    // 打包到哪个文件夹
    outputDir: 'dist',
    // 将静态资源打包
    assetsDir: 'static',
    // 打包的时候是否取消eslint代码检查
    lintOnSave: true,
    // 去除打包后js的map文件
    productionSourceMap: true,
    // 去除console
    configureWebpack: {
        // 关闭警告
        performance: {
            hints: 'warning',
            // 入口起点的最大体积
            maxEntrypointSize: 5000000,
            // 生成文件的最大体积
            maxAssetSize: 3000000,
        }
    }
};

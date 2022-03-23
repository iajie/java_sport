import * as echarts from '../../../../ec-canvas/echarts';
let echartsData = [];
const app = getApp();
/**
 * 初始化数据
 */
function initData(canvas, width, height, dpr) {
    const chart = echarts.init(canvas, null, {
        width: width,
        height: height,
        devicePixelRatio: dpr // 像素
    });
    canvas.setChart(chart);
    let option = {
        legend: {
            orient: 'vertical',
            //图标设置样式
            icon: "circle",
            //位置
            bottom: 'bottom',
            //格式化名字
            formatter: function (name) {
                let arr = [];
                echartsData.forEach(item => {
                    if (item.name == name) {
                        arr.push(name + item.value + 'g');
                    }
                });
                return arr.join('');
			}
        },
        series: [
            {
                type: 'pie',
                radius: '50%',
                data: echartsData,
                label: {
                    normal: {
                        show: true,
                        formatter: '{b}{d}%',//模板变量有 {a}、{b}、{c}、{d}，分别表示系列名，数据名，数据值，百分比。{d}数据会根据value值计算百分比
                    }
                }
            }
        ]
    };
    chart.setOption(option);
    return chart;
}

Page({

    /**
     * 页面的初始数据
     */
    data: {
        dataInfo: {},
        imageUrls: [],
        // 饼状图数据
        ec: {
            onInit: initData
        }
    },

    /**
     * 跳转
     */
    getFoodDetail() {
        wx.navigateTo({
            url: '/pages/food/foods/foodDetails/foodsDetails?data=' + JSON.stringify(this.data.dataInfo)
        });
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        app.ajax(`food/${options.id}`, 'GET').then((result) => {
            let { data } = result;
            let temp = [];
            if (data.imageUrls) {
                let arr = data.imageUrls.split(',');
                if (arr.length > 0) {
                    arr.forEach(i => {
                        temp.push('http://ajie.jierxm.com/' + i);
                    });
                } else {
                    temp.push('http://ajie.jierxm.com/' + arr[0]);
                }
            } else {
                temp.push('https://img.yzcdn.cn/vant/cat.jpeg');
            }
            this.setData({
                dataInfo: data,
                imageUrls: temp
            });
            echartsData = [
                {value: data.fat, name: '脂肪'},
                {value: data.protein, name: '蛋白质'},
                {value: data.carbonWater, name: '碳水化合物'}
            ];
        });
    },

    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady: function () {

    },

    /**
     * 生命周期函数--监听页面显示
     */
    onShow: function () {

    },

    /**
     * 生命周期函数--监听页面隐藏
     */
    onHide: function () {

    },

    /**
     * 生命周期函数--监听页面卸载
     */
    onUnload: function () {

    },

    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh: function () {

    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom: function () {

    },

    /**
     * 用户点击右上角分享
     */
    onShareAppMessage: function () {

    }
})
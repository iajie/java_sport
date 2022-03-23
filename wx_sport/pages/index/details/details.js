const app = getApp();
Page({

    /**
     * 页面的初始数据
     */
    data: {
        // 存储运动咨询详情
        dataInfo: {},
        url: '',
        flag: false,
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad: function (options) {
        const { id, type } = options;
        if (type == 1) {
            app.ajax(`sport/${id}`, 'GET').then((res) => {
                let content = res.data.content;
                if (content) {
                    this.setData({
                        dataInfo: app.towxml(content, 'markdown', { theme:'dark' }),
                        flag: true
                    });
                }
            });
        } else {
            app.ajax(`motion/${id}`, 'GET').then((res) => {
                let content = res.data.introduction;
                if (content) {
                    this.setData({
                        dataInfo: app.towxml(content, 'markdown', { theme:'dark' }),
                        flag: true
                    });
                }
            });
        }
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
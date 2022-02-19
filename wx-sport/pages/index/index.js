// index.js
// 获取应用实例
const app = getApp()

Page({

	/**
	 * 页面的初始数据
	 */
	data: {
		userInfo: {},
	},
	/** 获取用户信息 */
	getInfo() {
		wx.getUserProfile({
			desc: '用于完善会员资料', // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
			success: (res) => {
				let { avatarUrl, nickName, gender, country, province, city } = res.userInfo;
				wx.request({
					url: 'http://localhost:8000/mini/update/info',
					method: 'POST',
					header: {
						'Authorization': wx.getStorageSync('totken')
					},
					data: {
						nickName: nickName,
						sex: gender,
						avatar: avatarUrl,
						address: country + province + city,
						openId: wx.getStorageSync('openid')
					},
					success: (res) => {
						console.log(res);
					},
					fail: (err) => {
						console.log(err);
					}
				});
			}
		})
	},
	/**
	 * 生命周期函数--监听页面加载
	 */
	onLoad: function (options) {

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
		this.getTabBar().init();
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
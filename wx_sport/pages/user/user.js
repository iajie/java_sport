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
				let {
					avatarUrl,
					nickName,
					gender,
					country,
					province,
					city
				} = res.userInfo;
				let form = {
					nickName: nickName,
					sex: gender,
					avatar: avatarUrl,
					address: country + province + city,
					openId: wx.getStorageSync('openid')
				};
				app.ajax('mini/update/info', 'POST', form).then((res) => {
					wx.showToast({
						title: res.data.message,
					});
				});
			}
		})
	},

	/**
	 * 退出登录
	 */
	logout() {
		wx.showModal({
			title: '提示',
			content: '您确定要退出登录吗',
			success: (res) => {
				if (res.confirm) { //这里是点击了确定以后
					wx.clearStorageSync();
					wx.redirectTo({
						url: '/pages/login/login', //跳去登录页
					});
				} else { //这里是点击了取消以后
					console.log('用户点击取消')
				}
			}
		})
		//点击确定
		wx.clearStorageSync();
		this.getTabBar().init();
		wx.switchTab({
			url: '/pages/user/user',
		});
	},
	/**
	 * 生命周期函数--监听页面加载
	 */
	onLoad: function (options) {
		this.setData({
			userInfo: wx.getStorageSync('userInfo')
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
// index.js
// 获取应用实例
const app = getApp()
Page({

	/**
	 * 页面的初始数据
	 */
	data: {
		// 请求数据
		queryInfo: {
			pageNumber: 1,
			pageSize: 5
		},
		//上拉时是否继续请求数据，即是否还有更多数据  true可以继续上拉，false禁止上拉数据
		hasMoreData: true,
		// 响应数据
		tableList: [],
	},

	/**
	 * 获取分页数据
	 * @param {*} message 提示语
	 */
	findPage(message) {
		wx.showNavigationBarLoading();
		wx.showToast({
			title: message,
			icon: 'loading',
		});
		app.ajax('sport/findPage', 'POST', this.data.queryInfo).then((res) => {
			// 将原有的结果列表定义为临时数组
			let temp = this.data.tableList;
			// 将新的结果接收
			let result = res.data.rows;
			if (result.length > 0) {
				// 如果分页页码为1，那么说明用户在下拉
				if (this.data.queryInfo.pageNumber == 1) {
					temp = [];
				}
				// 如果结果长度大于分页数，那么说明还可以上拉数据，否则禁止上拉
				if (result.length < this.data.queryInfo.pageSize) {
					this.setData({
						tableList: temp.concat(result),
						hasMoreData: false
					});
				} else {
					this.setData({
						tableList: temp.concat(result),
						hasMoreData: true,
						queryInfo: {
							pageNumber: this.data.queryInfo.pageNumber + 1,
							pageSize: 5,
						}
					});
				}
			} else {
				this.setData({
					hasMoreData: false
				});
				//在当前页面显示导航条加载动画
				wx.showNavigationBarLoading();
				//显示 loading 提示框
				wx.showLoading({
					title: '没有跟多数据了！',
				});
				wx.hideNavigationBarLoading();
				wx.hideLoading();
			}
		});
		wx.hideNavigationBarLoading();
		wx.hideToast();
	},

	/**
	 * 跳转详情页
	 * @param {*} id 
	 */
	toDetails(event) {
		wx.navigateTo({
			url: `/pages/index/details/details?id=${event.target.dataset.id}`
		});
	},

	/**
	 * 生命周期函数--监听页面加载
	 */
	onLoad: function (options) {
		this.findPage('加载中...');
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
		this.data.queryInfo.pageNumber = 1;
		this.findPage('数据刷新中...');
	},

	/**
	 * 页面上拉触底事件的处理函数
	 */
	onReachBottom: function () {
		if (this.data.hasMoreData) {
			this.findPage('加载更多数据...');
		}
	},

	/**
	 * 用户点击右上角分享
	 */
	onShareAppMessage: function () {

	}
})
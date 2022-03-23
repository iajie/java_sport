import * as echarts from '../../ec-canvas/echarts';
const app = getApp();
Page({

	/**
	 * 页面的初始数据
	 */
	data: {
		//运动数据
		ec: {
			// 延迟加载
			lazyLoad: true
		},
		data1: [],
		data2: [],
		data3: [],
		data4: [],
		//今日步数
		step: wx.getStorageSync('step') || 0,
	},

	/**
	 * 生命周期函数--监听页面加载
	 */
	onLoad: function (options) {
		app.ajax('mini/step/report', 'GET').then((res) => {
			const { week1, week2, week3, week4 } = res.data;
			//迭代运动信息
			for (let i=0; i<7; i++) {
				//装本周数据
				if (week1[i] === null || week1[i] === undefined) {
					this.data.data1.push(null);
				} else {
					this.data.data1.push(week1[i].step);
				}
				this.data.data2.push(week2[i].step);
				this.data.data3.push(week3[i].step);
				this.data.data4.push(week4[i].step);
			}
			this.lineComponent = this.selectComponent('#mychart-dom-line');
			this.initChart();
		});
	},

	/**
	 * 初始化echarts数据
	 */
	initChart: function() {
		this.lineComponent.init((canvas, width, height, dpr) => {
			const chart = echarts.init(canvas, null, {
				width: width,
				height: height,
				devicePixelRatio: dpr // new
			});
			canvas.setChart(chart);
			chart.setOption(this.getOption());
			return chart;
		});
	},

	/**
	 * 折线图数据
	 */
	getOption() {
		return {
			//点击时显示信息
			tooltip: {
				trigger: 'axis'
			},
			legend: {
				data: ['本周', '第二周', '第三周', '第四周']
			},
			//格子数据 刻度
			grid: {
				left: '3%',
				right: '4%',
				bottom: '3%',
				containLabel: true
			},
			//X轴显示日期
			xAxis: {
				type: 'category',
				boundaryGap: false,
				data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
			},
			//Y轴数据
			yAxis: {
				type: 'value'
			},
			series: [
				{
					name: '本周',
					type: 'line',
					data: this.data.data1
				},
				{
					name: '第二周',
					type: 'line',
					data: this.data.data2
				},
				{
					name: '第三周',
					type: 'line',
					data: this.data.data3
				},
				{
					name: '第四周',
					type: 'line',
					data: this.data.data4
				}
			]
		};
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
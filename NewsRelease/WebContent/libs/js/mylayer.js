var mylayer = {
	//有图标，自动关闭，没有后续操作
	success : function(contents) {
		layer.msg(
			contents,
			{icon:1, time:3000}
		);
	},
	
	//有图标，自动关闭，跳转
	successUrl : function(contents, url) {
		layer.msg(
			contents,
			{icon:1, time:3000},
			function() {
				location.href = url;
			}
		);
	},
	
	//有图标，自动关闭，没有后续操作
	errorMsg : function(contents) {
		layer.msg(
			contents,
			{icon:2, time:3000}
		);
	},
	
	//有图标，不自动关闭，没有后续操作
	errorAlert : function(contents) {
		layer.alert(
			contents,
			{icon:2}
		);
	},
	
	//没有图标，询问层，确认按钮后有后续操作
	confirm : function(contents, url) {
		layer.confirm(
			contents,
			function(index) {
				console.log("点击了确定");
				location.href = url;
				layer.close(index);
			},
			function(index) {
				console.log("点击了取消");
			}
		);
	}
}

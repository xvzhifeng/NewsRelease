var util = {
	SUCCESS : 0,
	ERROR : 1,
	NEED_LOGIN : 2,
	isNull : function(value) {
		//把value首尾的空格去掉
		var str = value.replace(/(^\s*)|(\s*$)/, '');
		//输入框中输入空格也为空
		if (str == '' || str == undefined || str == null) {
			return true;
		} else {
			return false;
		}
	},
	getSelectedIds : function(data) {
		var ids = [];//[1,2,3]
    	for(var i in data) {
    		ids.push(data[i].id);
    	}
    	ids = ids.join(',');// '1,2,3'
    	return ids;
	}
}

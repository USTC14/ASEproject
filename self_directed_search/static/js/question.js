$(function($) {
	// 随机选取radio
	$("#randChoose").bind("click", function() {
		var $radios = $(":radio");
		var count = 0;
		var num = 0;
		for (var i = 0; i < $radios.length / 2; i++) {
			count = i * 2;
			if (Math.random() < 0.5) {
				num = count;
			} else {
				num = count + 1;
			}
			$(":radio").eq(num).attr("checked", "checked");
		}
	});
	// 设置所有 radio 为未被选中
	$("#removeChoose").bind("click", function() {
		$(":radio").removeAttr("checked");
	});
});


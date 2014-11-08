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

/*
 * function linkTo(y) {
 * 
 * window.location.hash = y; }
 * 
 * function form_check() { var a = document.getElementsByTagName("INPUT"); var b =
 * document.getElementsByTagName("STRONG"); for (var i = 0; i < a.length; i++) {
 * var tmpStr; var j = i / 2; tmpStr = a[i].name; var strongid = b[j]; var
 * tmpjuanbiao = tmpStr + "juanbiao"; if (a[i].type == "radio" &&
 * eval("document.form1." + tmpStr + "[0].checked") == false &&
 * eval("document.form1." + tmpStr + "[1].checked") == false) { alert("问题'" +
 * tmpStr + "'没有选择"); linkTo(tmpjuanbiao); strongid.style.color = "#ff0000";
 * return false; } } }
 */
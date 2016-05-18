/**
 * @author:xujun
 * @desc:新增活动主控制js
 */
$(function() {
//	init();
//	handleSubDict("henan");
	// 上传文件
	

	$("#at_submit1").on("click", function(e) {
		e.preventDefault();
		submit_handler(3);
	});
	$("#at_submit2").on("click", function(e) {
		e.preventDefault();
		submit_handler(-1);
	});
	/*
	$("#at_address").on("change", function() {
		var v=$(this).val();
		handleSubDict(v);
	});
	*/
});

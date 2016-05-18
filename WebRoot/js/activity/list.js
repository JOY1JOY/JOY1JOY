/**
 * @author:xujun
 * @desc:主控制js-活动主页
 */

$(function() {
	at.get_activities();
	
	

	
	
	// 时间
	$("#at_time a").on("click", function(e) {
		e.preventDefault();
		$(this).addClass(JOY_CLASS_ITEM_SELECTED);
		var fobj = this;
		$("#at_time a").each(function() {
			if (fobj != this) {
				$(this).removeClass(JOY_CLASS_ITEM_SELECTED);
			}
		});
		at.search_handler(1, this);
	});
	// 费用
	$("#at_fee a").on("click", function(e) {
		e.preventDefault();
		$(this).addClass(JOY_CLASS_ITEM_SELECTED);
		var fobj = this;
		$("#at_fee a").each(function() {
			if (fobj != this) {
				$(this).removeClass(JOY_CLASS_ITEM_SELECTED);
			}
		});
		at.search_handler(2, this);
	});
	
	
	// 分类
	$(".cate-items a").on("click", function(e){
		
		e.preventDefault();
		$(this).addClass(JOY_CLASS_ITEM_SELECTED);
		$(this).removeClass(JOY_CLASS_ITEM_UNSELECTED);
		var fobj = this;
		$(".cate-items a").each(function() {
			if (fobj != this) {
				$(this).removeClass(JOY_CLASS_ITEM_SELECTED);
				$(this).addClass(JOY_CLASS_ITEM_UNSELECTED);
			}
		});
		
		//alert("click");
		//at.search_handler(0, this);
		
	});
	

});

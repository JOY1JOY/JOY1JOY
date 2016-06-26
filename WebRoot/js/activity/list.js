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
		
		var $self = $(this);
		
		e.preventDefault();
		
		$self.addClass(JOY_CLASS_ITEM_SELECTED);
		$self.removeClass(JOY_CLASS_ITEM_UNSELECTED);
		
		var fobj = this;
		
		var $all= $self.siblings();
		
		$all.each(function() {
			if (fobj != this) {
				$(this).removeClass(JOY_CLASS_ITEM_SELECTED);
				$(this).addClass(JOY_CLASS_ITEM_UNSELECTED);
			}
		});
		var val=$self.parent().attr("data");
		at.search_handler(val, $self);
	});
	
	
	//赞 
//	$(".upvote").click(function(){
//     alert("uu");
//	});
//	
	

});

/**
 * 
 * @version 1.0
 * @description 公告
 */
// 加载公告列表
var initPagination = function() {
	var num_entries = $("#PageNum").val();
	// 创建分页
	$("#Pagination").pagination(num_entries, {
		num_edge_entries : 1, // 边缘页数
		num_display_entries : 8, // 主体页数
		callback : pageselectCallback,
		items_per_page : 6, // 每页显示8项
		prev_text : "PRE",
		next_text : "NEXT"
	});
};

function pageselectCallback(page_index, jq) {
	page_index += 1;
	$.ajax({
		url : joy.getContextPath() +'/notice/noticeList.action',
		type : 'post',
		data : {
			noticeType : "",
			pageIndex : page_index
		},
		cache : false,
		dataType : 'json',
		success : function(re) {
	           
				$("#topicList").empty();
				var resMap = eval(re.rows);
				// alert(resMap.id);
				$.each(resMap, function(i) {
					var obj = resMap[i];
//					var html = '<li>';
//					html += '<a href="'+joy.getContextPath()+'/notice/detailNotice.action?noticeId='
//							+ obj.id + '">' + obj.title + '</a>';
//					html += '<p class="gray">' + obj.cdatetime + '</p>';
//					html += '<p class="blank">' + obj.content + '</p>';
//					html += '</li>';
					var html ='<div class="row">';
					html += '<div class="item-c col-sm-12 col-md-8 col-lg-8"';
					if(i==0){
					html += 'style="border-top: 0;">';
					}
					else{
					html += '>';
					}
					html +='<div class="author">';
					html +='<a href="#">';
					html +='<img src="'+joy.getContextPath()+obj.icon+'" >';
					html +='<span>'+obj.userid+'</span>';
					html +='</a>';
					html +='<span class="date">'+obj.cdatetime+'</span>';
					html +='</div>';
                    html +='<h3>';
					html +='<a href="'+joy.getContextPath()+'/notice/detailNotice.action?noticeId='
					+ obj.id + '" target="_blank">'+obj.title+'</a>';
					html +='</h3>';
                    html +='<div class="partakes">';
					html +='<label class="lab-read">阅读&nbsp;2125</label>';
					html +='<label class="lab-good">赞&nbsp;165</label>';
					html +='<label class="lab-discuss">评论&nbsp;14</label>';
					html +='</div>';
					html +='<img src="../images/22.jpg">';
				    html +='</div>';
				    html +='</div>';
					$("#topicList").append(html);
				});
				$("#Pagination").show();
			}

		//}
	});
	return false;
}

$(function() {
	$("#Pagination").hide();
	initPagination();
//	initKnowledge();
	
//	$("#activity").click(function() {
//		initPagination();
//	});
	
	
	
	
	// 分类
	$(".post-nav li").on("click", function(e){
		
		var $self = $(this);
		
		e.preventDefault();
		
		$self.addClass("active");
	//	$self.removeClass(JOY_CLASS_ITEM_UNSELECTED);
		
		var fobj = this;
		
		var $all= $self.siblings();
		
		$all.each(function() {
			if (fobj != this) {
				$(this).removeClass("active");
	//			$(this).addClass(JOY_CLASS_ITEM_UNSELECTED);
			}
		});
		
	//	var val=$self.parent().attr("data");
		
		notice.search_handler(val, $self);
		
	});
	

});

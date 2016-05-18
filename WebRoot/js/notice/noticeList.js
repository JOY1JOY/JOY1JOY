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

//话题模板展示

var JOY_TEMPLATE_TOPIC = '<div class="item-c col-sm-12 col-md-8 col-lg-8" style="border-top: 0;">'
	+'<div class="author">'
	+'<a href="/Pocket/Author/Detail?authorId=31">'
	+'<img src="../images/22.jpg" >'
	+'<span>动小动</span>'
	+'</a>'
	+'<span class="date">2016-04-16</span>'
	+'</div>'
    +'<h3>'
	+'<a href="/Pocket/Post/7806" target="_blank">我如何花四年时间在帝都买到人生中第一套房子</a>'
	+'</h3>'
    +'<div class="partakes">'
	+'<label class="lab-read">阅读&nbsp;2125</label>'
	+'<label class="lab-good">赞&nbsp;165</label>'
	+'<label class="lab-discuss">评论&nbsp;14</label>'
	+'</div>'
	+'<img src="../images/22.jpg">'
    +'</div>';






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
					var html = '<div class="item-c col-sm-12 col-md-8 col-lg-8"';
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

});

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
		prev_text : "&laquo",
		next_text : "&raquo"
	});
};

function pageselectCallback(page_index, jq) {
	page_index += 1;
	var v = $("#noticeType").attr("value");
	$.ajax({
		url : joy.getContextPath() +'/notice/noticeList.action',
		type : 'post',
		data : {
			noticeType : v,
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
					
					html +='<a href="#"><label class="lab-good" data-value='+obj.id+'>赞&nbsp;<span>'+obj.upvoteCount+'</span></label></a>';
					html +='<a href="#"><label class="lab-discuss" data-value='+obj.id+'>评论&nbsp;'+obj.commentCount+'</label></a>';
					html +='</div>';
					var content = obj.content;
					var ele=$(content).find("img:first").attr("src");
					var thumbsrc=ele.replace("/images/org","/images/thumbnail");
					if("undefined" == typeof ele){
					ele="../images/thumbnail/default.jpg";	
					}
					html +='<img src="'+thumbsrc+'">';
				    html +='</div>';
				    html +='</div>';
					$("#topicList").append(html);
					
				});
				
				var obj = $("#topicList").find(".lab-good");
				obj.click(function(){
					var subtleVariant=$(this).find("span");
					var num = subtleVariant.html();
					var data_value=$(this).attr("data-value");
					notice.upvote(subtleVariant,num,data_value);
				});
				
				$("#Pagination").show();
			}

		//}
	});
	return false;
}

var notice ={
		
};

notice.upvote = function(obj,num,id) {

	var upvoteUrl=joy.getContextPath()+"/upvote/upvote.action";
	var data={
			termId:id,
			UpvoteType:1
	};
	$.getJSON(upvoteUrl,data,function(o){

		if(o.code=="0"){
			//$t.context.innerText=parseInt($t.context.innerText)+1;
			obj.html(parseInt(num)+1);
		} else {
			if (o && o.checkSession) {
				joy.util.handle_not_login(window);
			}
		}
	});
};




notice.search_handler=function(o){
	
    var v = o.find('a').attr("data-value");
    // set the total num
    $.ajax({	
    	url : joy.getContextPath() +'/notice/findTotalNum.action',
		type : 'post',
		data : {
			noticeType : v,
		},
		cache : false,
		dataType : 'json',
		success : function(re) {
			
      			//set the total num
				$("#PageNum").attr("value",re.data);
				$("#noticeType").attr("value",v);
				
			   //get the Init page data
				$("#Pagination").pagination(re.data, {
					num_edge_entries : 1, // 边缘页数
					num_display_entries : 8, // 主体页数
					callback : pageselectCallback,
					items_per_page : 6, // 每页显示6项
					prev_text : "&laquo",
					next_text : "&raquo"
				});
				
				},
    });
//  get the first page data
//	initPagination();
}


$(function() {
	$("#Pagination").hide();
	initPagination();

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
		
		notice.search_handler($self);
		
	});
	

});

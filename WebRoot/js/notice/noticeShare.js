var page = {
	pno : 1,
	psize : 6
};
var JOY_URL_ORG_NOTICE_LIST_URL = joy.getContextPath() + "/notice/shareNoticeList.action";



var ITEM_OPT_TEMPLATE = '<a href="{optUrl}" target="_blank" class="btn btn-default  buttonjo1joy" role="button">{optName}</a>';
var ITEM_CLOSE_TEMPLATE = '<a href="#"  onclick="org.closeConfirm(\'{optUrl}\')" data-value="{id}" class="btn btn-default  buttonjo1joy" role="button">{optName}</a>';

var ITEM_TEMPLATE= '<div class="row item-c">';
ITEM_TEMPLATE+='<div class="col-sm-12 col-md-12 col-lg-4 thumImages">';
ITEM_TEMPLATE+='<img  class="img-responsive" src="{imgSrc}" />';
ITEM_TEMPLATE+='</div>';
ITEM_TEMPLATE+='<div class="col-sm-12 col-md-12 col-lg-8"><h3>';
ITEM_TEMPLATE+='<a href="{link_url}"  target="_blank">{name}</a>';
ITEM_TEMPLATE+='</h3><p></p><p></p><p>{cdatetime}    &nbsp;&nbsp; 状态：{statusName} </br> </br>  {opt}</p>';
ITEM_TEMPLATE+='</div>';
ITEM_TEMPLATE+='</div>';

var notice = {
		
};

notice.closeConfirm=function(o){

	$('#myModal').find('.modal-title').text('确认');
	$('#myModal').find('.modal-body').text('确认关闭活动吗？');
	$('#myModal').find('#Confirm').click(function(){
		window.location.href=joy.getContextPath()+o;
	});
    $('#myModal').modal();
	
}

$(function() {
	
	//
	// 创建分页
	$(".pagination").pagination($("#totalPages").val(), {
		num_edge_entries : 3, // 边缘页数
		num_display_entries : 4, // 主体页数
		callback : pageselectCallback,
		items_per_page : page.psize, // 每页显示1项
		prev_text : "&laquo",
		next_text : "&raquo"
	});
	
	if($("#totalPages").val()==0){
		$(".pagination").css("display","none");
		$(".loading").css("display","block");
		$(".loading").css("visibility","visible");
	}else{
		
		$(".loading").css("display","none");
		$(".loading").css("visibility","hidden");
	}
	
	function pageselectCallback(page_index, jq) {
		page.pno = page_index + 1;
		$.getJSON(JOY_URL_ORG_NOTICE_LIST_URL, page, function(o) {

			if (o && o.data) {
				$("#notice-list").empty();
				$.each(o.data, function(i) {
					alert("test");

			//		var content = joy.template(ITEM_TEMPLATE, me);
					var content = "test";
					$("#notice-list").append(content);
				});

			} else {
				if (o && o.checkSession) {
					joy.util.handle_not_login(window);
				}
			}

		});
		return false;
	}
});
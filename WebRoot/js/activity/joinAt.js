var page = {
	pno : 1,
	psize : 5
};
var JOY_URL_ORG_AT_LIST_URL = joy.getContextPath() + "/join/joinList.action";
// var ITEM_TEMPLATE = '<li class="join-row"><div class="td td-1"><a href="{linkUrl}" class="title">{name}</a></div><div class="td td-2"></div><div class="td td-3">{addtime}</div><div class="td td-4"></div></li>';


var ITEM_TEMPLATE= '<div class="row">';
ITEM_TEMPLATE+='<div class="col-sm-12 col-md-3 col-lg-3 thumImages">';
ITEM_TEMPLATE+='<img alt="140x140" src="{imgSrc}" />';
ITEM_TEMPLATE+='</div>';
ITEM_TEMPLATE+='<div class="col-sm-12 col-md-8 col-lg-8"><h3>';
ITEM_TEMPLATE+='<a href="{linkUrl}" target="blank" class="title">{name}</a>';
ITEM_TEMPLATE+='</h3><p></p><p></p><p>报名时间：{addtime}</p>';
ITEM_TEMPLATE+='</div>';
ITEM_TEMPLATE+='</div>';

$(function() {
	// 创建分页
	$(".pagination").pagination($("#totalPages").val(), {
		num_edge_entries : 3, // 边缘页数
		num_display_entries : 4, // 主体页数
		callback : pageselectCallback,
		items_per_page : page.psize, // 每页显示1项
		prev_text : "上一页",
		next_text : "下一页"
	});
	// alert($("#totalPages").val());
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
		$.getJSON(JOY_URL_ORG_AT_LIST_URL, page, function(o) {

			if (o && o.data) {
				$("#join-list").empty();
				$.each(o.data, function(i) {
					var me = this;
					me.linkUrl = joy.getContextPath()
							+ "/at/detail.action?activity.id=" + me.atid;
					me.imgSrc = joy.getContextPath() + me.atthumb;
					var content = joy.template(ITEM_TEMPLATE, me);
					$("#join-list").append(content);
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
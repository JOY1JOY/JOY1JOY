var page = {
	pno : 1,
	psize : 5
};
var JOY_URL_ORG_AT_LIST_URL = joy.getContextPath() + "/at/orgAtList.action";

//var ITEM_TEMPLATE = '<li class="join-row"><div class="td td-1">'
//		+ '<a href="{link_url}" class="title">{name}</a>'
//		+ '<p class="gray">{stime}</p></div><div class="td td-2"></div>'
//		+ '<div class="td td-3">{statusName}（{partNum}/{pnum}）</div><div class="td td-4">'
//		+ '{opt}</li>';

var ITEM_OPT_TEMPLATE = '<a href="{optUrl}"  class="btn btn-default  buttonjo1joy" role="button">{optName}</a>';

var ITEM_TEMPLATE= '<div class="row">';
ITEM_TEMPLATE+='<div class="col-sm-12 col-md-3 col-lg-3 thumImages">';
ITEM_TEMPLATE+='<img alt="140x140" src="{imgSrc}" />';
ITEM_TEMPLATE+='</div>';
ITEM_TEMPLATE+='<div class="col-sm-12 col-md-8 col-lg-8"><h3>';
ITEM_TEMPLATE+='<a href="{link_url}" target="blank" class="title">{name}</a>';
ITEM_TEMPLATE+='</h3><p></p><p></p><p>发布时间：{cdatetime}    &nbsp;&nbsp; 状态：{statusName} </br> </br>  {opt}</p>';
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
				$(".join-list").empty();
				$.each(o.data, function(i) {
					var me = this;
					me.statusName = "";
					if (JOY_ACTIVITY_STATUS[me.status]) {
						me.statusName = JOY_ACTIVITY_STATUS[me.status];
					}
					me.imgSrc = joy.getContextPath() + me.poster;
					// 处理链接
					var link_url = joy.getContextPath()
							+ "/at/detail.action?activity.id=" + me.id;
					me.link_url = link_url;
					// 处理操作
					
					var opt = "";
					var opt_param = {
						id : me.id,
						optUrl : "#",
						optName : ""
					};
                   
					if (me.status == -2 || me.status == -1 ||me.status == 0 || me.status == 1) {
						opt_param.optName = "编辑";
						opt_param.optUrl = joy.getContextPath()
								+ "/at/edit.action?activity.id=" + me.id;
						opt += joy.template(ITEM_OPT_TEMPLATE, opt_param);
						opt +=' ';
						opt_param.optName = "关闭";
						opt_param.optUrl = joy.getContextPath()
								+ "/at/close.action?activity.id=" + me.id;
						opt += joy.template(ITEM_OPT_TEMPLATE, opt_param);
					
					} 
//					else {
//						opt_param.optName = "查看成员";
//						opt_param.optType = 2;
//						opt_param.optUrl = joy.getContextPath()
//						+ "/at/partiList.action?activity.id=" + me.id;
//						opt += joy.template(ITEM_OPT_TEMPLATE, opt_param);
//					}
					me.opt = opt;
          
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
var JOY_AT_JOIN_URL = joy.getContextPath() + "/join/add.action";
var JOY_AT_COLLECT_URL = joy.getContextPath() + "/collect/add.action";
var JOY_AT_COMMENT_URL = joy.getContextPath() + "/comment/add.action";

function opt_handler(t, id) {

	switch (t) {
	case 0:// 报名
		var pnum = $("#at_joiin_pnum").val();
		var premark = $("#at_joiin_remark").val();
		var piphone = $("#at_joiin_iphone").val();
		var pidcard = $("#at_joiin_idcard").val();
		if (!/[0-9]+/.test(pnum) || pnum < 1) {
			joy.alert('请正确输入报名人数!');
			break;
		}
		if (!/[0-9]+/.test(piphone) || piphone ==null) {
			joy.alert('请输入手机号码，以便联系!');
			break;
		}
		var param = {
			"atUser.pnum" : pnum,
			"atUser.atid" : id,
			"atUser.remark" : encodeURI(premark),
			"atUser.iphone" : piphone,
			"atUser.idcard" : pidcard
		};
		at_join(param);
		break;
	case 1:// 加入群组
		var qr = $("#at_gqr").val();
		if (qr && qr != "") {
			$("#at_qr_area").fadeToggle("slow");
		} else {
			joy.alert("对不起,该活动还没有创建群组!");
		}
		break;
	case 2:// 收藏
		var data = {
			"collect.atid" : id
		};
		at_collect(data);
		break;
	default:
		break;
	}
}
function at_join(data) {
	$.getJSON(JOY_AT_JOIN_URL, data, function(o) {
		if (o) {
			var code = o.code;
			if (code == 0) {
				joy.alert("恭喜您，报名成功!");
			} else if (code == 1) {
				joy.alert("您已报名此活动!");
			} else if (code == 2) {
				joy.alert("活动不存在，报名失败!");

			} else if (code == 3) {
				joy.alert("活动状态不正确，报名失败!");
			} else if (code == 4) {
				joy.alert("活动状态不正确，报名失败!");
			} else {
				if (o && o.checkSession) {
					joy.util.handle_not_login(window);
				} else
					joy.alert("对不起,报名失败!");
			}
		}
	});
}
function at_collect(data) {
	$.getJSON(JOY_AT_COLLECT_URL, data, function(o) {
		if (o && o.code == 0) {
			joy.alert("恭喜您，收藏成功!")
		} else {
			if (o && o.checkSession) {
				joy.util.handle_not_login(window);
			} else
				joy.alert("对不起，收藏失败!");
		}
	});
}


var detail={};

// 发表评论提交处理
detail.submitComment=function(){
	var id = $.trim($("#activityId").val());
	
	var at_comment = editor.getValue();
	if (at_comment == "") {
		alert("评论内容不能为空");
		return false;
	}
	var data = {
		'termId' : id,
		"comments. comment" : at_comment,
		'commentType': 0,
	};
	var url  = JOY_AT_COMMENT_URL;
	$.post(url,data, function(o){
		if (o && o.code == 0) {
			//如果处理成功，附加进去
			$.toast({
				text:"评论成功",
				hideAfter:1000 ,
				position:'mid-center',
				loaderBg:'#9EC600',
				bgColor: '#aaaaaa',
			});
			var me ={};
			me.mask_image = joy.getContextPath() + "" + o.data.icon;
			me.comment=o.data.comment;
			me.userid = o.data.userid;
			var content = joy.template(JOY_TEMPLATE_COMMENT, me);
			content = $(content).append($("#commentList").html());
			$("#commentList").empty();
			$("#commentList").append(content);
			
			} else {

				if (o && o.checkSession) {
					joy.util.handle_not_login(window);
				}else{
					joy.alert("对不起,评论提交失败:"+o.msg);
				}
				
		}
	},"json");
};

//获取评论
detail.getComment=function(){
	var num_entries = $("#PageNum").val();
	// 创建分页
	$("#Pagination").pagination(num_entries, {
		num_edge_entries : 1, // 边缘页数
		num_display_entries : 8, // 主体页数
		callback : pageselectCallback,
		items_per_page : 100, // 每页显示8项
		prev_text : "&laquo",
		next_text : "&raquo"
	});
}

//评论显示模板
var JOY_TEMPLATE_COMMENT='<li class="media">'
	                    +'<div class="media-left pull-left">'
	                    +'<a href="#">'
	                    +'<img class="media-object" src="{mask_image}" alt="...">'
	                    +'</a>'
	                    +'</div>'
	                    +'<div class="media-body">'
	                    +'<h4 class="media-heading">{userid}</h4>'
	                    +'{comment}'
	                    +'</div>'
	                    +'</li>';

//获取评论 分页回调函数
function pageselectCallback(page_index, jq) {
	page_index += 1;
	var id = $("#activityId").val();
	$.ajax({
		url : joy.getContextPath() +'/comment/commentList.action',
		type : 'post',
		data : {
			termId : id,
			pageIndex : page_index
		},
		cache : false,
		dataType : 'json',
		success : function(o) {
			if (o && o.data) {
				$("#commentList").empty();
				$.each(o.data, function(i) {
					var me = this;
					me.mask_image = joy.getContextPath() + "" + me.icon;
					var content = joy.template(JOY_TEMPLATE_COMMENT, me);
					$("#commentList").append(content);
				});
			
	         }
		}
	});
	return false;
}

//赞
detail.upvote = function(obj,num,id) {

	var upvoteUrl=joy.getContextPath()+"/upvote/upvote.action";
	var data={
			termId:id,
			UpvoteType:0
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

$(function() {
	

	// 绑定发表评论提交按钮
	$("#at_submit").on("click", function(e) {
		e.preventDefault();
		detail.submitComment();
	});
	

	//绑定点赞按钮
	$(".m-upvote").on("click",function(){
		var obj=$(this).find("span");
		var num = $(obj).html();
		var data_value=$(this).attr("data-value");
		detail.upvote(obj,num,data_value);
	});
	
	
	//加载评论
	detail.getComment();
	    

});

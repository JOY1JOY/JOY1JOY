/**
 * @author:xujun
 * @desc:defines-活动主页
 */
// 获取活动
at.get_activities = function() {
	// 查询
	var data = {
		pno : at.pno,
		psize : at.psize,
		minJoyFee : at.minJoyFee,
		maxJoyFee : at.maxJoyFee,
		status: at.status,
		time : at.time,
		type : at.type
	};
	

	$.getJSON(JOY_URL_ACTIVITY_LIST, data, function(o) {

		if (o && o.list) {
			var finished = true;
            
			
			var ik=1;
			objtemp=$("<div class='row'></div>");		
			
			$.each(o.list, function(i) {
				finished = false;
				var me = this;
				me.mask_image = joy.getContextPath() + "" + me.cuserIcon;// activity.get_mask_image();
				me.poster = joy.getContextPath() + me.poster;
				me.thumbnail = joy.getContextPath() + me.thumbnail;
				me.url = joy.getContextPath()
						+ "/at/detail.action?activity.id=" + me.id;
				me.time = me.stime.substring(0, 10);// +"~"+me.etime.substring(0,10);
				// me.typeName = at.get_dtype_name(me.type);
				me.statusName = JOY_ACTIVITY_STATUS[me.status];
				var content = joy.template(JOY_TEMPLATE_ACTIVITY, me);
				
				objtemp.append(content);

				if(ik%3==0){
					$("#list_activities").append(objtemp);
					objtemp=$("<div class='row'></div>");
				} 
				 
				if(o.list.length==ik){
					$("#list_activities").append(objtemp);
				}
				ik++;
			});
			
			var obj=$("#list_activities").find(".upvote");
			obj.click(function(){
				var subtleVariant=$(this).find(".subtleVariant");
				var num = subtleVariant.html();
				var data_value=$(this).attr("data-value");
				at.upvote(subtleVariant,num,data_value);
			});
			
			if (finished) {//
				$("#at-loading").hide();
				$("#at-no-more-loading").show();
			} else {
				$("#at-no-more-loading").hide();
				$("#at-loading").show();
			}
		}

	});
};

at.upvote = function(obj,num,id) {

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


// 加载更多
at.get_more = function() {
	at.pno = at.pno + 1;
	at.get_activities();
};
// 搜索
at.search_handler = function(t, o) {


	var v = o.attr("data-value");

	at.search_pre_handler(t, v);

	at.pno = 1;
	$("#list_activities").empty();
	at.get_activities();


};
at.search_pre_handler = function(t, v) {

	at.time=$(".cate-items[data='time_sw'] .cate-on").attr("data-value");
	at.type=$(".cate-items[data='type_sw'] .cate-on").attr("data-value");
	at.status=$(".cate-items[data='status_sw'] .cate-on").attr("data-value");

};
at.get_dtype_name = function(k) {
	var name = "";
	$.each($("#at_dtype a"), function(v) {
		if ($(this).attr("data-value") == k) {
			name = $(this).html();
			return false;
		}
	});
	return name;
}
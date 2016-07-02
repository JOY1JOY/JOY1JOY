/**
 * @author:xujun
 * @desc:configs-活动主页
 */

var at = {
	pno : 1,
	psize : 9,
	minJoyFee : 0,
	maxJoyFee : 0,
	status: -100,
	time : 0,
	type : "all"
};
// 活动列表URL
JOY_URL_ACTIVITY_LIST = joy.getContextPath() + "/at/list.action";
JOY_JOY_FEE_MIN = 0;// 可选费用的最小值
JOY_JOY_FEE_MAX = 100;// 可选费用的最大值
//JOY_CLASS_ITEM_SELECTED = "itemSelected";

JOY_CLASS_ITEM_SELECTED = "cate-on";
JOY_CLASS_ITEM_UNSELECTED = "tag";

// 活动展示模板
JOY_TEMPLATE_ACTIVITY_OLD = '<li>'
		+ '<div class="m-course">'
		+ '<div class="m-course-top">'
		+ '<a href="{url}"> <img src="{poster}"><span class="m-course-title-bg"></span>'
		+ '<span class="m-course-title">{name}</span> <span class="m-course-user-bg"></span>'
		+ '<span class="m-course-user" > <img src="{mask_image}"><em>{cuserName}</em></span></a>'
		+ '</div>' + '<div class="m-course-bottom">'
		+ '<div class="m-course-time">' + '<i></i> <span>{time}</span>'
		+ '</div>' + '<div class="m-course-address">'
		+ '<i></i> <span>{statusName}</span>' + '</div>' + '</div>' + '</div>'
		+ '</li>';

JOY_TEMPLATE_ACTIVITY = '<div class="col-6 col-sm-6 col-lg-4">'
 	+ '<a href="{url}" target="_blank" class="thumbnail">'
 	+ '<img alt="{name}" src="{thumbnail}"></a>'
 	+ ' <div class="recipe-title">'
 	+ '<h3>'
 	+ '<a href="{url}" target="_blank"><div class="title-over"><NOBR>{name}</NOBR></div></a>'
 	+ '</h3>'
 	+ '<a class="button smallSize secondaryText subtleVariant simpleVariant upvote" href="javascript:void(0);" data-value="{id}">'
 	+ '<div class="buttonContainer" ><div class="postVoteArrow" ></div><span >&nbsp;</span><span class="subtleVariant">{upvoteCount}</span></div>'
 	+ '</a>'
 	+ '<a class="button smallSize secondaryText subtleVariant simpleVariant " href="#" data-value="{id}">'
 	+ ' <div class="buttonContainer"><span data-reactid=".q.1.1.1.0.0.1.0:$0.1.1.1.$64071.0.1.0.1.0.0"><svg width="12" height="11" viewBox="0 0 12 11" xmlns="http://www.w3.org/2000/svg"><path d="M10.0124802,16.8320558 C9.21033653,16.0515289 8.72727273,15.044941 8.72727273,13.9462121 C8.72727273,11.4655331 11.1897066,9.45454545 14.2272727,9.45454545 C17.2648389,9.45454545 19.7272727,11.4655331 19.7272727,13.9462121 C19.7272727,16.4268911 17.2648389,18.4378788 14.2272727,18.4378788 C13.4722764,18.4378788 12.752811,18.3136428 12.0978565,18.0888377 C11.026169,18.7087928 8.93104025,19.527919 8.93104025,19.527919 C8.93104025,19.527919 9.63175021,17.8427438 10.0124802,16.8320558 Z" transform="translate(-8 -9)" fill="#FFF" fill-rule="evenodd"></path></svg></span><span >&nbsp;</span><span >{commentCount}</span></div>'
 	+ ' </a>'		
 	
    + '<a class="button smallSize secondaryText greySolidColor solidVariant" href="#" >'	
 	+ '<div class="buttonContainer" >{statusName}</div>'
 	+ '</a>'
 	
	+ '<div class="button smallSize secondaryText simpleVariant">'
	+ '<div class="buttonContainer"><div class="posttime" ></div><span >&nbsp;</span><span class="subtleVariant">{time}</span></div>'
	+ '</div>'
	
	
 	+ '</div>'
 	+ '</div>'
 	+ '</div>';

JOY_TEMPLATE_ACTIVITY_BAK= '<div class="col-6 col-sm-6 col-lg-4">'
  	+ '<a href="{url}" target="_blank" class="thumbnail">'
  	+ '<img alt="{name}" src="{poster}"></a>'
  	+ ' <div class="recipe-title">'
  	+ '<h3>'
  	+ '<a href="{url}" target="_blank">{name}</a>'
  	+ '</h3>'
 	+ '<div class="m-time"> <i></i>'
 	+ '<span>{time}</span>'
 	+ '<a class="btn btn-info btn-xs" href="{url}" role="button">{statusName}</a>'
  	+ '</div>'
  	+ '</div>'
  	+ '</div>';



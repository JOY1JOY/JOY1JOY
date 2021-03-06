<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	if (!"".equals(path)) {
		if (!path.endsWith("/")) {
			path = path + "/";
		}
	} else {
		path = "/";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>首页 - 动一动</title>
<meta name="keywork" value="动一动,白领,户外活动,学习,周末无聊,周末干嘛,有趣">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1" />
<meta name="description" content="网站描述">
<link rel='icon' href="<%=path%>images/favcion.ico" type=‘image/x-ico’ />
<link href="<%=path%>resCss/detail.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=path%>resCss/simditor.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>resCss/jquery.toast.min.css" />

<jsp:include page="../base/base_import_jquery1.11.2.jsp"></jsp:include>

<script type="text/javascript" src="<%=path%>js/activity/detail.js"></script>
</head>

<body>

	<jsp:include page="../base/joy1joy_header.jsp"></jsp:include>
	<div class="page-body">

		<div class="fetature container">

			<div class="row">
				<div class="col-10 col-sm-10 col-lg-6">
					<a href="#"> <img alt="" class="img-responsive"
						src="<%=path.substring(0, path.length() - 1)%><s:property value='activity.poster' />"></a>
				</div>
							<input name="id" id="activityId" type="hidden" value="${activity.id}">
							<input type="hidden" id="PageNum" value="${activity.commentPageNum}" />
							
				
				<div class="col-10 col-sm-10 col-lg-3">
					<h3>
						<s:property value="activity.name" />
						<!--        <a class="btn btn-info btn-l" href="javascript:opt_handler(0,${activity.id});" role="button">报名参加</a> -->
					</h3>

					<p>
					<div class="m-time">
						<i></i> <span><s:date name="activity.stime"
								format="yyyy-MM-dd" />
					</div>
					</p>

					<p>
					<div class="m-place">
						<i></i> <span><s:property value="activity.addressName" /></span>
					</div>
					</p>

					<div class="m-money">
						<i></i> <span><s:property value="activity.joyFee" /></span>
					</div>

					<div class="m-upvote" data-value="${activity.id}">
						<i></i> <span>${activity.upvoteCount}</span>
					</div>

					<div class="share">

						<!-- JiaThis Button BEGIN -->
						<div class="jiathis_style">
							<span class="jiathis_txt">分享到：</span> </a>
							<a class="jiathis_button_weixin"></a>
							<a class="jiathis_button_tsina"></a>

						</div>

					</div>
					<div class="author">
						<a href="#"> <img
							src="<s:property value="activity.cuserIcon" />"></img> <s:property
								value="activity.cuserName" /></a>
					</div>
				</div>

			</div>

			<div class="row">

				<div class="col-10 col-sm-10 col-lg-6">

					<div class="content">
						<div class="d-con">${activity.description}</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-10 col-sm-10 col-lg-6">
					<p></p>
					增加评论
					<p>
						<textarea placeholder="" id="at_comment" name="activity.comment"></textarea>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-10 col-sm-10 col-lg-6">
						<button type="button" class="btn m-btn m-btn-primary"
							id="at_submit">发表</button>
					</div>
				</div>
			</div>


			<div class="row">
				<div class="col-10 col-sm-10 col-lg-6">
					<p></p>
					全部评论
					<p></p>
				</div>
			</div>


			<div class="row">
				<div class="col-10 col-sm-10 col-lg-6">
					<ul class="media-list" id="commentList">
					
					</ul>
				</div>
			</div>
			
				<div class="row">
					<div class="col-10 col-sm-10 col-lg-6">
					<nav>
					<ul class="pagination pagination-sm" id="Pagination" style="display:none" >
	
	
					</ul>
					</nav>
					</div>
			</div>
			
			

		</div>
	</div>

	<jsp:include page="../base/joy1joy_footer.jsp"></jsp:include>
 
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>

	<script type="text/javascript" src="<%=path%>js/jquery.pagination.js"></script>
	<script type="text/javascript" src="<%=path%>resJs/jquery.toast.min.js"></script>
	<script type="text/javascript" src="<%=path%>resJs/module.js"></script>
	<script type="text/javascript" src="<%=path%>resJs/hotkeys.js"></script>
	<script type="text/javascript" src="<%=path%>resJs/uploader.js"></script>
	<script type="text/javascript" src="<%=path%>resJs/simditor.js"></script>

	<script type="text/javascript">
    //绑定发表评论框
    var toolbar = [ 'italic', 'underline', 'ol', 'ul', 'image' ];
    var editor = new Simditor({
	textarea : $('#at_comment'),
	upload : {
		url : joy.getContextPath() + '/at/uploadEdit.action', // 文件上传的接口地址
		params : null, // 键值对,指定文件上传接口的额外参数,上传的时候随文件一起提交
		fileKey : 'upload', // 服务器端获取文件数据的参数名
		connectionCount : 3,
		leaveConfirm : '正在上传文件'
	},
	toolbar : toolbar, // 工具栏
// optional options
});
</script>
</body>
</html>
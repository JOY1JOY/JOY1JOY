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
<title>动一动 JOY1JOY.COM</title>
<meta name="keywork" value="动一动，白领，户外活动，学习，周末无聊，周末干嘛,有趣">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1" />
<link rel='icon' href="<%=path%>images/favcion.ico" type=‘image/x-ico’ />
<meta name="description" content="网站描述">
<jsp:include page="../base/base_import_jquery1.11.2.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="<%=path%>resCss/font-awesome.min.css">
<link href="<%=path%>css/notice.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%=path%>resCss/simditor.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>resCss/jquery.toast.min.css" />

<script type="text/javascript" src="<%=path%>js/notice/noticeDetail.js"></script>
</head>

<body>
	<jsp:include page="../base/joy1joy_header.jsp"></jsp:include>


	<div class="container">
		<div class="row">
			<div class="col-12 col-sm-10 col-lg-8">

				<div class="author">
					<a href="#"> <img src="${tnotice.icon}"></img>
						${tnotice.userid}
					</a>
					
						<input name="id" id="noticeId" type="hidden" value="${tnotice.id}">
						<input type="hidden" id="PageNum" value="${tnotice.commentPageNum}" />
				</div>
				<p></p>
				<p class="gray">
					<s:date name="#tnotice.cdatetime" format="yyyy.MM.dd" />
				</p>
				<a href="javascript:void(0);">${tnotice.title}</a>
				<p class="blank">${tnotice.content}</p>
			</div>
		</div>

        <div class="row">
        <div class="col-12 col-sm-10 col-lg-8 head">
        <div class="shares pull-right">
        <span id="file-good-link" class="good-link lab-good" data-value="${tnotice.id}">${tnotice.upvoteCount} </span>
        
        
        </div>
        </div>
        </div>
        
	<div class="share">

						<!-- JiaThis Button BEGIN -->
						<div class="jiathis_style">
							<span class="jiathis_txt">分享到：</span> 
								<a class="jiathis_button_weixin"></a>
							<a class="jiathis_button_tsina"></a>

						</div>

					</div>
					

		<div class="row">
			<div class="col-12 col-sm-10 col-lg-8">
				<p></p>
				增加评论
				<p>
					<textarea placeholder="" id="noticeContent" name="noticeContent">${activity.description}</textarea>
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
					<ul class="pagination pagination-sm" id="Pagination"
						style="display: none">
					</ul>
				</nav>
			</div>
		</div>


	</div>
	<jsp:include page="../base/joy1joy_footer.jsp"></jsp:include>


	<script type="text/javascript" src="<%=path%>js/jquery.pagination.js"></script>
		<script type="text/javascript" src="<%=path%>resJs/jquery.toast.min.js"></script>
	
	<script type="text/javascript" src="<%=path%>resJs/module.js"></script>
	<script type="text/javascript" src="<%=path%>resJs/hotkeys.js"></script>
	<script type="text/javascript" src="<%=path%>resJs/uploader.js"></script>
	<script type="text/javascript" src="<%=path%>resJs/simditor.js"></script>
	<script type="text/javascript" src="<%=path%>resJs/global.js"></script>
	<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
	
	<script type="text/javascript">
   
    var toolbar = ['italic', 'underline', 'ol', 'ul', 'image'];
    var editor = new Simditor({
  textarea: $('#noticeContent'),
  upload : {
            url : joy.getContextPath() + '/at/uploadEdit.action', //文件上传的接口地址
            params: null, //键值对,指定文件上传接口的额外参数,上传的时候随文件一起提交
            fileKey: 'upload', //服务器端获取文件数据的参数名
            connectionCount: 3,
            leaveConfirm: '正在上传文件'
        } ,
  toolbar : toolbar,  //工具栏
});

</script>
</body>
</html>
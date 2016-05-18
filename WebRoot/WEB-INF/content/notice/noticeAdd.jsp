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
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
		<link rel='icon' href="<%=path%>images/favcion.ico" type=‘image/x-ico’ />
		<meta name="description" content="网站描述">
		<jsp:include page="../base/base_import_jquery1.11.2.jsp"></jsp:include>
		<link href="<%=path%>css/publishP.css" rel="stylesheet">
		<link href="<%=path%>css/footer.css" rel="stylesheet">

		<link rel="stylesheet" type="text/css"
			href="<%=path%>resCss/font-awesome.min.css">
		<link rel="stylesheet" type="text/css"
			href="<%=path%>resCss/publish.css">
		<link rel="stylesheet" type="text/css"
			href="<%=path%>resCss/style.css">
			
		<link rel="stylesheet" type="text/css"
			href="<%=path%>resCss/bootstrap-datetimepicker.min.css">
		<link rel="stylesheet" type="text/css"
			href="<%=path%>resCss/simditor.css" />



		<script type="text/javascript"
			src="<%=path%>My97DatePicker/WdatePicker.js"></script>

	<script type="text/javascript" src="<%=path%>js/notice/noticeAdd.js"></script>

	</head>

	<body>
		<jsp:include page="../base/joy1joy_header.jsp"></jsp:include>



		<div class="container">
			<div class="row">
				<div class="col-md-10">
					<div class="span12 pub-title">
						<h3>
							发布话题
						</h3>
					</div>
					<form class="form-horizontal " id="activity_form" action="<%=path%>notice/saveNotice.action"
						name="noticeForm" method="post">
										
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-4 col-md-2 control-label">
								<h4>
									标题：
								</h4>
							</label>
							<div class="col-sm-8 col-md-6">
								<input type="title" class="form-control" name="noticeTitle" value="${activity.name}" id="at_name" placeholder="标题">
							</div>
						</div>

					
						
						<div class="form-group">
							<label class="col-sm-4 col-md-2  control-label">
								<h4>
									标签：
								</h4>
							</label>
							<div class="col-sm-5">
								<!-- Multiple Checkboxes -->
									<s:iterator var="t" value="#request.dcits">
								<label class="checkbox-inline">
									<input type="checkbox" name="type" id="inlineCheckbox1" value=value="${t.dkey}">
									${t.dvalue}
								</label>
								
								</s:iterator>
							</div>
						</div>
						


						<div class="form-group">
							<label class="col-sm-4 col-md-2  control-label">
								<h4>
									内容：
								</h4>
							</label>
							<div class="col-sm-12 col-md-9">
								<textarea  placeholder="" id="noticeContent"
							name="noticeContent" autofocus>${activity.description}</textarea>
							</div>
						</div>





						<div class="form-group">
						<div class="col-sm-offset-2 col-sm-8">
     <a href="javascript:void(0);" class="m-btn m-btn-primary" id="at_submit1">
发布</a>
    </div>
    <!--  
							<div class="col-sm-offset-2 col-sm-4 col-md-2">
								<button type="submit" class="btn btn-default btn-info btn-block" id="at_submit1">
									发布
								</button>
							</div>
  -->
							<div class=" col-sm-4 col-md-2">
								<button type="submit" class="btn btn-default btn-info btn-block" id="at_submit2">
									保存草稿
								</button>
							</div>

							<div class=" col-sm-4 col-md-2">
								<button type="submit" class="btn btn-default btn-info btn-block">
									预览
								</button>
							</div>

						</div>
					</form>
				</div>


			</div>
		</div>



		<jsp:include page="../base/joy1joy_footer.jsp"></jsp:include>
		
		<script type="text/javascript"
			src="<%=path%>resJs/bootstrap-datetimepicker.min.js"></script>
			<script type="text/javascript"
			src="<%=path%>resJs/bootstrap-datetimepicker.zh-CN.js"></script>

		<script type="text/javascript" src="<%=path%>resJs/module.js"></script>
		<script type="text/javascript" src="<%=path%>resJs/hotkeys.js"></script>
		<script type="text/javascript" src="<%=path%>resJs/uploader.js"></script>
		<script type="text/javascript" src="<%=path%>resJs/simditor.js"></script>
		<script type="text/javascript" src="<%=path%>resJs/global.js"></script>
		<script type="text/javascript">
   
    var toolbar = ['bold', 'italic', 'underline', 'strikethrough','image', 'hr','indent', 'outdent' ];
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
  //optional options
});

</script>
	</body>
</html>
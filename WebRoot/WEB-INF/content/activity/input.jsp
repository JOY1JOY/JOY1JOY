<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>

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
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
		<meta charset="utf-8">
		<title>动一动 JOY1JOY.COM</title>
		<meta name="keywork" value="动一动，白领，户外活动，学习，周末无聊，周末干嘛,有趣">
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
			href="<%=path%>resCss/webuploader.css">
			
		<link rel="stylesheet" type="text/css"
			href="<%=path%>resCss/bootstrap-datetimepicker.min.css">
		<link rel="stylesheet" type="text/css"
			href="<%=path%>resCss/simditor.css" />


		<script type="text/javascript" src="<%=path%>js/jquery.Jcrop.min.js"></script>
		<link href="<%=path%>css/jquery.Jcrop.min.css">

		<script type="text/javascript"
			src="<%=path%>My97DatePicker/WdatePicker.js"></script>

		<script type="text/javascript" src="<%=path%>js/activity/input.js"></script>
		<script type="text/javascript"
			src="<%=path%>js/activity/input-config.js"></script>
		<script type="text/javascript"
			src="<%=path%>js/activity/input-define.js"></script>

	</head>

	<body>
		<jsp:include page="../base/joy1joy_header.jsp"></jsp:include>

		<div class="container">
			<div class="row">
				<div class="col-md-10">
					<div class="span12 pub-title">
						<h3 id="tittleid">
							发布活动
						</h3>
					</div>
					<form class="form-horizontal " id="activity_form" action=""
						method="post">
										<input type="hidden" id="at_optType" value="${editOpt}">
							<input type="hidden" name="activity.status" id="at_status"
						value="-1">
						<input type="hidden" name="activity.id" id="at_id"
							value="${activity.id}">
						<input type="hidden" name="activity.status" id="at_status"
							value="${activity.status}">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-4 col-md-2 control-label">
								<h4>
									标题：
								</h4>
							</label>
							<div class="col-sm-8 col-md-6">
								<input type="title" class="form-control" name="activity.name" value="${activity.name}" id="at_name" placeholder="活动标题">
							</div>
						</div>

						<div class="form-group">
							<label for="inputAddress" class="col-sm-4 col-md-2 control-label">
								<h4>
									地点：
								</h4>
							</label>
							
<!--  
    <div class="col-sm-4 col-md-3">
        <select class="form-control"> 
      <option>河南省</option> 
      </select>
    </div>

        <div class="col-sm-4 col-md-3">
        <select class="form-control"> 
      <option>郑州市</option> 
   
      </select>
      
    </div>
    -->

							<div class="col-sm-8 col-md-6">
								<select  class="form-control" id="saddress" value="${activity.address}" name="activity.address">
									<option value="zhengzhou">
										郑州市
									</option>
									<option value="hangzhou">
										杭州市
									</option>
									<option value="shanghai">
										上海市
									</option>
									<option value="beijing">
										北京市
									</option>

								</select>
							</div>

						</div>


						<div class="form-group">
							<label for="inputPassword3"
								class="col-sm-4 col-md-2 control-label">
								<h4>
									时间：
								</h4>
							</label>
							<div class="col-sm-4">
								<div class="input-group date form_date col-md-12" data-date=""
									data-date-format="yyyy MM dd" data-link-field="dtp_input2"
									data-link-format="yyyy-mm-dd">
									<input class="form-control" size="50" type="text" value="<s:date name='activity.stime' format='yyyy-MM-dd' />"
									id="at_stime" name="activity.stime" placeholder="开始时间">

									<span class="input-group-addon"><span
										class="glyphicon glyphicon-calendar"></span> </span>
								</div>
								<input type="hidden" id="dtp_input2" value="" />
								<br />
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
								
								<c:forEach var="t" items="${ dtypes}">
								
									<label class="checkbox-inline">
										
										<c:if test="${ fn:contains(activity.type, t.dkey) }">
											<input type="checkbox" name="type" id="inlineCheckbox1" value="${t.dkey}" checked="checked">
										</c:if>
										
										<c:if test="${! fn:contains(activity.type,t.dkey) }">
											<input type="checkbox" name="type" id="inlineCheckbox1" value="${t.dkey}">
										</c:if>
										
										${t.dvalue}
										
									</label>								
								</c:forEach>

							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 col-md-2  control-label">
								<h4>
									费用：
								</h4>
							</label>
							<div class="col-sm-4 col-md-2">
								<input type="fee" class="form-control" name="activity.joyFee" value="${activity.joyFee}" id="at_joyFee"
									placeholder="活动费用">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 col-md-2  control-label">
								<h4>
									海报：
								</h4>
							</label>
							<div class="col-sm-8 col-md-6">
								<div id="uploader">
									<div class="queueList">
										<div id="dndArea" class="placeholder">
											<div id="filePicker"></div>

										</div>
									</div>
									<div class="statusBar" style="display: none;">
										<div class="progress">
											<span class="text">0%</span>
											<span class="percentage"></span>
										</div>
										<div class="info"></div>
										<div class="btns">
											<div id="filePicker2">继续添加</div>
											<div class="uploadBtn">
												开始上传
											</div>
										</div>
									</div>
								</div>
								
								

								
								<!-- 
								<div id="uploader">
    <div id="fileList" class="uploader-list"></div>
    <div id="filePicker">选择图片</div>
</div>				
-->
							</div>
							<input type="hidden" id="at_poster" value="${activity.poster}"
								name="activity.poster">
						</div>


						<div class="form-group">
							<label class="col-sm-4 col-md-2  control-label">
								<h4>
									内容：
								</h4>
							</label>
							<div class="col-sm-12 col-md-9">
								<textarea  placeholder="" id="at_description"
							name="activity.description" autofocus>${activity.description}</textarea>
							</div>
						</div>





						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-4 col-md-2">
								<button type="button" class="btn m-btn m-btn-primary" id="at_submit1">
									发布
								</button>
							</div>

							<div class=" col-sm-4 col-md-2">
								<button type="button" class="btn m-btn m-btn-primary" id="at_submit2">
									保存草稿
								</button>
							</div>
                            <!--  
							<div class=" col-sm-4 col-md-2">
								<button type="button" class="btn m-btn m-btn-primary" id="at_submit3">
									预览
								</button>
							</div>
							-->

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
		<script type="text/javascript" src="<%=path%>resJs/webuploader.js"></script>
		<script type="text/javascript" src="<%=path%>resJs/upload.js"></script>
		<script type="text/javascript" src="<%=path%>resJs/module.js"></script>
		<script type="text/javascript" src="<%=path%>resJs/hotkeys.js"></script>
		<script type="text/javascript" src="<%=path%>resJs/uploader.js"></script>
		<script type="text/javascript" src="<%=path%>resJs/simditor.js"></script>
		<script type="text/javascript" src="<%=path%>resJs/global.js"></script>
		<script type="text/javascript">
		
	var poster= '${activity.poster}';
	var isEdit=$("#at_optType").val();
	
	if("1"===isEdit){
		$("#tittleid").html("编辑活动");	
	}
	
    $('.form_date').datetimepicker({
    format: 'yyyy-mm-dd',
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    var toolbar = ['bold', 'italic', 'underline', 'strikethrough','fontScale','color','table','ol','ul','image', 'hr','indent', 'outdent' ];
    var editor = new Simditor({
    textarea: $('#at_description'),
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

$("#at_name").focus();
</script>
	</body>
</html>
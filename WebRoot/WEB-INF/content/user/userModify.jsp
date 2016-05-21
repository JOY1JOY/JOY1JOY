<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	//System.out.println(path + "************");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
		<meta charset="utf-8">
		<title>首页 - 动一动</title>
		<meta name="keywork" value="动一动,白领,户外活动,学习,周末无聊,周末干嘛,有趣">
		<link rel='icon' href="<%=path%>images/favcion.ico" type=‘image/x-ico’ />
		<meta name="description" content="网站描述">
		<jsp:include page="../base/base_import_jquery1.11.2.jsp"></jsp:include>
		<script type="text/javascript"
			src="<%=path%>/My97DatePicker/WdatePicker.js"></script>
		<link href="<%=path%>/css/footer.css" rel="stylesheet">
        <link href="<%=path%>/resCss/user.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="<%=path%>/resCss/bootstrap-datetimepicker.min.css">
		<script type="text/javascript" src="<%=path%>/js/user/userModify.js"></script>
		  
	</head>

	<body>
		<jsp:include page="../base/joy1joy_header.jsp"></jsp:include>

		<div class="main wrap">


			<div class="jumbotron">
				<div class="container">
				个人设置
				</div>
			</div>

			<div class="container">


				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active">
						<a href="#home" aria-controls="home" role="tab" data-toggle="tab">个人信息</a>
					</li>
					<li role="presentation">
						<a href="#profile" aria-controls="profile" role="tab"
							data-toggle="tab">修改头像</a>
					</li>
					<li role="presentation">
						<a href="#messages" aria-controls="messages" role="tab"
							data-toggle="tab">修改密码</a>
					</li>
				</ul>


				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active tab-pad" id="home">
					
					<div class="container">
						<form id="userEditForm" name="userEditForm" method="post"
							action="<%=path%>/user/updateUser.action"
							enctype="multipart/form-data" class="form-horizontal">

							<div class="form-group">
								<label for="userId" class="col-sm-2 control-label">
									<h4>
										用户名：
									</h4>
								</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="userId"
										placeholder="用户名" name="userId" value="${tUsers.userid}">
								</div>
							</div>

							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">
									<h4>
										心情签名：
									</h4>
								</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="state" type="text"
										name="state" value="${tUsers.state}">
								</div>
							</div>

							<div class="form-group" id="youxiang">
								<label for="email" class="col-sm-2 control-label">
									<h4>
										邮箱号：
									</h4>
								</label>
								<div class="col-sm-4">
									<input id="email" type="email" class="form-control"
										name="email" value="${tUsers.email}" />
								</div>
							</div>

							<div class="form-group" id="xingbie">
								<label for="gender" class="col-sm-2 control-label">
									<h4>
										性别：
									</h4>
								</label>
								<div class="col-sm-4">
									<label class="radio-inline">
										<input type="radio" name="gender" id="inlineRadio1" value="0">
										男生
									</label>
									<label class="radio-inline">
										<input type="radio" name="gender" id="inlineRadio2" value="1">
										女生
									</label>
								</div>
							</div>
							
								<div class="form-group" id="xingbie">
								<label for="birth" class="col-sm-2 control-label">
									<h4>
										生日：
									</h4>
								</label>
								<div class="col-sm-4">
											<div class="input-group date form_date col-md-12" data-date=""
									data-date-format="yyyy MM dd" data-link-field="dtp_input2"
									data-link-format="yyyy-mm-dd">
									<input class="form-control" size="50" type="text" value="<s:date name='#tUsers.birthdate' format='yyyy-MM-dd' />"
									id="birthday" name="birthday">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-calendar"></span> </span>
								</div>
								</div>
							</div>


							<div class="form-group">
							<label for="mobile" class="col-sm-2 control-label">
								<h4>
									手机号：
								</h4>
							</label>
							<div class="col-sm-4">
								<input id="mobile" type="text" name="mobile"
									class="form-control" value="${tUsers.mobile}">
							</div>
						</div>

						<div class="form-group">
							<label for="QQ" class="col-sm-2 control-label">
								<h4>
									QQ：
								</h4>
							</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="qq" type="text"
									name="qq" value="${tUsers.qq}">
							</div>
						</div>

						<div class="form-group">
							<br>
							<br>
							<div class="col-md-offset-2">
							<button class="m-btn m-btn-primary" type="button"
								id="editUserInfo">
								      保 存
							</button>
							</div>
						</div>
						</form>
						</div>
					</div>



					<div role="tabpanel" class="tab-pane tab-pad" id="profile">
						<div class="container">
						<div class="row">
						<form id="userEditImgForm" name="userEditImgForm" method="post"
							action="<%=path%>/user/updateUserImg.action"
							enctype="multipart/form-data" class="form-horizontal">

		<input type="hidden" class="form-control" id="userId"
			   placeholder="用户名" name="userId" value="${tUsers.userid}">

									<div class="col-xs-12 col-sm-4 col-md-1">

										<a href="javascript:void(0);" style="cursor: default;"><img
												src="<%=path%>/images/hehe_default_avatar.png"
												id="imgheadCircle" class="img-circle" title="头像" alt="头像"
												style="width: 70px; height: 70px;"> </a>
									</div>
									<div class="col-xs-12 col-sm-4 col-md-2">
										<div id="preview">
											<a href="javascript:void(0);" style="cursor: default;"><img
													src="<%=path%>/images/hehe_default_avatar.png" id="imghead"
													title="头像" alt="头像" style="width: 160px; height: 160px;">
											</a>
										</div>
	                                  </div>
		<div class="col-xs-12 col-sm-4 col-md-2">
										<div class="form-group">
											<a href="#"
												style="position: relative; display: inline-block; width: 40px; height: 40px;">
												<!--  <img alt="更换头像" src="<%=path%>/images/icon-edit.png" id="changeHead" />   -->
												<input type="file" onchange="previewImage(this)"
													name="myFile" id="imgOne" value="浏览"
													style="position: absolute; right: -40px; top: 0; font-size: 30px; opacity: 0; filter: alpha(opacity =     0);" /></input>
												<button class="m-btn m-btn-primary" type="button">
													浏览
												</button> </a>
										</div>




										<div class="form-group">
											<button class="m-btn m-btn-primary" type="button"
												id="editUserImgInfo">
												保 存
											</button>
										</div>
											</div>
										
								</form>
					
						</div>
						</div>
					</div>
					
					
					<div role="tabpanel" class="tab-pane" id="messages">
					<div class="container">
						待完善中..
						</div>
					</div>
					
					
					
				</div>
			</div>
		</div>





		<div class="footer-placeholder"></div>

		<jsp:include page="../base/joy1joy_footer.jsp"></jsp:include>
		
			<script type="text/javascript"
			src="<%=path%>/resJs/bootstrap-datetimepicker.min.js"></script>
		<script type="text/javascript"
			src="<%=path%>/resJs/bootstrap-datetimepicker.zh-CN.js"></script>
	

		<script type="text/javascript">
		
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
    
	function getBrowserInfo()
	{
		var agent = navigator.userAgent.toLowerCase() ;
		
		var regStr_ie = /msie [\d.]+;/gi ;
		var regStr_ff = /firefox\/[\d.]+/gi
		var regStr_chrome = /chrome\/[\d.]+/gi ;
		var regStr_saf = /safari\/[\d.]+/gi ;
		//IE
		if(agent.indexOf("msie") > 0)
		{
			return agent.match(regStr_ie) ;
		}
		
		//firefox
		if(agent.indexOf("firefox") > 0)
		{
			return agent.match(regStr_ff) ;
		}
		
		//Chrome
		if(agent.indexOf("chrome") > 0)
		{
			return agent.match(regStr_chrome) ;
		}
		
		//Safari
		if(agent.indexOf("safari") > 0 && agent.indexOf("chrome") < 0)
		{
			return agent.match(regStr_saf) ;
		}
	
	}

	$(function() {
	
	

		var gender = "${tUsers.gender}";
		
		if(gender.length>0){
		$(":radio[value=" + gender + "]").attr("checked", true);
		}
		var iconImg = "${tUsers.icon}";
		if (iconImg != "") {
			var path = joy.getContextPath();
			$("#imghead").attr("src", path  + iconImg);
			$("#imgheadCircle").attr("src", path  + iconImg);
		}
		
		var browser = getBrowserInfo() ;
		//alert(browser);
		var verinfo = (browser+"").replace(/[^0-9.]/ig,"");
		//alert(parseInt(verinfo));
		if(parseInt(verinfo)<=8)
		{
			$("#imgOne").removeClass("ie9");
			$("#imgOne").addClass("ie8");
		}else
		{
			$("#imgOne").removeClass("ie8");
			$("#imgOne").addClass("ie9");
		}
	});
</script>

	</body>
</html>

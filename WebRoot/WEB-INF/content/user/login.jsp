<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	if (!"".equals(path)) {
		path = path + "/";
	} else {
		path = "/";
	}
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
		<jsp:include page="../base/base_import_jquery1.11.2.jsp" />
		<link href="<%=path%>resCss/login.css" type="text/css"
			rel="stylesheet" />
		<script type="text/javascript" src="<%=path%>js/jquery.cookie.js"></script>
		<script type="text/javascript" src="<%=path%>js/user/login.js"></script>
		<link href="<%=path%>resCss/bootstrapVa.css" type="text/css" rel="stylesheet" />
        <link href="<%=path%>resCss/bootstrapValidator.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="<%=path%>resJs/bootstrapValidator.min.js"></script>
	</head>


	<body>


		<jsp:include page="../base/joy1joy_header.jsp" />


		<div class="container login-wrap">
			<div class="span12">
				<h4>
					登录动一动
				</h4>
			</div>
			<hr>
			<form class="form-horizontal" id="login">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-4 control-label">
						<h4>
							用户名：
						</h4>
					</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="loginName" name="userId"
							placeholder="用户名">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-4 control-label">
						<h4>
							密码：
						</h4>
					</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" id="loginPass" name="password"
							placeholder="密码">
					</div>
				</div>
				<div class="form-group ">
					<div class="col-sm-offset-4 col-sm-8">
						<div class="checkbox">
							<label>
								<input type="checkbox" id="rememberMe" name="rememberMe">
								记住我
							</label>
						</div>
						<div class="pull-right">
							<a href="#">忘记密码?</a>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-8">
						 <button type="submit" class="log_btn m-btn m-btn-primary" id="log_btn">
							登陆
					
					</div>
				</div>
			</form>

			<div class="tip_reg">
				<P>
					还没有动一动账户
				</P>
				<P>
					马上注册，发现趣味的活动！
					<a href="javascript:void(0);" class="flatReg">立即注册</a>
				</P>
			</div>
			
	</div>


 <jsp:include page="../base/joy1joy_footer.jsp" />

</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="com.joy1joy.app.bean.TUsers"%>
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
<%
	Object o = request.getSession().getAttribute("users");
	String userID = "";
	if (null != o) {
		TUsers user = (TUsers) o;
		userID = user.getUserid();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
		<meta charset="utf-8">
		<title>首页 - 动一动</title>
		<meta name="keywork" value="动一动，白领，户外活动，学习，周末无聊，周末干嘛">
		<link rel='icon' href="<%=path%>images/favcion.ico" type=‘image/x-ico’ />
		<meta name="description" content="网站描述">
		<link href="<%=path%>css/pagination.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css"
			href="<%=path%>resCss/person.css">
		<link rel="stylesheet" type="text/css"
			href="<%=path%>resCss/style.css">
		<jsp:include page="../base/base_import_jquery1.11.2.jsp" />

	</head>

	<body>
		<jsp:include page="../base/joy1joy_header.jsp"></jsp:include>


		<div class="main wrap">



			<div class="jumbotron">
				<div class="container">
					<div class="row clearfix">

						<div class="col-md-4 user-info">
							<div class="user-name">
								<%=userID%>
							</div>
							<div></div>
							<div class="fans">
								<a href="#"> 粉丝 <span>3</span> </a>
								<a href="#" class="left-border"> 关注 <span>17</span> </a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="container" >

				<div class="col-sm-12 col-md-10 col-lg-10" >
                   <div class="container" id="join-list">
                   </div>
					<div class="row">
						<div id="Pagination" class="pagination"></div>
						<div class="loading" style="display: none">
							还没有数据……
						</div>
					</div>

				</div>

				<div class="col-sm-8 col-md-2 col-lg-2 bs-docs-sidebar">
					<ul class="nav nav-list bs-docs-sidenav">
						<li>
							<a href="<%=path%>at/joinAt.action"> 已报名活动</a>
						</li>
						<li class="active">
							<a href="<%=path%>at/organize.action"> 已发布活动</a>
						</li>
						<li>
							<a href="#"> 已发布话题</a>
						</li>

					</ul>
				</div>
				
			</div>
			</div>

		<input type="hidden" id="totalPages" value="${totalPages}">



		<jsp:include page="../base/joy1joy_footer.jsp"></jsp:include>
	</body>

	<script type="text/javascript" src="<%=path%>js/jquery.pagination.js"></script>
	<script type="text/javascript" src="<%=path%>js/activity/organize.js"></script>
</html>
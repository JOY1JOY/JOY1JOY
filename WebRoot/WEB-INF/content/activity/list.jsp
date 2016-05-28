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
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
		<link rel='icon' href="<%=path%>images/favcion.ico" type=‘image/x-ico’ />
		<meta name="description" content="网站描述">
		<jsp:include page="../base/base_import_jquery1.11.2.jsp"></jsp:include>
		<link href="<%=path%>resCss/list.css" rel="stylesheet">

		<script type="text/javascript"
			src="<%=path%>js/activity/list-config.js"></script>
		<script type="text/javascript"
			src="<%=path%>js/activity/list-define.js"></script>
		<script type="text/javascript" src="<%=path%>js/activity/list.js"></script>
	</head>

	<body>
		<jsp:include page="../base/joy1joy_header.jsp"></jsp:include>

		<div class="page-body">
			<div class="fetature container">


				<div class="cate" >
					<span class="cate-label">类&emsp;别:</span>
					<span class="cate-items" data="type_sw">
						<a class="cate-on" data-value="all">所有</a>
						<s:iterator var="t" value="dtypes">
						    <a href="#"  class="tag" data-value="${t.dkey}">${t.dvalue}</a>
					    </s:iterator>	
					</span>
				</div>
				
				<div class="cate" >
					<span class="cate-label">状&emsp;态:</span>
					<span class="cate-items" data="status_sw">
						<a class="cate-on" data-value="-100">所有</a>
						<s:iterator var="t" value="dstatus">
							<a href="#" class="tag" data-value="${t.dkey}">${t.dvalue}</a>
						</s:iterator>
					</span>

				</div>

				<div class="cate" >
					<span class="cate-label">时&emsp;间:</span>
					<span class="cate-items" data="time_sw">
						<a class="cate-on" data-value="0">所有</a>
						<s:iterator var="t" value="dtime">
							<a href="#" class="tag" data-value="${t.dkey}">${t.dvalue}</a>
						</s:iterator>
					</span>

				</div>
				
				<div class="alltitle text-center">
					<p>
						<h2>
							全部活动
						</h2>
					</p>
				</div>
				
				<div class="row" id="list_activities">
				</div>
				
					<div id="at-loading" class="loading" style="visibility: visible;">
					<a href="javascript:at.get_more();">加载更多……</a>
				</div>
				<div style="display: none;" id="at-no-more-loading" class="loading"
					style="visibility: visible;">没有更多数据了……</div>
			</div>
			
				
				<!--/row-->
			</div>
		</div>



		<jsp:include page="../base/joy1joy_footer.jsp"></jsp:include>
	</body>
</html>
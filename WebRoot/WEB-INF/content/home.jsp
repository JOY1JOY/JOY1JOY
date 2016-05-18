<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	if (!"".equals(path)) {
		path = path + "/";
	} else {
		path = "/";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>动一动，户外心生活</title>
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
<meta name="keywork" value="动一动,白领,户外活动,学习,周末无聊,周末干嘛,有趣">
<meta name="description" content="网站描述">
<link rel='icon' href="<%=path%>images/favcion.ico" type=‘image/x-ico’ />

<jsp:include page="base/base_import_jquery1.11.2.jsp" />
<script type="text/javascript"
	src="<%=path%>js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="<%=path%>js/home/config.js"></script>
<script type="text/javascript" src="<%=path%>js/activity/list-config.js"></script>
<script type="text/javascript" src="<%=path%>js/home/define.js"></script>
<script type="text/javascript" src="<%=path%>js/home/home.js"></script>
</head>

<body>
	<jsp:include page="base/joy1joy_header.jsp"></jsp:include>

	 <div class="page-body">

            <div class="jumbotron">
                <div class="container">
                    <h1></h1>
                    <p></p>

                    <p>户外，心生活，你的每一次分享，对自己与他人都是一种帮助</p>
                    <p>
                        <a class="btn btn-warning btn-m" href="<%=path%>at/input.action" role="button">发布活动</a>
                        &nbsp;&nbsp;
                       
                </div>
            </div>

            <div class="fetature container" id="home_activities">



            </div>
                 
                 
    </div>


	<jsp:include page="base/joy1joy_footer.jsp"></jsp:include>


</body>
</html>
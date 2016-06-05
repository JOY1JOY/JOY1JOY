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
<meta name="description" content="网站描述">
<link rel='icon' href="<%=path%>images/favcion.ico" type=‘image/x-ico’ />

<jsp:include page="../base/base_import_jquery1.11.2.jsp"></jsp:include>

<script type="text/javascript" src="<%=path%>js/activity/detail.js"></script>
</head>

<body>

	<jsp:include page="../base/joy1joy_header.jsp"></jsp:include>
 <div class="page-body">
            <!-- Main jumbotron for a primary marketing message or call to action -->

            <div class="fetature container">
          
                    <div class="col-10 col-sm-10 col-lg-8">
                        <a href="#" >
                            <img alt="Korean Bao Sliders " class="img-responsive" src="<%=path.substring(0, path.length() - 1)%><s:property value='activity.poster' />"></a>
                        <div class="recipe-title">
                            <h3>
                                <a href="/recipes/korean-bao-sliders-with-gochujang-mayo-sweet-potato-tempura"><s:property value="activity.name" /></a>
                                 <a class="btn btn-info btn-l" href="javascript:opt_handler(0,${activity.id});" role="button">报名参加</a>
                            </h3>
                            </div>
                            <div class="m-time"> <i></i>
                                <span><s:date name="activity.stime" format="yyyy-MM-dd" />
                            </div>
                            <div class="m-place"> <i></i>
                                <span><s:property value="activity.addressName" /></span>
                            </div>
                            <div class="m-money">
                                <i></i>
                                <span><s:property value="activity.joyFee" /></span>
                            </div> 


                   <div class="share">

<!-- JiaThis Button BEGIN -->
<div class="jiathis_style">
    <span class="jiathis_txt">分享到：</span>
    <a class="jiathis_button_tools_1"></a>
    <a class="jiathis_button_tools_2"></a>
    <a class="jiathis_button_tools_3"></a>
   <a class="jiathis_counter_style"></a>
</div>

<!-- JiaThis Button END -->
    </div>
                        <div class="content">
                            <div class="d-con">${activity.description}
                       </div>
                        </div>
                    </div>


             
                <!--/row--> </div>
        </div>
       

	<jsp:include page="../base/joy1joy_footer.jsp"></jsp:include> 

<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
</body>
</html>
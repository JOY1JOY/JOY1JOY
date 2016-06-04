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
<title>动一动-周边优质趣味户外活动分享者</title>
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
<meta name="keywork" value="动一动,白领,户外活动,学习,周末无聊,周末干嘛,有趣">
<meta name="description" content="网站描述">
<link rel='icon' href="<%=path%>images/favcion.ico" type=‘image/x-ico’ />
<link href="<%=path%>resCss/list.css" rel="stylesheet">
<link href="<%=path%>resCss/swiper.min.css" rel="stylesheet">



<jsp:include page="base/base_import_jquery1.11.2.jsp" />
<script type="text/javascript"
	src="<%=path%>js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="<%=path%>js/home/config.js"></script>
<script type="text/javascript" src="<%=path%>js/activity/list-config.js"></script>
<script type="text/javascript" src="<%=path%>js/home/define.js"></script>
<script type="text/javascript" src="<%=path%>js/home/home.js"></script>
<script type="text/javascript" src="<%=path%>js/home/swiper.min.js"></script>

</head>

<body>
	<jsp:include page="base/joy1joy_header.jsp"></jsp:include>

	 <div class="page-body">
<!--  
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
           -->
           
              <div class="swiper-container">
        <div class="swiper-wrapper">


					<div class="swiper-slide">
						    <div class="jumbotron" style="background: #0080ff url(images/banners/img0.jpg) no-repeat center center; display: block; height: 300px; width: 100%">
							<div class="container" >
								<h2 style="color:#fff;font-">
									你的每一次分享，对自己与他人都是一种帮助
								</h2>
								<p>
								<p>
									<a class="m-btn-home m-btn-yellow"
										href="<%=path%>at/input.action" role="button">发布活动</a>
									&nbsp;&nbsp;
							</div> 
							</div>
					</div>
					
					
					
                  
					<div class="swiper-slide">
						<a href="#"
							style="background: #0080ff url(images/banners/2.jpg) no-repeat center center; display: block; height: 300px; width: 100%">

					 </a>
					</div>
					
							<div class="swiper-slide">
						<a href="#"
							style="background: #ffffff url(images/banners/3.jpg) no-repeat center center; display: block; height: 300px; width: 100%">

						 </a>
					</div>
					

				</div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Add Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
    
    
            
               <div class="container zuix">


              <span>最新活动</span> &nbsp  <a href="<%=path%>at/atlist.action" target="_blank">查看全部</a>
            </div>
                 

            <div class="fetature container" id="home_activities">



            </div>
                 
                 
    </div>


	<jsp:include page="base/joy1joy_footer.jsp"></jsp:include>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	//System.out.println(path + "************");
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
		<title>动一动</title>
		<jsp:include page="../base/base_import_jquery1.11.2.jsp" />



		<link rel="stylesheet" type="text/css"
			href="<%=path%>/resCss/info.css">
		<link rel="stylesheet" type="text/css"
			href="<%=path%>/resCss/style.css">

		<script type="text/javascript" src="<%=path%>/js/jquery.pagination.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery.idTabs.min.js"></script>
		<script type="text/javascript" src="<%=path%>/js/notice/noticeList.js"></script>
		

	</head>

	<body id="top">
	
		<input type="hidden" id="PageNum" value="${PageNum}" />
		<input type="hidden" id="noticeType" value="${noticeType}" />
		<jsp:include page="../base/joy1joy_header.jsp" />


		<div class="container info-wrap" >
			<div class="row">
				<div class="col-sm-12 col-md-8 col-lg-8">
					<ul class="post-nav" id="post-nav">
						<li data-id="1" class="active">
							<a href="#" data-value="ALL">所有</a>
						</li>
						
							<s:iterator var="t" value="dtypes">							
								<li data-id="2">
							<a href="#" data-value="${t.dkey}">${t.dvalue}</a>
						</li>
						</s:iterator>
						
					</ul>
				</div>
             </div>
             
             	<div class="container" id="topicList">
			    </div>
                   	<div class="row">
              <nav>
  <ul class="pagination pagination-sm" id="Pagination">


  </ul>
</nav>
              </div>
              
		</div>
		<div class="footer-placeholder"></div>
		<jsp:include page="../base/joy1joy_footer.jsp" />
	</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
		String path = request.getContextPath();
	if (!"".equals(path)) {
		if (!path.endsWith("/")) {
			path = path + "/";
		}
	} else {
		path = "/";
	}
	//System.out.println(path + "************");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
<title>动一动</title>
<jsp:include page="../base/base_import_jquery1.11.2.jsp" />
<link href="<%=path%>css/style.css" rel="stylesheet"/>
<link href="<%=path%>css/notice.css" rel="stylesheet"/>
<style type="text/css">

 ul li{
list-style: none;
}
</style>


</head>

<body>
	<jsp:include page="../base/joy1joy_header.jsp" />
	
	<div class="main wrap">

    <div class="container">
    <div class="col-12 col-sm-10 col-lg-8">
    
                <div class="author"><a href="#"> <img src="${tnotice.icon}"></img> ${tnotice.userid}</a>
                </div>
                <p></p>
                <p class="gray"><s:date name="#tnotice.cdatetime" format="yyyy.MM.dd"/></p>
                <a href="javascript:void(0);">${tnotice.title}</a>
                   
                  <p class="blank">${tnotice.content}</p>
 
    
    </div>
    
    
    </div>

  </div>
<div class="footer-placeholder"></div>
	<jsp:include page="../base/joy1joy_footer.jsp" />
</body>
</html>

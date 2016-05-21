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
.m-input-text {
	display:block;
	padding:7px 0;
	width:100%;
	height:35px;
	border:1px solid #e7e5e4;
	font-size:14px;
	line-height:20px;
	text-indent:10px;
	background-color:#fff;
	border-radius:4px;
	color:#737069
}
ul li{
list-style: none;
}
</style>


</head>

<body>
	<jsp:include page="../base/joy1joy_header.jsp" />
	
	<div class="main wrap">

<div class="notice_bar">
    <div class="notice_inner">
    <div id="usual2" class="usual"> 
   
      <div class="clear"></div>
  
            <h3 id="hType"></h3>
            <ul>
                <li>
                <div class="author"><a href="#"> <img src="${tnotice.icon}"></img> ${tnotice.userid}</a>
                </div>
                <p></p>
                <p class="gray"><s:date name="#tnotice.cdatetime" format="yyyy.MM.dd"/></p>
                <a href="javascript:void(0);">${tnotice.title}</a>
                   
                  <p class="blank">${tnotice.content}</p>
                </li>
                
            </ul>
      </div> 
    </div> 
 
  </div>

  </div>
<div class="footer-placeholder"></div>
	<jsp:include page="../base/joy1joy_footer.jsp" />
</body>
</html>

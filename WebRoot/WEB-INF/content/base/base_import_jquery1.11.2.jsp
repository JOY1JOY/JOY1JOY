<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<input id="joy1_context_path" type="hidden"
	value="<%=path.substring(0, path.length() - 1)%>" />

<link href="<%=path%>css/sobox/sobox_style.css" type="text/css"
	rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="<%=path%>resCss/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>resCss/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>resCss/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>resCss/syntax.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>resCss/style.css"></head>

<script type="text/javascript">

	 var contextPath = document.getElementById("joy1_context_path").value;

</script>



<script type="text/javascript" src="<%=path%>js/is.js"></script>
<script type="text/javascript" src="<%=path%>js/base/config.js"></script>
<script type="text/javascript" src="<%=path%>js/base/define.js"></script>

<script type="text/javascript" src="<%=path%>resJs/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=path%>js/jquery.sobox.min.js"></script>


<script type="text/javascript" src="<%=path%>resJs/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>resJs/global.js"></script>


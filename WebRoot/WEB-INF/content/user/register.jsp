<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	if (!"".equals(path)) {
		path = path + "/";
	}else {
		path = "/";
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
<title>动一动</title>
<jsp:include page="../base/base_import_jquery1.11.2.jsp" />
<link rel='icon' href="<%=path%>images/favcion.ico" type=‘image/x-ico’ />
<script type="text/javascript" src="<%=path%>js/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=path%>js/user/user.js"></script>
<link href="<%=path%>resCss/regedit.css" type="text/css" rel="stylesheet" />

</head>

<body>
<jsp:include page="../base/joy1joy_header.jsp" />


<div class="container regedit-wrap">
    <div class="row">
    <div class="col-md-4">
    <div class="span12 reg-title">
    <h3>注册动一动</h3>
    </div>
          <form class="form-horizontal ">
  <div class="form-group">
  <label for="inputEmail3" class="col-sm-4 control-label"><h4>用户名：</h4></label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="userId" placeholder="用户名">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-4 control-label"><h4>密码：</h4></label>
    <div class="col-sm-8">
      <input type="password" class="form-control" id="onePass" placeholder="输入6~18位字符">
    </div>
  </div>
    <div class="form-group">
    <label for="inputPassword3" class="col-sm-4 control-label"><h4>重复密码：</h4></label>
    <div class="col-sm-8">
      <input type="password" class="form-control" id="twoPass" placeholder="输入6~18位字符">
    </div>
  </div>

    <div class="form-group">
    <label for="exampleInputEmail1" class="col-sm-4 control-label"><h4>邮箱：</h4></label>
     <div class="col-sm-8">
    <input type="email" class="form-control" id="userEmail" placeholder="邮箱">
        </div>
  </div>

      <div class="form-group">
    <label for="exampleInputphone" class="col-sm-4 control-label"><h4>手机号：</h4></label>
     <div class="col-sm-8">
    <input type="text" class="form-control" id="userName" placeholder="手机号">
        </div>
  </div>


  <div class="form-group ">
    <div class="col-sm-offset-4 col-sm-8">
      <div class="checkbox">
        <label>
          <input type="checkbox" id="agree"> 我已阅读并同意 《动一动用户条例》
        </label>
      </div>
    
  </div>
  
  </div>
  <div class="form-group">
    <div class="col-sm-offset-4 col-sm-8">
     <a href="javascript:void(0);" class="log_btn m-btn m-btn-primary" id="reg_btn">
注册</a>
    </div>
  </div>
</form>
</div>
    <div class="col-md-offset-2  col-md-4">
      <ul>
          <li>已有动一动账户</li>
            <li><a href="javascript:void(0);" class="flatLogin">立即登录>></a></li>
        </ul>
      <ul >
   
          <li>使用第三方账户登录</li>
            <li><a href="javascript:void(0);"><img src="<%=path %>images/weibo_ico.jpg" /></a></li>
       
        </ul>
    </div>
</div>
</div>


	<div class="footer-placeholder"></div>
	<jsp:include page="../base/joy1joy_footer.jsp" />
</body>
</html>

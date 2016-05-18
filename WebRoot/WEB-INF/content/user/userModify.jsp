<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	//System.out.println(path + "************");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>首页 - 动一动</title>
<meta name="keywork" value="动一动,白领,户外活动,学习,周末无聊,周末干嘛,有趣">
<link rel='icon' href="<%=path%>images/favcion.ico" type=‘image/x-ico’ />
<meta name="description" content="网站描述">
<jsp:include page="../base/base_import_jquery1.11.2.jsp"></jsp:include>
<script type="text/javascript" src="<%=path%>/My97DatePicker/WdatePicker.js"></script>
<link href="<%=path%>/css/footer.css" rel="stylesheet">

<script type="text/javascript" src="<%=path%>/js/user/userModify.js"></script>

</head>

<body>
	<jsp:include page="../base/joy1joy_header.jsp"></jsp:include>

	<div class="main wrap">

		<form id="userEditForm" name="userEditForm" method="post"
			action="<%=path%>/user/updateUser.action"
			enctype="multipart/form-data">

<div class="jumbotron">
				<div class="container">
					<div class="row clearfix">
						<div class="col-md-4 user-atten">
							<div class="box clearfix">
								<div class="avatar">
									<img class="avatar"
										src="http://img.pmcaff.com/fetch_fileaf2bc5a63fda7c04bbfc4687843739fb-picture"
										alt="">
								</div>
							</div>
						</div>
						<div class="col-md-4 user-info">
							<div class="user-name">
								一只海鸥
							</div>
							<div></div>
							<div class="fans">
								<a href="#"> 粉丝 <span>3</span> </a>
								<a href="/user/focus-list?user_name=JOY1JOY" class="left-border">
									关注 <span>17</span> </a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container">

				<div class="row">
					<label for="name">用户名：</label> <input id="userId" type="text"
						name="userId" value="${tUsers.userid}" />
				</div>

				<div class="row">
					<label for="signature">心情签名：</label> <input id="state" type="text"
						name="state" value="${tUsers.state}">
				</div>

				<div class="row gender">
					<label>性别：</label> <span> <em><input type="radio"
							name="gender" value="0" />男生</em> <em><input type="radio"
							name="gender" value="1" />女生</em>
					</span>
				</div>
				
				<div class="row">
					<label>生日：</label> <input name="birthday" id="birthday"
						value="<s:date name="#tUsers.birthdate" format="yyyy-MM-dd"/>"
						type="text" readonly="readonly" style="width: 186px;" /> <img
						onclick="WdatePicker({el:'birthday'})"
						src="<%=path%>/My97DatePicker/skin/datePicker.gif" width="16"
						height="22" align="absmiddle" />
				</div>
				
				<div class="row">
					<label for="email">邮箱：</label> <input id="email" type="text"
						name="email" value="${tUsers.email}">
				</div>
               <!--  
				<div class="row phone">
					<label>手机：</label> <em>${sessionScope.users.mobile}</em>
				</div>
				-->
				<div class="row phone">
					<label>手机：</label> <input id="mobile" type="text" name="mobile"
						value="${tUsers.mobile}">
				</div>

				<div class="row">
					<label for="qq">QQ：</label> <input id="qq" type="text" name="qq"
						value="${tUsers.qq}">
				</div>

				<div class="row-btn">
					<span class="status">数据提交中，请稍等……</span> <br> <br>
					<button class="m-btn m-btn-primary" type="button" id="editUserInfo">保
						存</button>
				</div>

			</div>
		</form>


	</div>
	</div>




	<div class="footer-placeholder"></div>

	<jsp:include page="../base/joy1joy_footer.jsp"></jsp:include>
	
	<script type="text/javascript">
	function getBrowserInfo()
	{
		var agent = navigator.userAgent.toLowerCase() ;
		
		var regStr_ie = /msie [\d.]+;/gi ;
		var regStr_ff = /firefox\/[\d.]+/gi
		var regStr_chrome = /chrome\/[\d.]+/gi ;
		var regStr_saf = /safari\/[\d.]+/gi ;
		//IE
		if(agent.indexOf("msie") > 0)
		{
			return agent.match(regStr_ie) ;
		}
		
		//firefox
		if(agent.indexOf("firefox") > 0)
		{
			return agent.match(regStr_ff) ;
		}
		
		//Chrome
		if(agent.indexOf("chrome") > 0)
		{
			return agent.match(regStr_chrome) ;
		}
		
		//Safari
		if(agent.indexOf("safari") > 0 && agent.indexOf("chrome") < 0)
		{
			return agent.match(regStr_saf) ;
		}
	
	}

	$(function() {

		var gender = "${tUsers.gender}";
		
		if(gender.length>0){
		$(":radio[value=" + gender + "]").attr("checked", true);
		}
		var iconImg = "${tUsers.icon}";
		if (iconImg != "") {
			var path = joy.getContextPath();
			$("#imghead").attr("src", path  + iconImg);
		}
		
		var browser = getBrowserInfo() ;
		//alert(browser);
		var verinfo = (browser+"").replace(/[^0-9.]/ig,"");
		//alert(parseInt(verinfo));
		if(parseInt(verinfo)<=8)
		{
			$("#imgOne").removeClass("ie9");
			$("#imgOne").addClass("ie8");
		}else
		{
			$("#imgOne").removeClass("ie8");
			$("#imgOne").addClass("ie9");
		}
	});
</script>

</body>
</html>

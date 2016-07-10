<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.joy1joy.app.bean.TUsers"%>
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

<link rel='icon' href="<%=path%>images/favcion.ico" type=‘image/x-ico’ />
	
<input type="hidden" id="joy-context-path" value="<%=path%>" />

<div id="wrapper">
 <div class="navbar " role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand logo active" href="<%=path%>home.action">
                        <img src="/resImages/logo9.png" style="width:80%" title="动一动"
                alt="动一动"></a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="<%=path%>at/atlist.action">活动</a>
                        
                        </li>
                        <li>
                            <a href="<%=path%>notice/findNoticeList.action">话题</a>
                        </li>
                        <li class="dropdown">
                          <a class="dropdown-toggle" data-toggle="dropdown" href="#">发布<b class="caret"></b></a>
                              
                          <ul class="dropdown-menu">
                          <li>
                            <a href="<%=path%>at/input.action">活动</a>
                            <a href="<%=path%>notice/jumpSaveNotice.action">话题</a>
                            </li>
                            </ul>
                        </li>

                    </ul>
<%
		Object o = request.getSession().getAttribute("users");
		String userID="";
		if (null == o) {
	%>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a target="_blank" href="<%=path%>user/jumpLogin.action">登陆</a>
                        </li>
                         <li>
                            <a target="_blank" href="<%=path%>user/register.action">注册</a>
                        </li>
                    </ul>
                    	<%
		} else {

			TUsers user = (TUsers) o;
			String icon = user.getIcon();
			userID = user.getUserid();
			
	%>   <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle"
       data-toggle="dropdown"
       href="#"><%=userID%><b class="caret"></b></a>
       <ul class="dropdown-menu">
       <li>
                            <a href="<%=path%>at/organize.action">个人中心</a>
                                   <a href="<%=path%>user/jumpUserDetail.action">个人设置</a>
                                   <a href="<%=path%>user/exit.action">退出</a>
                        </li>
    </ul>

                        </li>
                    </ul>
                    
                </div>
                <!-- /.nav-collapse --> </div>
            <!-- /.container --> </div>
            <%
		}
	%> <!-- /.navbar --> </div>
	</div>
		</div>
            
            
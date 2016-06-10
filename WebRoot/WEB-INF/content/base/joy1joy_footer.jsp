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
<div id="footer" class="footer">
            <div class="footer-inner container">
                <div class="row">
                    <div class="col-md-4">
                        <p class="copyright">
                           
                            <a href="http://joy1joy.com">JOY1JOY</a>
                            动一动
                        </p>
                        <p>©2016-2026 One Gull Team</p>
                    </div>
                    <div class="col-md-4">
                        <!-- <p>友情链接</p>
                    -->
                    <ul class="friends-links">
                    <!--  
                        <li>
                            <a href="#" title=">MOUNTAIN</a>
                        </li>
                        <li>
                            <a href="#" title="">HIKING</a>
                        </li>
                     -->
                    </ul>
                </div>
                <div class="col-md-4">
                    <div class="weixin">
                        <img src="/resImages/qrcode.jpg" alt="..." class="img-rounded weixin-img">
                        <p>微信公共帐号</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
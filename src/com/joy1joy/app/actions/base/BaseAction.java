package com.joy1joy.app.actions.base;

import java.io.File;
import java.util.Calendar;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.alibaba.fastjson.JSONObject;
import com.joy1joy.app.bean.FilePath;
import com.joy1joy.app.bean.TUsers;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Results({
		@Result(name = "login", type = "redirect", location = "/user/jumpLogin.action"),
		@Result(name = "noAdminPri", type = "redirect", location = "/noAdminPri.action") })
public class BaseAction extends ActionSupport implements IAction,
		ServletRequestAware, ServletResponseAware, SessionAware {

	@SuppressWarnings("unchecked")
	protected Map session;
	protected HttpServletRequest request;
	protected HttpServletResponse response;

	private Logger logger = Logger.getLogger(BaseAction.class);
	/**
	 * 分页的索引
	 */
	protected String pageIndex;

	/**
	 * 显示的条数
	 */
	protected int showCount = 5;

	/**
	 * 获得分页的总数
	 * 
	 * @param totalCount
	 * @return
	 */
	public int getPageNum(int totalCount) {
		int pageNum = totalCount % showCount == 0 ? totalCount / showCount
				: totalCount / showCount + 1;
		return pageNum;
	}

	/**
	 * 获得起始索引
	 * 
	 * @return
	 */
	public int getStartIndex() {
		int startIndex = (Integer.valueOf(pageIndex) - 1) * showCount;
		return startIndex;
	}

	public Map getSession() {
		return session;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;

	}

	@Override
	public void setSession(Map session) {
		this.session = session;

	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;

	}

	public String getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(String pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getShowCount() {
		return showCount;
	}

	public void setShowCount(int showCount) {
		this.showCount = showCount;
	}

	/**
	 * 返回JSON格式的字符串
	 * 
	 * @param code
	 * @param msg
	 * @param o
	 * @return
	 * @author:xujun
	 */
	protected String jsonData(int code, String msg, Object o) {
		JSONObject json = new JSONObject();
		json.put(CODE, code);
		json.put(MSG, msg);
		json.put(DATA, o);

		return json.toString();

	}
	 /**
	  * getUserId
	  * @return
	  */
	protected int getLoginUserId() {
		int id = -1;
		Object o = ActionContext.getContext().getSession().get("users");
		if (null != o) {
			TUsers user = (TUsers) o;
			id = user.getUid();
		}
		// for test
		// id = 1;
		logger.debug("登录用户id:" + id);
		return id;
	}
	/**
	 * getUserIcon
	 * @return
	 */
	protected String getLoginUserIcon() {
		String id = "";
		Object o = ActionContext.getContext().getSession().get("users");
		if (null != o) {
			TUsers user = (TUsers) o;
			id = user.getIcon();
		}
		// for test
		// id = 1;
		logger.debug("登录用户id:" + id);
		return id;
	}
	/**
	 * getUserId
	 * @return
	 */
	protected String getLoginUserFullId() {
		String id = "";
		Object o = ActionContext.getContext().getSession().get("users");
		if (null != o) {
			TUsers user = (TUsers) o;
			id = user.getUserid();
		}
		// for test
		// id = 1;
		logger.debug("登录用户id:" + id);
		return id;
	}
	
	
	/**
	 * 生成一个路径
	 * @param originalFileName
	 * @param param
	 * @return
	 */
	protected FilePath getFilePath(String originalFileName){
		
		
		/*根据系统类型确定根路径*/
		String os1 = System.getProperty("os.name");
		String root = "/opt/";
		if (os1.toLowerCase().startsWith("win")) {
			root = "D:\\";
		}
		
		
		/*获取文件分隔符*/
		String s= System.getProperties().getProperty("file.separator");
		Calendar c = Calendar.getInstance();
		
		
		String year=String.valueOf(c.get(Calendar.YEAR));
		String month=String.valueOf(c.get(Calendar.MONTH)+1);
		String day=String.valueOf(c.get(Calendar.DAY_OF_MONTH));
		String fileName=UUID.randomUUID().toString().replace("-", "")+"_"+originalFileName;
		
		String path="images"+s+"org"+s+year+s+month+s+day;
		String absolutePath=root+path+s+fileName;
		String webPath="/"+(path+s+fileName).replace("\\", "/");
		
		String middlePath="images"+s+"thumbnail"+s+year+s+month+s+day;
		String thumbnailAbsolutePath=root+middlePath+s+fileName;
		String thumbnailWebPath="/"+(middlePath+s+fileName).replace("\\", "/");
		
		File file = new File(root+path);
		if(!file.exists()){
			file.mkdirs();
		}
		

		
		FilePath filePath = new FilePath();
		filePath.setRoot(root);
		filePath.setFileName(fileName);
		filePath.setMiddlePath(path);
		filePath.setAbsolutePath(absolutePath);
		filePath.setWebPath(webPath);
		
		
		File file1 = new File(root+middlePath);
		if(!file1.exists()){
			file1.mkdirs();
		}		
		
		filePath.setThumbnailAbsolutePath(thumbnailAbsolutePath);
		filePath.setMiddlePath(middlePath);
		filePath.setThumbnailWebPath(thumbnailWebPath);
		
		return filePath;
	}	
}
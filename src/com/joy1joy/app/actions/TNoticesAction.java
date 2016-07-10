package com.joy1joy.app.actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;

import com.joy1joy.app.actions.base.BaseAction;
import com.joy1joy.app.bean.ActivityPage;
import com.joy1joy.app.bean.TActivity;
import com.joy1joy.app.bean.TComment;
import com.joy1joy.app.bean.TDict;
import com.joy1joy.app.bean.TNotices;
import com.joy1joy.app.bean.TUsers;
import com.joy1joy.app.core.annotation.AdminAccess;
import com.joy1joy.app.core.annotation.LoginAccess;
import com.joy1joy.app.service.ITAtCommentService;
import com.joy1joy.app.service.ITDictService;
import com.joy1joy.app.service.ITNoticeService;
import com.joy1joy.utils.DateJsonValueProcessor;
import com.opensymphony.xwork2.ActionContext;



@Results({
		@Result(name = "success", location = "/WEB-INF/content/user/success.jsp"),
		@Result(name = "success", location = "/WEB-INF/content/user/fail.jsp") })
@Namespace(value = "/notice")
public class TNoticesAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private static String dateFormat = "yyyy.MM.dd";
	private Integer noticeId;

	private String noticeTitle;
	private String noticeContent;
	private String noticeType = "";
	private int noticeState = 0;
	private String type = "";
	private int start;
	private int end;
	private int pno;
	private int psize;
	
	@Autowired
	private ITAtCommentService atCommentService;

	public TNoticesAction() {
		setShowCount(6);

	}

	// 引入业务层
	@Autowired
	ITNoticeService noticeService;
	// 引入业务层
	@Autowired
	ITDictService dictService;

	@Action(value = "findNoticeList", results = {
			@Result(name = "success", location = "/WEB-INF/content/notice/noticeList.jsp"),
			@Result(name = "error", location = "/WEB-INF/content/notice/success.jsp") })
	public String findNoticeList() {
		// 根据登录人的角色信息，判断noticeState的取值。普通用户为2，管理员为所有
		if (session.get("users") != null) {
			TUsers users = (TUsers) session.get("users");
			if (users.getType() == 0) {
				noticeState = TNotices.NOTICE_STATUE_RELEASE;
			}
		}
		
		// add by duansy 20160528 for 
		
	   List<TDict> dicts = dictService.findDictByType(DICT_NOTICE);
		
		ActionContext.getContext().put("dtypes", dicts);
		
		//end by duansy
		
//		// 查询公告字典集合
//		List<TDict> dicts = dictService.findDictByType("notice");
//		for (TDict dict : dicts) {
//			// 获取公告总数
//			int totalCount = noticeService.selectTNoticesCount(dict.getDkey(),
//					noticeState);
//
//			int pageNum = getPageNum(totalCount);
//			// System.out.println(dict.getDkey()+"PageNum");
//			request.setAttribute(dict.getDkey() + "PageNum", pageNum);
//		}
		
		int totalCount = noticeService.selectTNoticesCount(noticeType,
				noticeState);
		int pageNum = getPageNum(totalCount);
		request.setAttribute("PageNum", totalCount);
		return C_SUCCESS;
	}
	
	/**
	 * get The total num
	 * 
	 */
	@Action(value= "findTotalNum",results = { @Result(name = C_SUCCESS, location = "/WEB-INF/content/base/JSON.jsp") })
	public String findTotalNum(){
		
		int code = -1;
		String msg = MSG_FAILURE;
		int data = 0;
		try {
		data = noticeService.selectTNoticesCount(noticeType,noticeState);
		msg = MSG_SUCCESS;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ActionContext.getContext().put(JSON_DATA, jsonData(code, msg, data));		
		return C_SUCCESS;
	}
	

	@Action(value = "noticeList")
	public void noticeList() {
		try {
			// 根据登录人的角色信息，判断noticeState的取值。普通用户为0，管理员为所有 1
			if (session.get("users") != null) {
				TUsers users = (TUsers) session.get("users");
				if (users.getType() == 0) {
					noticeState = TNotices.NOTICE_STATUE_DELETE;
				}
			}
			PrintWriter out = null;
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			int startIndex = getStartIndex();
			List<TNotices> noticeLists = noticeService.findNoticeListByLimit(
					noticeType, noticeState, startIndex, showCount);
			JSONArray jsonArray = new JSONArray();
			for (TNotices notice : noticeLists) {
				jsonArray.add(DateJsonValueProcessor.beanToJson(notice,
						dateFormat));
			}
			String json = "{\"rows\":" + jsonArray.toString() + "}";
			out.print(json);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@LoginAccess
	@Action(value = "jumpSaveNotice", results = { @Result(name = "success", location = "/WEB-INF/content/notice/noticeAdd.jsp") })
	public String jumpSave() {
		// 查询公告字典集合
		List<TDict> dicts = dictService.findDictByType("notice");
		request.setAttribute("dcits", dicts);
		return C_SUCCESS;
	}

	@LoginAccess
	@Action(value = "saveNotice", results = {
			@Result(type="redirect",name = "success", location = "/notice/findNoticeList.action"),
			@Result(name = "error", location = "/WEB-INF/content/notice/success.jsp"),
			@Result(name = "input", location = "/WEB-INF/content/notice/noticeInput.jsp") })
	public String save() {
		TNotices notices = new TNotices();
		notices.setTitle(noticeTitle);
		notices.setType(noticeType);
		notices.setContent(noticeContent);
		notices.setCdatetime(new Timestamp(System.currentTimeMillis()));
		notices.setStatus(TNotices.NOTICE_STATUE_RELEASE);
		if (session.get("users") == null) {
			return C_INPUT;
		}
		TUsers users = (TUsers) session.get("users");
		notices.setCuid(users.getUid());
		boolean result = this.noticeService.addNotices(notices);
		if (result) {
			findNoticeList();
			request.setAttribute("noticeType", noticeType);
			return C_SUCCESS;
		} else {
			return C_ERROR;
		}
	}

	@Action(value = "detailNotice", results = {
			@Result(name = "success", location = "/WEB-INF/content/notice/noticeDetail.jsp"),
			@Result(name = "error", location = "/WEB-INF/content/notice/success.jsp") })
	public String findNoticeDetail() {
		TNotices tnotice = this.noticeService.selectTNoticesById(noticeId);
		TComment comment = new TComment();

		comment.setTermId(noticeId);
		tnotice.setCommentPageNum(atCommentService.getCommentsCount(comment));
		
		if (null != tnotice) {
			// request.setAttribute("tnotice", tnotice);
			ActionContext.getContext().put("tnotice", tnotice);
			return C_SUCCESS;
		} else {
			return C_ERROR;
		}

	}

	

	/**
	 *  获取本人分享的话题 COUNT
	 * @return
	 */
	@LoginAccess
	@Action(value = "shareNotice", results = { @Result(name = C_INPUT, location = "/WEB-INF/content/notice/shareNotice.jsp") })
	public String shareNotice() {
		int cuid = getLoginUserId();
		int count = noticeService.getOrgNoticesWithPagesCount(cuid);
		ActionContext.getContext().put("totalPages", count);
		return C_INPUT;
	}
	
	/**
	 *   获取本人分享的话题 LIST
	 * @return
	 */

	@LoginAccess
	@Action(value = "shareNoticeList", results = { @Result(name = C_SUCCESS, location = "/WEB-INF/content/base/JSON.jsp") })
	public String shareNoticeList() {
		int code = -1;
		String msg = MSG_FAILURE;
		List<TNotices> data = null;

		int cuid = getLoginUserId();
		try {
			ActivityPage p = new ActivityPage(pno, psize);
			p.setUid(cuid);
			data = noticeService.getOrgNoticesWithPages(p);
			code = R_SUCCESS;
			msg = MSG_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		}

		ActionContext.getContext().put(JSON_DATA, jsonData(code, msg, data));
		return C_SUCCESS;
	}
	
	                      
	/**
	 * 打开编辑活动
	 */
	@Action(value = "edit", results = { @Result(name = C_INPUT, location = "/WEB-INF/content/notice/noticeAdd.jsp") })
	public String edit() {
		ActionContext.getContext().put("editOpt", 1);
		List<TDict> dicts = dictService.findDictByType("notice");
        
		//设置编辑选项
		ActionContext.getContext().put("editOpt", 1);
		ActionContext.getContext().put("dicts", dicts);
		TNotices noc = noticeService.selectTNoticesById(noticeId);
		
		ActionContext.getContext().put("notice", noc);

		return C_INPUT;
	}
	
	
	/**
	 * 更新活动
	 * @return
	 */

	@LoginAccess
	@Action(value = "update", results = { @Result(type="redirect", name = C_SUCCESS, location = "/notice/shareNotice.action") })
	public String update() {
		int code = -1;
		String msg = MSG_FAILURE;

		if (null != noticeId || noticeId != -1) {
			try {
				TNotices notice = new TNotices();
				notice.setId(noticeId);
				notice.setType(noticeType);
				notice.setTitle(noticeTitle);
				notice.setContent(noticeContent);
				int i = noticeService.updateTNotices(notice);
				if (i > 0) {
					code = R_SUCCESS;
					msg = MSG_SUCCESS;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		ActionContext.getContext().put(JSON_DATA, jsonData(code, msg, null));
		return C_SUCCESS;
	}

	
	
	
	
	public Integer getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(Integer noticeId) {
		this.noticeId = noticeId;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

}

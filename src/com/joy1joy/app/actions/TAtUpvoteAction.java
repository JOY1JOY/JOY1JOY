package com.joy1joy.app.actions;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.joy1joy.app.actions.base.BaseAction;
import com.joy1joy.app.bean.TAtCollect;
import com.joy1joy.app.bean.TAtUpvote;
import com.joy1joy.app.core.annotation.LoginAccess;
import com.joy1joy.app.service.ITAtCollectService;
import com.joy1joy.app.service.ITAtUpvoteService;
import com.opensymphony.xwork2.ActionContext;

/**
 * 
 * @author DSY1029
 * <p>Description: </p>
 * @date 2016-6-11 下午10:23:58
 * @version V1.0
 */
@Namespace("/upvote")
public class TAtUpvoteAction  extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TAtUpvote upvote;
	private Logger logger = Logger.getLogger(TAtCollectAction.class);
	@Autowired
	private ITAtUpvoteService upvoteService ;

	@LoginAccess
	@Action(value = "add", results = { @Result(name = C_SUCCESS, location = "/WEB-INF/content/base/JSON.jsp") })
	public String add() {
		logger.debug("点赞");
		int code = -1;
		String msg = MSG_FAILURE;
		try {
			if (null != upvote) {
				upvote.setUid(getLoginUserId());
				upvote.setCreateTime(new Date());
				try {
					boolean ok = false;

					TAtUpvote find = upvoteService
							.selectTAtUpvote(upvote);
					if (null == find) {
						int i = upvoteService.insertTAtUpvote(upvote);
						if (i > 0) {
							ok = true;
							logger.debug("点赞成功");
						} else {
							logger.debug("点赞失败!");
							ok = false;
						}
					} else {
						ok = true;
					}
					if (ok) {
						code = R_SUCCESS;
						msg = MSG_SUCCESS;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			code = -1;
		}
		ActionContext.getContext().put(JSON_DATA,
				this.jsonData(code, msg, null));
		return C_SUCCESS;
	}

}

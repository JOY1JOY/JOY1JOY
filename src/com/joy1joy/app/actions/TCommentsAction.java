package com.joy1joy.app.actions;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.joy1joy.app.actions.base.BaseAction;
import com.joy1joy.app.bean.ActivityPage;
import com.joy1joy.app.bean.TActivity;
import com.joy1joy.app.bean.TAtUpvote;
import com.joy1joy.app.bean.TComment;
import com.joy1joy.app.bean.TDict;
import com.joy1joy.app.bean.TNotices;
import com.joy1joy.app.core.annotation.LoginAccess;
import com.joy1joy.app.service.ITActivity;
import com.joy1joy.app.service.ITAtCommentService;
import com.joy1joy.app.service.ITAtUpvoteService;
import com.joy1joy.app.service.ITNoticeService;
import com.opensymphony.xwork2.ActionContext;

/**
 * 
 * @author DSY1029
 * 
 */
@Namespace("/comment")
public class TCommentsAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private TComment comments;
	private Logger logger = Logger.getLogger(TAtCollectAction.class);
	@Autowired
	private ITAtCommentService commentService;
	@Autowired
	private ITActivity itActivity;
	@Autowired
	private ITNoticeService noticeService;

	private Integer termId;
	private Integer commentType = 0;
	private Integer showCount = 100;

	/**
	 * 添加评论
	 * 
	 * @return
	 */

	@LoginAccess
	@Action(value = "add", results = { @Result(name = C_SUCCESS, location = "/WEB-INF/content/base/JSON.jsp") })
	public String add() {
		logger.debug("增加评论");
		int code = -1;
		String msg = MSG_FAILURE;
		TComment comment = new TComment();
		TActivity activity = new TActivity();
		TNotices tnotice = new TNotices();
		try {
			if (null != termId) {
				comment.setUid(getLoginUserId());
				comment.setCreateTime(new Date());
				comment.setTermId(termId);
				comment.setCommentType(commentType);
				comment.setCommentStatus(0);
				comment.setComment(comments.getComment());
				comment.setIcon(getLoginUserIcon());
				comment.setUserid(getLoginUserFullId());
				try {
					boolean ok = false;
					int i = commentService.insertTComment(comment);
					if (i > 0) {
						ok = true;
						logger.debug("插入评论成功！");

						if (commentType == 0) {
							// 更新活动评论数量
							activity.setId(termId);
							int n = itActivity
									.updateActivityCommentCount(activity);
						} else if (commentType == 1) {
							// 更新话题评论数量
							tnotice.setId(termId);
							int n = noticeService
									.updateTNoticesCommentCount(tnotice);
						}
						//

					} else {
						logger.debug("插入评论失败!");
						ok = false;
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
				this.jsonData(code, msg, comment));
		return C_SUCCESS;
	}

	/**
	 * @author DSY1029 获取评论
	 * @return
	 */
	@Action(value = "commentList", results = { @Result(name = C_SUCCESS, location = "/WEB-INF/content/base/JSON.jsp") })
	public String allActivity() {
		logger.debug("查询所有评论!");
		int code = -1;
		String msg = MSG_FAILURE;
		List<TComment> data = null;
		TComment comment = new TComment();
		comment.setTermId(termId);
		comment.setCommentType(commentType);
		try {
			// 获取所有评论
			code = R_SUCCESS;
			msg = MSG_SUCCESS;
			int startIndex = getStartIndex();
			data = commentService.findCommentListByLimit(comment, startIndex,
					showCount);

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询所有活动失败!");
		}

		ActionContext.getContext().put(JSON_DATA, jsonData(code, msg, data));
		return C_SUCCESS;
	}

	public TComment getComments() {
		return comments;
	}

	public void setComments(TComment comments) {
		this.comments = comments;
	}

	public Integer getTermId() {
		return termId;
	}

	public void setTermId(Integer termId) {
		this.termId = termId;
	}

	public Integer getCommentType() {
		return commentType;
	}

	public void setCommentType(Integer commentType) {
		this.commentType = commentType;
	}

}

package com.joy1joy.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.joy1joy.app.bean.CollectAtResult;
import com.joy1joy.app.bean.TAtUpvote;
import com.joy1joy.app.bean.TComment;
import com.joy1joy.app.bean.TNotices;

/**
 * 
 * @author DSY1029
 * <p>Description: </p>
 * @date 2016-6-11 下午10:32:31
 * @version V1.0
 */

public interface ITAtCommentService {
	public int insertTComment(TComment comment);

	public int deleteTComment(int id);

	public TComment selectTComment(TComment comment);
	
	public int updateTComment(TComment comment);

	public int getCommentsCount(TComment comment);
	
	public List<TComment> selectByUserid(int id);
	
	public List<TComment> findCommentListByLimit(TComment  comments,int offset,int limit) ;

}

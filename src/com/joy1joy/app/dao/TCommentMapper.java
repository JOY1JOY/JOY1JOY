package com.joy1joy.app.dao;

import java.util.List;
import java.util.Map;

import java.util.List;

import com.joy1joy.app.bean.TActivity;
import com.joy1joy.app.bean.TAtUpvote;
import com.joy1joy.app.bean.TComment;
import com.joy1joy.app.bean.TNotices;

public interface TCommentMapper {

	
	public int insertTComment(TComment comment);

	public int deleteTComment(int id);
	
	public int getCommentsCount(TComment comment);

	public TAtUpvote selectTComment(TComment comment);
	
	public int updateTComment(TComment comment);

	public List<TComment> selectByUserid(int uid);

	public List<TComment> selectTCommentByLimit(Map map);
	
    public int updateTNoticesUpvoteCount(TNotices notice);
	
	public int updateTNoticesCommentCount(TNotices notice);
	
}

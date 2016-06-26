package com.joy1joy.app.dao;

import java.util.List;

import java.util.List;

import com.joy1joy.app.bean.TAtUpvote;

public interface TUpvoteMapper {

	
	public int insertTAtUpvote(TAtUpvote upvote);

	public int deleteTAtUpvote(int id);

	public TAtUpvote selectTAtUpvote(TAtUpvote upvote);
	
	public int updateTAtUpvote(TAtUpvote upvote);

	public List<TAtUpvote> selectByUserid(int uid);
}

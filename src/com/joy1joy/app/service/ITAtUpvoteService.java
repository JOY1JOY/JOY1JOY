package com.joy1joy.app.service;

import java.util.List;

import com.joy1joy.app.bean.CollectAtResult;
import com.joy1joy.app.bean.TAtUpvote;

/**
 * 
 * @author DSY1029
 * <p>Description: </p>
 * @date 2016-6-11 下午10:32:31
 * @version V1.0
 */

public interface ITAtUpvoteService {
	public int insertTAtUpvote(TAtUpvote upvote);

	public int deleteTAtUpvote(int id);

	public TAtUpvote selectTAtUpvote(TAtUpvote collect);

	public List<TAtUpvote> selectByUserid(int id);

}

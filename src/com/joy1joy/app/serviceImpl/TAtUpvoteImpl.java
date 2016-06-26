package com.joy1joy.app.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.joy1joy.app.bean.TAtUpvote;
import com.joy1joy.app.dao.TUpvoteMapper;
import com.joy1joy.app.service.ITAtCollectService;
import com.joy1joy.app.service.ITAtUpvoteService;
/**
 * 
 * @author DSY1029
 * <p>Description: </p>
 * @date 2016-6-11 下午10:34:09
 * @version V1.0
 */
@Service
public class TAtUpvoteImpl implements ITAtUpvoteService{
	
	@Autowired
	private TUpvoteMapper mapper;

	@Override
	public int insertTAtUpvote(TAtUpvote upvote) {
		// TODO Auto-generated method stub
		return mapper.insertTAtUpvote(upvote);
	}

	@Override
	public int deleteTAtUpvote(int id) {
		// TODO Auto-generated method stub
		return mapper.deleteTAtUpvote(id);
	}

	public TAtUpvote selectTAtUpvote(TAtUpvote upvote) {
		// TODO Auto-generated method stub
		return mapper.selectTAtUpvote(upvote);
	}

	@Override
	public List<TAtUpvote> selectByUserid(int uid) {
		// TODO Auto-generated method stub
		return mapper.selectByUserid(uid);
	}
	
	@Override
	public int updateTAtUpvote(TAtUpvote upvote){
		
		return mapper.updateTAtUpvote(upvote);

	}



}

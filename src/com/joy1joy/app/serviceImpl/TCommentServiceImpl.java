package com.joy1joy.app.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joy1joy.app.bean.TAtUpvote;
import com.joy1joy.app.bean.TComment;
import com.joy1joy.app.bean.TNotices;
import com.joy1joy.app.dao.TCommentMapper;
import com.joy1joy.app.dao.TUpvoteMapper;
import com.joy1joy.app.service.ITAtCommentService;
import com.joy1joy.app.service.ITAtUpvoteService;


/**
 * 
 * @author DSY1029
 *
 */

@Service
public class TCommentServiceImpl implements ITAtCommentService{
  
	private static Logger log=Logger.getLogger(TNoticeServiceImpl.class);

	@Autowired
	private TCommentMapper mapper;

	@Override
	public int insertTComment(TComment comment) {
		// TODO Auto-generated method stub
		return mapper.insertTComment(comment);
	}

	@Override
	
	public int getCommentsCount(TComment comment){
		
		return mapper.getCommentsCount(comment);
	}
	@Override
	public int deleteTComment(int id) {
		// TODO Auto-generated method stub
		return mapper.deleteTComment(id);
	}

	@Override
	public TComment selectTComment(TComment comment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateTComment(TComment comment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TComment> selectByUserid(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<TComment> findCommentListByLimit(TComment  comments,int offset,int limit) {
		List<TComment> list=null;
		try {
			Map<String,Object> m=new HashMap<String,Object>();
			m.put("termId", comments.getTermId());
			m.put("status", comments.getCommentStatus());
			m.put("commentType", comments.getCommentType());
			m.put("offset", offset);
			m.put("limit", limit);
			list= mapper.selectTCommentByLimit(m);
		} catch (Exception e) {
			log.error("********【分页查询公告列表失败】*****，原因：", e);
		}
		return list;
	}


	
}

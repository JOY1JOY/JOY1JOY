package com.joy1joy.app.service;

import java.util.List;
import java.util.Map;

import com.joy1joy.app.bean.ActivityPage;
import com.joy1joy.app.bean.TActivity;
import com.joy1joy.app.bean.TNotices;

/** 
 * <p>Title: ITNoticeService.java</p>
 * 
 * <p>Description: </p>
 * 
 * <p>Date: 2015-4-20</p>
 * 
 * <p>Time: 上午10:10:10</p>
 * 
 * <p>Copyright: 2015</p>
 * 
 * 
 * @author boyd
 * @version 1.0
 * 
 * <p>============================================</p>
 * <p>Modification History
 * <p>Mender: </p>
 * <p>Date: </p>
 * <p>Reason: </p>
 * <p>============================================</p>
 */
public interface ITNoticeService{
	public boolean addNotices(TNotices notices);
	
	public List<TNotices> findNoticeList();
	
	public List<TNotices> findNoticeListByLimit(String type,int status,int offset,int limit);
	
	public int selectTNoticesCount(String type,int status);
	
	public TNotices selectTNoticesById(Integer id);
	public List<TNotices> selectRecentNotices(Map map);
	
	public int updateTNoticesUpvoteCount(TNotices notice);
	
	public int updateTNoticesCommentCount(TNotices notice);
	
	/**
	 * 根据用户ID分别查取所分享的话题
	 * @param id
	 * @return
	 */
	public int getOrgNoticesWithPagesCount(Integer id);
	
	
	/**
	 * 根据用户ID 及 分页 查取单页面的分享话题
	 * @param Page
	 * @return
	 */
	
	public List<TNotices> getOrgNoticesWithPages (ActivityPage Page);
	
}

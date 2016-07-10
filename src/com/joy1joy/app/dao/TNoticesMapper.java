package com.joy1joy.app.dao;

import java.util.List;
import java.util.Map;

import com.joy1joy.app.bean.ActivityPage;
import com.joy1joy.app.bean.TActivity;
import com.joy1joy.app.bean.TNotices;

public interface TNoticesMapper {

	/**
	 * 添加公告
	 * 
	 * @param tNotices
	 * @return
	 */
	int insertTNotices(TNotices tNotices);

	/**
	 * 查找公告
	 * 
	 * @return
	 */
	List<TNotices> selectTNoticesList();

	/**
	 * 分页查询公告
	 * 
	 * @param offset
	 * @param limit
	 * @return
	 */
	List<TNotices> selectTNoticesByLimit(Map map);

	/**
	 * 查询公告的总数
	 * 
	 * @return
	 */
	int selectTNoticesCount(Map map);

	/**
	 * 根据id查询公告
	 * 
	 * @param id
	 * @return
	 */
	TNotices selectTNoticesById(Integer id);

	public List<TNotices> selectRecentNotices(Map map);
	
    public int updateTNoticesUpvoteCount(TNotices notices);
    
    public int updateTNotices(TNotices notices);
    
	
    public int updateTNoticesCommentCount(TNotices notices);
    
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
package com.joy1joy.app.bean;

import java.util.Date;
import org.apache.ibatis.type.Alias;

/**
 * 
 * @author DSY1029
 * <p>Description: </p>
 * @date 2016-6-11 下午10:13:13
 * @version V1.0
 */
@Alias("TAtUpvote")
public class TAtUpvote {


	private int upvoteid;
	private int uid;
	private int termId;
	private int UpvoteType;
	private String remark;
	private Date createTime;
	private String createBy;
	private String lastUpdateBy; 
	private Date lastUpdateTime;
	private int upvoteStatus;
	

	public int getUpvoteid() {
		return upvoteid;
	}
	public void setUpvoteid(int upvoteid) {
		this.upvoteid = upvoteid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getTermId() {
		return termId;
	}
	public void setTermId(int termId) {
		this.termId = termId;
	}
	public int getUpvoteType() {
		return UpvoteType;
	}
	public void setUpvoteType(int upvoteType) {
		UpvoteType = upvoteType;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public String getLastUpdateBy() {
		return lastUpdateBy;
	}
	public void setLastUpdateBy(String lastUpdateBy) {
		this.lastUpdateBy = lastUpdateBy;
	}
	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	
	public int getUpvoteStatus() {
		return upvoteStatus;
	}
	public void setUpvoteStatus(int upvoteStatus) {
		this.upvoteStatus = upvoteStatus;
	}
}

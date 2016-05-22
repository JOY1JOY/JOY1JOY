package com.joy1joy.app.bean;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * @author DSY1029
 * <p>Description: </p>
 * @date 2016-5-22 上午10:25:43
 * @version V1.0
 */


@Alias("join")
public class JoinAt {
	private int atid;
	private String name;
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	private Date addtime;
   
	/**
	 * 活动缩略图
	 */
	private String atthumb;

	public String getAtthumb() {
		return atthumb;
	}

	public void setAtthumb(String atthumb) {
		this.atthumb = atthumb;
	}

	public int getAtid() {
		return atid;
	}

	public void setAtid(int atid) {
		this.atid = atid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getAddtime() {
		return addtime;
	}

	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

}

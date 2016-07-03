package com.joy1joy.app.bean;


/**
 * 文件名辅助类
 * @author cookie
 *
 */
public class FilePath {

	/* 根路径 */
	private String root;
	/* 中间路径去掉根路径和文件名的路径 */
	private String middlePath;
	/* 文件名 */
	private String fileName;
	/* 扩展名 */
	private String extName;
	/* 绝对路径 */
	private String absolutePath;
	/* 相对的WEB路径 */
	private String webPath;
	/* 缩略图路径 */
	private String thumbnailMidPath;
	/* 缩略图绝对路径 */
	private String thumbnailAbsolutePath;
	/* 缩略图WEB路径 */
	private String thumbnailWebPath;
	
	
	

	public String getRoot() {
		return root;
	}

	public void setRoot(String root) {
		this.root = root;
	}

	public String getMiddlePath() {
		return middlePath;
	}

	public void setMiddlePath(String middlePath) {
		this.middlePath = middlePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getExtName() {
		return extName;
	}

	public void setExtName(String extName) {
		this.extName = extName;
	}

	public String getAbsolutePath() {
		return absolutePath;
	}

	public void setAbsolutePath(String absolutePath) {
		this.absolutePath = absolutePath;
	}

	public String getWebPath() {
		return webPath;
	}

	public void setWebPath(String webPath) {
		this.webPath = webPath;
	}

	public String getThumbnailMidPath() {
		return thumbnailMidPath;
	}

	public void setThumbnailMidPath(String thumbnailMidPath) {
		this.thumbnailMidPath = thumbnailMidPath;
	}

	public String getThumbnailAbsolutePath() {
		return thumbnailAbsolutePath;
	}

	public void setThumbnailAbsolutePath(String thumbnailAbsolutePath) {
		this.thumbnailAbsolutePath = thumbnailAbsolutePath;
	}

	public String getThumbnailWebPath() {
		return thumbnailWebPath;
	}

	public void setThumbnailWebPath(String thumbnailWebPath) {
		this.thumbnailWebPath = thumbnailWebPath;
	}


}

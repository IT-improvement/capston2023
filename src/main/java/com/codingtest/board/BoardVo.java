package com.codingtest.board;

import java.sql.Date;

public class BoardVo {
	private int chat_num;
	private java.sql.Date createTime;
	private String roomTitle;
	private String language;
	private String roomPwd;
	private int allowMem;
	private String id;
	private int statusMem;
	
	public BoardVo() {
		super();
	}
	
	public int getStatusMem() {
		return statusMem;
	}
	public void setStatusMem(int statusMem) {
		this.statusMem = statusMem;
	}
	public int getChat_num() {
		return chat_num;
	}
	public void setChat_num(int chat_num) {
		this.chat_num = chat_num;
	}
	public java.sql.Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(java.sql.Date createTime) {
		this.createTime = createTime;
	}
	public String getRoomTitle() {
		return roomTitle;
	}
	public void setRoomTitle(String roomTitle) {
		this.roomTitle = roomTitle;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getRoomPwd() {
		return roomPwd;
	}
	public void setRoomPwd(String roomPwd) {
		this.roomPwd = roomPwd;
	}
	public int getAllowMem() {
		return allowMem;
	}
	public void setAllowMem(int allowMem) {
		this.allowMem = allowMem;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public BoardVo(int chat_num, Date createTime, String roomTitle, String language, String roomPwd, int allowMem,
			String id, int statusMem) {
		super();
		this.chat_num = chat_num;
		this.createTime = createTime;
		this.roomTitle = roomTitle;
		this.language = language;
		this.roomPwd = roomPwd;
		this.allowMem = allowMem;
		this.id = id;
		this.statusMem = statusMem;
	}
	
	
}

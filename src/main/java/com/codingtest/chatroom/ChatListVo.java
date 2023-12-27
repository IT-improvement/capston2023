package com.codingtest.chatroom;

import java.sql.Timestamp;

public class ChatListVo {
	private int chat_num;
	private Timestamp createTime;
	private String roomTitle;
	private String language;
	private int allowMem;
	private String roomPwd;
	private String id;
	private int statusMem;
	private int visit_num;
	
	public int getVisit_num() {
		return visit_num;
	}
	public void setVisit_num(int visit_num) {
		this.visit_num = visit_num;
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
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
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
	public int getAllowMem() {
		return allowMem;
	}
	public void setAllowMem(int allowMem) {
		this.allowMem = allowMem;
	}
	public String getRoomPwd() {
		return roomPwd;
	}
	public void setRoomPwd(String roomPwd) {
		this.roomPwd = roomPwd;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

}

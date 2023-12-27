package com.codingtest.admin.member;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Lob;

public class MemberVo {
	
	private String id; 
	private String pwd; 
	private String userName;
	private boolean loginfo; 
	private String user; 
	private int comfile;
	private int solveNum;	
	private Timestamp logDate;
	private Timestamp logOutDate;
	private int log_num;
	private String email;
	private String phoneNum;
	private String zipcode;
	private String address;
	private String question;
	private String answer;
	private String profileImage;
	 
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getLog_num() {
		return log_num;
	}
	public void setLog_num(int log_num) {
		this.log_num = log_num;
	}
	public Timestamp getLogDate() {
		return logDate;
	}
	public void setLogDate(Timestamp logDate) {
		this.logDate = logDate;
	}
	public Timestamp getLogOutDate() {
		return logOutDate;
	}
	public void setLogOutDate(Timestamp logOutDate) {
		this.logOutDate = logOutDate;
	}
	public int getSolveNum() {
		return solveNum;
	}
	public void setSolveNum(int solveNum) {
		this.solveNum = solveNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public boolean isLoginfo() {
		return loginfo;
	}
	public void setLoginfo(boolean loginfo) {
		this.loginfo = loginfo;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public int getComfile() {
		return comfile;
	}
	public void setComfile(int comfile) {
		this.comfile = comfile;
	}
}

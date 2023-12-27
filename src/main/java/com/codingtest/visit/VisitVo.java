package com.codingtest.visit;

import java.sql.Timestamp;

public class VisitVo {
	private int visitNum;
	private int q_num;
	private String Id;
	private String q_language;
	private String q_title;
	private String q_level;
	public String getQ_level() {
		return q_level;
	}
	public void setQ_level(String q_level) {
		this.q_level = q_level;
	}
	public int getVisitNum() {
		return visitNum;
	}
	public void setVisitNum(int visitNum) {
		this.visitNum = visitNum;
	}
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}

	public String getQ_language() {
		return q_language;
	}
	public void setQ_language(String q_language) {
		this.q_language = q_language;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	} 

}

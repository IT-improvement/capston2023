package com.codingtest.question;

import java.sql.Timestamp;

public class QuestionVo {
	private int q_num;
	private String q_level;
	private String q_title;
	private String q_info;
	private String company;
	private int visitCount;
	private String q_language;
	private String q_anwserpercent;
	private int q_answer;
	private String past_title;
	private int num;
	private int past_num;
	public int getPast_num() {
		return past_num;
	}
	public void setPast_num(int past_num) {
		this.past_num = past_num;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getVisitTime() {
		return visitTime;
	}
	public void setVisitTime(Timestamp visitTime) {
		this.visitTime = visitTime;
	}
	private String id;
	private Timestamp visitTime;
	
	public String getPast_title() {
		return past_title;
	}
	public void setPast_title(String past_title) {
		this.past_title = past_title;
	}
	public int getQ_answer() {
		return q_answer;
	}
	public void setQ_answer(int q_answer) {
		this.q_answer = q_answer;
	}
	public String getQ_anwserpercent() {
		return q_anwserpercent;
	}
	public void setQ_anwserpercent(String q_anwserpercent) {
		this.q_anwserpercent = q_anwserpercent;
	}
	public String getQ_language() {
		return q_language;
	}
	public void setQ_language(String q_language) {
		this.q_language = q_language;
	}
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getQ_level() {
		return q_level;
	}
	public void setQ_level(String q_level) {
		this.q_level = q_level;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_info() {
		return q_info;
	}
	public void setQ_info(String q_info) {
		this.q_info = q_info;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getVisitCount() {
		return visitCount;
	}
	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}
}

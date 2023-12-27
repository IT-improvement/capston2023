package com.codingtest.solvelang;

public class SolvelangVo {
	private int language_num;
	private String id;
	private String lan;
	private int correct_problems;
	private int wrong_problems1;
	private int time_exceeded;
	private int compile_errors;
	
	
	public int getLanguage_num() {
		return language_num;
	}
	public void setLanguage_num(int language_num) {
		this.language_num = language_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLan() {
		return lan;
	}
	public void setLan(String lan) {
		this.lan = lan;
	}
	public int getCorrect_problems() {
		return correct_problems;
	}
	public void setCorrect_problems(int correct_problems) {
		this.correct_problems = correct_problems;
	}
	public int getWrong_problems1() {
		return wrong_problems1;
	}
	public void setWrong_problems1(int wrong_problems1) {
		this.wrong_problems1 = wrong_problems1;
	}
	public int getTime_exceeded() {
		return time_exceeded;
	}
	public void setTime_exceeded(int time_exceeded) {
		this.time_exceeded = time_exceeded;
	}
	public int getCompile_errors() {
		return compile_errors;
	}
	public void setCompile_errors(int compile_errors) {
		this.compile_errors = compile_errors;
	}

}

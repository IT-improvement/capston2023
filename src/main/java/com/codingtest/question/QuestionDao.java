package com.codingtest.question;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
@Component
public class QuestionDao {
    private JdbcTemplate jdbcTemplate;
   
	
    
    @Autowired
    public QuestionDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
    public List<QuestionVo> getQuestionList(Map<String, Object> param) {
        String query = "SELECT * FROM question";
        return jdbcTemplate.query(query, new BeanPropertyRowMapper<>(QuestionVo.class));
    }
    
    public List<QuestionVo> getAllQuestions() {
        String query = "SELECT * FROM question";
        return jdbcTemplate.query(query, (rs, rowNum) -> {
            QuestionVo vo = new QuestionVo();
            vo.setQ_num(rs.getInt("q_num"));
            vo.setQ_level(rs.getString("q_level"));
            vo.setQ_title(rs.getString("q_title"));
            vo.setQ_language(rs.getString("q_language"));
            vo.setQ_info(rs.getString("q_info"));
            vo.setQ_anwserpercent(rs.getString("q_anwserpercent"));
            vo.setVisitCount(rs.getInt("visitCount"));
            return vo;
        });
    }
    
    public List<QuestionVo> getQuestionList(String l1) {
        String query = "SELECT * FROM question WHERE q_language = ?";
        return jdbcTemplate.query(query, new Object[]{l1}, (rs, rowNum) -> {
            QuestionVo vo = new QuestionVo();
            vo.setQ_num(rs.getInt("q_num"));
            vo.setQ_level(rs.getString("q_level"));
            vo.setQ_title(rs.getString("q_title"));
            vo.setQ_language(rs.getString("q_language"));
            vo.setQ_info(rs.getString("q_info"));
            vo.setQ_anwserpercent(rs.getString("q_anwserpercent"));
            vo.setVisitCount(rs.getInt("visitCount"));
            //list.add(dto) query �޼����� ����� ��ȯ�Ǵ� ����Ʈ�� ��Ҹ� �߰��ϴ� list.add(dto); ������ ���� �ۼ��� �ʿ䰡 �����ϴ�. query �޼���� ����� ���� ����Ʈ�� �����ϰ�, �� ��(row)�� �����͸� �����ͼ� ����Ʈ�� �߰��ϴ� �۾��� �̹� �����մϴ�. �̰��� Spring�� JdbcTemplate�� �⺻ �����Դϴ�.
            return vo;
            
        });
    }
    


    public List<QuestionVo> getQuestionList(String l1, String l2) {
        String query = "select * from question where q_language = ? or q_language = ?";
        return jdbcTemplate.query(query, new Object[]{l1, l2}, (rs, rowNum) -> {
            QuestionVo vo = new QuestionVo();
            vo.setQ_num(rs.getInt("q_num"));
            vo.setQ_level(rs.getString("q_level"));
            vo.setQ_title(rs.getString("q_title"));
            vo.setQ_language(rs.getString("q_language"));
            vo.setQ_info(rs.getString("q_info"));
            vo.setQ_anwserpercent(rs.getString("q_anwserpercent"));
            vo.setVisitCount(rs.getInt("visitCount"));
            return vo;
        });
    }

	public List<QuestionVo> getQuestionList(String l1, String l2, String l3) {

			String query = "select * from question where q_language = ? or q_language = ? or q_language = ?";
			return jdbcTemplate.query(query, new Object[]{l1, l2, l3}, (rs, rowNum) -> {
            QuestionVo vo = new QuestionVo();
            vo.setQ_num(rs.getInt("q_num"));
            vo.setQ_level(rs.getString("q_level"));
            vo.setQ_title(rs.getString("q_title"));
            vo.setQ_language(rs.getString("q_language"));
            vo.setQ_info(rs.getString("q_info"));
            vo.setQ_anwserpercent(rs.getString("q_anwserpercent"));
            vo.setVisitCount(rs.getInt("visitCount"));
            return vo;
        });
    }


	public List<QuestionVo> getQuestionList(String l1, String l2, String l3, String l4) {
			String query = "select * from question where q_language = ? or q_language = ? "
					+ "or q_language = ? or q_language = ?";
			return jdbcTemplate.query(query, new Object[]{l1, l2, l3,l4}, (rs, rowNum) -> {
	            QuestionVo vo = new QuestionVo();
	            vo.setQ_num(rs.getInt("q_num"));
	            vo.setQ_level(rs.getString("q_level"));
	            vo.setQ_title(rs.getString("q_title"));
	            vo.setQ_language(rs.getString("q_language"));
	            vo.setQ_info(rs.getString("q_info"));
	            vo.setQ_anwserpercent(rs.getString("q_anwserpercent"));
	            vo.setVisitCount(rs.getInt("visitCount"));
	            return vo;
	        });
	    }

	public List<QuestionVo> getQuestionList(String l1, String l2, String l3, String l4, String l5) {
			String query = "select * from question where q_language = ? or q_language = ? "
					+ "or q_language = ? or q_language = ? or q_language = ?";
			return jdbcTemplate.query(query, new Object[]{l1, l2, l3,l4,l5}, (rs, rowNum) -> {
	            QuestionVo vo = new QuestionVo();
	            vo.setQ_num(rs.getInt("q_num"));
	            vo.setQ_level(rs.getString("q_level"));
	            vo.setQ_title(rs.getString("q_title"));
	            vo.setQ_language(rs.getString("q_language"));
	            vo.setQ_info(rs.getString("q_info"));
	            vo.setQ_anwserpercent(rs.getString("q_anwserpercent"));
	            vo.setVisitCount(rs.getInt("visitCount"));
	            return vo;
	        });
	}

    public int insertVisitCount(int qnum) {
        String query = "update question set visitCount = visitCount + 1 where q_num = ?";
        return jdbcTemplate.update(query, qnum);
    }

    public QuestionVo getCodingQuestionList(int qNum) {

        String query = "select * from question where q_num = ?";
        return jdbcTemplate.queryForObject(query, new Object[]{qNum}, (rs, rowNum) -> { 
            QuestionVo dto = new QuestionVo();
            dto.setQ_num(rs.getInt("q_num"));
            dto.setQ_title(rs.getString("q_title"));
            dto.setQ_info(rs.getString("q_info"));
          
            return dto;
        });
    }
    
    
//    public List<QuestionVo> getAllQuestions() {
//        String query = "SELECT * FROM question";
//        return jdbcTemplate.query(query, (rs, rowNum) -> {
//            QuestionVo vo = new QuestionVo();
//            vo.setQ_num(rs.getInt("q_num"));
//            vo.setQ_level(rs.getString("q_level"));
//            vo.setQ_title(rs.getString("q_title"));
//            vo.setQ_language(rs.getString("q_language"));
//            vo.setQ_info(rs.getString("q_info"));
//            vo.setQ_anwserpercent(rs.getString("q_anwserpercent"));
//            vo.setVisitCount(rs.getInt("visitCount"));
//            return vo;
//        });
//    }
//    
//    public List<QuestionVo> getQuestionList(String l1) {
//        String query = "SELECT * FROM question WHERE q_language = ?";
//        return jdbcTemplate.query(query, new Object[]{l1}, (rs, rowNum) -> {
//            QuestionVo vo = new QuestionVo();
//            vo.setQ_num(rs.getInt("q_num"));
//            vo.setQ_level(rs.getString("q_level"));
//            vo.setQ_title(rs.getString("q_title"));
//            vo.setQ_language(rs.getString("q_language"));
//            vo.setQ_info(rs.getString("q_info"));
//            vo.setQ_anwserpercent(rs.getString("q_anwserpercent"));
//            vo.setVisitCount(rs.getInt("visitCount"));
//            //list.add(dto) query �޼����� ����� ��ȯ�Ǵ� ����Ʈ�� ��Ҹ� �߰��ϴ� list.add(dto); ������ ���� �ۼ��� �ʿ䰡 �����ϴ�. query �޼���� ����� ���� ����Ʈ�� �����ϰ�, �� ��(row)�� �����͸� �����ͼ� ����Ʈ�� �߰��ϴ� �۾��� �̹� �����մϴ�. �̰��� Spring�� JdbcTemplate�� �⺻ �����Դϴ�.
//            return vo;
//            
//        });
//    }
    public List<QuestionVo> getKakaoQuestionList(Map<String, Object> param) {
        String query = "SELECT * FROM question WHERE company = 'īī��'";
        return jdbcTemplate.query(query, (rs, rowNum) -> {
            QuestionVo vo = new QuestionVo();
            vo.setQ_num(rs.getInt("q_num"));
            vo.setQ_level(rs.getString("q_level"));
            vo.setQ_title(rs.getString("q_title"));
            vo.setQ_language(rs.getString("q_language"));
            vo.setQ_info(rs.getString("q_info"));
            vo.setQ_anwserpercent(rs.getString("q_anwserpercent"));
            vo.setVisitCount(rs.getInt("visitCount"));
            // �ʿ信 ���� �ٸ� �Ӽ����� �����մϴ�.
            return vo;
        });
    }
    

    public List<QuestionVo> getAllPastQuestionList(Map<String, Object> param) {
        String query = "select * from past_q";
        return jdbcTemplate.query(query, (rs, rowNum) -> {
            QuestionVo vo = new QuestionVo();
            vo.setPast_num(rs.getInt("past_num"));
            vo.setPast_title(rs.getString("past_title"));
            // ��Ÿ �ʵ�鵵 �ʿ信 ���� �߰�
            return vo;
        });
    }
    public String getPastTitleByPastNum(int pastNum) {
        String query = "SELECT past_title FROM past_q WHERE past_num = ?";
        return jdbcTemplate.queryForObject(query, new Object[]{pastNum}, String.class);
    }

	public QuestionVo firstQuestion() {
		String query = "SELECT q_num, q_title, q_language, q_anwserpercent, q_level FROM question ORDER BY visitCount DESC, q_title ASC LIMIT 0,1";
        return jdbcTemplate.queryForObject(query, (rs, rowNum) -> { 
            QuestionVo vo = new QuestionVo();
            vo.setQ_num(rs.getInt("q_num"));
            vo.setQ_title(rs.getString("q_title"));
            vo.setQ_language(rs.getString("q_language"));
            vo.setQ_anwserpercent(rs.getString("q_anwserpercent"));
            vo.setQ_level(rs.getString("q_level"));
            // �ʿ信 ���� �ٸ� �Ӽ����� �����մϴ�.
            return vo;
        });
	}
	
	public QuestionVo secondQuestion() {
		String query = "SELECT q_num, q_title, q_language, q_anwserpercent, q_level FROM question ORDER BY visitCount DESC, q_title ASC LIMIT 1,1";
        return jdbcTemplate.queryForObject(query, (rs, rowNum) -> { 
			QuestionVo vo = new QuestionVo();
            vo.setQ_num(rs.getInt("q_num"));
            vo.setQ_title(rs.getString("q_title"));
            vo.setQ_language(rs.getString("q_language"));
            vo.setQ_anwserpercent(rs.getString("q_anwserpercent"));
            vo.setQ_level(rs.getString("q_level"));;
            // �ʿ信 ���� �ٸ� �Ӽ����� �����մϴ�.
            return vo;
        });
	}
	
	public QuestionVo thirdQuestion() {
		String query = "SELECT q_num, q_title, q_language, q_anwserpercent, q_level FROM question ORDER BY visitCount DESC, q_title ASC LIMIT 2,1";
        return jdbcTemplate.queryForObject(query, (rs, rowNum) -> { 
			QuestionVo vo = new QuestionVo();
            vo.setQ_num(rs.getInt("q_num"));
            vo.setQ_title(rs.getString("q_title"));
            vo.setQ_language(rs.getString("q_language"));
            vo.setQ_anwserpercent(rs.getString("q_anwserpercent"));
            vo.setQ_level(rs.getString("q_level"));
            // �ʿ信 ���� �ٸ� �Ӽ����� �����մϴ�.
            return vo;
        });
	}
	
	public QuestionVo fourthQuestion() {
		String query = "SELECT q_num, q_title, q_language, q_anwserpercent, q_level FROM question ORDER BY visitCount DESC, q_title ASC LIMIT 3,1";
        return jdbcTemplate.queryForObject(query, (rs, rowNum) -> { 
			QuestionVo vo = new QuestionVo();
            vo.setQ_num(rs.getInt("q_num"));
            vo.setQ_title(rs.getString("q_title"));
            vo.setQ_language(rs.getString("q_language"));
            vo.setQ_anwserpercent(rs.getString("q_anwserpercent"));
            vo.setQ_level(rs.getString("q_level"));
            // �ʿ信 ���� �ٸ� �Ӽ����� �����մϴ�.
            return vo;
        });
	}
	
	public QuestionVo fifthQuestion() {
		String query = "SELECT q_num, q_title, q_language, q_anwserpercent, q_level FROM question ORDER BY visitCount DESC, q_title ASC LIMIT 4,1";
        return jdbcTemplate.queryForObject(query, (rs, rowNum) -> { 
			QuestionVo vo = new QuestionVo();
            vo.setQ_num(rs.getInt("q_num"));
            vo.setQ_title(rs.getString("q_title"));
            vo.setQ_language(rs.getString("q_language"));
            vo.setQ_anwserpercent(rs.getString("q_anwserpercent"));
            vo.setQ_level(rs.getString("q_level"));
            // �ʿ信 ���� �ٸ� �Ӽ����� �����մϴ�.
            return vo;
        });
	}

}

package com.codingtest.visit;

import java.sql.Timestamp;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class VisitDao {
	
	JdbcTemplate jdbcTemplate;


    
    public int solvequestion(String userId, int qnum, String q_language, String q_title, String q_level) {
        // SQL 쿼리
        String query = "INSERT INTO visit (Id, q_num,q_language,q_title,q_level) VALUES (?, ?,?,?,?)";

        // JdbcTemplate을 사용하여 쿼리 실행
        return jdbcTemplate.update(query, userId, qnum,q_language,q_title,q_level);
    }
    
//	
//	
//	public List<VisitDTO> getVlist(){
//		List<VisitDTO> list= new ArrayList<VisitDTO>();
//		try {
//			String query = "SELECT visit.*,question.* from visit INNER JOIN question ON visit.q_num = question.q_num order by visitNum desc limit 0,5";
//			pstmt = con.prepareStatement(query);
//			rs = pstmt.executeQuery();
//			while(rs.next()){
//				VisitDTO dto = new VisitDTO();
//				dto.setId(rs.getString("Id"));
//				dto.setQ_num(rs.getInt("q_num"));
//				dto.setVisitTime(rs.getTimestamp("visitTime"));
//				dto.setQ_title(rs.getString("q_title"));
//				dto.setQ_language(rs.getString("q_language"));
//				dto.setQ_level(rs.getString("q_level"));
//				list.add(dto);
//			}
//		} catch (Exception e) {
//		} 
//			return list;
//	}

}

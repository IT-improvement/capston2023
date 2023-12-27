package com.codingtest.chatroom;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class ChatListDao {
	 @Autowired
	    private JdbcTemplate jdbcTemplate;
	 
	 public List<ChatListVo> selectChatList(Map<String, Object> param) {
		    // 적절한 쿼리와 파라미터 처리를 수행
		 //여기 chatvisit 쿼리문 없어서 승재한테 받아야함
		    String query = "SELECT * FROM chatroom INNER JOIN chatvisit on chatroom.id = chatvisit.id AND chatroom.roomTitle = chatvisit.roomTitle;";
		    
		    // 여기에 쿼리 및 파라미터 처리 로직을 추가

		    return jdbcTemplate.query(query, (rs, rowNum) -> {
		        ChatListVo vo = new ChatListVo();
		        vo.setCreateTime(rs.getTimestamp("createTime"));
		        vo.setRoomTitle(rs.getString("roomTitle"));
		        vo.setLanguage(rs.getString("language"));
		        vo.setAllowMem(rs.getInt("allowMem"));
		        vo.setStatusMem(rs.getInt("statusMem"));
		        vo.setId(rs.getString("id"));
		        vo.setVisit_num(rs.getInt("visit_num"));
		        return vo;
		    });
	 }
	

//	public int insertWrite(ChatListDTO dto) {
//		int result = 0;
//		try {
//			String query = "insert into chatroom(createTime,roomTitle,language,allowMem,roomPwd,id,statusMem) ";
//			query += "values(?,?,?,4,?,?,1)";
//			pstmt = con.prepareStatement(query);
//			pstmt.setTimestamp(1, dto.getCreateTime());
//			pstmt.setString(2, dto.getRoomTitle());
//			pstmt.setString(3, dto.getLanguage());			
//			pstmt.setString(4, dto.getRoomPwd());
//			pstmt.setString(5, dto.getId());
//			result = pstmt.executeUpdate();
//		} catch (Exception e) {
//			System.out.println("Exception[insertWrite]:" + e.getMessage());
//		}
//		return result;
//	}
//	public ChatListDTO selectTitle(String id) {
//		ChatListDTO dto = new ChatListDTO();
//		String query = "select roomTitle from chatroom where id=?";
//		try {
//			pstmt = con.prepareStatement(query);
//			pstmt.setString(1, id);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				dto.setRoomTitle(rs.getString("roomTitle"));
//			}
//		} catch (Exception e) {
//			System.out.println("Exception[selectTitle] : " + e.getMessage());
//		}
//		return dto;
//	}
	
}

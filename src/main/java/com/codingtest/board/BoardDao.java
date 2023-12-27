package com.codingtest.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class BoardDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public BoardDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<BoardVo> firstChatRooms() {
        String query = "SELECT * FROM chatroom ORDER BY statusMem DESC, createTime ASC, roomTitle ASC LIMIT 0, 1";

        return jdbcTemplate.query(query, (rs, rowNum) -> {
            BoardVo boardVo = new BoardVo();
            boardVo.setRoomTitle(rs.getString("roomTitle"));
            boardVo.setLanguage(rs.getString("language"));
            boardVo.setCreateTime(rs.getDate("createTime"));
            boardVo.setId(rs.getString("id"));
            boardVo.setAllowMem(rs.getInt("allowMem"));
            boardVo.setStatusMem(rs.getInt("statusMem"));
            boardVo.setRoomPwd(rs.getString("roomPwd"));
            return boardVo;
        });
    }
    
    public List<BoardVo> secondChartRoom() {
    	 String query = "SELECT * FROM chatroom ORDER BY statusMem DESC, createTime ASC, roomTitle asc LIMIT 1, 1";

         return jdbcTemplate.query(query, (rs, rowNum) -> {  //rs는 ResultSet 객체를 나타내며, rowNum은 현재 행 번호를 나타냄
             BoardVo boardVo = new BoardVo();
             boardVo.setRoomTitle(rs.getString("roomTitle"));
             boardVo.setLanguage(rs.getString("language"));
             boardVo.setCreateTime(rs.getDate("createTime"));
             boardVo.setId(rs.getString("id"));
             boardVo.setAllowMem(rs.getInt("allowMem"));
             boardVo.setStatusMem(rs.getInt("statusMem"));
             boardVo.setRoomPwd(rs.getString("roomPwd"));
             return boardVo;
         });
    }
    
    public List<BoardVo> thirdChartRoom(){
    String query = "SELECT * FROM chatroom ORDER BY statusMem DESC, createTime ASC, roomTitle asc LIMIT 2, 1";
    return jdbcTemplate.query(query,(rs,rowNum) -> {
    	BoardVo boardVo = new BoardVo();
    	 boardVo.setRoomTitle(rs.getString("roomTitle"));
         boardVo.setLanguage(rs.getString("language"));
         boardVo.setCreateTime(rs.getDate("createTime"));
         boardVo.setId(rs.getString("id"));
         boardVo.setAllowMem(rs.getInt("allowMem"));
         boardVo.setStatusMem(rs.getInt("statusMem"));
         boardVo.setRoomPwd(rs.getString("roomPwd"));
         return boardVo;
    	
	
    });
    
    
    }
    
    public List<BoardVo> fourthChartRoom(){
    	String query = "SELECT * FROM chatroom ORDER BY statusMem DESC, createTime ASC, roomTitle asc LIMIT 3, 1";
    	 return jdbcTemplate.query(query,(rs,rowNum) -> {
    	    	BoardVo boardVo = new BoardVo();
    	    	 boardVo.setRoomTitle(rs.getString("roomTitle"));
    	         boardVo.setLanguage(rs.getString("language"));
    	         boardVo.setCreateTime(rs.getDate("createTime"));
    	         boardVo.setId(rs.getString("id"));
    	         boardVo.setAllowMem(rs.getInt("allowMem"));
    	         boardVo.setStatusMem(rs.getInt("statusMem"));
    	         boardVo.setRoomPwd(rs.getString("roomPwd"));
    	         return boardVo;
    	    	
    	
    	  });
    
    }
    
}
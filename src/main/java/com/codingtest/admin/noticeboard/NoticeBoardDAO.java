package com.codingtest.admin.noticeboard;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;


@Component
public class NoticeBoardDAO {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public NoticeBoardDAO(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public List<NoticeBoardDTO> listNoticeBoard(){
		String query = "SELECT * FROM mvcboard";
		
		return jdbcTemplate.query(query, (rs, rowNum) -> {
			NoticeBoardDTO noticeBoardDTO = new NoticeBoardDTO();
			noticeBoardDTO.setContent(rs.getString("content"));
			noticeBoardDTO.setIdx(rs.getInt("idx"));
			noticeBoardDTO.setName(rs.getString("name"));
			noticeBoardDTO.setTitle(rs.getString("title"));
			noticeBoardDTO.setPostdate(rs.getTimestamp("postdate"));
			noticeBoardDTO.setVisitcount(rs.getInt("visitcount"));
			return noticeBoardDTO;
		});
	}
	
    public void addPost(String title, String content, String name, Timestamp postDate) {
        String sql = "INSERT INTO mvcboard (title, content, name, postdate) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, title, content, name, postDate);
    }
	
    public NoticeBoardDTO getPostByIdx(int idx) {
        // 특정 게시글 조회 쿼리 작성
        String query = "SELECT * FROM mvcboard WHERE idx = ?";
        return jdbcTemplate.queryForObject(query, new Object[]{idx}, new BeanPropertyRowMapper<>(NoticeBoardDTO.class));
    }
    
    public int getEditPost(NoticeBoardDTO dto) {
    	String query = "UPDATE mvcboard SET title = ?, content = ? WHERE idx = ?";
    	return jdbcTemplate.update(query,dto.getTitle(), dto.getContent(), dto.getIdx());
    }
    
    public void deleteById(int idx) {
    	String query = "DELETE FROM mvcboard WHERE idx = ?";
    	 jdbcTemplate.update(query,idx);
    }
    public List<CommentsDTO> getCommentsByPostId(int postId) {
        String query = "SELECT * FROM comments WHERE postId = ?";
        return jdbcTemplate.query(query, new Object[]{postId}, new BeanPropertyRowMapper<>(CommentsDTO.class));
    }
    public void addComment(CommentsDTO comment) {
        String query = "INSERT INTO comments (postId, content, name, postdate) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(query, comment.getPostId(), comment.getContent(), comment.getName(), comment.getPostdate());
    }

	
	
	
}

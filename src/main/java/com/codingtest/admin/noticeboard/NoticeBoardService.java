package com.codingtest.admin.noticeboard;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeBoardService {
	
	@Autowired
	NoticeBoardDAO noticeBoardDAO;
	NoticeBoardDTO noticeBoardDTO;
	
	public List<NoticeBoardDTO> getNoticeBoardList(){
		return noticeBoardDAO.listNoticeBoard();
	}
	  
	public void addPost(String title, String content, String name, Timestamp postDate) {
	
		noticeBoardDAO.addPost(title, content, name, postDate);

	}

	   public NoticeBoardDTO getPostByIdx(int idx) {
	        return noticeBoardDAO.getPostByIdx(idx);
	    }
	   
	   public int editPost(NoticeBoardDTO dto) {
		   return noticeBoardDAO.getEditPost(dto);
		   
	   }
	   public void deletePostByIdx(int idx) {
		   noticeBoardDAO.deleteById(idx);
	    }
	   public List<CommentsDTO> getCommentsByPostId(int postId) {
	        return noticeBoardDAO.getCommentsByPostId(postId);
	    }
	    public void addComment(CommentsDTO comment) {
	    	noticeBoardDAO.addComment(comment);
	    }

	   

	
}

package com.codingtest.admin.noticeboard;

import java.sql.Timestamp;

public class CommentsDTO {
	   private int commentId;
	    private int postId;
	    private String content;
	    private String name;
	    private Timestamp postdate;
		public int getCommentId() {
			return commentId;
		}
		public void setCommentId(int commentId) {
			this.commentId = commentId;
		}
		public int getPostId() {
			return postId;
		}
		public void setPostId(int postId) {
			this.postId = postId;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public Timestamp getPostdate() {
			return postdate;
		}
		public void setPostdate(Timestamp postdate) {
			this.postdate = postdate;
		}
	    
}

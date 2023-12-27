package com.codingtest.admin.noticeboard;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NoticeBoardController {
	
	@Autowired
	NoticeBoardService noticeBoardService;
	
	@GetMapping("/noticeboard")
	public String noticeBoard(Model model) {
		List<NoticeBoardDTO> noticeBoardDTO = noticeBoardService.getNoticeBoardList();
		model.addAttribute("noticeBoardDTO", noticeBoardDTO);
		String nextPage = "noticeboard/noticeboard";
	
	    return nextPage;
	}
	
	 @GetMapping("/addPostForm")
	    public String addPostForm() {
	        return "noticeboard/WriteForm"; // 이 부분은 실제 jsp 페이지의 이름으로 수정해야 합니다.
	    }
	 
	 
	 
	  @PostMapping("/addPost")
	    public String addPost(@RequestParam("title") String title,
	                          @RequestParam("content") String content,
	                          @RequestParam("name") String name
	    		) {
	        // Principal 객체를 통해 현재 로그인 중인 사용자의 정보를 가져옵니다.
		
	        // 현재 시간
	        Timestamp postDate = new Timestamp(System.currentTimeMillis());

	        // 게시글 추가 서비스 호출
	        noticeBoardService.addPost(title, content, name, postDate);

	        return "redirect:/noticeboard";
	    }
	  
	  @GetMapping("/boardContents")
	  public String boardContents(@RequestParam("idx") int idx, Model model) {
	      NoticeBoardDTO mvcboard = noticeBoardService.getPostByIdx(idx);

	      // 가져온 게시글의 정보를 모델에 추가
	      model.addAttribute("mvcboard", mvcboard);
	      
	      List<CommentsDTO> comments = noticeBoardService.getCommentsByPostId(idx);
	      model.addAttribute("comments", comments);
	      
	      return "noticeboard/BoardContents"; // JSP 페이지의 경로
	  }
	  
	  @GetMapping("/editPostForm")
	    public String editPostForm(@RequestParam("idx") int idx, Model model) {
	        NoticeBoardDTO mvcboard = noticeBoardService.getPostByIdx(idx);

	        // 가져온 게시글의 정보를 모델에 추가
	        model.addAttribute("mvcboard", mvcboard);
	        return "noticeboard/editForm"; // 수정 폼의 JSP 페이지의 경로
	    }
	  
	  @PostMapping("/editPost")
	    public String editPost(@ModelAttribute("editedPost") NoticeBoardDTO editedPost) {
	        // editedPost 객체를 사용하여 게시글 수정 처리
	        noticeBoardService.editPost(editedPost);
	        return "redirect:/boardContents?idx=" + editedPost.getIdx();
	    }
	   @GetMapping("/deletePost")
	    public String deletePost(@RequestParam("idx") int idx) {
	        noticeBoardService.deletePostByIdx(idx);
	        return "redirect:/noticeboard"; // 삭제 후 목록으로 리다이렉트
	    }
	   
	   @PostMapping("/addComment")
	   public String addComment(@ModelAttribute("commentForm") CommentsDTO comment, HttpSession session, Model model) {
	       // postId는 comment 객체에서 가져올 수 있습니다.
	       int postId = comment.getPostId();

	       // authenticatedMemberId는 세션에서 가져올 수 있습니다.
	       String authenticatedMemberId = (String) session.getAttribute("authenticatedMemberId");
	       Timestamp postDate = new Timestamp(System.currentTimeMillis());
	       comment.setName(authenticatedMemberId);
	       comment.setPostdate(postDate);

	       noticeBoardService.addComment(comment);

	       // 추가된 댓글 목록을 가져와서 모델에 추가
	       List<CommentsDTO> comments = noticeBoardService.getCommentsByPostId(postId);
	       model.addAttribute("comments", comments);

	       // 게시글로 리다이렉트
	       return "redirect:/boardContents?idx=" + postId;
	   }
	   
	   @GetMapping("/back")
	   public String back() {
		   return "redirect:/noticeboard";
	  }
}
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
	        return "noticeboard/WriteForm"; // �� �κ��� ���� jsp �������� �̸����� �����ؾ� �մϴ�.
	    }
	 
	 
	 
	  @PostMapping("/addPost")
	    public String addPost(@RequestParam("title") String title,
	                          @RequestParam("content") String content,
	                          @RequestParam("name") String name
	    		) {
	        // Principal ��ü�� ���� ���� �α��� ���� ������� ������ �����ɴϴ�.
		
	        // ���� �ð�
	        Timestamp postDate = new Timestamp(System.currentTimeMillis());

	        // �Խñ� �߰� ���� ȣ��
	        noticeBoardService.addPost(title, content, name, postDate);

	        return "redirect:/noticeboard";
	    }
	  
	  @GetMapping("/boardContents")
	  public String boardContents(@RequestParam("idx") int idx, Model model) {
	      NoticeBoardDTO mvcboard = noticeBoardService.getPostByIdx(idx);

	      // ������ �Խñ��� ������ �𵨿� �߰�
	      model.addAttribute("mvcboard", mvcboard);
	      
	      List<CommentsDTO> comments = noticeBoardService.getCommentsByPostId(idx);
	      model.addAttribute("comments", comments);
	      
	      return "noticeboard/BoardContents"; // JSP �������� ���
	  }
	  
	  @GetMapping("/editPostForm")
	    public String editPostForm(@RequestParam("idx") int idx, Model model) {
	        NoticeBoardDTO mvcboard = noticeBoardService.getPostByIdx(idx);

	        // ������ �Խñ��� ������ �𵨿� �߰�
	        model.addAttribute("mvcboard", mvcboard);
	        return "noticeboard/editForm"; // ���� ���� JSP �������� ���
	    }
	  
	  @PostMapping("/editPost")
	    public String editPost(@ModelAttribute("editedPost") NoticeBoardDTO editedPost) {
	        // editedPost ��ü�� ����Ͽ� �Խñ� ���� ó��
	        noticeBoardService.editPost(editedPost);
	        return "redirect:/boardContents?idx=" + editedPost.getIdx();
	    }
	   @GetMapping("/deletePost")
	    public String deletePost(@RequestParam("idx") int idx) {
	        noticeBoardService.deletePostByIdx(idx);
	        return "redirect:/noticeboard"; // ���� �� ������� �����̷�Ʈ
	    }
	   
	   @PostMapping("/addComment")
	   public String addComment(@ModelAttribute("commentForm") CommentsDTO comment, HttpSession session, Model model) {
	       // postId�� comment ��ü���� ������ �� �ֽ��ϴ�.
	       int postId = comment.getPostId();

	       // authenticatedMemberId�� ���ǿ��� ������ �� �ֽ��ϴ�.
	       String authenticatedMemberId = (String) session.getAttribute("authenticatedMemberId");
	       Timestamp postDate = new Timestamp(System.currentTimeMillis());
	       comment.setName(authenticatedMemberId);
	       comment.setPostdate(postDate);

	       noticeBoardService.addComment(comment);

	       // �߰��� ��� ����� �����ͼ� �𵨿� �߰�
	       List<CommentsDTO> comments = noticeBoardService.getCommentsByPostId(postId);
	       model.addAttribute("comments", comments);

	       // �Խñ۷� �����̷�Ʈ
	       return "redirect:/boardContents?idx=" + postId;
	   }
	   
	   @GetMapping("/back")
	   public String back() {
		   return "redirect:/noticeboard";
	  }
}
package com.codingtest.question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PastQuestionController {
	
	@Autowired
	PastQuestionListService pastQuestionListService;
	
	@GetMapping("/pastQusetionList")
	public String PastQuestionList(Model model) {
      
        List<QuestionVo> pastQuestionList = pastQuestionListService.getPastQuestionList();
        
        // �𵨿� �����͸� �߰�
        model.addAttribute("pastQuestionList", pastQuestionList);
        System.out.println("[PastQuestionController] : PastQuestionList()");
        String nextPage = "question/past-question";
        
        return nextPage;
	}
	
	  @GetMapping("/pQuestionList")
	    public String pQuestionList(@RequestParam("past_num") int pastNum, Model model) {
	        // ���⼭ pastNum�� �̿��Ͽ� �ش� ���� past_title�� �������� ���� �޼ҵ� ȣ��
	        String pastTitle = pastQuestionListService.getPastTitleByPastNum(pastNum);

	        // �𵨿� ������ �߰�
	        model.addAttribute("pastTitle", pastTitle);
	        
	        List<QuestionVo> p_QuestionList = pastQuestionListService.getP_QuestionList();
	        model.addAttribute("p_QuestionList", p_QuestionList);


	        // ��ȯ�� JSP �������� ��θ� ��ȯ
	        return "question/questionList";
	    }
	
	
	

}

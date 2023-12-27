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
        
        // 모델에 데이터를 추가
        model.addAttribute("pastQuestionList", pastQuestionList);
        System.out.println("[PastQuestionController] : PastQuestionList()");
        String nextPage = "question/past-question";
        
        return nextPage;
	}
	
	  @GetMapping("/pQuestionList")
	    public String pQuestionList(@RequestParam("past_num") int pastNum, Model model) {
	        // 여기서 pastNum을 이용하여 해당 값의 past_title을 가져오는 서비스 메소드 호출
	        String pastTitle = pastQuestionListService.getPastTitleByPastNum(pastNum);

	        // 모델에 데이터 추가
	        model.addAttribute("pastTitle", pastTitle);
	        
	        List<QuestionVo> p_QuestionList = pastQuestionListService.getP_QuestionList();
	        model.addAttribute("p_QuestionList", p_QuestionList);


	        // 반환할 JSP 페이지의 경로를 반환
	        return "question/questionList";
	    }
	
	
	

}

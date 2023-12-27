package com.codingtest.question;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class QuestionController {
	
	@Autowired
	QuestionService questionService;
	
	
	@GetMapping("/questionList")
    public String questionList(Model model) {
        System.out.println("[QuestionController] : questionList()");
        
        // 서비스를 통해 문제 리스트를 가져옴
        List<QuestionVo> questionList = questionService.getQuestionList();
        
        // 모델에 데이터를 추가
        model.addAttribute("questionList", questionList);
        
        String nextPage = "question/problomSovingPage";
        
        return nextPage;
	}
	
	@GetMapping("/playCoding")
	  public String playCoding(@RequestParam("q_num") int qNum, Model model) {
        System.out.println("[QuestionController] : playCoding()");
        questionService.incrementVisitCount(qNum);
		
		QuestionVo question = questionService.getCodingQuestion(qNum);
        model.addAttribute("question", question);
		
		String nextPage="question/PlayCodingpg";
		return nextPage;
		
	}
	@GetMapping("/correct")
		public String correct() {
		System.out.println("[QuestionController] : correct()");
		
		String nextPage="question/problomSovingPage";
		return nextPage;
		
	}
	
	@RequestMapping("/problomSovingPage1")
	public String showProblomSovingPage1(@RequestParam(value = "languageChecked", required = false) String[] languages, Model model) {
	    List<QuestionVo> questionList = questionService.getQuestionList(languages);
        System.out.println("[QuestionController] : problomSovingPage1()");

	    model.addAttribute("questionList", questionList);
	    String nextPage =  "question/problomSovingPage1";
	    return nextPage; // JSP 뷰 이름
	}
	
}




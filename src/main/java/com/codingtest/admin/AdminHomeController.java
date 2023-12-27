package com.codingtest.admin;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class AdminHomeController {
	@RequestMapping(value = {"","/"}, method = RequestMethod.GET)
	public String loginComfrm() {
		System.out.println("[AdminHomeController] loginComfrm()");
		
		//String nextPage = "question/PlayCodingpg";
	String nextPage = "mainA/pages-login";
		
		return nextPage;
	}

}

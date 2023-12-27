package com.codingtest.openchat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OpenchatController {

	@GetMapping("/openchat")
	public String openchat() {
		String nextPage="openchat/openchat";
		return nextPage;
	}
}

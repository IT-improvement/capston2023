package com.codingtest.admin.join;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.codingtest.admin.member.MemberVo;
import com.codingtest.board.BoardVo;
import com.codingtest.board.ChatroomService;
import com.codingtest.question.QuestionService;
import com.codingtest.question.QuestionVo;

@Controller

public class MemberController {
	@Autowired
	AdminMemberService adminMemberService; // 占쎌뵠占쎌쟽野껓옙 service �뜮�뜃而쇽㎗占� 雅뚯눘�뿯 占쎄돌餓λ쵐肉� createAccountConfirm占쎌뵠
											// 占쎌뵠野껉퍔�뱽 占쎄텢占쎌뒠占쎈막占쎈땾占쎌뿳占쎈뼄.

	@Autowired
	private QuestionService questionService;
	
	
	@PostMapping("/loginConfirm")
	public String loginConfirm(MemberVo memberVo, HttpSession session, Model model) {
		System.out.println("[MemberController] loginConfirm()");

		MemberVo loginMemberVo = adminMemberService.loginConfirm(memberVo);

		if (loginMemberVo != null) {
			// 嚥≪뮄�젃占쎌뵥 占쎄쉐�⑤벏釉� 野껋럩�뒭, 占쎄쉭占쎈�∽옙肉� 占쎄텢占쎌뒠占쎌쁽 占쎌젟癰귨옙 占쏙옙占쎌삢
			session.setAttribute("authenticatedMemberId", loginMemberVo.getId());

			return "redirect:/main_page";
		} else {
			// 濡쒓렇�씤 �떎�뙣 �떆 �떎�뙣 硫붿떆吏�瑜� 酉곕줈 �쟾�떖

			model.addAttribute("loginFailed", true);

			// 嚥≪뮄�젃占쎌뵥 占쎈뼄占쎈솭占쎈립 野껋럩�뒭, 占쎈뼄占쎈뻻 嚥≪뮄�젃占쎌뵥 占쎈읂占쎌뵠筌욑옙嚥∽옙
			return "mainA/pages-login"; // 嚥≪뮄�젃占쎌뵥 占쎈쨲 占쎈읂占쎌뵠筌욑옙 (login.jsp)
		}
	}

	@RequestMapping(value = "/main_page", method = RequestMethod.GET)
	public String mainPage(Model model) {
		int userCount = adminMemberService.getUserCount();
		model.addAttribute("userCount", userCount);

		int nowUserCount = adminMemberService.getNowUserCount();
		model.addAttribute("nowUserCount", nowUserCount);

		int totalquestion = adminMemberService.getTotalquestion();
		model.addAttribute("totalquestion", totalquestion);

		QuestionVo firstQuestion = questionService.firstQuestion();
		QuestionVo secondQuestion = questionService.secondQuestion();
		QuestionVo thirdQuestion = questionService.thirdQuestion();
		QuestionVo fourthQuestion = questionService.fourthQuestion();
		QuestionVo fifthQuestion = questionService.fifthQuestion();
		model.addAttribute("firstQuestion", firstQuestion);
		model.addAttribute("secondQuestion", secondQuestion);
		model.addAttribute("thirdQuestion", thirdQuestion);
		model.addAttribute("fourthQuestion", fourthQuestion);
		model.addAttribute("fifthQuestion", fifthQuestion);

		return "mainA/main_page";
	}

	@RequestMapping(value = "/createAccountForm", method = RequestMethod.GET)
	public String createAccountForm() {
		System.out.println("[MemberController] createAccountForm()");

		String nextPage = "mainA/pages-sign-up";
		return nextPage;
	}

//	@PostMapping("/createAccountConfirm")
//	public String createAccountConfirm(
//	    @ModelAttribute MemberVo memberVo,
//	    @RequestParam("address_1") String address1,
//	    @RequestParam("address_2") String address2,
//	    @RequestParam("zipcode") String zipcode,
//	    @RequestParam("profileImage") String profileImage) { // 蹂�寃쎈맂 遺�遺�
//	    System.out.println("[MemberController] createAccountConfirm()");
//
//	    String nextPage;
//
//	    // 二쇱냼 �꽕�젙
//	    String address = address1 + " " + address2;
//	    memberVo.setAddress(address);
//	    memberVo.setZipcode(zipcode);
//
//	    // �봽濡쒗븘 �씠誘몄� 寃쎈줈 �꽕�젙
//	    memberVo.setProfileImage(profileImage);
//
//	    int result = adminMemberService.createAccountConfirm(memberVo);
//
//	    if (result <= 0) {
//	        nextPage = "mainA/pages-sign-up";
//	    } else {
//	        // �쉶�썝媛��엯 �꽦怨� �떆 濡쒓렇�씤 �럹�씠吏�濡� �씠�룞
//	        nextPage = "redirect:/";
//	    }
//
//	    return nextPage;
//	}
//	

	@RequestMapping(value = "/createAccountConfirm", method = RequestMethod.POST)
	public String createAccountConfirm(MemberVo memberVo, @RequestParam("address_1") String address1,
			@RequestParam("address_2") String address2, @RequestParam("zipcode") String zipcode, 
			@RequestParam("userEmail1") String userEmail1 ,@RequestParam("userEmail2") String userEmail2) {
		System.out.println("[MemberController] createAccountConfirm()");

		String nextPage;

		// 雅뚯눘�꺖占쏙옙 占쎌뒭占쎈젶甕곕뜇�깈�몴占� 鈺곌퀬鍮�占쎈릭占쎈연 address 占쎈툡占쎈굡占쎈퓠 占쎄퐬占쎌젟
		String email = userEmail1 + userEmail2;
		String address = address1 + " " + address2;
		memberVo.setAddress(address);
		memberVo.setZipcode(zipcode);
		memberVo.setEmail(email);

		int result = adminMemberService.createAccountConfirm(memberVo);

		if (result <= 0) {
			nextPage = "mainA/pages-sign-up";
		} else {
			// 占쎌돳占쎌뜚揶쏉옙占쎌뿯占쎌뵠 占쎄쉐�⑤벏釉�筌롳옙 嚥≪뮄�젃占쎌뵥 占쎈읂占쎌뵠筌욑옙嚥∽옙 �뵳�됰뼄占쎌뵠占쎌젂占쎈뱜占쎈릭�⑨옙
			// 筌롫뗄�뻻筌욑옙�몴占� 占쎌읈占쎈뼎
			return "mainA/pages-login";
		}

		return nextPage;
	}

	@PostMapping("/idCheck")
	public ResponseEntity<String> idCheck(@RequestParam("id") String id) {
		int cnt = adminMemberService.idCheck(id);
		System.out.println("[MemberController] idCheck()");
		if (cnt == 0) {
			return ResponseEntity.ok("0");
		} else {
			return ResponseEntity.ok("1");
		}
	}

//	@RequestMapping(value = "/isIdDuplicated", method = RequestMethod.POST)
//	public String isIdDuplicated(String id, Model model) {
//	    System.out.println("[JoinController] isIdDuplicated");
//	    int result = joinMemberService.isIdDuplicated(id);
//	    model.addAttribute("result", result); // 餓λ쵎�궗 筌ｋ똾寃� 野껉퀗�궢�몴占� 筌뤴뫀�쑞占쎈퓠 �빊遺쏙옙
//	    return "mainA/CheckId"; // 餓λ쵎�궗 筌ｋ똾寃� 野껉퀗�궢揶쏉옙 占쎈ご占쎈뻻占쎈┷占쎈뮉 �뀎占� 占쎈읂占쎌뵠筌욑옙嚥∽옙 占쎌뵠占쎈짗
//	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// �꽭�뀡�뿉�꽌 濡쒓렇�씤�맂 �궗�슜�옄�쓽 �븘�씠�뵒瑜� �뼸�뼱�샂
		String userId = (String) session.getAttribute("authenticatedMemberId");
		System.out.println("[MemberController] logout()");
		// 濡쒓렇�븘�썐 �꽌鍮꾩뒪 �샇異�
		adminMemberService.logout(userId);
		return "redirect:/"; // 濡쒓렇�씤 �럹�씠吏�濡� 由щ떎�씠�젆�듃
	}

	@GetMapping("/myprofile")
	public String myprofile(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("authenticatedMemberId");
		MemberVo membervo = adminMemberService.userinfo(userId);
		model.addAttribute("membervo", membervo);
		String nextPage = "myprofile/profile";
		return nextPage;
	}

	@GetMapping("/about")
	public String about() {
		String nextPage = "mainA/main_about";
		return nextPage;
	}

	@GetMapping("/loginGo")
    public String loginGo() {
        return "redirect:/";
    }
	@GetMapping("/pagesForgetPwd")
    public String pagesForgetPwd() {
        return "mainA/pages-forgot-password";
    }
	@GetMapping("/pagesChagePwd")
    public String pagesChangePwd() {
        return "mainA/pages-change-password";
    }
	
	@PostMapping("/changePwdConfirm")
	public String changePwdConfirm(MemberVo memberVo, Model model, HttpServletRequest request) {
	    System.out.println("[MemberController] changePwdConfirm()");

	    MemberVo pwdMemberVo = adminMemberService.findUserForPasswordRecovery(
	            memberVo.getId(), memberVo.getQuestion(), memberVo.getAnswer(), memberVo.getEmail());

	    model.addAttribute("authenticatedMember", pwdMemberVo);

	    if (pwdMemberVo == null) {
	        request.setAttribute("msg", "아이디 또는 답변이 틀렸습니다.");
	        return "mainA/pages-forgot-password";
	    } else {
	        return "/mainA/showPopup";
	    }
	}

	@PostMapping("/changePwdOkConfirm")
	public String changePwdOkConfirm(MemberVo memberVo, @RequestParam("newPassword") String newPassword,
			@RequestParam("confirmPassword") String confirmPassword, Model model) {
		System.out.println("[MemberController] changePwdOkConfirm()");
		String id = memberVo.getId();
		memberVo.setPwd(confirmPassword);
		int result = adminMemberService.changePwd(memberVo);
		if (result <= 0) {
			return "mainA/pages-change-password";
		}
		return "mainA/pages-login";
	}
	
	
}

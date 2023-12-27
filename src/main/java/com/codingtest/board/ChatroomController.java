package com.codingtest.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.codingtest.chatroom.ChatListService;
import com.codingtest.chatroom.ChatListVo;

@Controller
public class ChatroomController {
	@Autowired
	private ChatListService chatListService;
	
	
	@GetMapping("/ChatListPage")
	public String chatList(Model model, HttpSession session) {

	    // 적절한 파라미터를 설정하여 전달
	    Map<String, Object> param = new HashMap<>();
	    List<ChatListVo> chatList = chatListService.getChatList(param);

	    // chatList를 모델에 추가
	    model.addAttribute("chatList", chatList);

	    return "chat_room/ChatListPage";
	}
}

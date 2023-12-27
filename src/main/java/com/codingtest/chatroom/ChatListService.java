package com.codingtest.chatroom;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatListService {
	
	
    @Autowired
    private ChatListDao chatListDao;

    
    public List<ChatListVo> getChatList(Map<String, Object> param) {
        // ������ �Ķ���� ���� ���� �ʿ��ϴٸ� �߰� ����
        return chatListDao.selectChatList(param);
    }

}

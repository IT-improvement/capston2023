package com.codingtest.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatroomService {

    @Autowired
    private BoardDao boardDao;

    public List<BoardVo> getFirstChatrooms() {
        return boardDao.firstChatRooms();
    }
    
    public List<BoardVo> getSecondChartooms(){
    	return boardDao.secondChartRoom();
    }
    
    public List<BoardVo> getThirdChartRooms(){
    	return boardDao.thirdChartRoom();
    }
    
    public List<BoardVo> getFourthChatrRoom(){
    	return boardDao.fourthChartRoom();
    }
}
package com.codingtest.question;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PastQuestionListService {
	
	@Autowired
	QuestionDao questionDao;
	
	   public List<QuestionVo> getPastQuestionList() {
	        return questionDao.getAllPastQuestionList(new HashMap<>());
	    }
	   public List<QuestionVo> getP_QuestionList() {
	        return questionDao.getKakaoQuestionList(new HashMap<>());
	    }
	   public String getPastTitleByPastNum(int pastNum) {
	        // pastNum을 이용하여 해당 값의 past_title을 가져오는 DAO 메소드 호출
	        return questionDao.getPastTitleByPastNum(pastNum);
	    }
	    
}

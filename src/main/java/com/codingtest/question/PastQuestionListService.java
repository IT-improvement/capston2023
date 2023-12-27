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
	        // pastNum�� �̿��Ͽ� �ش� ���� past_title�� �������� DAO �޼ҵ� ȣ��
	        return questionDao.getPastTitleByPastNum(pastNum);
	    }
	    
}

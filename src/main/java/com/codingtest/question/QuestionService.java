package com.codingtest.question;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingtest.visit.VisitVo;


@Service
public class QuestionService {
	
	@Autowired
	QuestionDao questionDao;
	VisitVo visitVo;
	
    public List<QuestionVo> getQuestionList() {
        return questionDao.getQuestionList(new HashMap<>());
    }
    public QuestionVo firstQuestion() {
        return questionDao.firstQuestion();
    }
    public QuestionVo secondQuestion() {
        return questionDao.secondQuestion();
    }
    public QuestionVo thirdQuestion() {
        return questionDao.thirdQuestion();
    }
    public QuestionVo fourthQuestion() {
        return questionDao.fourthQuestion();
    }
    public QuestionVo fifthQuestion() {
        return questionDao.fifthQuestion();
    }
    
    public QuestionVo getCodingQuestion(int qNum) {
        return questionDao.getCodingQuestionList(qNum);
    }

    public int incrementVisitCount(int qNum) {
        return questionDao.insertVisitCount(qNum);
    }
    public List<QuestionVo> getQuestionList(String[] languages) {
        // 사용자가 선택한 언어에 따라 적절한 DAO 메서드 호출
        switch (languages.length) {
            case 1:
                return questionDao.getQuestionList(languages[0]);
            case 2:
                return questionDao.getQuestionList(languages[0], languages[1]);
            // 나머지 케이스에 대한 처리도 추가 가능
            case 3:
                return questionDao.getQuestionList(languages[0], languages[1], languages[2]);
            case 4:
                return questionDao.getQuestionList(languages[0], languages[1], languages[2], languages[3]);
            case 5:
                return questionDao.getQuestionList(languages[0], languages[1], languages[2], languages[3], languages[4]);
            default:
                // 기본적으로 모든 문제 리스트 반환
                return questionDao.getAllQuestions(); 
        }
    }
    
    
}

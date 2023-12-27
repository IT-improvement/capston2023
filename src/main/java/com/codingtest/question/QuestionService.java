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
        // ����ڰ� ������ �� ���� ������ DAO �޼��� ȣ��
        switch (languages.length) {
            case 1:
                return questionDao.getQuestionList(languages[0]);
            case 2:
                return questionDao.getQuestionList(languages[0], languages[1]);
            // ������ ���̽��� ���� ó���� �߰� ����
            case 3:
                return questionDao.getQuestionList(languages[0], languages[1], languages[2]);
            case 4:
                return questionDao.getQuestionList(languages[0], languages[1], languages[2], languages[3]);
            case 5:
                return questionDao.getQuestionList(languages[0], languages[1], languages[2], languages[3], languages[4]);
            default:
                // �⺻������ ��� ���� ����Ʈ ��ȯ
                return questionDao.getAllQuestions(); 
        }
    }
    
    
}

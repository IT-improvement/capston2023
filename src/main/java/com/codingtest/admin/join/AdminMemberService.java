package com.codingtest.admin.join;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingtest.admin.member.MemberDao;
import com.codingtest.admin.member.MemberVo;

@Service
public class AdminMemberService implements MemberService {

	final static public int ADMIN_ACCOUNT_ALREADY_EXIST = 0;
	final static public int ADMIN_ACCOUNT_CREATE_SUCCESS = 1;
	final static public int ADMIN_ACCOUNT_CREATE_FAIL = -1;
	@Autowired
	MemberDao memberDao;

	public MemberVo loginConfirm(MemberVo memberVo) {
		// 아이디와 패스워드로 로그인 확인
		MemberVo result = memberDao.login(memberVo);
		if (result != null) {
			// 로그인 성공 시 현재 시간을 얻어와서 로그인 시간만을 logfile에 기록
			Timestamp logTime = new Timestamp(System.currentTimeMillis());
			result.setLogDate(logTime);
			memberDao.insertLog(result);
		}
		return result;
	}

	public int createAccountConfirm(MemberVo memberVo) {
		System.out.println("[AdminMemberService] createAccountConfirm()");
		boolean result = memberDao.insertUser(memberVo);
		if (!result)
			return ADMIN_ACCOUNT_CREATE_FAIL;
		else
			return ADMIN_ACCOUNT_CREATE_SUCCESS;

	}

	@Override
	public int idCheck(String id) {
		return memberDao.idCheck(id);
	}

	public int getUserCount() {
		return memberDao.alluser();
	}

	public int getNowUserCount() {
		return memberDao.totaluser();
	}

	public int getTotalquestion() {
		return memberDao.totalquestion();
	}

	public int logout(String userId) {
		// 현재 시간을 얻어와서 Vo에 설정
		Timestamp logoutTime = new Timestamp(System.currentTimeMillis());

		// Vo에 아이디와 로그아웃 시간 설정
		MemberVo memberVo = new MemberVo();
		memberVo.setId(userId);
		memberVo.setLogOutDate(logoutTime);

		// Dao에 로그아웃 정보 저장
		return memberDao.insertLogout(memberVo);
	}

	public MemberVo userinfo(String id) {
		return memberDao.userinfo(id);
	}

	public MemberVo changePwdConfirm(MemberVo memberVo) {
		return memberDao.findPwd(memberVo);
	}

	public int changePwd(MemberVo memberVo) {
		return memberDao.changePwd(memberVo);
	}
	public MemberVo findUserForPasswordRecovery(String id, String question, String answer, String email) {
	    return memberDao.findUserForPasswordRecovery(id, question, answer, email);
	}
}

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
		// ���̵�� �н������ �α��� Ȯ��
		MemberVo result = memberDao.login(memberVo);
		if (result != null) {
			// �α��� ���� �� ���� �ð��� ���ͼ� �α��� �ð����� logfile�� ���
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
		// ���� �ð��� ���ͼ� Vo�� ����
		Timestamp logoutTime = new Timestamp(System.currentTimeMillis());

		// Vo�� ���̵�� �α׾ƿ� �ð� ����
		MemberVo memberVo = new MemberVo();
		memberVo.setId(userId);
		memberVo.setLogOutDate(logoutTime);

		// Dao�� �α׾ƿ� ���� ����
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

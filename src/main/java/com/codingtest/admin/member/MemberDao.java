package com.codingtest.admin.member;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component // @Component�뒗 Spring Framework�뿉�꽌 而댄룷�꼳�듃 �뒪罹붿쓣 �넻�빐 �옄�룞�쑝濡� 愿�由щ릺�뒗
			// 鍮�(Bean) �겢�옒�뒪瑜� �굹���궡�뒗 �뼱�끂�뀒�씠�뀡�엯�땲�떎.
public class MemberDao {
	private JdbcTemplate jdbcTemplate;

	@Autowired // �깮�꽦�옄瑜� �넻�빐 JdbcTemplate 鍮덉쓣 二쇱엯諛쏅룄濡� �꽕�젙

	public MemberDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public MemberVo login(MemberVo memberVo) {
		String query = "Select * From user Where id = ? AND pwd = ?";
		try {
			return jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<>(MemberVo.class), memberVo.getId(),
					memberVo.getPwd());

		} catch (Exception e) {
			System.out.println("Exception[MemberDAO]:" + e.getMessage());
			return null;
		}
	}

	public boolean insertUser(MemberVo memberVo) {
		String query = "INSERT INTO user(id, pwd, email, phoneNum, zipcode, address, question, answer) VALUES(?,?,?,?,?,?,?,?)";
		int result = jdbcTemplate.update(query, memberVo.getId(), memberVo.getPwd(), memberVo.getEmail(),
				memberVo.getPhoneNum(), memberVo.getZipcode(), memberVo.getAddress(), memberVo.getQuestion(),
				memberVo.getAnswer());
		return result > 0;
	}

	public boolean isIdDuplicated(String id) {
		String query = "SELECT COUNT(*) FROM user WHERE id = ?";
		int count = jdbcTemplate.queryForObject(query, Integer.class, id); // queryForObject媛� 1�쓣 諛섑솚�븳�떎硫� 愿�由ъ옄媛�
																			// �엯�젰�븳 �븘�씠�뵒�뒗 �씠誘� �궗�슜以묒씤 �븘�씠�뵒 0�씠硫�
																			// �궗�슜以묒씤 �븘�뵒�씠媛� �븘�땲�떎.

		return count > 0;

	}

	public int idCheck(String id) {
		String sql = "SELECT COUNT(id) FROM user WHERE id=?";
		return jdbcTemplate.queryForObject(sql, Integer.class, id);
	}

	public int alluser() {
		String query = "SELECT COUNT(*) FROM user"; // �쟻�젅�븳 SQL 荑쇰━ �옉�꽦
		return jdbcTemplate.queryForObject(query, Integer.class);
	}

	public int totaluser() {
		String query = "select COUNT(*) from logfile where logOutDate is NULL";
		return jdbcTemplate.queryForObject(query, Integer.class);
	}

	public int totalquestion() {
		String query = "select COUNT(*) from question";
		return jdbcTemplate.queryForObject(query, Integer.class);
	}

	public int insertLogout(MemberVo vo) {
		int result = 0;
		String query = "UPDATE logfile SET logOutDate = ? WHERE logOutDate IS NULL AND id = ?";

		try {
			// JdbcTemplate을 사용하여 PreparedStatement를 생성하고 실행
			result = jdbcTemplate.update(query, vo.getLogOutDate(), vo.getId());
		} catch (Exception e) {
			System.out.println("Exception[insertLogout] : " + e.getMessage());
		}

		return result;
	}

	public int insertLog(MemberVo vo) {

		String query = "INSERT INTO `capston`.`logfile` (`logDate`, `id`) VALUES(?,?)";
		return jdbcTemplate.update(query, vo.getLogDate(), vo.getId());
	}

	public MemberVo userinfo(String id) {
		String query = "SELECT * FROM user WHERE id = ?";
		return jdbcTemplate.queryForObject(query, new Object[]{id}, new BeanPropertyRowMapper<>(MemberVo.class));
	}
	
	 public MemberVo findPwd(MemberVo memberVo) {
	    	String query = "select * from user where id=? and question=? and answer=?";
	    	try {
				return jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<MemberVo>(MemberVo.class),
						memberVo.getId(), memberVo.getQuestion(), memberVo.getAnswer());
			} catch (Exception e) {
				System.out.println("Exception[findPwd]:" + e.getMessage());
				return null;
			}
	    }
	    
	    public int changePwd(MemberVo memberVo) {
	    	String query = "update user set pwd=? where id=?";
	    	int result = 0;
	    	try {
				result = jdbcTemplate.update(query, memberVo.getPwd(), memberVo.getId());
			} catch (Exception e) {
				System.out.println("Exception[changePwd]:" + e.getMessage());
			}
	    	return result;
	    }
	    
	    public MemberVo findUserForPasswordRecovery(String id, String question, String answer, String email) {
	        String query = "SELECT * FROM user WHERE id = ? AND question = ? AND answer = ? And email = ?";
	        try {
	            return jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<>(MemberVo.class), id, question, answer, email);
	        } catch (DataAccessException e) {
	            System.out.println("Exception[findUserForPasswordRecovery]: " + e.getMessage());
	            return null;
	        }
	    }
}
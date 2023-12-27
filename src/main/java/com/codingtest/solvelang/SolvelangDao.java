package com.codingtest.solvelang;

public class SolvelangDao {

//  public SolvelangDTO getSolveM(String uid, String upass) {
//      SolvelangDTO dto = null;
//      String query = "select * from language where id=?";
//      try {
//          pstmt = con.prepareStatement(query);
//          pstmt.setString(1, uid);
//
//          rs = pstmt.executeQuery();
//          if (rs.next()) {
//              dto = new SolvelangDTO();
//              dto.setId(rs.getString("id"));
//          }
//      } catch (Exception e) {
//          System.out.println("Exception[SolvelangDAO]:" + e.getMessage());
//      }
//      return dto;
//  }
//
//  public SolvelangDTO getLanguage(String Uid) {
//      SolvelangDTO sdto = null;
//      String query = "SELECT * FROM language WHERE id = ? and lan = 'Java'"; // '?'�쓽 �뵲�샂�몴 �젣嫄�
//      try {
//          pstmt = con.prepareStatement(query);
//          pstmt.setString(1, Uid);
//
//          rs = pstmt.executeQuery();
//          if (rs.next()) {
//              sdto = new SolvelangDTO();
//              sdto.setLanguage_num(rs.getInt("language_num"));
//              sdto.setId(rs.getString("id"));
//              sdto.setCorrect_problems(rs.getInt("correct_problems"));
//              sdto.setWrong_problems1(rs.getInt("wrong_problems1"));
//              sdto.setTime_exceeded(rs.getInt("time_exceeded"));
//              sdto.setCompile_errors(rs.getInt("compile_errors"));
//          }
//      } catch (Exception e) {
//          System.out.println("Exception[SolvelangDAO]:" + e.getMessage());
//      }
//      return sdto;
//  }
//  public SolvelangDTO getLanguageC(String Uid) {
//      SolvelangDTO sdto = null;
//      String query = "SELECT * FROM language WHERE id = ? and lan = 'C#'"; // '?'�쓽 �뵲�샂�몴 �젣嫄�
//      try {
//          pstmt = con.prepareStatement(query);
//          pstmt.setString(1, Uid);
//
//          rs = pstmt.executeQuery();
//          if (rs.next()) {
//              sdto = new SolvelangDTO();
//              sdto.setLanguage_num(rs.getInt("language_num"));
//              sdto.setId(rs.getString("id"));
//              sdto.setCorrect_problems(rs.getInt("correct_problems"));
//              sdto.setWrong_problems1(rs.getInt("wrong_problems1"));
//              sdto.setTime_exceeded(rs.getInt("time_exceeded"));
//              sdto.setCompile_errors(rs.getInt("compile_errors"));
//          }
//      } catch (Exception e) {
//          System.out.println("Exception[SolvelangDAO]:" + e.getMessage());
//      }
//      return sdto;
//  }
//  
//  
//  public SolvelangDTO getLanguageP(String Uid) {
//      SolvelangDTO sdto = null;
//      String query = "SELECT * FROM language WHERE id = ? and lan = 'Python'"; // '?'�쓽 �뵲�샂�몴 �젣嫄�
//      try {
//          pstmt = con.prepareStatement(query);
//          pstmt.setString(1, Uid);
//
//          rs = pstmt.executeQuery();
//          if (rs.next()) {
//              sdto = new SolvelangDTO();
//              sdto.setLanguage_num(rs.getInt("language_num"));
//              sdto.setId(rs.getString("id"));
//              sdto.setCorrect_problems(rs.getInt("correct_problems"));
//              sdto.setWrong_problems1(rs.getInt("wrong_problems1"));
//              sdto.setTime_exceeded(rs.getInt("time_exceeded"));
//              sdto.setCompile_errors(rs.getInt("compile_errors"));
//          }
//      } catch (Exception e) {
//          System.out.println("Exception[SolvelangDAO]:" + e.getMessage());
//      }
//      return sdto;
	//}

}

package com.codingtest.recentmatter;

import org.springframework.stereotype.Component;

@Component
public class RecentMatterDao {

//    public List<RecentMatterDTO> getRecentDataList() {
//        List<RecentMatterDTO> dataList = new ArrayList<>();
//
//        try {
//            // SQL 荑쇰━ �떎�뻾�븯�뿬 寃곌낵瑜� DTO 媛앹껜濡� 蹂��솚 �썑 諛섑솚�븯�뒗 濡쒖쭅 �옉�꽦
//            Statement statement = con.createStatement();
//            String query = "SELECT * FROM studylist ORDER BY createTime DESC LIMIT 4";
//            ResultSet resultSet = statement.executeQuery(query);
//
//            while (resultSet.next()) {
//                // DTO 媛앹껜 �깮�꽦 諛� �븘�뱶 �꽕�젙
//                RecentMatterDTO dto = new RecentMatterDTO();
//                dto.setNum(resultSet.getInt("study_num"));
//                dto.setTitle(resultSet.getString("title"));
//                dto.setLanguage(resultSet.getString("language"));
//                dto.setContents(resultSet.getString("contents"));
//                dto.setCreateTime(resultSet.getDate("createTime"));
//
//                dataList.add(dto);
//            }
//
//            resultSet.close();
//            statement.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return dataList;
//    }
}

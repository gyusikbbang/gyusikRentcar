package rent.inform;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class repairinformDBBean {
	
    private static repairinformDBBean instance = new repairinformDBBean();
    //.jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
    public static repairinformDBBean getInstance() {
        return instance;
    }
    
    private repairinformDBBean() {}   

    //커넥션풀로부터 Connection객체를 얻어냄
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/book");
        return ds.getConnection();
    }
 
    //board테이블에 글을 추가(inset문)<=writePro.jsp페이지에서 사용
   
	public int getArticleCount()
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement("select count(*) from repair_inform");
            rs = pstmt.executeQuery();

            if (rs.next()) {
               x = rs.getInt(1);
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }

	//글의 목록(복수개의 글)을 가져옴(select문) <=list.jsp에서 사용
	public List<repairinformDataBean> getArticles(int start, int end)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<repairinformDataBean> articleList = null;
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY repair_number) NUM , A.* FROM repair_inform A ORDER BY repair_number) WHERE NUM BETWEEN ? AND ?");
            pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                articleList = new ArrayList<repairinformDataBean>(end);
                do{
                    repairinformDataBean article = new repairinformDataBean();
				  
				  article.setReNum(rs.getString("repair_number"));
				  article.setCarid(rs.getString("car_id"));
				  article.setReshopid(rs.getString("repair_shop_id"));

                  article.setCusDid(rs.getString("cus_driver_license_id"));
				  article.setRepairc(rs.getString("repair_contents"));
				  article.setRepairdate(rs.getString("repair_date"));
                  article.setRepairprice(rs.getString("repair_price"));
                  article.setPricedead(rs.getString("price_deadline"));
                  article.setRepairAc(rs.getString("add_repair_contents"));
                  article.setRepairEndDate(rs.getString("repair_end_date"));
                  
				  
                  articleList.add(article);
			    }while(rs.next());
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return articleList;
    }
 
	//글의 내용을 보기(1개의 글)(select문)<=content.jsp페이지에서 사용
	

}
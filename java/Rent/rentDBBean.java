package rent.r;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class rentDBBean {
	
    private static rentDBBean instance = new rentDBBean();
    //.jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
    public static rentDBBean getInstance() {
        return instance;
    }
    
    private rentDBBean() {}
    
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
            
            pstmt = conn.prepareStatement("select count(*) from rent");
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
	public List<rentDataBean> getArticles(int start, int end)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<rentDataBean> articleList = null;
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"select /*+ gather_plan_statistics */ * from rent order by cast(car_rent_id as number(38))  offset ? rows fetch next ? rows only ");
            pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                articleList = new ArrayList<rentDataBean>(end);
                do{
                    rentDataBean article = new rentDataBean();
				  
				article.setCarRentid(rs.getString("car_rent_id"));
				article.setCarId(rs.getString("car_id"));
				article.setCusDriverLicenseId(rs.getString("cus_driver_license_id"));
				article.setRentStrartDate(rs.getString("rent_start_date"));
				article.setRentEndDate(rs.getString("rent_end_date"));
				article.setRentPeriod(rs.getString("rent_period"));
				article.setPrice(rs.getString("price"));
				article.setPriceDeadline(rs.getString("price_deadline"));
				article.setAddPrice(rs.getString("add_price"));
				article.setAddContents(rs.getString("add_contents"));


                  
				
                  
                  
				  
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
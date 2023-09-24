package rent.cars;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class carDBBean {
	
    private static carDBBean instance = new carDBBean();
    //.jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
    public static carDBBean getInstance() {
        return instance;
    }
    
    private carDBBean() {}
    
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
            
            pstmt = conn.prepareStatement("select count(*) from cars");
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
	public List<carDataBean> getArticles(int start, int end)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<carDataBean> articleList = null;
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"select /*+ gather_plan_statistics */ * from cars order by  cast(car_id as number(38)) offset ? rows fetch next ? rows only");
            pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                articleList = new ArrayList<carDataBean>(end);
                do{
                    carDataBean article = new carDataBean();
				  
				  article.setCarid(rs.getString("car_id"));
				  article.setComid(rs.getString("com_id"));
				  article.setCarName(rs.getString("car_name"));
                  article.setCarType(rs.getString("car_type"));
                  
				  article.setCarNumber(rs.getString("car_number"));
				  article.setRegdate(rs.getString("reg_date"));
				  article.setNop(rs.getString("nop"));
				  article.setCarinfo(rs.getString("car_info"));
                  article.setCarRentprice(rs.getString("car_rent_price"));
                  article.setRentNum(rs.getString("rent_num"));
                  article.setCarRepair(rs.getString("car_repair"));
                  article.setIMG(rs.getString("img"));
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
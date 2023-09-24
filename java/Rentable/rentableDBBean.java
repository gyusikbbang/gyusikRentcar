package rent.rentable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class rentableDBBean {
	
    private static rentableDBBean instance = new rentableDBBean();
    //.jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
    public static rentableDBBean getInstance() {
        return instance;
    }
    
    private rentableDBBean() {}
    
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
            
            pstmt = conn.prepareStatement("select count(*) from (select distinct c.car_id 차id , c.com_id 회사id, c.car_name 차이름, c.car_type 차타입, c.car_number 차번호, c.reg_date 등록일자, c.nop 탑승인원, c.car_info 차정보,c.car_rent_price 차가격,c.rent_num 대여횟수,  c.car_repair 정비중 from cars c, rent r where (c.car_id = r.car_id AND TO_CHAR(r.rent_end_date, 'YYYYMMDD') < TO_CHAR(SYSDATE, 'YYYYMMDD') AND c.car_repair = 'X') OR ( c.rent_num = '0' AND car_repair ='X')) ");
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
	public List<rentableDataBean> getArticles(int start, int end)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<rentableDataBean> articleList = null;
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	" select distinct c.car_id 차id , c.com_id 회사id, c.car_name 차이름, c.car_type 차타입, c.car_number 차번호, c.reg_date 등록일자, c.nop 탑승인원, c.car_info 차정보,c.car_rent_price 차가격,c.rent_num 대여횟수,  c.car_repair 정비중 from cars c, rent r where (c.car_id = r.car_id AND TO_CHAR(r.rent_end_date, 'YYYYMMDD') < TO_CHAR(SYSDATE, 'YYYYMMDD') AND c.car_repair = 'X') OR ( c.rent_num = '0' AND car_repair ='X') order by c.car_id offset ? rows fetch next ? rows only ");
            pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                articleList = new ArrayList<rentableDataBean>(end);
                do{
                    rentableDataBean article = new rentableDataBean();
				  
				  article.setCarid(rs.getString("차id"));
				  article.setComid(rs.getString("회사id"));
				  article.setCarName(rs.getString("차이름"));
                  article.setCarType(rs.getString("차타입"));
				  article.setCarNumber(rs.getString("차번호"));
				  article.setRegdate(rs.getString("등록일자"));
				  article.setNop(rs.getString("탑승인원"));
				  article.setCarinfo(rs.getString("차정보"));
                  article.setCarRentprice(rs.getString("차가격"));
                  article.setRentNum(rs.getString("대여횟수"));
                  article.setCarRepair(rs.getString("정비중"));
                  
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
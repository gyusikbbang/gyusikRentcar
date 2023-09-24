package rent.com;
import java.sql.Timestamp;

public class comDataBean {
    private String com_id;
    private String com_name;
    private String com_addr;
    private String com_tel;
    private String com_manager;
	private String com_manager_email;
	
   
	public String getComid() {
		return com_id;
	}
	public void setComid(String com_id) {
		this.com_id = com_id;
	}


	public String getComName() {
		return com_name;
	}
	public void setComName(String com_name) {
		this.com_name = com_name;
	}


	public String getComAddr() {
		return com_addr;
	}
	public void setComAddr(String com_addr) {
		this.com_addr = com_addr;
	}


	public String getComtel() {
		return com_tel;
	}
	public void setComtel(String com_tel) {
		this.com_tel = com_tel;
	}


	public String getComManager() {
		return com_manager;
	}
	public void setComManager(String com_manager) {
		this.com_manager = com_manager;
	}
	public String getComManaEmail() {
		return com_manager_email;
	}
	public void setComManaEmail(String com_manager_email) {
		this.com_manager_email = com_manager_email;
	}
	

}
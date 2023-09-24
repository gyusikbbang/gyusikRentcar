package rent.cus;
import java.sql.Timestamp;

public class rentcDataBean {
    private String cus_driver_license_id;
    private String cus_name;
    private String cus_addr;
    private String cus_email;
    private String use_num;
	private String used_car_type;
	private String used_date;
	
   
	public String getCusid() {
		return cus_driver_license_id;
	}
	public void setCusid(String cus_driver_license_id) {
		this.cus_driver_license_id = cus_driver_license_id;
	}


	public String getCusName() {
		return cus_name;
	}
	public void setCusName(String cus_name) {
		this.cus_name = cus_name;
	}

	public String getCusAddr() {
		return cus_addr;
	}
	public void setCusAddr(String cus_addr) {
		this.cus_addr = cus_addr;
	}

	public String getCusEmail() {
		return cus_email;
	}
	public void setCusEmail(String cus_email) {
		this.cus_email = cus_email;
	}




	public String getUseNum() {
		return use_num;
	}
	public void setUseNum(String use_num) {
		this.use_num = use_num;
	}


	public String getUct() {
		return used_car_type;
	}
	public void setUct(String used_car_type) {
		this.used_car_type = used_car_type;
	}

	public String getUseDate() {
		return used_date;
	}

	public void setUseDate(String used_date) {
		this.used_date = used_date;
	}

}
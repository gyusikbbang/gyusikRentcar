package rent.cars;
import java.sql.Timestamp;

public class carDataBean {
    private String car_id;
    private String com_id;
    private String car_name;
    private String car_type;
    private String car_number;
	private String reg_date;
	private String nop;
	private String car_info;
	private String car_rent_price;
	private String rent_num;
	private String car_repair;
	private String img;
	public String getCarid() {
		return car_id;
	}
	public void setCarid(String car_id) {
		this.car_id = car_id;
	}
	public String getComid() {
		return  com_id;
	}
	public void setComid(String com_id) {
		this.com_id = com_id;
	}
	public String getCarName() {
		return car_name;
	}
	public void setCarName(String car_name) {
		this.car_name = car_name;
	}
	public String getCarType() {
		return car_type;
	}
	public void setCarType(String car_type) {
		this.car_type = car_type;
	}
	public String getCarNumber() {
		return car_number;
	}
	public void setCarNumber(String car_number) {
		this.car_number = car_number;
	}
	public String getRegdate() {
		return reg_date;
	}
	public void setRegdate(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getNop() {
		return nop;
	}
	public void setNop(String nop) {
		this.nop = nop;
	}


	public String getCarinfo() {
		return car_info;
	}
	public void setCarinfo(String car_info) {
		this.car_info = car_info;
	}
		
	public String getCarRentprice() {
		return car_rent_price;
	}
	public void setCarRentprice(String car_rent_price) {
		this.car_rent_price = car_rent_price;
	}

	public String getRentNum() {
		return rent_num;
	}
	public void setRentNum(String rent_num) {
		this.rent_num = rent_num;
	}

	public String getCarRepair() {
		return car_repair;
	}
	public void setCarRepair(String car_repair) {
		this.car_repair = car_repair;
	}

	public String getIMG() {
		return img;
	}
	public void setIMG(String img) {
		this.img = img;
	}
		
}
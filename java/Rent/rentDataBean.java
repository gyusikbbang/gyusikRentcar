package rent.r;
import java.sql.Timestamp;

public class rentDataBean {
    private String car_rent_id;
    private String car_id;
    private String cus_driver_license_id;
    private String rent_start_date;
    private String rent_end_date;
    private String rent_period;
    private String price;
    private String price_deadline;
    private String add_price;
    private String add_contents;


	public String getCarRentid() {
		return car_rent_id;
	}
	public void setCarRentid(String car_rent_id) {
		this.car_rent_id = car_rent_id;
	}


	public String getCarId() {
		return car_id;
	}
	public void setCarId(String car_id) {
		this.car_id = car_id;
	}


	public String getCusDriverLicenseId() {
		return cus_driver_license_id;
	}
	public void setCusDriverLicenseId(String cus_driver_license_id) {
		this.cus_driver_license_id = cus_driver_license_id;
	}


	public String getRentStrartDate() {
		return rent_start_date;
	}
	public void setRentStrartDate(String rent_start_date) {
		this.rent_start_date = rent_start_date;
	}


	public String getRentEndDate() {
		return rent_end_date;
	}
	public void setRentEndDate(String rent_end_date) {
		this.rent_end_date = rent_end_date;
	}


	public String getRentPeriod() {
		return rent_period;
	}
	public void setRentPeriod(String rent_period) {
		this.rent_period = rent_period;
	}
	

	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	

	public String getPriceDeadline() {
		return price_deadline;
	}
	public void setPriceDeadline(String price_deadline) {
		this.price_deadline = price_deadline;
	}
	

	public String getAddPrice() {
		return add_price;
	}
	public void setAddPrice(String add_price) {
		this.add_price = add_price;
	}
	

	public String getAddContents() {
		return add_contents;
	}
	public void setAddContents(String add_contents) {
		this.add_contents = add_contents;
	}
	


}
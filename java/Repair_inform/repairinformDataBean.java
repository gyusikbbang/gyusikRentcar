package rent.inform;
import java.sql.Timestamp;

public class repairinformDataBean {
	private String repair_number;
    private String car_id;
	private String repair_shop_id;
    private String cus_driver_license_id;
    private String repair_contents;
	private String repair_date;
	private String repair_price;
	private String price_deadline;
	private String add_repair_contents;
	private String repair_end_date;
   
	public String getReNum() {
		return repair_number;
	}
	public void setReNum(String repair_number) {
		this.repair_number = repair_number;
	}


	public String getCarid() {
		return car_id;
	}
	public void setCarid(String car_id) {
		this.car_id = car_id;
	}

	public String getReshopid() {
		return repair_shop_id;
	}
	public void setReshopid(String repair_shop_id) {
		this.repair_shop_id = repair_shop_id;
	}

	public String getCusDid() {
		return cus_driver_license_id;
	}
	public void setCusDid(String cus_driver_license_id) {
		this.cus_driver_license_id = cus_driver_license_id;
	}




	public String getRepairc() {
		return repair_contents;
	}
	public void setRepairc(String repair_contents) {
		this.repair_contents =  repair_contents;
	}


	public String getRepairdate() {
		return repair_date;
	}
	public void setRepairdate(String repair_date) {
		this.repair_date = repair_date;
	}

	public String getRepairprice() {
		return repair_price;
	}
	public void setRepairprice(String repair_price) {
		this.repair_price = repair_price;
	}

	public String getPricedead() {
		return price_deadline;
	}
	public void setPricedead(String price_deadline) {
		this.price_deadline = price_deadline;
	}


	public String getRepairAc() {
		return add_repair_contents;
	}
	public void setRepairAc(String add_repair_contents) {
		this.add_repair_contents = add_repair_contents;
	}

	public String getRepairEndDate() {
		return repair_end_date;
	}
	public void setRepairEndDate(String repair_end_date) {
		this.repair_end_date = repair_end_date;
	}

}
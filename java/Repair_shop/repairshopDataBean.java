package rent.shop;
import java.sql.Timestamp;

public class repairshopDataBean {
    private String repair_shop_id;
    private String shop_name;
    private String shop_addr;
    private String shop_tel;
    private String shop_manager;
	private String shop_manager_email;
	
   
	public String getReShid() {
		return repair_shop_id;
	}
	public void setReShid(String repair_shop_id) {
		this.repair_shop_id = repair_shop_id;
	}


	public String getShopName() {
		return shop_name;
	}
	public void setShopName(String shop_name) {
		this.shop_name = shop_name;
	}

	public String getShopAddr() {
		return shop_addr;
	}
	public void setShopAddr(String shop_addr) {
		this.shop_addr = shop_addr;
	}

	public String getShoptel() {
		return shop_tel;
	}
	public void setShoptel(String shop_tel) {
		this.shop_tel = shop_tel;
	}




	public String getShopM() {
		return shop_manager;
	}
	public void setShopM(String shop_manager ) {
		this.shop_manager =  shop_manager;
	}


	public String getShopMemail() {
		return shop_manager_email;
	}
	public void setShopMemail(String shop_manager_email) {
		this.shop_manager_email = shop_manager_email;
	}


}
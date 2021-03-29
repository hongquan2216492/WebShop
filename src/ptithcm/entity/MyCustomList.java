package ptithcm.entity;

public class MyCustomList {
	public String name;
	public String image;
	public String totalPrice;
	
	public MyCustomList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyCustomList(String name, String image, String totalPrice) {
		super();
		this.name = name;
		this.image = image;
		this.totalPrice = totalPrice;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
}

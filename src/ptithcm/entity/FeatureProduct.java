package ptithcm.entity;

public class FeatureProduct {
	private String name;
	private String image;
	private Long totalQuantity;
	
	


	public FeatureProduct() {
		super();
		// TODO Auto-generated constructor stub
	}



	public FeatureProduct(String name, String image, Long totalQuantity) {
		super();
		this.name = name;
		this.image = image;
		this.totalQuantity = totalQuantity;
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



	public Long getTotalQuantity() {
		return totalQuantity;
	}



	public void setTotalQuantity(Long totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	
}

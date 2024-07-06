package Model;

public class Product {
	     
	private int Id, UnitPurchase;
	private String Name, Description;
	private double QtyExpectedMonth, MaxPricePurchased;
	
	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}
	
	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}
	
	public int getUnitPurchase() {
		return UnitPurchase;
	}

	public void setUnitPurchase(int unitPurchase) {
		UnitPurchase = unitPurchase;
	}
	
	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}
	
	public double getQtyExpectedMonth() {
		return QtyExpectedMonth;
	}
	
	public void setQtyExpectedMonth(double qtyExpectedMonth) {
		QtyExpectedMonth = qtyExpectedMonth;
	}

	public double getMaxPricePurchased() {
		return MaxPricePurchased;
	}

	public void setMaxPricePurchased(double maxPricePurchased) {
		MaxPricePurchased = maxPricePurchased;
	}	
}

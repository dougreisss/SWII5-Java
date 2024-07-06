/** @author Douglas Reis e Lucas Aquino */

package Repository;

import Model.Product;

import java.util.*;

public class DbContext {
	
	private static List<Product> listProducts = new ArrayList<>();
	
	private static Integer idIncrement = 1;
	
	public List<Product> GetAllProducts() {
		return DbContext.listProducts;
	}
	
	public Product GetProductById(int id) {
		
		for(Product product : listProducts) {
			
			if(product.getId() == id) {
				return product;
			}
		}
		
		return null;
	}
	
	public void AddProduct(Product product) {
		
		product.setId(idIncrement++);
		listProducts.add(product);
	}
	
	public void UpdateProduct(Product product) {
		
		Product productItem = this.GetProductById(product.getId());
		
		productItem.setName(product.getName());
		productItem.setDescription(product.getDescription());
		productItem.setMaxPricePurchased(product.getMaxPricePurchased());
		productItem.setQtyExpectedMonth(product.getQtyExpectedMonth());
		productItem.setUnitPurchase(product.getUnitPurchase());
		
	}
	
	public void DeleteProduct(int id) {
			
		Iterator<Product> it = listProducts.iterator();
		
		while(it.hasNext()) {
			Product product = it.next();
			
			if(product.getId() == id) {
				it.remove();
			}
		}
	}
	
}

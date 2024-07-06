/** @author Douglas Reis e Lucas Aquino */

package Services;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Repository.DbContext;
import Model.Product;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DbContext _products = new DbContext();

	@Override   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int id = Integer.parseInt(request.getParameter("id"));
		
		Product product = _products.GetProductById(id);
				
		request.setAttribute("product", product);
		
		RequestDispatcher rd = request.getRequestDispatcher("/UpdateProduct.jsp");
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product newProduct = new Product();
		
		newProduct.setId(Integer.parseInt(request.getParameter("id")));
		newProduct.setName(request.getParameter("Name"));
		newProduct.setUnitPurchase(Integer.parseInt(request.getParameter("UnitPurchase")));
		newProduct.setDescription(request.getParameter("Description"));
		newProduct.setQtyExpectedMonth(Double.parseDouble(request.getParameter("QtyExpectedMonth")));
		newProduct.setMaxPricePurchased(Double.parseDouble(request.getParameter("MaxPricePurchased")));
				
		_products.UpdateProduct(newProduct);
		
		response.sendRedirect("GetProductsServlet");
		
	}
}

/** @author Douglas Reis e Lucas Aquino */

package Services;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Product;
import Repository.DbContext;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private DbContext _products = new DbContext();
    

	@Override   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/NewProduct.jsp");
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Product newProduct = new Product();
		
		
		newProduct.setName(request.getParameter("Name"));
		newProduct.setUnitPurchase(Integer.parseInt(request.getParameter("UnitPurchase")));
		newProduct.setDescription(request.getParameter("Description"));
		newProduct.setQtyExpectedMonth(Double.parseDouble(request.getParameter("QtyExpectedMonth")));
		newProduct.setMaxPricePurchased(Double.parseDouble(request.getParameter("MaxPricePurchased")));
		
		_products.AddProduct(newProduct);
		
		response.sendRedirect("GetProductsServlet");
		
	}

}

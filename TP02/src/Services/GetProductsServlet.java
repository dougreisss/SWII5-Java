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

@WebServlet("/GetProductsServlet")
public class GetProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DbContext _products = new DbContext();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("products", _products.GetAllProducts());
		
		RequestDispatcher rd = request.getRequestDispatcher("/GetProducts.jsp");
		rd.forward(request, response);
	}

}

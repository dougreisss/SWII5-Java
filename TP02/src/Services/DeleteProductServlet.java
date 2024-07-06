/** @author Douglas Reis e Lucas Aquino */

package Services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Repository.DbContext;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private DbContext _products = new DbContext();
    

	@Override   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int id = Integer.parseInt(request.getParameter("id"));
		
		_products.DeleteProduct(id);
		
		response.sendRedirect("GetProductsServlet");
	}

}

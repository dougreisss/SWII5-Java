/**
 * @author Douglas Reis e Lucas Aquino
 */

package Services;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import Repository.OrdersDAO;
import Model.Orders;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "OrderServlet", urlPatterns = { "/Order/*" }, loadOnStartup = 1)
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrdersDAO _orderDAO;

	public void init() {
		String jdbcURL = getServletContext().getInitParameter("jdbcURL");
		String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");

		this._orderDAO = new OrdersDAO(jdbcURL, jdbcUsername, jdbcPassword);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getPathInfo();

		if (action == null) {
			action = "";
		}

		try {
			switch (action) {
				case "/new":
					showNewForm(request, response);
					break;
				case "/insert":
					insert(request, response);
					break;
				case "/delete":
					delete(request, response);
					break;
				case "/edit":
					showEditForm(request, response);
					break;
				case "/update":
					update(request, response);
					break;
				default:
					list(request, response);
					break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		} catch (ParseException ex) {
			throw new ServletException(ex);
		}
	}

	private void list(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Orders> list = _orderDAO.getAll();
		request.setAttribute("list", list);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/Orders/List.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/Orders/Form.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Orders orders = _orderDAO.getById(id);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/Orders/Form.jsp");
		request.setAttribute("order", orders);
		dispatcher.forward(request, response);
	}

	private void insert(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ParseException {

		double purchAmt = Double.parseDouble(request.getParameter("purchAmt"));
		String ordDateStr = request.getParameter("ordDate");
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date ordDate = dateFormat.parse(ordDateStr);
		int customerId = Integer.parseInt(request.getParameter("customerId"));
		int salesmanId = Integer.parseInt(request.getParameter("salesmanId"));

		Orders entity = new Orders(purchAmt, ordDate, customerId, salesmanId);
		_orderDAO.insert(entity);
		response.sendRedirect("list");
	}

	private void update(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ParseException {
		int id = Integer.parseInt(request.getParameter("ordNo"));
		double purchAmt = Double.parseDouble(request.getParameter("purchAmt"));
		String ordDateStr = request.getParameter("ordDate");
		SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date ordDate = inputFormat.parse(ordDateStr);
		int customerId = Integer.parseInt(request.getParameter("customerId"));
		int salesmanId = Integer.parseInt(request.getParameter("salesmanId"));

		Orders entity = new Orders(id, purchAmt, ordDate, customerId, salesmanId);
		_orderDAO.update(entity);
		response.sendRedirect("list");
	}

	private void delete(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		Orders entity = new Orders(id);
		_orderDAO.delete(entity);

		response.sendRedirect("list");
	}
}

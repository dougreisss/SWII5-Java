/**
 * @author Douglas Reis e Lucas Aquino
 */

package Services;

import Repository.*;
import Model.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CustomerServlet", urlPatterns = { "/Customer/*" }, loadOnStartup = 1)
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerDAO _customerDAO;

	public void init() {
		String jdbcURL = getServletContext().getInitParameter("jdbcURL");
		String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");

		this._customerDAO = new CustomerDAO(jdbcURL, jdbcUsername, jdbcPassword);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getPathInfo();

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
		}
	}

	private void list(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Customer> list = _customerDAO.getAll();
		request.setAttribute("list", list);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/Customer/List.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/Customer/Form.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Customer customer = _customerDAO.getById(id);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/Customer/Form.jsp");
		request.setAttribute("customer", customer);
		dispatcher.forward(request, response);
	}

	private void insert(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String custName = request.getParameter("name");
		String city = request.getParameter("city");
		int grade = Integer.parseInt(request.getParameter("grade"));
		int salesmanId = Integer.parseInt(request.getParameter("salesmanId"));

		Customer customer = new Customer(custName, city, grade, salesmanId);
		_customerDAO.insert(customer);
		response.sendRedirect("list");
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String custName = request.getParameter("name");
		String city = request.getParameter("city");
		int grade = Integer.parseInt(request.getParameter("grade"));
		int salesmanId = Integer.parseInt(request.getParameter("salesmanId"));

		Customer customer = new Customer(id, custName, city, grade, salesmanId);

		_customerDAO.update(customer);
		response.sendRedirect("list");
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		Customer customer = new Customer(id);
		_customerDAO.delete(customer);

		response.sendRedirect("list");
	}
}

/**
 * @author Douglas Reis e Lucas Aquino
 */

package Repository;

import Model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO extends BaseDAO<Customer> {

	public CustomerDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		super(jdbcURL, jdbcUsername, jdbcPassword);
	}

	@Override
	public List<Customer> getAll() throws SQLException {

		List<Customer> lstCustomer = new ArrayList<Customer>();

		String query = "SELECT Customer_Id, Cust_Name, City, Grade, Salesman_Id FROM Customer";

		connect();

		Statement statement = jdbcConnection.createStatement();
		ResultSet resultSet = statement.executeQuery(query);

		while (resultSet.next()) {

			int id = resultSet.getInt("Customer_Id");
			String custName = resultSet.getString("Cust_Name");
			String city = resultSet.getString("City");
			int grade = resultSet.getInt("Grade");
			int salesmanId = resultSet.getInt("Salesman_Id");

			Customer customer = new Customer(id, custName, city, grade, salesmanId);
			lstCustomer.add(customer);
		}

		resultSet.close();
		statement.close();

		disconnect();

		return lstCustomer;
	}

	@Override
	public Customer getById(int id) throws SQLException {

		Customer customer = null;

		String query = "SELECT Customer_Id, Cust_Name, City, Grade, Salesman_Id FROM orders.customer where Customer_Id = ?";

		this.connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(query);
		statement.setInt(1, id);

		ResultSet resultSet = statement.executeQuery();

		if (resultSet.next()) {

			String custName = resultSet.getString("Cust_Name");
			String city = resultSet.getString("City");
			int grade = resultSet.getInt("Grade");
			int salesmanId = resultSet.getInt("Salesman_Id");

			customer = new Customer(id, custName, city, grade, salesmanId);
		}

		resultSet.close();
		statement.close();

		this.disconnect();

		return customer;
	}

	@Override
	public boolean insert(Customer entity) throws SQLException {

		String query = "INSERT INTO Customer (Customer_Id, Cust_Name, City, Grade, Salesman_Id) VALUES (?, ?, ?, ?, ?)";
		this.connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(query);
		statement.setInt(1, entity.getCustomerId());
		statement.setString(2, entity.getCustName());
		statement.setString(3, entity.getCity());
		statement.setInt(4, entity.getGrade());
		statement.setInt(5, entity.getSalesmanId());

		boolean rowInserted = statement.executeUpdate() > 0;
		statement.close();
		this.disconnect();
		return rowInserted;
	}

	@Override
	public boolean update(Customer entity) throws SQLException {

		String query = "UPDATE Customer SET Cust_Name = ?, City = ?, Grade = ?, Salesman_Id = ? WHERE Customer_Id = ?";

		this.connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(query);
		statement.setString(1, entity.getCustName());
		statement.setString(2, entity.getCity());
		statement.setInt(3, entity.getGrade());
		statement.setInt(4, entity.getSalesmanId());
		statement.setInt(5, entity.getCustomerId());

		this.disconnect();

		return false;
	}

	@Override
	public boolean delete(Customer entity) throws SQLException {

		String query = "DELETE FROM Customer WHERE Customer_Id = ?";

		this.connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(query);
		statement.setInt(1, entity.getCustomerId());

		boolean rowDeleted = statement.executeUpdate() > 0;

		statement.close();
		this.disconnect();
		return rowDeleted;
	}
}

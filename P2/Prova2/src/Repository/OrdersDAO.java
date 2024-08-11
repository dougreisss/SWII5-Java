/**
 * @author Douglas Reis e Lucas Aquino
 */

package Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Model.*;

public class OrdersDAO extends BaseDAO<Orders> {

	public OrdersDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		super(jdbcURL, jdbcUsername, jdbcPassword);
	}

	@Override
	public List<Orders> getAll() throws SQLException {

		List<Orders> lstOrders = new ArrayList<Orders>();

		String query = "SELECT Ord_No, Purch_Amt, Ord_Date, Customer_Id, Salesman_Id FROM orders.orders";

		this.connect();

		Statement statement = jdbcConnection.createStatement();
		ResultSet resultSet = statement.executeQuery(query);

		while (resultSet.next()) {

			int ordNo = resultSet.getInt("Ord_No");
			double purchAmt = resultSet.getDouble("Purch_Amt");
			java.sql.Date ordDate = resultSet.getDate("Ord_Date");
			int customerId = resultSet.getInt("Customer_Id");
			int salesmanId = resultSet.getInt("Salesman_Id");

			Orders orders = new Orders(ordNo, purchAmt, ordDate, customerId, salesmanId);

			lstOrders.add(orders);

		}

		resultSet.close();
		statement.close();
		this.disconnect();

		return lstOrders;
	}

	@Override
	public Orders getById(int id) throws SQLException {
		Orders orders = null;

		String query = "SELECT Ord_No, Purch_Amt, Ord_Date, Customer_Id, Salesman_Id FROM orders.orders where Ord_No = ?";

		this.connect();

		Statement statement = jdbcConnection.createStatement();
		ResultSet resultSet = statement.executeQuery(query);

		if (resultSet.next()) {

			int ordNo = resultSet.getInt("Ord_No");
			double purchAmt = resultSet.getDouble("Purch_Amt");
			java.sql.Date ordDate = resultSet.getDate("Ord_Date");
			int customerId = resultSet.getInt("Customer_Id");
			int salesmanId = resultSet.getInt("Salesman_Id");

			orders = new Orders(ordNo, purchAmt, ordDate, customerId, salesmanId);

		}

		resultSet.close();
		statement.close();
		this.disconnect();

		return orders;
	}

	@Override
	public boolean insert(Orders entity) throws SQLException {

		String query = "insert into orders.orders (Purch_Amt, Ord_Date, Customer_Id, Salesman_Id ) values (?, ?, ?, ?)";

		this.connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(query);
		statement.setDouble(1, entity.getPurchAmt());
		statement.setDate(2, new java.sql.Date(entity.getOrdDate().getTime()));
		statement.setInt(3, entity.getCustomerId());
		statement.setInt(4, entity.getSalesmanId());

		boolean rowInserted = statement.executeUpdate() > 0;

		statement.close();
		this.disconnect();

		return rowInserted;
	}

	@Override
	public boolean update(Orders entity) throws SQLException {

		String query = "update orders.orders set Purch_Amt = ?, Ord_Date = ?, Customer_Id = ?, Salesman_Id = ? where Ord_No = ?";

		this.connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(query);
		statement.setDouble(1, entity.getPurchAmt());
		statement.setDate(2, new java.sql.Date(entity.getOrdDate().getTime()));
		statement.setInt(3, entity.getCustomerId());
		statement.setInt(4, entity.getSalesmanId());
		statement.setInt(5, entity.getOrdNo());

		boolean rowDeleted = statement.executeUpdate() > 0;

		statement.close();
		this.disconnect();

		return rowDeleted;
	}

	@Override
	public boolean delete(Orders entity) throws SQLException {

		String query = "delete from orders.orders where Ord_No where = ?";

		this.connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(query);
		statement.setInt(1, entity.getOrdNo());

		boolean rowDeleted = statement.executeUpdate() > 0;

		statement.close();
		this.disconnect();

		return rowDeleted;
	}

}

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

public class SalesmanDAO extends BaseDAO<Salesman> {

	public SalesmanDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		super(jdbcURL, jdbcUsername, jdbcPassword);
	}

	@Override
	public List<Salesman> getAll() throws SQLException {

		List<Salesman> lstSalesman = new ArrayList<Salesman>();

		String query = "SELECT Salesman_Id, Name, City, Commission FROM orders.salesman";

		this.connect();

		Statement statement = jdbcConnection.createStatement();
		ResultSet resultSet = statement.executeQuery(query);

		while (resultSet.next()) {

			int salesmanId = resultSet.getInt("Salesman_Id");
			String name = resultSet.getString("Name");
			String city = resultSet.getString("City");
			double commission = resultSet.getDouble("Commission");

			Salesman salesman = new Salesman(salesmanId, name, city, commission);

			lstSalesman.add(salesman);
		}

		resultSet.close();
		statement.close();

		this.disconnect();

		return lstSalesman;
	}

	@Override
	public Salesman getById(int id) throws SQLException {

		Salesman salesman = null;

		String query = "SELECT Salesman_Id, Name, City, Commission FROM orders.salesman where Salesman_Id = ?";

		this.connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(query);
		statement.setInt(1, id);

		ResultSet resultSet = statement.executeQuery();

		if (resultSet.next()) {

			int salesmanId = resultSet.getInt("Salesman_Id");
			String name = resultSet.getString("Name");
			String city = resultSet.getString("City");
			double commission = resultSet.getDouble("Commission");

			salesman = new Salesman(salesmanId, name, city, commission);
		}

		resultSet.close();
		statement.close();

		this.disconnect();

		return salesman;
	}

	@Override
	public boolean insert(Salesman entity) throws SQLException {

		String query = "insert into orders.salesman (Name, City, Commission) values (?, ?, ?)";

		this.connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(query);
		statement.setString(1, entity.getName());
		statement.setString(2, entity.getCity());
		statement.setDouble(3, entity.getCommission());

		boolean rowInserted = statement.executeUpdate() > 0;

		statement.close();
		this.disconnect();

		return rowInserted;
	}

	@Override
	public boolean update(Salesman entity) throws SQLException {

		String query = "update orders.salesman set Name = ?, City = ?, Commission = ? where Salesman_Id = ?";

		this.connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(query);
		statement.setString(1, entity.getName());
		statement.setString(2, entity.getCity());
		statement.setDouble(3, entity.getCommission());
		statement.setInt(4, entity.getSalesmanId());

		boolean rowUpdated = statement.executeUpdate() > 0;

		statement.close();
		this.disconnect();

		return rowUpdated;
	}

	@Override
	public boolean delete(Salesman entity) throws SQLException {
		String query = "delete from orders.salesman where Salesman_Id = ?";

		this.connect();

		PreparedStatement statement = jdbcConnection.prepareStatement(query);
		statement.setInt(1, entity.getSalesmanId());

		boolean rowInserted = statement.executeUpdate() > 0;

		statement.close();
		this.disconnect();

		return rowInserted;
	}
}

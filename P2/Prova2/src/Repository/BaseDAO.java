/**
 * @author Douglas Reis e Lucas Aquino
 */

package Repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public abstract class BaseDAO<T> {
	private String jdbcURL;
	private String jdbcUsername;
	private String jdbcPassword;
	public Connection jdbcConnection;

	public BaseDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
		this.jdbcURL = jdbcURL;
		this.jdbcUsername = jdbcUsername;
		this.jdbcPassword = jdbcPassword;
	}

	protected void connect() throws SQLException {
		if (jdbcConnection == null || jdbcConnection.isClosed()) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				throw new SQLException(e);
			}

			jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		}
	}

	protected void disconnect() throws SQLException {
		if (jdbcConnection != null && !jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}

	public abstract List<T> getAll() throws SQLException;

	public abstract T getById(int id) throws SQLException;

	public abstract boolean insert(T entity) throws SQLException;

	public abstract boolean update(T entity) throws SQLException;

	public abstract boolean delete(T entity) throws SQLException;
}

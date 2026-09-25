package com.tap.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.OrderDao;
import com.tap.model.Order;
import com.tap.util.DBConnection;

public class OrderDaoImpl implements OrderDao {

    private static final String INSERT_ORDER =
            "INSERT INTO orders "
          + "(userId, restaurantId, totalAmount, status, paymentMode, address) "
          + "VALUES (?, ?, ?, ?, ?, ?)";

    private static final String GET_ORDER =
            "SELECT * FROM orders WHERE orderId = ?";

    private static final String GET_ALL_ORDERS =
            "SELECT * FROM orders";

    private static final String GET_ORDERS_BY_USER =
            "SELECT * FROM orders WHERE userId = ?";

    private static final String GET_ORDERS_BY_RESTAURANT =
            "SELECT * FROM orders WHERE restaurantId = ?";

    private static final String UPDATE_ORDER =
            "UPDATE orders SET userId = ?, restaurantId = ?, totalAmount = ?, "
          + "status = ?, paymentMode = ?, address = ? "
          + "WHERE orderId = ?";

    private static final String DELETE_ORDER =
            "DELETE FROM orders WHERE orderId = ?";


    @Override
    public void addOrder(Order order) {

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(
                             INSERT_ORDER,
                             PreparedStatement.RETURN_GENERATED_KEYS)) {

            statement.setInt(1, order.getUserId());
            statement.setInt(2, order.getRestaurantId());
            statement.setDouble(3, order.getTotalAmount());
            statement.setString(4, order.getStatus());
            statement.setString(5, order.getPaymentMode());
            statement.setString(6, order.getAddress());

            statement.executeUpdate();

            try (ResultSet resultSet = statement.getGeneratedKeys()) {

                if (resultSet.next()) {
                    order.setOrderId(resultSet.getInt(1));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public Order getOrder(int orderId) {

        Order order = null;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(GET_ORDER)) {

            statement.setInt(1, orderId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {
                    order = mapResultSetToOrder(resultSet);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return order;
    }


    @Override
    public List<Order> getAllOrders() {

        List<Order> orders = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(GET_ALL_ORDERS);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                orders.add(mapResultSetToOrder(resultSet));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }


    @Override
    public List<Order> getOrdersByUser(int userId) {

        List<Order> orders = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(GET_ORDERS_BY_USER)) {

            statement.setInt(1, userId);

            try (ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    orders.add(mapResultSetToOrder(resultSet));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }


    @Override
    public List<Order> getOrdersByRestaurant(int restaurantId) {

        List<Order> orders = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(GET_ORDERS_BY_RESTAURANT)) {

            statement.setInt(1, restaurantId);

            try (ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    orders.add(mapResultSetToOrder(resultSet));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }


    @Override
    public void updateOrder(Order order) {

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(UPDATE_ORDER)) {

            statement.setInt(1, order.getUserId());
            statement.setInt(2, order.getRestaurantId());
            statement.setDouble(3, order.getTotalAmount());
            statement.setString(4, order.getStatus());
            statement.setString(5, order.getPaymentMode());
            statement.setString(6, order.getAddress());
            statement.setInt(7, order.getOrderId());

            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public void deleteOrder(int orderId) {

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(DELETE_ORDER)) {

            statement.setInt(1, orderId);

            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    private Order mapResultSetToOrder(ResultSet resultSet)
            throws SQLException {

        Order order = new Order();

        order.setOrderId(resultSet.getInt("orderId"));
        order.setUserId(resultSet.getInt("userId"));
        order.setRestaurantId(resultSet.getInt("restaurantId"));
        order.setTotalAmount(resultSet.getDouble("totalAmount"));
        order.setStatus(resultSet.getString("status"));
        order.setPaymentMode(resultSet.getString("paymentMode"));
        order.setAddress(resultSet.getString("address"));

        return order;
    }
}
package com.tap.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.OrderItemDao;
import com.tap.model.OrderItem;
import com.tap.util.DBConnection;

public class OrderItemDaoImpl implements OrderItemDao {

    private static final String INSERT_ORDER_ITEM =
            "INSERT INTO orderitem "
          + "(orderId, menuId, quantity, price) "
          + "VALUES (?, ?, ?, ?)";

    private static final String GET_ORDER_ITEM =
            "SELECT * FROM orderitem WHERE orderItemId = ?";

    private static final String GET_ALL_ORDER_ITEMS =
            "SELECT * FROM orderitem";

    private static final String GET_ORDER_ITEMS_BY_ORDER =
            "SELECT * FROM orderitem WHERE orderId = ?";

    private static final String UPDATE_ORDER_ITEM =
            "UPDATE orderitem SET orderId = ?, menuId = ?, "
          + "quantity = ?, price = ? "
          + "WHERE orderItemId = ?";

    private static final String DELETE_ORDER_ITEM =
            "DELETE FROM orderitem WHERE orderItemId = ?";


    @Override
    public void addOrderItem(OrderItem orderItem) {

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(
                             INSERT_ORDER_ITEM,
                             PreparedStatement.RETURN_GENERATED_KEYS)) {

            statement.setInt(1, orderItem.getOrderId());
            statement.setInt(2, orderItem.getMenuId());
            statement.setInt(3, orderItem.getQuantity());
            statement.setDouble(4, orderItem.getPrice());

            statement.executeUpdate();

            try (ResultSet resultSet = statement.getGeneratedKeys()) {

                if (resultSet.next()) {
                    orderItem.setOrderItemId(resultSet.getInt(1));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public OrderItem getOrderItem(int orderItemId) {

        OrderItem orderItem = null;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(GET_ORDER_ITEM)) {

            statement.setInt(1, orderItemId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {
                    orderItem = mapResultSetToOrderItem(resultSet);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItem;
    }


    @Override
    public List<OrderItem> getAllOrderItems() {

        List<OrderItem> orderItems = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(GET_ALL_ORDER_ITEMS);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                orderItems.add(mapResultSetToOrderItem(resultSet));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItems;
    }


    @Override
    public List<OrderItem> getOrderItemsByOrder(int orderId) {

        List<OrderItem> orderItems = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(GET_ORDER_ITEMS_BY_ORDER)) {

            statement.setInt(1, orderId);

            try (ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    orderItems.add(mapResultSetToOrderItem(resultSet));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItems;
    }


    @Override
    public void updateOrderItem(OrderItem orderItem) {

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(UPDATE_ORDER_ITEM)) {

            statement.setInt(1, orderItem.getOrderId());
            statement.setInt(2, orderItem.getMenuId());
            statement.setInt(3, orderItem.getQuantity());
            statement.setDouble(4, orderItem.getPrice());
            statement.setInt(5, orderItem.getOrderItemId());

            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public void deleteOrderItem(int orderItemId) {

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(DELETE_ORDER_ITEM)) {

            statement.setInt(1, orderItemId);

            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    private OrderItem mapResultSetToOrderItem(ResultSet resultSet)
            throws SQLException {

        OrderItem orderItem = new OrderItem();

        orderItem.setOrderItemId(
                resultSet.getInt("orderItemId"));

        orderItem.setOrderId(
                resultSet.getInt("orderId"));

        orderItem.setMenuId(
                resultSet.getInt("menuId"));

        orderItem.setQuantity(
                resultSet.getInt("quantity"));

        orderItem.setPrice(
                resultSet.getDouble("price"));

        return orderItem;
    }
}
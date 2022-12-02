/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import product.ProductDTO;
import users.UserDTO;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class OrderDAO {

    private static final String INSERT_ORDER = "INSERT INTO Orders(date, userID, total, address, phone, shippingfee, reciever, status) VALUES (?,?,?,?,?,?,?,?)";
    private static final String GET_ORDER_ID = "SELECT TOP 1 * FROM Orders WHERE userID = ? ORDER BY orderId desc";
    private static final String INSERT_ORDER_DETAIL = "INSERT INTO OrderDetails(productID, orderID, quantity, price) VALUES(?, ?, ?, ?)";
    private static final String GET_PRODUCT_QUANTITY = "SELECT quantity FROM product WHERE productID = ?";
    private static final String UPDATE_PRODUCT_QUANTITY = "UPDATE product SET quantity = ? WHERE productId = ?";
    
    private static final String VIEW_ORDER_MANAGER = "SELECT orderid, Reciever, address, phone, date, status, shippingfee, total FROM orders WHERE status = N'Đang chuẩn bị hàng' ORDER BY orderid desc";
    private static final String VIEW_ORDER_DETAIL_MANAGER = "SELECT pro.name, detail.quantity, detail.price "
            + "FROM orderDetails detail, product pro "
            + "WHERE detail.productId = pro.productId and detail.orderId like ?";
//    button
    private static final String CHANGE_ORDER_STATUS_ADMIN_MANAGER = "UPDATE orders SET status = N'Đang vận chuyển' WHERE orderid = ?";
//    view trans
    private static final String VIEW_ORDER_TRANSPORT_MANAGER = "SELECT orderid, Reciever, address, phone, date, status, shippingfee, total FROM orders WHERE status = N'Đang vận chuyển' ORDER BY orderid desc";
//    confirm success shipper
    private static final String CHANGE_ORDER_STATUS_SHIPPER_MANAGER = "UPDATE orders SET status = N'Đã hoàn tất' WHERE orderid = ?";
//    view success
    private static final String VIEW_ORDER_SUCCESS_MANAGER = "SELECT orderid, Reciever, address, phone, date, status, shippingfee, total FROM orders WHERE status = N'Đã hoàn tất' ORDER BY orderid desc";
    
    public List<OrderDTO> viewOrderSuccess() throws SQLException {
        List<OrderDTO> order = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_ORDER_SUCCESS_MANAGER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int orderId = Integer.parseInt(rs.getString("orderid"));
                    String name = rs.getString("Reciever");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    String date = rs.getString("date");
                    String status = rs.getString("status");
                    int shippingfee = Integer.parseInt(rs.getString("shippingfee"));
                    int total = Integer.parseInt(rs.getString("total"));
                    order.add(new OrderDTO(orderId, date, address, phone, shippingfee, total, name, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return order;
    }
    
public boolean changeOrderToSuccessStatus(OrderDTO order) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHANGE_ORDER_STATUS_SHIPPER_MANAGER);
                ptm.setInt(1, order.getOrderId());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return check;
    }


    public boolean changeOrderTransportStatus(OrderDTO order) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHANGE_ORDER_STATUS_ADMIN_MANAGER);
                ptm.setInt(1, order.getOrderId());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return check;
    }
    
    public List<OrderDTO> viewOrderTransport() throws SQLException {
        List<OrderDTO> order = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_ORDER_TRANSPORT_MANAGER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int orderId = Integer.parseInt(rs.getString("orderid"));
                    String name = rs.getString("Reciever");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    String date = rs.getString("date");
                    String status = rs.getString("status");
                    int shippingfee = Integer.parseInt(rs.getString("shippingfee"));
                    int total = Integer.parseInt(rs.getString("total"));
                    order.add(new OrderDTO(orderId, date, address, phone, shippingfee, total, name, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return order;
    }
    
    public List<OrderDetail> viewOrderDetailById(int orderId) throws SQLException {
        List<OrderDetail> detail = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_ORDER_DETAIL_MANAGER);
                ptm.setInt(1, orderId);
                rs = ptm.executeQuery();
                while (rs.next()) {
//                    int id = rs.getInt("orderId");
                    String name = rs.getString("name");
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    int price = Integer.parseInt(rs.getString("price"));
                    detail.add(new OrderDetail(name, orderId, quantity, price));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return detail;
    }

    public List<OrderDTO> viewOrder() throws SQLException {
        List<OrderDTO> order = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_ORDER_MANAGER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int orderId = Integer.parseInt(rs.getString("orderid"));
                    String name = rs.getString("Reciever");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    String date = rs.getString("date");
                    String status = rs.getString("status");
                    int shippingfee = Integer.parseInt(rs.getString("shippingfee"));
                    int total = Integer.parseInt(rs.getString("total"));
                    order.add(new OrderDTO(orderId, date, address, phone, shippingfee, total, name, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return order;
    }

    public int insertOrder(OrderDTO order) throws SQLException {
        int orderID = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ORDER);
                ptm.setString(1, order.getDate());
                ptm.setInt(2, order.getUserId());
                ptm.setFloat(3, order.getTotal());
                ptm.setString(4, order.getAddress());
                ptm.setString(5, order.getPhone());
                ptm.setInt(6, order.getShippingfee());
                ptm.setString(7, order.getReceiver());
                ptm.setString(8, order.getStatus());
                ptm.executeUpdate();
            }
            ptm = conn.prepareStatement(GET_ORDER_ID);
            ptm.setInt(1, order.getUserId());
            rs = ptm.executeQuery();
            while (rs.next()) {
                orderID = rs.getInt("orderID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return orderID;
    }

    public boolean insertOrderDetail(OrderDetail orderDetail) throws SQLException {
        boolean check = false;
        int productQuantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ORDER_DETAIL);
                ptm.setInt(1, orderDetail.getProductID());
                ptm.setInt(2, orderDetail.getOrderID());
                ptm.setInt(3, orderDetail.getQuantity());
                ptm.setInt(4, orderDetail.getPrice());
                check = ptm.executeUpdate() > 0;

                ptm = conn.prepareStatement(GET_PRODUCT_QUANTITY);
                ptm.setInt(1, orderDetail.getProductID());
                rs = ptm.executeQuery();
                while (rs.next()) {
                    productQuantity = rs.getInt("quantity") - orderDetail.getQuantity();
                }

//                if (productQuantity > 0) {
                ptm = conn.prepareStatement(UPDATE_PRODUCT_QUANTITY);
                ptm.setInt(1, productQuantity);
                ptm.setInt(2, orderDetail.getProductID());
                check = ptm.executeUpdate() > 0;
//                } else {
//                    ProductDTO product
//                    ptm = conn.prepareStatement(UPDATE_STATUS_PRODUCT);
//                    ptm.setInt(1, product.getStatus());
//                    
//                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    private static final String GUEST_ID = "SELECT userId FROM users WHERE phone = ?";

    public int checkUserId(String phone) throws SQLException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int userId = 0;
        try {
            //1. Make connection
            connection = DBUtils.getConnection();
            if (connection != null) {
                stm = connection.prepareStatement(GUEST_ID);
                stm.setString(1, phone);
                rs = stm.executeQuery();
                if (rs.next()) {
                    userId = rs.getInt("userId");
                }
            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (stm != null) {
                stm.close();
            }

            if (connection != null) {
                connection.close();
            }
        }
        return userId;
    }

}

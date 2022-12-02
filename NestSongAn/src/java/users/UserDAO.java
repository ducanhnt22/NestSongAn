/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DBUtils;

/**
 *
 * @author tranq
 */
public class UserDAO implements Serializable {

    private static final String LOGIN = "SELECT userId, username, password, address, phone, email, fullname, roleId FROM users WHERE username = ? AND password = ?";
    private static final String VIEW_PROFILE = "SELECT userId, username, password, address, phone, email, fullname, roleId FROM users WHERE userId = ?";
    private static final String CHECK_DUPLICATE = "SELECT username FROM users WHERE username = ?";
    private static final String CREATE_ACCOUNT = "Insert Into users(password, address, phone, email, fullName, roleId, userName) Values(?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_INFO = "UPDATE users SET fullName = ?, address = ?, email = ?, phone = ? WHERE userId = ?";
    private static final String UPDATE_PASSWORD = "UPDATE users SET password = ? WHERE userId = ?";
    private static final String CHECK_EMAIL_DUPLICATE = "SELECT email FROM users WHERE email = ?";

    public UserDTO checkLogin(String userName, String password) throws SQLException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO result = null;

        try {
            //1. Make connection
            connection = DBUtils.getConnection();

            if (connection != null) {
                stm = connection.prepareStatement(LOGIN);
                stm.setString(1, userName);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int userId = rs.getInt("userID");
                    String fullName = rs.getString("fullName");
                    String roleId = rs.getString("roleId");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");

                    result = new UserDTO(userId, password, address, phone, email,
                            fullName, roleId, userName);
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
        return result;
    }

    public boolean checkDuplicate(String username)
            throws SQLException, NamingException {

        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(CHECK_DUPLICATE);
                stm.setString(1, username);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    private List<UserDTO> accounts;

    //móc dữ liệu lên nên ko cần set chỉ cần phương thức get
    public List<UserDTO> getAccounts() {
        return accounts;
    }

    public boolean createAccount(UserDTO dto)
            throws NamingException, SQLException {
        //đối vs trạng thái truyền obj thì phải kiểm tra xem obj có bằng null
        //hay ko, nếu bằng null thì ko làm j cả
        if (dto == null) {
            return false;
        }
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;

        try {
            //1. make connection
            con = DBUtils.getConnection();

            if (con != null) {
                //3. create stament
                stm = con.prepareStatement(CREATE_ACCOUNT);
                stm.setString(1, dto.getPassword());
                stm.setString(2, dto.getAddress());
                stm.setString(3, dto.getPhone());
                stm.setString(4, dto.getEmail());
                stm.setString(5, dto.getFullName());
                stm.setString(6, dto.getRoleId());
                stm.setString(7, dto.getUserName());

                //4. execute stament
                int row = stm.executeUpdate();
                //5. proccess result
                if (row > 0) {
                    result = true;
                }
            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return result;
    }

    public boolean updateInfo(UserDTO user) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_INFO);
                ptm.setString(1, user.getFullName());
                ptm.setString(2, user.getAddress());
                ptm.setString(3, user.getEmail());
                ptm.setString(4, user.getPhone());
                ptm.setInt(5, user.getUserId());
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
        }
        return check;
    }

    public boolean checkEmailDuplicate(String email)
            throws SQLException, NamingException {

        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(CHECK_EMAIL_DUPLICATE);
                stm.setString(1, email);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updatePassword(int userId, String password) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_PASSWORD);
                ptm.setString(1, password);
                ptm.setInt(2, userId);
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
        }
        return check;
    }

    public UserDTO viewUserProfile(int userId) throws SQLException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO dto = new UserDTO();

        try {
            //1. Make connection
            connection = DBUtils.getConnection();

            if (connection != null) {
                stm = connection.prepareStatement(VIEW_PROFILE);
                stm.setInt(1, userId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String roleId = rs.getString("roleId");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String userName = rs.getString("userName");
                    dto = new UserDTO(userId, password, address, phone, email,
                            fullName, roleId, userName);
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
        return dto;
    }
    /**
     * GUEST
     */
    private static final String SAVE_GUEST_INFORMATION = "INSERT INTO users(fullname, address, email, phone) VALUES(?, ?, ?, ?)";
    private static final String UPDATE_GUEST_INFORMATION = "UPDATE users SET fullName = ?, address = ?, phone = ? WHERE email = ?";

    public boolean updateGuestInformation(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_GUEST_INFORMATION);
                ptm.setString(1, user.getFullName());
                ptm.setString(2, user.getAddress());
                ptm.setString(4, user.getPhone());
                ptm.setString(5, user.getEmail());
                check = ptm.executeUpdate() > 0;
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean saveGuestInformation(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SAVE_GUEST_INFORMATION);
                ptm.setString(1, user.getFullName());
                ptm.setString(2, user.getAddress());
                ptm.setString(3, user.getEmail());
                ptm.setString(4, user.getPhone());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return check;
    }
}

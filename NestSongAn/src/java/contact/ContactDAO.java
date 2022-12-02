/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contact;

import comment.CommentDTO;
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
public class ContactDAO implements Serializable {

    private static final String INSERT_INTO_DB = "Insert Into contacts(senderName, email, phone, contactContent, status) Values(?, ?, ?, ?,0)";
    private static final String GET_CONTACT = "SELECT * FROM contacts WHERE status = 0";
    private static final String APROVE_CONTACT = "UPDATE contacts SET status = 1 WHERE contactId = ?";
    private static final String DELETE_CONTACT = "DELETE FROM contacts WHERE contactId = ?";

    public List<ContactDTO> contact;

    //móc dữ liệu lên nên ko cần set chỉ cần phương thức get
    public List<ContactDTO> getAccounts() {
        return contact;
    }

    public boolean insertContact(ContactDTO dto)
            throws NamingException, SQLException {
        if (dto == null) {
            return false;
        }
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;

        try {
            con = DBUtils.getConnection();

            if (con != null) {
                stm = con.prepareStatement(INSERT_INTO_DB);
                stm.setString(1, dto.getSenderName());
                stm.setString(2, dto.getEmail());
                stm.setString(3, dto.getPhone());
                stm.setString(4, dto.getContactContent());

            }

            int row = stm.executeUpdate();

            if (row > 0) {
                result = true;
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

    public List<ContactDTO> getAllContact() throws SQLException {
        List<ContactDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CONTACT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = Integer.parseInt(rs.getString("contactId"));
                    String name = rs.getString("senderName");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String contactContent = rs.getString("contactContent");

                    list.add(new ContactDTO(id, name, email, phone, contactContent));
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

        return list;
    }

    public boolean AproveContact(int id) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(APROVE_CONTACT);
                ptm.setInt(1, id);
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
    
     public boolean DeleteContact(int id) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_CONTACT);
                ptm.setInt(1, id);
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
}

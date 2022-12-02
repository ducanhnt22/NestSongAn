/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package comment;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import product.ProductDTO;
import utils.DBUtils;

/**
 *
 * @author tranq
 */
public class CommentDAO implements Serializable {

    private static final String VIEW_COMMENT = "SELECT commentId, userId, productId, Comment, status FROM comment WHERE productId = ? AND status = 1";
    private static final String CREATE_COMMENT = "Insert Into comment(userId, productId, Comment, status) Values(?, ?, ?, ?)";
    private static final String UPDATE_INFO = "UPDATE users SET fullName=?, address=?, email=?, phone=? WHERE userId=?";
    private static final String GET_ALL_COMMENT = "SELECT commentId,Comment FROM comment WHERE status = 0";
    private static final String ACCEPT_COMMENT = "UPDATE comment SET status = 1 WHERE commentId = ?";
    private static final String DELETE_COMMENT = "DELETE FROM comment WHERE commentId = ?";

    private List<CommentDTO> items;

    public List<CommentDTO> getItem() {
        return items;
    }

    public void viewComment(int productId) throws SQLException, NamingException {
        Connection connection = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        CommentDTO result = null;

        try {
            //1. Make connection
            connection = DBUtils.getConnection();

            if (connection != null) {
                stm = connection.prepareStatement(VIEW_COMMENT);
                stm.setInt(1, productId);
                
                rs = stm.executeQuery();
                while (rs.next()) {
                    int commentId = rs.getInt("commentId");
                    int userId = rs.getInt("userID");
                    String comment = rs.getString("Comment");
                    int status=rs.getInt("status");
                    result = new CommentDTO(commentId, userId, productId,
                            comment, status);

                    if (this.items == null) {
                        this.items = new ArrayList<>();
                    }
                    this.items.add(result);
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
    }

    public boolean createComment(CommentDTO dto)
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
                stm = con.prepareStatement(CREATE_COMMENT);
                stm.setInt(1, dto.getUserId());
                stm.setInt(2, dto.getProductId());
                stm.setString(3, dto.getComment());
                stm.setInt(4, dto.isStatus());
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
    
    public List<CommentDTO> getAllComment() throws SQLException {
        List<CommentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_COMMENT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id=Integer.parseInt(rs.getString("commentId"));               
                    String comment = rs.getString("Comment");
                   
                    list.add(new CommentDTO(id, comment));
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
    
     public boolean AcceptComment(int id) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ACCEPT_COMMENT);
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
     public boolean DeleteComment(int id) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_COMMENT);
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

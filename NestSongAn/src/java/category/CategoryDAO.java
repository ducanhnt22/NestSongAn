/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import product.ProductDTO;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class CategoryDAO {
    private static final String VIEW_CATEGORY = "SELECT categoryId ,categoryname "
                                              + "FROM category";
    
    public List<CategoryDTO> ViewCategory() throws SQLException {
        List<CategoryDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_CATEGORY);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String categoryId = rs.getString("categoryId");
                    String categoryName = rs.getString("categoryname");
                    list.add(new CategoryDTO(categoryId, categoryName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();
        }
        return list;
    }
    
    public static void main(String[] args) throws SQLException {
        CategoryDAO dao = new CategoryDAO();
        List<CategoryDTO> list = dao.ViewCategory();
        for (CategoryDTO dto : list) {
            System.out.println(dto.toString());
        }
    }
}

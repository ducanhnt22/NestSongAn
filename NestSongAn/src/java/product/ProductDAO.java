/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import category.CategoryDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import price.PriceDTO;
import utils.DBUtils;

/**
 *
 * @author dell
 */
public class ProductDAO {

    private static final String SEARCH = "SELECT pro.productId, pro.name, pro.quantity, pro.description, pro.categoryId, pro.image, pro.status, pri.price "
            + "FROM product pro, price pri "
            + "WHERE pro.productId = pri.productId AND pro.name like ?";
    private static final String VIEW = "SELECT pro.productId, pro.name, pro.quantity, pri.price, pro.categoryId, pro.image, pro.description, pro.categoryId, pro.status "
            + "FROM product pro, price pri "
            + "WHERE pro.productId = pri.productId";
     private static final String PAGINATION = "SELECT pro.productId, pro.name, pro.quantity, pri.price, pro.categoryId, pro.image, pro.description, pro.categoryId, pro.status "
            + "FROM product pro, price pri "
            + "WHERE pro.productId = pri.productId ORDER BY pro.productId OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
    private static final String VIEW_PRODUCT_BY_CATEGORY = "SELECT pro.productId, pro.name, pro.quantity, pro.description, pro.categoryId, pro.image, pro.status, pri.price "
            + "FROM product pro, price pri "
            + "WHERE pro.productId = pri.productId "
            + "AND pro.categoryId = ?";
    private static final String VIEW_UPDATE_PRODUCT = "select pro.productId, pro.name, pri.price, pro.quantity, pro.categoryId, cate.categoryName, pro.image, pro.description, pro.status "
            + "from product pro, category cate, price pri "
            + "where pro.productId = pri.productId and cate.categoryId = pro.categoryId";
    private static final String INSERT_INTO_PRODUCT_TABLE = "INSERT INTO product(name, quantity, image, description, categoryId, status) "
            + "VALUES(?,?,?,?,?,?)";
    private static final String GET_PRODUCT_ID = "SELECT * "
            + "FROM product "
            + "WHERE name "
            + "LIKE ?";
    private static final String GET_CATEGORY_ID = "SELECT * "
            + "FROM category "
            + "WHERE categoryName "
            + "LIKE ?";
    private static final String INSERT_INTO_PRICE_TABLE = "INSERT INTO price(productId, price, datechange, status) "
            + "VALUES(?,?,?,?)";
    private static final String UPDATE_PRODUCT_MANAGER = "UPDATE product "
            + "SET name = ?, quantity = ?, description = ?, categoryId = ?, image = ?, status = ? "
            + "WHERE productId = ?";
    private static final String UPDATE_PRICE_MANAGER = "UPDATE price "
            + "SET price = ?, datechange = ?, status = ? "
            + "WHERE productId = ?";
    private static final String REMOVE_PRODUCT_MANAGER = "UPDATE product "
            + "SET status = 0 "
            + "WHERE productId = ?";
    
    private static final String GET_PRODUCT_QUANTITY="SELECT quantity FROM product WHERE productId= ?";
    
    private static final String GET_PRODUCT_INDEX = "SELECT top 4 * FROM product";
            
    public List<ProductDTO> viewProductIndex() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_INDEX);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("name");
                    String img = rs.getString("image");
                    list.add(new ProductDTO(name,img));
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
    
     public int getProductQuantity(int id) throws SQLException {
        int check = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_QUANTITY);
                ptm.setInt(1, id);         
                rs=ptm.executeQuery();
                if(rs.next()){
                    check=Integer.parseInt(rs.getString("quantity"));
                }
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
    public boolean removeProduct(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(REMOVE_PRODUCT_MANAGER);
                ptm.setInt(1, product.getProductId());
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

    public boolean updatePrice(PriceDTO price) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_PRICE_MANAGER);
                ptm.setInt(1, price.getPrice());
                ptm.setString(2, price.getDateChange());
                ptm.setInt(3, price.getStatus());
                ptm.setInt(4, price.getProductId());
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

    public boolean updateProduct(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_PRODUCT_MANAGER);
                ptm.setString(1, product.getName());
                ptm.setInt(2, product.getQuantity());
                ptm.setString(3, product.getDescription());
                ptm.setString(4, product.getCategoryId());
                ptm.setString(5, product.getImage());
                ptm.setInt(6, product.getStatus());
                ptm.setInt(7, product.getProductId());
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

    public boolean insertProduct(ProductDTO product) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_INTO_PRODUCT_TABLE);
                ptm.setString(1, product.getName());
                ptm.setInt(2, product.getQuantity());
                ptm.setString(3, product.getImage());
                ptm.setString(4, product.getDescription());
                ptm.setString(5, product.getCategoryId());
                ptm.setInt(6, product.getStatus());
                check = ptm.executeUpdate() > 0;
            }
        } catch (ClassNotFoundException | SQLException e) {
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

    public int getProductId(String productName) throws SQLException {
        int productId = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_ID);
                ptm.setString(1, "%" + productName + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    productId = rs.getInt("productId");
                }
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
        return productId;
    }

    public String getCategoryId(String categoryName) throws SQLException {
        String categoryId = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CATEGORY_ID);
                ptm.setString(1, "%" + categoryName + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    categoryId = rs.getString("categoryId");
                }
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
        return categoryId;
    }

    public boolean insertPrice(PriceDTO price) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_INTO_PRICE_TABLE);
                ptm.setInt(1, price.getProductId());
                ptm.setInt(2, price.getPrice());
                ptm.setString(3, price.getDateChange());
                ptm.setInt(4, price.getStatus());
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

    public List<ProductDTO> viewUpdateProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_UPDATE_PRODUCT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = Integer.parseInt(rs.getString("productId"));
                    String name = rs.getString("name");
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    int price = rs.getInt("price");
                    String img = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryId = rs.getString("categoryId");
                    String categoryName = rs.getString("categoryName");
                    int status = Integer.parseInt(rs.getString("status"));
                    list.add(new ProductDTO(productID, name, quantity, price, img, description, categoryId, categoryName, status));
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

    public List<ProductDTO> viewProduct() throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = Integer.parseInt(rs.getString("productId"));
                    String name = rs.getString("name");
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    int price = rs.getInt("price");
                    String img = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryId");
                    int status = Integer.parseInt(rs.getString("status"));
                    list.add(new ProductDTO(productID, name, quantity, price, img, description, categoryID, status));
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

     public List<ProductDTO> pagination(int pageActive) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(PAGINATION);
                ptm.setInt(1, (pageActive-1)*9);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productID = Integer.parseInt(rs.getString("productId"));
                    String name = rs.getString("name");
                    int quantity = Integer.parseInt(rs.getString("quantity"));
                    int price = rs.getInt("price");
                    String img = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryId");
                    int status = Integer.parseInt(rs.getString("status"));
                    list.add(new ProductDTO(productID, name, quantity, price, img, description, categoryID, status));
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
    
    public List<ProductDTO> ViewByCategory(String cateId) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_PRODUCT_BY_CATEGORY);
                ptm.setString(1, cateId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productId = rs.getInt("productId");
                    String name = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    int price = rs.getInt("price");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryId = rs.getString("categoryId");
                    int status = rs.getInt("status");
                    list.add(new ProductDTO(productId, name, quantity, price, image, description, categoryId, status));
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

    public List<ProductDTO> getListProduct(String search) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int productId = rs.getInt("productId");
                    String name = rs.getString("name");
                    int quantity = rs.getInt("quantity");
                    int price = rs.getInt("price");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    String categoryId = rs.getString("categoryId");
                    int status = rs.getInt("status");
                    list.add(new ProductDTO(productId, name, quantity, price, image, description, categoryId, status));
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

//    public static void main(String[] args) throws SQLException {
//        ProductDAO dao = new ProductDAO();
//        List<ProductDTO> list = dao.ViewByCategory("C01");
//        for (ProductDTO dto : list) {
//            System.out.println(dto.toString());
//        }
//    }
}

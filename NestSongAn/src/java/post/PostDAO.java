/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package post;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Loi Lam
 */
public class PostDAO {
    
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    
    public List<PostDTO> getAllListPosts() throws SQLException{
        List<PostDTO> list = new ArrayList<>();
        try {
            String sql = "select postId, image, postContent, postTitle, category, dateUpload, status from post where status = 1";
            conn = DBUtils.getConnection();
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {  
                PostDTO post = new PostDTO();
                int postId = rs.getInt("postId");
                String igame = rs.getString("image");
                String postContent = rs.getString("postContent");
                String postTitle = rs.getString("postTitle");
                String category = rs.getString("category");
                Date dateUpload = rs.getDate("dateUpload");
                int status = rs.getInt("status");
                list.add(new PostDTO(postId, igame, postContent, postTitle, category, dateUpload, status));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(pst != null) pst.close();
            if(conn != null) conn.close();
        }
        return list;
    }
    
    public List<PostDTO> getAllListPostsForManager() throws SQLException{
        List<PostDTO> list = new ArrayList<>();
        try {
            String sql = "Select p.postId, p.image, p.postContent, p.postTitle, p.dateUpload, p.status, c.categoryName from post p, category c "+
                    " WHERE p.category = c.categoryId ";
            conn = DBUtils.getConnection();
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {  
                PostDTO post = new PostDTO();
                int postId = rs.getInt("postId");
                String igame = rs.getString("image");
                String postContent = rs.getString("postContent");
                String postTitle = rs.getString("postTitle");
                String category = rs.getString("categoryName");
                Date dateUpload = rs.getDate("dateUpload");
                int status = rs.getInt("status");
                list.add(new PostDTO(postId, igame, postContent, postTitle, category, dateUpload, status));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(pst != null) pst.close();
            if(conn != null) conn.close();
        }
        return list;
    }
    
    public PostDTO detailsBlog(int postId) throws SQLException {
        PostDTO post = new PostDTO();
        try {
            String sql = "select postId, image, postContent, postTitle, category, dateUpload, status from post where postId=?";
            conn = DBUtils.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setInt(1, postId);
            rs = pst.executeQuery();
            while (rs.next()) { 
                postId = rs.getInt("postId");
                String igame = rs.getString("image");
                String postContent = rs.getString("postContent");
                String postTitle = rs.getString("postTitle");
                String category = rs.getString("category");
                Date dateUpload = rs.getDate("dateUpload");
                int status = rs.getInt("status");
                post = new PostDTO(postId, igame, postContent, postTitle, category, dateUpload, status);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(pst != null) pst.close();
            if(conn != null) conn.close();
        }
        return post;
    }
    
    public boolean createPost(String image, String postTitle, String postContent,String category) throws SQLException {
        boolean check = false;
        try {
            String sql ="INSERT INTO post(image, postTitle, postContent, category, dateUpload, status)\n" +
                "VALUES(?,?,?,?,CURRENT_TIMESTAMP,1)";
            conn = DBUtils.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setString(1, image);
            pst.setString(2, postTitle);
            pst.setString(3, postContent);
            pst.setString(4, category);
            check = pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(pst != null) pst.close();
            if(conn != null) conn.close();
        }
        return check;
    }
    
    public boolean updatePost(int postId, String image, String postTitle, String postContent, String category) throws SQLException {
        boolean check = false;
        try {
            String sql ="UPDATE post SET image = ?, postTitle = ?, postContent = ?, category = ?, dateUpload = CURRENT_TIMESTAMP Where postId = ?";
            conn = DBUtils.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setString(1, image);
            pst.setString(2, postTitle);
            pst.setString(3, postContent);
            pst.setString(4, category);
            pst.setInt(5, postId);
            check = pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(pst != null) pst.close();
            if(conn != null) conn.close();
        }
        return check;
    }
    
    public boolean removePost(int postId) throws SQLException {
        boolean check = false;
        try {
            String sql ="UPDATE post SET status = 0 Where postId = ?";
            conn = DBUtils.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setInt(1, postId);
            check = pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(pst != null) pst.close();
            if(conn != null) conn.close();
        }
        return check;
    }
    
    public boolean unlockPost(int postId) throws SQLException {
        boolean check = false;
        try {
            String sql ="UPDATE post SET status = 1 Where postId = ?";
            conn = DBUtils.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setInt(1, postId);
            check = pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(pst != null) pst.close();
            if(conn != null) conn.close();
        }
        return check;
    }
}

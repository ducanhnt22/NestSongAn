/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package post;

import java.util.Date;

/**
 *
 * @author dell
 */
public class PostDTO {
    private int postId;
    private String image;
    private String postContent;
    private String postTitle;
    private String category;
    private Date dateUpload;
    private int status;

    public PostDTO() {
    }

    public PostDTO(int postId, String image, String postContent, String postTitle) {
        this.postId = postId;
        this.image = image;
        this.postContent = postContent;
        this.postTitle = postTitle;
    }

    
    
    public PostDTO(String image, String postContent, String postTitle, String category, Date dateUpload, int status) {
        this.image = image;
        this.postContent = postContent;
        this.postTitle = postTitle;
        this.category = category;
        this.dateUpload = dateUpload;
        this.status = status;
    }

    public PostDTO(String image, String postContent, String postTitle, String category, Date dateUpload) {
        this.image = image;
        this.postContent = postContent;
        this.postTitle = postTitle;
        this.category = category;
        this.dateUpload = dateUpload;
    }

    public PostDTO(int postId, String image, String postContent, String postTitle, String category, Date dateUpload, int status) {
        this.postId = postId;
        this.image = image;
        this.postContent = postContent;
        this.postTitle = postTitle;
        this.category = category;
        this.dateUpload = dateUpload;
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public Date getDateUpload() {
        return dateUpload;
    }

    public void setDateUpload(Date dateUpload) {
        this.dateUpload = dateUpload;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}

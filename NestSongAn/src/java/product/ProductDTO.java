/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

/**
 *
 * @author Admin
 */
public class ProductDTO {
    private int productId;
    private String name;
    private int quantity;
    private int price;
    private String image;
    private String description;
    private String categoryId;
    private String categoryName;
    private int status;

    public ProductDTO() {
    }

    public ProductDTO(int productId) {
        this.productId = productId;
    }

    public ProductDTO(String name, int quantity, int price, String image, String description, String categoryId, String categoryName, int status) {
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.description = description;
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.status = status;
    }

    public ProductDTO(int productId, String name, int quantity, int price, String image, String description, String categoryId, String categoryName, int status) {
        this.productId = productId;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.description = description;
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.status = status;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public ProductDTO(String categoryId, String categoryName) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
    }
    
    // contructor for DetailController
    public ProductDTO(int productId, String name, int quantity, int price, String image, String description) {
        this.productId = productId;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.description = description;
    }

    public ProductDTO(String name, int quantity, int price, String image, String description, String categoryId, int status) {
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.description = description;
        this.categoryId = categoryId;
        this.status = status;
    }
    
    //contructor for AddToCartController and BuyNowController
    public ProductDTO(int productId, String name, int quantity, int price, String image) {
        this.productId = productId;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
    }
    
    public ProductDTO(int productId, String name, int quantity, int price, String image, String description, String categoryId, int status) {
        this.productId = productId;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.description = description;
        this.categoryId = categoryId;
        this.status = status;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    

    public ProductDTO(int productId, String name, int quantity, String image, String description, String categoryId, int status) {
        this.productId = productId;
        this.name = name;
        this.quantity = quantity;
        this.image = image;
        this.description = description;
        this.categoryId = categoryId;
        this.status = status;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "productId=" + productId + ", name=" + name + ", quantity=" + quantity + ", image=" + image + ", description=" + description + ", categoryId=" + categoryId + ", status=" + status + '}';
    }
    
    
}

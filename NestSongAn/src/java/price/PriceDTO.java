/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package price;

/**
 *
 * @author dell
 */
public class PriceDTO {
    private int priceid;
    private int price;
    private int status;
    private int productId;
    private String dateChange;

    public PriceDTO(int priceid, int price, int status, int productId, String dateChange) {
        this.priceid = priceid;
        this.price = price;
        this.status = status;
        this.productId = productId;
        this.dateChange = dateChange;
    }

    public PriceDTO(int price, int status, String dateChange) {
        this.price = price;
        this.status = status;
        this.dateChange = dateChange;
    }

    public PriceDTO(int price, int status, int productId, String dateChange) {
        this.price = price;
        this.status = status;
        this.productId = productId;
        this.dateChange = dateChange;
    }

    public PriceDTO() {
    }

    public int getPriceid() {
        return priceid;
    }

    public void setPriceid(int priceid) {
        this.priceid = priceid;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getDateChange() {
        return dateChange;
    }

    public void setDateChange(String dateChange) {
        this.dateChange = dateChange;
    }

    
}

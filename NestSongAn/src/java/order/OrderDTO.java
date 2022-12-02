/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

/**
 *
 * @author Admin
 */
public class OrderDTO {
    private int orderId;
    private String date;
    private String address;
    private int userId;
    private String phone;
    private int shippingfee;
    private int total;
    private String receiver;
    private String status;

    public OrderDTO() {
    }

    public OrderDTO(int orderId) {
        this.orderId = orderId;
    }

    public OrderDTO(int orderId, String date, String address, String phone, int shippingfee, int total, String receiver, String status) {
        this.orderId = orderId;
        this.date = date;
        this.address = address;
        this.phone = phone;
        this.shippingfee = shippingfee;
        this.total = total;
        this.receiver = receiver;
        this.status = status;
    }

    public OrderDTO(String date, String address, int userId, String phone, int shippingfee, int total, String receiver, String status) {
        this.date = date;
        this.address = address;
        this.userId = userId;
        this.phone = phone;
        this.shippingfee = shippingfee;
        this.total = total;
        this.receiver = receiver;
        this.status = status;
    }

    


    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    

    public OrderDTO(int orderId, String date, String address, int userId, String phone) {
        this.orderId = orderId;
        this.date = date;
        this.address = address;
        this.userId = userId;
        this.phone = phone;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getShippingfee() {
        return shippingfee;
    }

    public void setShippingfee(int shippingfee) {
        this.shippingfee = shippingfee;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class UserDTO implements Serializable {

    private int userId;
    private String password;
    private String address;
    private String phone;
    private String email;
    private String fullName;
    private String roleId;
    private String userName;

    public UserDTO() {
    }

    //contructoer for update info
    
    
    public UserDTO(String address, String phone, String email, String fullName) {
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.fullName = fullName;
    }

    public UserDTO(String address, String phone, String email, String fullName, int userId) {
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.fullName = fullName;
        this.userId=userId;
    }

    public UserDTO(int userId, String password, String address, String phone, String email, String fullName, String roleId, String userName) {
        this.userId = userId;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.fullName = fullName;
        this.roleId = roleId;
        this.userName = userName;
    }

    public UserDTO( String password, String address, String phone,
            String email, String fullName, String roleId, String userName) {
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.fullName = fullName;
        this.roleId = roleId;
        this.userName = userName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "userId=" + userId + ", password=" + password + ", address=" + address + ", phone=" + phone + ", email=" + email + ", fullName=" + fullName + ", roleId=" + roleId + ", userName=" + userName + '}';
    }
}

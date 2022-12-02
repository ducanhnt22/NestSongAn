/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contact;

import java.io.Serializable;

/**
 *
 * @author tranq
 */
public class ContactDTO implements Serializable {
    private int id;
    private String senderName;
    private String email;
    private String phone;
    private String contactContent;

    public ContactDTO() {
    }

    public ContactDTO(int id, String senderName, String email, String phone, String contactContent) {
        this.id = id;
        this.senderName = senderName;
        this.email = email;
        this.phone = phone;
        this.contactContent = contactContent;
    }

    public ContactDTO(String senderName, String email, String phone, String contactContent) {
        this.senderName = senderName;
        this.email = email;
        this.phone = phone;
        this.contactContent = contactContent;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    

    /**
     * @return the senderName
     */
    public String getSenderName() {
        return senderName;
    }

    /**
     * @param senderName the senderName to set
     */
    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the contactContent
     */
    public String getContactContent() {
        return contactContent;
    }

    /**
     * @param contactContent the contactContent to set
     */
    public void setContactContent(String contactContent) {
        this.contactContent = contactContent;
    }

}

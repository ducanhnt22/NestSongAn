/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import java.io.Serializable;

/**
 *
 * @author tranq
 */
public class UserError implements Serializable{
    private String usernameErr;
    private String passwordErr;
    private String confirmNotMatch;
    private String usernameDuplicate;
    private String phoneErr;
    private String emailErr;
    private String emailDuplicate;
    private String fullNameErr;
    private String emailAndPhoneErr;
    
    public UserError() {
    }

    public String getUsernameErr() {
        return usernameErr;
    }

    public void setUsernameErr(String usernameErr) {
        this.usernameErr = usernameErr;
    }

    public String getPasswordErr() {
        return passwordErr;
    }

    public void setPasswordErr(String passwordErr) {
        this.passwordErr = passwordErr;
    }

    public String getConfirmNotMatch() {
        return confirmNotMatch;
    }

    public void setConfirmNotMatch(String confirmNotMatch) {
        this.confirmNotMatch = confirmNotMatch;
    }

    public String getUsernameDuplicate() {
        return usernameDuplicate;
    }

    public void setUsernameDuplicate(String usernameDuplicate) {
        this.usernameDuplicate = usernameDuplicate;
    }

    /**
     * @return the phoneErr
     */
    public String getPhoneErr() {
        return phoneErr;
    }

    /**
     * @param phoneErr the phoneErr to set
     */
    public void setPhoneErr(String phoneErr) {
        this.phoneErr = phoneErr;
    }

    /**
     * @return the emailErr
     */
    public String getEmailErr() {
        return emailErr;
    }

    /**
     * @param emailErr the emailErr to set
     */
    public void setEmailErr(String emailErr) {
        this.emailErr = emailErr;
    }

    /**
     * @return the fullNameErr
     */
    public String getFullNameErr() {
        return fullNameErr;
    }

    /**
     * @param fullNameErr the fullNameErr to set
     */
    public void setFullNameErr(String fullNameErr) {
        this.fullNameErr = fullNameErr;
    }

    /**
     * @return the emailDuplicate
     */
    public String getEmailDuplicate() {
        return emailDuplicate;
    }

    /**
     * @param emailDuplicate the emailDuplicate to set
     */
    public void setEmailDuplicate(String emailDuplicate) {
        this.emailDuplicate = emailDuplicate;
    }

    /**
     * @return the emailAndPhoneErr
     */
    public String getEmailAndPhoneErr() {
        return emailAndPhoneErr;
    }

    /**
     * @param emailAndPhoneErr the emailAndPhoneErr to set
     */
    public void setEmailAndPhoneErr(String emailAndPhoneErr) {
        this.emailAndPhoneErr = emailAndPhoneErr;
    }
    
    
}

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
public class ContactErr implements Serializable {

    private String emailAndPhoneErr;
    private String nameErr;
    private String emailErr;
    private String phoneErr;

    public ContactErr() {
    }

    public ContactErr(String emailAndPhoneErr, String nameErr, String emailErr, String phoneErr) {
        this.emailAndPhoneErr = emailAndPhoneErr;
        this.nameErr = nameErr;
        this.emailErr = emailErr;
        this.phoneErr = phoneErr;
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

    /**
     * @return the nameErr
     */
    public String getNameErr() {
        return nameErr;
    }

    /**
     * @param nameErr the nameErr to set
     */
    public void setNameErr(String nameErr) {
        this.nameErr = nameErr;
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

}

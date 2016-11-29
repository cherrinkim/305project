/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.model.UserExistsException;
import com.model.Users;
import com.model.UsersFacade;
import java.io.Serializable;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.inject.Named;

/**
 *
 * @author cherrinkim
 */
@Named(value = "registerBean")
@SessionScoped
public class RegisterBean extends GlobalBean implements Serializable {
    @EJB
    private UsersFacade userService;
    private Users user;
    private String email;
    private String userPassword;
    private String firstName;
    private String lastName;
    private String address;
    private String zipcode;
    private String state;
    private String telephone;
    private String city;
    
    public String register() { 
        Users user = new Users();
        user.setAddress(address);
        user.setCity(city);
        user.setEmail(email);
        user.setUserPassword(org.apache.commons.codec.digest.DigestUtils.sha256Hex(userPassword));
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setState(state);
        user.setTelephone(telephone);
        user.setZipcode(zipcode);
        
        try {
            userService.registerUser(user);
        } catch (UserExistsException ex) {
            System.out.println("user exists");
            return null;
        }
        return "";
    }


public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}

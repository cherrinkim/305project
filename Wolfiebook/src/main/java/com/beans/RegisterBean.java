/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.model.PagesFacade;
import com.model.UserExistsException;
import com.model.Users;
import com.model.UsersFacade;
import java.io.Serializable;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.application.FacesMessage;
import javax.inject.Named;

/**
 *
 * @author cherrinkim
 */
@Named(value = "registerBean")
@RequestScoped
public class RegisterBean extends GlobalBean implements Serializable {
    @EJB
    private UsersFacade userService;
    @EJB
    private PagesFacade pageService;
    private String email;
    private String userPassword;
    private String firstName;
    private String lastName;
    private String address;
    private String zipcode;
    private String state;
    private String telephone;
    private String city;
    private int purchaseRating;
    
    public String register() { 
        Users user = new Users();
        user.setAddress(address);
        user.setCity(city);
        user.setEmail(email);
        user.setUserPassword(org.apache.commons.codec.digest.DigestUtils.sha256Hex(userPassword));
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setState(state);
        user.setTelephone(telephone.replaceAll("[^0-9]", ""));
        user.setZipcode(zipcode);
        user.setPurchaseRating(0);
        
        try {
            userService.registerUser(user);
            pageService.createPage(user);
            sendMessage("register-msg", FacesMessage.SEVERITY_INFO, "You can now log in");
        } catch (UserExistsException ex) {
            System.out.println("user exists");
            sendMessage("register-msg", FacesMessage.SEVERITY_ERROR, "User with email already exists.");
        }
        return "/index?faces-redirect=true";
    }

    public int getPurchaseRating(){
        return purchaseRating;
    }
    
    public void setPurchaseRating(int rating) {
        purchaseRating = rating;
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

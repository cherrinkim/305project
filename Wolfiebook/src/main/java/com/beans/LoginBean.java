/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.model.Users;
import com.model.UsersFacade;
import javax.inject.Named;
import java.io.Serializable;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;


/**
 *
 * @author jeonghoon-kim
 */
@Named(value = "loginBean")
@SessionScoped
public class LoginBean extends GlobalBean implements Serializable {
    
    @EJB
    private UsersFacade userService;

    private String email;
    private String password;
    
    public String login() {
        
        Users user = userService.authenticateUser(email, password);
        
        if(user != null) {
            getSession().setAttribute("userSession", user);
            return "/pages/home?faces-redirect=true";
        } else {
            sendMessage("login-msg", FacesMessage.SEVERITY_ERROR, "Incorrect Username and Password");
            return null;
        }
    }
    
    public String userName() {
        
        Users user = (Users) getSession().getAttribute("userSession");
        return user.getFirstName();
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

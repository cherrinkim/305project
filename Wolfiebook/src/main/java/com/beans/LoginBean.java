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
import javax.enterprise.context.RequestScoped;
import javax.faces.application.FacesMessage;


/**
 *
 * @author jeonghoon-kim
 */
@Named(value = "loginBean")
@RequestScoped
public class LoginBean extends GlobalBean implements Serializable {
    
    @EJB
    private UsersFacade userService;
    private String email;
    private String password;
    
    public String login() {
        
        Users currentUser = userService.getUser(email, password);
        
        if(currentUser != null) {
            getSession().setAttribute("userSession", currentUser);
            return "/pages/home?faces-redirect=true";
        } else {
            sendMessage("login-msg", FacesMessage.SEVERITY_ERROR, "Incorrect Username and Password");
            return null;
        }
    }
}

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
    
    public String login() {
        
        Users curUsr = (Users) getBean("#{users}", Users.class);
        
        try {
            curUsr = userService.getUser(curUsr.getEmail(), curUsr.getUserPassword());
            getSession().setAttribute("userSession", curUsr);
            return "";
        } catch(NullPointerException e) {
            sendMessage("login-msg", FacesMessage.SEVERITY_ERROR, "Incorrect Username and Passowrd");
            return null;
        }
    }
}

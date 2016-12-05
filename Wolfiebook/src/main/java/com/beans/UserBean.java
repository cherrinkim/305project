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
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;


/**
 *
 * @author jeonghoon-kim
 */
@Named(value = "userBean")
@SessionScoped
public class UserBean extends GlobalBean implements Serializable {
    
    @EJB
    private UsersFacade userService;

    private String email;
    private String password;
    
    private Users selected;
    
    private List<Users> users;
    private List<Users> filteredUsers;
    
    @PostConstruct
    public void init() {
        users = userService.findAll();
    }
    
    public Users getSelected() {
        return selected;
    }

    public void setSelected(Users selected) {
        this.selected = selected;
    }
        
    public String login() {
        String hashedPassword = org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);
        Users user = userService.authenticateUser(email, hashedPassword);
        
        if(user != null) {
            getSession().setAttribute("userSession", user);
            return "/pages/home?faces-redirect=true";
        } else {
            sendMessage("login-msg", FacesMessage.SEVERITY_ERROR, "Incorrect Username and Password");
            return null;
        }
    }
    
    public String logout() {
        getSession().invalidate();
        return "/index?faces-redirect=true";
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
    
    public List<Users> getUsers() {
        return users;
    }
    
    public List<Users> getFilteredUsers(){
        return filteredUsers;
    }
    
    public void setFilteredUsers(List<Users> filteredUsers) {
        this.filteredUsers = filteredUsers;
    }
}

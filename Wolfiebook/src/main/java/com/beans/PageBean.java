/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.model.Pages;
import com.model.PagesFacade;
import com.model.Posts;
import com.model.Users;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.application.FacesMessage;
import javax.inject.Named;

/**
 *
 * @author jeonghoon-kim
 */
@Named("pageBean")
@RequestScoped
public class PageBean extends GlobalBean implements Serializable {
    
    @EJB
    private PagesFacade pageFacade;
    private Users user;
    
    
    @PostConstruct
    public void init() {
        try {
            user = (Users) getSession().getAttribute("userSession");
            
        } catch(NullPointerException e) {
            getFacesContext().getApplication().getNavigationHandler().handleNavigation(getFacesContext(), null, "/index?faces-redirect=true");
        }
    }
    
    public Pages getPage() {
        
        Pages page = pageFacade.find(user.getUserId());
        
        if(page != null) {
            getSession().setAttribute("pageSession", page);
            return page;
        } else {
            sendMessage("load-msg", FacesMessage.SEVERITY_ERROR, "No page available.");
            return null;
        }
    }
    
    public List<Posts> getPosts() {
        
        Pages page = pageFacade.find(user.getUserId());
        
        if(page != null) {
            getSession().setAttribute("pageSession", page);
            return page.getPostsList();
        } else {
            sendMessage("load-msg", FacesMessage.SEVERITY_ERROR, "No page available.");
            return null;
        }
        
    }
}

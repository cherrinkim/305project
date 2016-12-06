/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.model.GroupExistsException;
import com.model.Groups;
import com.model.GroupsFacade;
import com.model.Pages;
import com.model.PagesFacade;
import com.model.Posts;
import com.model.UserExistsException;
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
 * @author cherrinkim
 */
@Named(value = "groupBean")
@RequestScoped
public class GroupBean extends GlobalBean implements Serializable {
    private String groupName;
    private String type;
    private Users user;
    private String newName;
    
    @EJB
    private GroupsFacade groupService;
    @EJB
    private PagesFacade pageService;
    
    @PostConstruct
    public void init() {
        try {
            user = (Users) getSession().getAttribute("userSession");
            
        } catch(NullPointerException e) {
            getFacesContext().getApplication().getNavigationHandler().handleNavigation(getFacesContext(), null, "/index?faces-redirect=true");
        }
    }
    
    public String createGroup(){
        Groups group = new Groups();
        group.setGroupName(groupName);
        group.setType(type);
        group.setOwnerId(user);
        
        List<Groups> groups = user.getGroupsList();
        groups.add(group);
        
      
        try {
            groupService.createGroup(group);
            pageService.createPage(group);
        } catch (GroupExistsException ex) {
            sendMessage("group-msg", FacesMessage.SEVERITY_ERROR, "Group with name already exists.");
        }
        
        return "/pages/group?faces-redirect=true";
    }
    
//    public List<Groups> getGroups() {
//        
//        Groups group = groupsService.findPage(user);
//        
//        if(page != null) {
//            getSession().setAttribute("pageSession", page);
//            return page.getPostsList();
//        } else {
//            sendMessage("load-msg", FacesMessage.SEVERITY_ERROR, "No page available.");
//            return null;
//        }
//    }

    
    public String deleteGroup(){
        return "";
    }
    
    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getNewName() {
        return groupName;
    }

    public void setNewName(String newName) {
        this.newName = newName;
    }
    
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}

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
import com.model.UsersFacade;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import org.primefaces.event.RowEditEvent;

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
    private Boolean isEditable;
    
    @EJB
    private GroupsFacade groupFacade;
    @EJB
    private PagesFacade pageFacade;
    @EJB
    private UsersFacade userFacade;
    
    @PostConstruct
    public void init() {
        try {
            user = (Users) getSession().getAttribute("userSession");
            
        } catch(NullPointerException e) {
            getFacesContext().getApplication().getNavigationHandler().handleNavigation(getFacesContext(), null, "/index?faces-redirect=true");
        }
    }
    
    public void onRowEdit(RowEditEvent event){
        FacesMessage msg = new FacesMessage("Name edited", ((Groups) event.getObject()).getGroupName());
        FacesContext.getCurrentInstance().addMessage(null, msg);
        groupFacade.renameGroup((Groups) event.getObject());
    }
    
    public void onRowCancel(RowEditEvent event) {
        FacesMessage msg = new FacesMessage("Edit Cancelled", ((Groups) event.getObject()).getGroupName());
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }
    
    public String deleteGroup(){
        Groups group = groupFacade.findGroup(groupName);
        List<Groups> groups = user.getGroupsList();
        groups.remove(group);
        user.setGroupsList(groups);
        
        groupFacade.deleteGroup(groupName);
        
        
        userFacade.edit(user);
        
        return "/pages/group?faces-redirect=true";
    }
    
    public String createGroup(){
        Groups group = new Groups();
        group.setGroupName(groupName);
        group.setType(type);
        group.setOwnerId(user);
        
        List<Groups> groups = user.getGroupsList();
        groups.add(group);
        user.setGroupsList(groups);
        
        userFacade.edit(user);
        try {
            groupFacade.createGroup(group);
            pageFacade.createPage(group);
        } catch (GroupExistsException ex) {
            sendMessage("group-msg", FacesMessage.SEVERITY_ERROR, "Group with name already exists.");
        }
        
        return "/pages/group?faces-redirect=true";
    }
    
    public List<Groups> getGroups() {
        return user.getGroupsList();
       
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
    
    public void edit(){
        this.isEditable = true;
    }
    
    public void save(){
        this.isEditable = false;
    }
    
    public Boolean getIsEditable(){
        return isEditable;
    }

}
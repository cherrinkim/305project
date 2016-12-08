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
import com.model.Users;
import com.model.UsersFacade;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import org.primefaces.event.RowEditEvent;

/**
 *
 * @author cherrinkim
 */
@Named(value = "groupBean")
@ViewScoped
public class GroupBean extends GlobalBean implements Serializable {

    private String groupName;
    private String type;
    private Users user;
    private Boolean isEditable;
    
    private Groups selected;

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
            

        } catch (NullPointerException e) {
            getFacesContext().getApplication().getNavigationHandler().handleNavigation(getFacesContext(), null, "/index?faces-redirect=true");
        }
    }
    
    protected void setEmbeddableKeys() {
    }

    protected void initializeEmbeddableKey() {
    }
    
    public Groups prepareCreate() {
        selected = new Groups();
        initializeEmbeddableKey();
        return selected;
    }

    public void onRowEdit(RowEditEvent event) {
        FacesMessage msg = new FacesMessage("Name edited", ((Groups) event.getObject()).getGroupName());
        FacesContext.getCurrentInstance().addMessage(null, msg);
        groupFacade.renameGroup((Groups) event.getObject());
    }

    public void onRowCancel(RowEditEvent event) {
        FacesMessage msg = new FacesMessage("Edit Cancelled", ((Groups) event.getObject()).getGroupName());
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }
    


    public String deleteGroup() {
        List<Groups> groups = user.getGroupsList();
        groups.remove(selected);
        user.setGroupsList(groups);

        List<Groups> groups2 = user.getGroupsList1();
        groups2.remove(selected);
        user.setGroupsList1(groups2);
        
       
        Pages page = pageFacade.findPage(selected);
        pageFacade.remove(page);
        Groups group = groupFacade.findGroup(selected.getGroupName());
        groupFacade.remove(group);
        return "/pages/editGroup?faces-redirect=true";
    }

    public String createGroup() {
        Groups group = new Groups();
        group.setGroupName(groupName);
        group.setType(type);
        group.setOwnerId(user);
        
        try {
            groupFacade.createGroup(group);
            pageFacade.createPage(group);
        } catch (GroupExistsException ex) {
            FacesMessage msg = new FacesMessage("Group name already exists", groupName);
            FacesContext.getCurrentInstance().addMessage(null, msg);
            
            return "/pages/editGroup?faces-redirect=true";
        }

        List<Groups> groups = user.getGroupsList1();
        groups.add(group);
        user.setGroupsList1(groups);
        
        userFacade.edit(user);
        

        return "/pages/editGroup?faces-redirect=true";
    }

    public String joinGroup() {
        Groups group = groupFacade.findGroup(groupName);
        if (group != null) {
            List<Users> users = group.getUsersList();
            users.add(user);
            group.setUsersList(users);

            List<Groups> groups = user.getGroupsList();
            groups.add(group);
            user.setGroupsList(groups);


            userFacade.edit(user);

            return "/pages/group?faces-redirect=true";
        } else {
            FacesMessage msg = new FacesMessage("Group not found", groupName);
            FacesContext.getCurrentInstance().addMessage(null, msg);
        }
        groupName = "";
        return null;
    }
    
    public void addToGroup(Users newMember){
        Groups group = selected;
        if (group != null) {
            List<Users> users = group.getUsersList();
            users.add(newMember);
            group.setUsersList(users);

            List<Groups> groups = newMember.getGroupsList();
            groups.add(group);
            newMember.setGroupsList(groups);

            userFacade.edit(newMember);
            
            FacesMessage msg = new FacesMessage("Added to", groupName);
            FacesContext.getCurrentInstance().addMessage(null, msg);
        } else {
            FacesMessage msg = new FacesMessage("Group not found", groupName);
            FacesContext.getCurrentInstance().addMessage(null, msg);
        }
    }

    public List<Groups> getOwnedGroups() {
        return user.getGroupsList1();
    }
    
    public List<Groups> getJoinedGroups() {
        return user.getGroupsList();
    }
    
    public List<Groups> getAllGroups() {
        return groupFacade.findAll();
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }


    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void edit() {
        this.isEditable = true;
    }

    public void save() {
        this.isEditable = false;
    }

    public Boolean getIsEditable() {
        return isEditable;
    }

    public void setSelected(Groups selected){
        this.selected = selected;
    }
    
    public Groups getSelected(){
        return selected;
    }
}

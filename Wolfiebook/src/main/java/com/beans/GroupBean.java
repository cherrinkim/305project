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
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import org.primefaces.event.RowEditEvent;

/**
 *
 * @author cherrinkim
 */
@Named(value = "groupBean")
@SessionScoped
public class GroupBean extends GlobalBean implements Serializable {

    private String groupName;
    private String type;
    private Users user;
    private String newName;
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
        Groups group = groupFacade.findGroup(groupName);
        if (group != null) {
            List<Groups> groups = user.getGroupsList();
            groups.remove(group);
            user.setGroupsList(groups);
            
            List<Groups> groups2 = user.getGroupsList1();
            groups2.remove(group);
            user.setGroupsList1(groups2);

            groupFacade.remove(group);
            userFacade.edit(user);

            return "/pages/group?faces-redirect=true";
        } else {
            FacesMessage msg = new FacesMessage("Group not found", groupName);
            FacesContext.getCurrentInstance().addMessage(null, msg);
        }
        groupName = "";
        return null;
    }

    public String createGroup() {
        Groups group = new Groups();
        group.setGroupName(groupName);
        group.setType(type);
        group.setOwnerId(user);

        List<Groups> groups = user.getGroupsList1();
        groups.add(group);
        user.setGroupsList1(groups);
        
        userFacade.edit(user);
        try {
            groupFacade.createGroup(group);
            pageFacade.createPage(group);
        } catch (GroupExistsException ex) {
            sendMessage("group-msg", FacesMessage.SEVERITY_ERROR, "Group with name already exists.");
        }

        return "/pages/group?faces-redirect=true";
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
        Groups group = groupFacade.findGroup(groupName);
        if (group != null) {
            List<Users> users = group.getUsersList();
            users.add(newMember);
            group.setUsersList(users);

            List<Groups> groups = newMember.getGroupsList();
            groups.add(group);
            newMember.setGroupsList(groups);


            userFacade.edit(newMember);
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

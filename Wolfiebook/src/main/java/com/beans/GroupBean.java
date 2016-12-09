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
import org.primefaces.event.ToggleEvent;

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
    
    public String toGroupPage(Groups group) {
        getSession().setAttribute("groupSession", group);        
        return "/pages/groupPage?faces-redirect=true";
    }
    
    public String toPrevious(){
        return "/pages/group?faces-redirect=true";
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
    
    public void removeFromGroup(Users user2){
        if(user2.getEmail().equals(user.getEmail())){
            FacesMessage msg = new FacesMessage("Can't remove yourself", "");
            FacesContext.getCurrentInstance().addMessage(null, msg);
            return;
        }
        if(!selected.getUsersList().contains(user2)){
            FacesMessage msg = new FacesMessage("User does not exist in group", user2.getFirstName());
            FacesContext.getCurrentInstance().addMessage(null, msg);
            return;
        }
        List<Users> users = selected.getUsersList();
        users.remove(user2);
        selected.setUsersList(users);
        
        List<Groups> groups = user2.getGroupsList();
        groups.remove(selected);
        user2.setGroupsList(groups);
        
        userFacade.edit(user2);
    }
    
    public List<Users> getUsers(){
        if(selected == null){
            return null;
        }
        return selected.getUsersList();
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
        

        selected = group;
        joinGroup();
        return "/pages/editGroup?faces-redirect=true";
    }

    public String joinGroup() {
        Groups group = groupFacade.findGroup(selected.getGroupName());
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
        return null;
    }
    
    public void unjoinGroup(Groups group){
        if(group.getOwnerId().getEmail().equals(user.getEmail())){
            FacesMessage msg = new FacesMessage("Can't unjoin group created", group.getGroupName());
            FacesContext.getCurrentInstance().addMessage(null, msg);
            return;
        }
        List<Users> users = group.getUsersList();
        users.remove(user);
        group.setUsersList(users);
        
        List<Groups> groups = user.getGroupsList();
        groups.remove(group);
        user.setGroupsList(groups);
        
        userFacade.edit(user);
        FacesMessage msg = new FacesMessage("Group unjoined", group.getGroupName());
        FacesContext.getCurrentInstance().addMessage(null, msg);
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
    
    public String getGroupPageName() {
        Groups g = (Groups) getSession().getAttribute("groupSession");
        return selected.getGroupName();
    }
}

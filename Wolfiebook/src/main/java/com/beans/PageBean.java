/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.model.Pages;
import com.model.PagesFacade;
import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.inject.Named;

/**
 *
 * @author jeonghoon-kim
 */
@Named("pageBean")
@SessionScoped
public class PageBean extends GlobalBean implements Serializable {
    
    @EJB
    private PagesFacade pageFacade;
    private List<Pages> items;
    private Integer ownerId;
    
    public List<Pages> getPages() {
        if (items == null) {
            items = getPageFacade().findAll();
        }
        return items;
    }
    
    public List<Pages> getPage() {
        
        items = getPageFacade().getPersonalPage(ownerId);
        
        if(items != null) {
            getSession().setAttribute("pageSession", items);
            return items;
        } else {
            sendMessage("page-msg", FacesMessage.SEVERITY_ERROR, "No page available");
            return null;
        }
    }

    public Integer getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Integer ownerId) {
        this.ownerId = ownerId;
    }

    public PagesFacade getPageFacade() {
        return pageFacade;
    }

    public void setPageFacade(PagesFacade pageFacade) {
        this.pageFacade = pageFacade;
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jeonghoon-kim
 */
public class GlobalBean {
 
    protected FacesContext getFacesContext() {
        return FacesContext.getCurrentInstance();
    }
    
    protected HttpSession startSession() {
        return (HttpSession) getFacesContext().getExternalContext().getSession(true);
    }
    
    protected HttpSession getSession() {
        return (HttpSession) getFacesContext().getExternalContext().getSession(false);
    }
    
    protected Object getBean(String e, Class c) {
        return getFacesContext().getApplication().evaluateExpressionGet(getFacesContext(), e, c);
    }
    
    protected void sendMessage(String cId, FacesMessage.Severity severity, String summary) {
        getFacesContext().addMessage(cId, new FacesMessage(severity, summary, summary));
    }
}

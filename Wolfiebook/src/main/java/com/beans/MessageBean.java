package com.beans;

import com.model.Messages;
import com.model.MessagesFacade;
import com.model.Users;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.inject.Named;
import javax.enterprise.context.RequestScoped;
import javax.faces.bean.ManagedProperty;

/**
 *
 * @author jeonghoon-kim
 */
@Named(value = "messageBean")
@RequestScoped
public class MessageBean extends GlobalBean {
    
    @EJB
    private MessagesFacade messageService;
    
    private List<Messages> messages;
    private Users user;
    
    @ManagedProperty (value="#{param.receiver}")
    private Users receiver;
    
    @PostConstruct
    public void init() {
        try {
            user = (Users) getSession().getAttribute("userSession");
            
        } catch(NullPointerException e) {
            getFacesContext().getApplication().getNavigationHandler().handleNavigation(getFacesContext(), null, "/index?faces-redirect=true");
        }
    }
    
    public MessageBean() {
    }
    
    public List<Messages> getMessages(Users receiver) {
        
        messages = messageService.messageHistory(user, receiver);
        messages.addAll(messageService.messageHistory(receiver, user));
        
        if(messages != null) {
            return messages;
        } else {
            return null;
        }
    }
}

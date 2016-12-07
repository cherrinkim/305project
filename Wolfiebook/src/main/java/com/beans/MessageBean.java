package com.beans;

import com.model.Messages;
import com.model.MessagesFacade;
import com.model.Users;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ManagedProperty;

/**
 *
 * @author jeonghoon-kim
 */
@Named(value = "messageBean")
@SessionScoped
public class MessageBean extends GlobalBean implements Serializable {
    
    @EJB
    private MessagesFacade messageService;
    
    private List<Messages> messages;
    private Users user;
    private String subject;
    private String content;
    
    private Messages selected;
    private List<Messages> filteredMessages;
    
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
    
    public void sendMessages(Users receiver) {
        Timestamp currentTimestamp = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
        Messages msg = new Messages();
        msg.setSubject(subject);
        msg.setContent(content);
        msg.setDateSent(currentTimestamp);
        msg.setSender(user);
        msg.setReceiver(receiver);
        messageService.edit(msg);
    }
    
    public String deleteMessages() {
        messageService.remove(selected);
        return null;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Messages getSelected() {
        return selected;
    }

    public void setSelected(Messages selected) {
        this.selected = selected;
    }

    public List<Messages> getFilteredMessages() {
        return filteredMessages;
    }

    public void setFilteredMessages(List<Messages> filteredMessages) {
        this.filteredMessages = filteredMessages;
    }
}

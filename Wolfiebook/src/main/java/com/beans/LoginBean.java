package com.beans;

import com.entities.User;
import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;



/**
 *
 * @author jeonghoon-kim
 */
@ManagedBean
@SessionScoped
public class LoginBean implements Serializable {

    private User user;

    public LoginBean() {
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}

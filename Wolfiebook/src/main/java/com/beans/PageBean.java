/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.model.Comments;
import com.model.CommentsFacade;
import com.model.Pages;
import com.model.PagesFacade;
import com.model.Posts;
import com.model.PostsFacade;
import com.model.Users;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.application.FacesMessage;
import javax.inject.Named;

/**
 *
 * @author jeonghoon-kim
 */
@Named("pageBean")
@RequestScoped
public class PageBean extends GlobalBean implements Serializable {
    
    @EJB
    private PagesFacade pageFacade;
    @EJB
    private PostsFacade postFacade;
    @EJB
    private CommentsFacade commentFacade;
    private Users user;
    private String postContent;
    private String commentContent;
    
    
    @PostConstruct
    public void init() {
        try {
            user = (Users) getSession().getAttribute("userSession");
            
        } catch(NullPointerException e) {
            getFacesContext().getApplication().getNavigationHandler().handleNavigation(getFacesContext(), null, "/index?faces-redirect=true");
        }
    }
    
    public Pages getPage() {
        
        Pages page = pageFacade.find(user.getUserId());
        
        if(page != null) {
            getSession().setAttribute("pageSession", page);
            return page;
        } else {
            sendMessage("load-msg", FacesMessage.SEVERITY_ERROR, "No page available.");
            return null;
        }
    }
    
    public List<Posts> getPosts() {
        
        Pages page = pageFacade.findPage(user);
        
        if(page != null) {
            getSession().setAttribute("pageSession", page);
            return page.getPostsList();
        } else {
            sendMessage("load-msg", FacesMessage.SEVERITY_ERROR, "No page available.");
            return null;
        }
    }
    
    public String newPost() {
        
        Timestamp currentTimestamp = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
        
        Pages page = pageFacade.find(user.getUserId());
        page.setPostCount(page.getPostCount()+1);
        
        Posts post = new Posts();
        post.setPageId(page);
        post.setAuthorId(user);
        post.setDateCreated(currentTimestamp);
        post.setContent(postContent);
        post.setCommentCount(0);
        
        List<Posts> posts = page.getPostsList();
        posts.add(post);
        page.setPostsList(posts);
        getSession().setAttribute("pageSession", page);
        getSession().setAttribute("postSession", post);
        
        pageFacade.edit(page);
        postFacade.edit(post);
        
        return "/pages/home?faces-redirect=true";
    }
    
    public String newComment(Posts postId) {
        
        Timestamp currentTimestamp = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
        
        Posts post = postFacade.find(postId);
        post.setCommentCount(post.getCommentCount()+1);
        
        Comments comment = new Comments();
        comment.setPostId(postId);
        comment.setAuthorId(user);
        comment.setDateCreated(currentTimestamp);
        comment.setContent(commentContent);
        
        List<Comments> comments = post.getCommentsList();
        comments.add(comment);
        post.setCommentsList(comments);
        
        getSession().setAttribute("postSession", post);
        getSession().setAttribute("commentSession", comment);
        
        postFacade.edit(post);
        commentFacade.edit(comment);
        
        return "/pages/home?faces-redirect=true";
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }
}

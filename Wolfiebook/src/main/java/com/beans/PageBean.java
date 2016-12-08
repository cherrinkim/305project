/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.model.Comments;
import com.model.CommentsFacade;
import com.model.Groups;
import com.model.Pages;
import com.model.PagesFacade;
import com.model.Posts;
import com.model.PostsFacade;
import com.model.Users;
import com.model.UsersFacade;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.event.ValueChangeEvent;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import org.primefaces.event.RowEditEvent;

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
    @EJB
    private UsersFacade userFacade;
    private Users user;
    private String postContent;
    private String commentContent;
    private Posts selected;


    @PostConstruct
    public void init() {
        try {
            user = (Users) getSession().getAttribute("userSession");

        } catch (NullPointerException e) {
            getFacesContext().getApplication().getNavigationHandler().handleNavigation(getFacesContext(), null, "/index?faces-redirect=true");
        }
    }
    
    public void onRowEdit(RowEditEvent event) {
        FacesMessage msg = new FacesMessage("Post edited", "");
        FacesContext.getCurrentInstance().addMessage(null, msg);
        Posts post = (Posts) event.getObject();
        postFacade.editPost(post);
    }

    public void onRowCancel(RowEditEvent event) {
        FacesMessage msg = new FacesMessage("Edit Cancelled", "");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public Pages getPage() {

        Pages page = pageFacade.find(user.getUserId());

        if (page != null) {
            getSession().setAttribute("pageSession", page);
            return page;
        } else {
            sendMessage("load-msg", FacesMessage.SEVERITY_ERROR, "No page available.");
            return null;
        }
    }

    public List<Posts> getPosts() {

        Pages page = pageFacade.findPage(user);

        if (page != null) {
            getSession().setAttribute("pageSession", page);
            return page.getPostsList();
        } else {
            sendMessage("load-msg", FacesMessage.SEVERITY_ERROR, "No page available.");
            return null;
        }
    }

    public List<Posts> getGroupPosts(Groups group) {

        Pages page = pageFacade.findPage(group);

        if (page != null) {
            getSession().setAttribute("pageSession", page);
            return page.getPostsList();
        } else {
//            sendMessage("groupPageGrowl", FacesMessage.SEVERITY_ERROR, "No page available.");
            return null;
        }
    }

    public String newPost() {

        Timestamp currentTimestamp = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());

        Pages page = pageFacade.findPage(user);
        page.setPostCount(page.getPostCount() + 1);

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

        pageFacade.edit(page);
        return null;
    }

    public String newGroupPost(Groups group) {
        
        Timestamp currentTimestamp = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());

        Pages page = pageFacade.findPage(group);
        page.setPostCount(page.getPostCount() + 1);

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

        pageFacade.edit(page);
        return "/pages/groupPage?faces-redirect=true";

    }

    public String newComment(Posts postId) {

        Timestamp currentTimestamp = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());

        Posts post = postFacade.find(postId);
        post.setCommentCount(post.getCommentCount() + 1);

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

        return null;
    }

    public String deletePost(Posts post, Groups group) {
        Pages page = pageFacade.findPage(group);
        page.setPostCount(page.getPostCount() - 1);

        List<Posts> posts = page.getPostsList();
        posts.remove(post);
        page.setPostsList(posts);
        getSession().setAttribute("pageSession", page);
        pageFacade.edit(page);
        postFacade.remove(post);

        return "/pages/groupPage?faces-redirect=true";
    }

    public String likePost(Posts post) {
        List<Posts> posts = user.getPostsList();
        if (posts.contains(post)) {
            unlikePost(post);
        } else {
            posts.add(post);
            userFacade.edit(user);
        }

        return "/pages/groupPage?faces-redirect=true";
    }

    public String checkLikedPost(Posts post) {
        List<Posts> posts = user.getPostsList();
        if (posts.contains(post)) {
            return "Unlike";
        }
        return "Like";
    }

    public void unlikePost(Posts post) {
        List<Posts> posts = user.getPostsList();
        posts.remove(post);

        userFacade.edit(user);
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

    public Posts getSelected() {
        return selected;
    }

    public void setSelected(Posts selected) {
        this.selected = selected;
    }
}

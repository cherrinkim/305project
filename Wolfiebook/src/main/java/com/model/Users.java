/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 *
 * @author jeonghoon-kim
 */
@Entity
@Table(name = "Users")
@NamedQueries({
    @NamedQuery(name = "Users.getUser", query = "SELECT u FROM Users u WHERE u.email = :email AND u.userPassword = :userPassword"),
    @NamedQuery(name = "Users.findAll", query = "SELECT u FROM Users u"),
    @NamedQuery(name = "Users.findByUserId", query = "SELECT u FROM Users u WHERE u.userId = :userId"),
    @NamedQuery(name = "Users.findByUserPassword", query = "SELECT u FROM Users u WHERE u.userPassword = :userPassword"),
    @NamedQuery(name = "Users.findByFirstName", query = "SELECT u FROM Users u WHERE u.firstName = :firstName"),
    @NamedQuery(name = "Users.findByLastName", query = "SELECT u FROM Users u WHERE u.lastName = :lastName"),
    @NamedQuery(name = "Users.findByAddress", query = "SELECT u FROM Users u WHERE u.address = :address"),
    @NamedQuery(name = "Users.findByCity", query = "SELECT u FROM Users u WHERE u.city = :city"),
    @NamedQuery(name = "Users.findByState", query = "SELECT u FROM Users u WHERE u.state = :state"),
    @NamedQuery(name = "Users.findByZipcode", query = "SELECT u FROM Users u WHERE u.zipcode = :zipcode"),
    @NamedQuery(name = "Users.findByTelephone", query = "SELECT u FROM Users u WHERE u.telephone = :telephone"),
    @NamedQuery(name = "Users.findByEmail", query = "SELECT u FROM Users u WHERE u.email = :email"),
    @NamedQuery(name = "Users.findByAccountCreated", query = "SELECT u FROM Users u WHERE u.accountCreated = :accountCreated"),
    @NamedQuery(name = "Users.findByCreditCard", query = "SELECT u FROM Users u WHERE u.creditCard = :creditCard"),
    @NamedQuery(name = "Users.findByPurchaseRating", query = "SELECT u FROM Users u WHERE u.purchaseRating = :purchaseRating")})
@Named
@RequestScoped
public class Users implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "userId")
    private Integer userId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 64)
    @Column(name = "userPassword")
    private String userPassword;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "firstName")
    private String firstName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "lastName")
    private String lastName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 95)
    @Column(name = "address")
    private String address;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 35)
    @Column(name = "city")
    private String city;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2)
    @Column(name = "state")
    private String state;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "zipcode")
    private String zipcode;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 12)
    @Column(name = "telephone")
    private String telephone;
    @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "email")
    private String email;
    @Column(name = "accountCreated")
    @Temporal(TemporalType.TIMESTAMP)
    private Date accountCreated;
    @Size(max = 16)
    @Column(name = "creditCard")
    private String creditCard;
    @Column(name = "purchaseRating")
    private Integer purchaseRating;
    @JoinTable(name = "LikedComments", joinColumns = {
        @JoinColumn(name = "userId", referencedColumnName = "userId")}, inverseJoinColumns = {
        @JoinColumn(name = "commentId", referencedColumnName = "commentId")})
    @ManyToMany
    private List<Comments> commentsList;
    @JoinTable(name = "Friends", joinColumns = {
        @JoinColumn(name = "friend1", referencedColumnName = "userId")}, inverseJoinColumns = {
        @JoinColumn(name = "friend2", referencedColumnName = "userId")})
    @ManyToMany
    private List<Users> usersList;
    @ManyToMany(mappedBy = "usersList")
    private List<Users> usersList1;
    @JoinTable(name = "LikedPosts", joinColumns = {
        @JoinColumn(name = "userId", referencedColumnName = "userId")}, inverseJoinColumns = {
        @JoinColumn(name = "postId", referencedColumnName = "postId")})
    @ManyToMany
    private List<Posts> postsList;
    @JoinTable(name = "GroupMembers", joinColumns = {
        @JoinColumn(name = "userId", referencedColumnName = "userId")}, inverseJoinColumns = {
        @JoinColumn(name = "groupId", referencedColumnName = "groupId")})
    @ManyToMany
    private List<Groups> groupsList;
    @OneToMany(mappedBy = "ownerId")
    private List<Pages> pagesList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sender")
    private List<Messages> messagesList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "receiver")
    private List<Messages> messagesList1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "buyerId")
    private List<Sales> salesList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "authorId")
    private List<Comments> commentsList1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "ownerId")
    private List<Groups> groupsList1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "authorId")
    private List<Posts> postsList1;

    public Users() {
    }

    public Users(Integer userId) {
        this.userId = userId;
    }

    public Users(Integer userId, String userPassword, String firstName, String lastName, String address, String city, String state, String zipcode, String telephone, String email) {
        this.userId = userId;
        this.userPassword = userPassword;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.city = city;
        this.state = state;
        this.zipcode = zipcode;
        this.telephone = telephone;
        this.email = email;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getAccountCreated() {
        return accountCreated;
    }

    public void setAccountCreated(Date accountCreated) {
        this.accountCreated = accountCreated;
    }

    public String getCreditCard() {
        return creditCard;
    }

    public void setCreditCard(String creditCard) {
        this.creditCard = creditCard;
    }

    public Integer getPurchaseRating() {
        return purchaseRating;
    }

    public void setPurchaseRating(Integer purchaseRating) {
        this.purchaseRating = purchaseRating;
    }

    public List<Comments> getCommentsList() {
        return commentsList;
    }

    public void setCommentsList(List<Comments> commentsList) {
        this.commentsList = commentsList;
    }

    public List<Users> getUsersList() {
        return usersList;
    }

    public void setUsersList(List<Users> usersList) {
        this.usersList = usersList;
    }

    public List<Users> getUsersList1() {
        return usersList1;
    }

    public void setUsersList1(List<Users> usersList1) {
        this.usersList1 = usersList1;
    }

    public List<Posts> getPostsList() {
        return postsList;
    }

    public void setPostsList(List<Posts> postsList) {
        this.postsList = postsList;
    }

    public List<Groups> getGroupsList() {
        return groupsList;
    }

    public void setGroupsList(List<Groups> groupsList) {
        this.groupsList = groupsList;
    }

    public List<Pages> getPagesList() {
        return pagesList;
    }

    public void setPagesList(List<Pages> pagesList) {
        this.pagesList = pagesList;
    }

    public List<Messages> getMessagesList() {
        return messagesList;
    }

    public void setMessagesList(List<Messages> messagesList) {
        this.messagesList = messagesList;
    }

    public List<Messages> getMessagesList1() {
        return messagesList1;
    }

    public void setMessagesList1(List<Messages> messagesList1) {
        this.messagesList1 = messagesList1;
    }

    public List<Sales> getSalesList() {
        return salesList;
    }

    public void setSalesList(List<Sales> salesList) {
        this.salesList = salesList;
    }

    public List<Comments> getCommentsList1() {
        return commentsList1;
    }

    public void setCommentsList1(List<Comments> commentsList1) {
        this.commentsList1 = commentsList1;
    }

    public List<Groups> getGroupsList1() {
        return groupsList1;
    }

    public void setGroupsList1(List<Groups> groupsList1) {
        this.groupsList1 = groupsList1;
    }

    public List<Posts> getPostsList1() {
        return postsList1;
    }

    public void setPostsList1(List<Posts> postsList1) {
        this.postsList1 = postsList1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userId != null ? userId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Users)) {
            return false;
        }
        Users other = (Users) object;
        if ((this.userId == null && other.userId != null) || (this.userId != null && !this.userId.equals(other.userId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.model.Users[ userId=" + userId + " ]";
    }
    
}

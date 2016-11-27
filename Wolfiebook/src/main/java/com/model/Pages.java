/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.io.Serializable;
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
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author jeonghoon-kim
 */
@Entity
@Table(name = "Pages")
@NamedQueries({
    @NamedQuery(name = "Pages.findByOwner", query = "SELECT p FROM Pages p WHERE p.ownerId = :ownerId"),
    @NamedQuery(name = "Pages.findAll", query = "SELECT p FROM Pages p")
    , @NamedQuery(name = "Pages.findByPageId", query = "SELECT p FROM Pages p WHERE p.pageId = :pageId")
    , @NamedQuery(name = "Pages.findByPostCount", query = "SELECT p FROM Pages p WHERE p.postCount = :postCount")})
@Named
@RequestScoped
public class Pages implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "pageId")
    private Integer pageId;
    @Column(name = "postCount")
    private Integer postCount;
    @JoinColumn(name = "ownerId", referencedColumnName = "userId")
    @ManyToOne
    private Users ownerId;
    @JoinColumn(name = "groupId", referencedColumnName = "groupId")
    @ManyToOne
    private Groups groupId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "pageId")
    private List<Posts> postsList;

    public Pages() {
    }

    public Pages(Integer pageId) {
        this.pageId = pageId;
    }

    public Integer getPageId() {
        return pageId;
    }

    public void setPageId(Integer pageId) {
        this.pageId = pageId;
    }

    public Integer getPostCount() {
        return postCount;
    }

    public void setPostCount(Integer postCount) {
        this.postCount = postCount;
    }

    public Users getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Users ownerId) {
        this.ownerId = ownerId;
    }

    public Groups getGroupId() {
        return groupId;
    }

    public void setGroupId(Groups groupId) {
        this.groupId = groupId;
    }

    public List<Posts> getPostsList() {
        return postsList;
    }

    public void setPostsList(List<Posts> postsList) {
        this.postsList = postsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (pageId != null ? pageId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pages)) {
            return false;
        }
        Pages other = (Pages) object;
        if ((this.pageId == null && other.pageId != null) || (this.pageId != null && !this.pageId.equals(other.pageId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.model.Pages[ pageId=" + pageId + " ]";
    }
    
}

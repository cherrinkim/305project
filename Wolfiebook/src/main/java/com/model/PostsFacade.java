/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

/**
 *
 * @author jeonghoon-kim
 */
@Stateless
public class PostsFacade extends AbstractFacade<Posts> {

    @PersistenceContext(unitName = "com_Wolfiebook_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PostsFacade() {
        super(Posts.class);
    }
    
    public void editPost(Posts post){
        Posts p = em.find(Posts.class, post.getPostId());
        if(p == null) {
            throw new IllegalArgumentException("Unknown Post id");
        }
        p.setContent(post.getContent());
    }
}

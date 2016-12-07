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
import javax.persistence.Query;

/**
 *
 * @author jeonghoon-kim
 */
@Stateless
public class GroupsFacade extends AbstractFacade<Groups> {

    @PersistenceContext(unitName = "com_Wolfiebook_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public GroupsFacade() {
        super(Groups.class);
    }
    
    public void createGroup(Groups group) throws GroupExistsException {
        try {
            Groups existingGroup = (Groups) em.createNamedQuery("Groups.findByGroupName")
                .setParameter("groupName", group.getGroupName())
                .getSingleResult();
            throw new GroupExistsException();
        } catch(NoResultException e){
            em.persist(group);
        }  
    }
    
    public void renameGroup(Groups group){
        Query query = em.createQuery("UPDATE Groups SET g.groupName = :groupName WHERE g.groupId = :groupId");
        int update = query.setParameter("groupName", group.getGroupName()).setParameter("groupId", group.getGroupId()).executeUpdate();
    }
    
    public Groups findGroup(String groupName){
        try {
            Groups existingGroup = (Groups) em.createNamedQuery("Groups.findByGroupName")
                .setParameter("groupName", groupName)
                .getSingleResult();
            
            return existingGroup;
        } catch(NoResultException e){
            System.out.println("Group doesn't exist");
        }
        return null;
    }
}

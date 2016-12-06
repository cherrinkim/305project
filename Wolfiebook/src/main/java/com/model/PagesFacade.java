package com.model;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

/**
 *
 * @author jeonghoon-kim
 */
@Stateless
public class PagesFacade extends AbstractFacade<Pages> {

    @PersistenceContext(unitName = "com_Wolfiebook_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PagesFacade() {
        super(Pages.class);
    }
    
    public void createPage(Users user){
        try {
            Users usr = (Users) em.createNamedQuery("Users.findByEmail")
                    .setParameter("email", user.getEmail())
                    .getSingleResult();

            Pages page = new Pages();
            page.setOwnerId(usr);
            page.setPostCount(0);
            em.persist(page);
            } catch(NoResultException e){
                
            }  
    }
    
    public void createPage(Groups group){
        try {
            Groups existingGroup = (Groups) em.createNamedQuery("Groups.findByGroupName")
                    .setParameter("groupName", group.getGroupName())
                    .getSingleResult();

            Pages page = new Pages();
            page.setGroupId(existingGroup);
            page.setPostCount(0);
            em.persist(page);
            } catch(NoResultException e){
                
            }  
    }
    
    public Pages findPage(Users user){
        try{
            Pages page = (Pages) em.createNamedQuery("Pages.findByOwner")
                    .setParameter("ownerId", user)
                    .getSingleResult();
            
            return page;
        } catch(NoResultException e){
            
        }
        return null;
    }
}

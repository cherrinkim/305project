/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
    
    public List<Pages> getPersonalPage(Integer ownerId) {
        try {
            List<Pages> items = (List<Pages>) em.createNamedQuery("Pages.findByOwner")
                    .setParameter("ownerId", ownerId)
                    .getResultList();
            return items;
        } catch(NoResultException e) {
            return null;
        }
    }
}

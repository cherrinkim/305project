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
public class MessagesFacade extends AbstractFacade<Messages> {

    @PersistenceContext(unitName = "com_Wolfiebook_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MessagesFacade() {
        super(Messages.class);
    }
    
    public List<Messages> messageHistory(Users sender, Users receiver) {    
        try {
            List<Messages> msg = (List<Messages>) em.createNamedQuery("Messages.findBySR")
                .setParameter("sender", sender)
                .setParameter("receiver", receiver)
                .getResultList();
            return msg;
        } catch(NoResultException e) {
            return null;
        }
    }
    
    public void send(String subject, String content) {
        
    }
}

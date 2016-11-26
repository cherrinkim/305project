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
public class UsersFacade extends AbstractFacade<Users> {

    @PersistenceContext(unitName = "com_Wolfiebook_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsersFacade() {
        super(Users.class);
    }
    
    public Users getUser(String email, String password) {
        try {
            return (Users) em.createNamedQuery("Users.getUser")
                .setParameter("email", email)
                .setParameter("userPassword", password)
                .getSingleResult();
        } catch(NoResultException e) {
            return null;
        }
    }
    
    public void registerUser(Users user) throws UserExistsException {
        try {
            em.createNamedQuery("Users.findByEmail")
                    .setParameter("email", user.getEmail())
                    .getSingleResult();
            throw new UserExistsException();
        } catch(NoResultException e) {
            em.persist(user);
        }
    }
    
}
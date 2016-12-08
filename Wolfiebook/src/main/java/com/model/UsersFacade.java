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
import com.model.UserExistsException;
import java.util.List;

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
    
    public Users authenticateUser(String email, String password) {    
        try {
            Users usr = (Users) em.createNamedQuery("Users.getUser")
                .setParameter("email", email)
                .setParameter("userPassword", password)
                .getSingleResult();
            return usr;
        } catch(NoResultException e) {
            return null;
        }
    }
    
    public void registerUser(Users user) throws UserExistsException{
            try {
                Users usr = (Users) em.createNamedQuery("Users.findByEmail")
                    .setParameter("email", user.getEmail())
                    .getSingleResult();
                throw new UserExistsException();
            } catch(NoResultException e){
                em.persist(user);
            }  
    }
    
    public void editOwnerList(Users user, Groups group) {
        Users u = em.find(Users.class, user.getUserId());
        if(u == null) {
            throw new IllegalArgumentException("Unknown User id");
        }
        List<Groups> g = u.getGroupsList1();
        g.remove(group);
        u.setGroupsList1(g);
        em.merge(u);
    }
}

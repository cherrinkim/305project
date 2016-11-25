package com.mycompany.wolfiebook;

import com.mycompany.wolfiebook.Comments;
import com.mycompany.wolfiebook.Groups;
import com.mycompany.wolfiebook.Messages;
import com.mycompany.wolfiebook.Pages;
import com.mycompany.wolfiebook.Posts;
import com.mycompany.wolfiebook.Sales;
import com.mycompany.wolfiebook.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-11-25T14:59:03")
@StaticMetamodel(Users.class)
public class Users_ { 

    public static volatile SingularAttribute<Users, String> lastName;
    public static volatile SingularAttribute<Users, String> userPassword;
    public static volatile SingularAttribute<Users, String> city;
    public static volatile CollectionAttribute<Users, Groups> groupsCollection1;
    public static volatile SingularAttribute<Users, Integer> purchaseRating;
    public static volatile CollectionAttribute<Users, Messages> messagesCollection1;
    public static volatile CollectionAttribute<Users, Posts> postsCollection;
    public static volatile SingularAttribute<Users, String> state;
    public static volatile CollectionAttribute<Users, Comments> commentsCollection;
    public static volatile CollectionAttribute<Users, Pages> pagesCollection;
    public static volatile SingularAttribute<Users, String> email;
    public static volatile CollectionAttribute<Users, Messages> messagesCollection;
    public static volatile CollectionAttribute<Users, Users> usersCollection1;
    public static volatile SingularAttribute<Users, Date> accountCreated;
    public static volatile SingularAttribute<Users, String> address;
    public static volatile SingularAttribute<Users, String> telephone;
    public static volatile CollectionAttribute<Users, Posts> postsCollection1;
    public static volatile SingularAttribute<Users, Integer> userId;
    public static volatile SingularAttribute<Users, String> zipcode;
    public static volatile CollectionAttribute<Users, Sales> salesCollection;
    public static volatile SingularAttribute<Users, String> firstName;
    public static volatile CollectionAttribute<Users, Comments> commentsCollection1;
    public static volatile SingularAttribute<Users, String> creditCard;
    public static volatile CollectionAttribute<Users, Users> usersCollection;
    public static volatile CollectionAttribute<Users, Groups> groupsCollection;

}
package com.mycompany.wolfiebook;

import com.mycompany.wolfiebook.Pages;
import com.mycompany.wolfiebook.Users;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-11-25T04:48:37")
@StaticMetamodel(Groups.class)
public class Groups_ { 

    public static volatile SingularAttribute<Groups, String> groupName;
    public static volatile SingularAttribute<Groups, Integer> groupId;
    public static volatile CollectionAttribute<Groups, Pages> pagesCollection;
    public static volatile SingularAttribute<Groups, String> type;
    public static volatile CollectionAttribute<Groups, Users> usersCollection;
    public static volatile SingularAttribute<Groups, Users> ownerId;

}
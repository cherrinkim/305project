package com.mycompany.wolfiebook;

import com.mycompany.wolfiebook.Groups;
import com.mycompany.wolfiebook.Posts;
import com.mycompany.wolfiebook.Users;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-11-25T04:48:37")
@StaticMetamodel(Pages.class)
public class Pages_ { 

    public static volatile CollectionAttribute<Pages, Posts> postsCollection;
    public static volatile SingularAttribute<Pages, Groups> groupId;
    public static volatile SingularAttribute<Pages, Integer> postCount;
    public static volatile SingularAttribute<Pages, Integer> pageId;
    public static volatile SingularAttribute<Pages, Users> ownerId;

}
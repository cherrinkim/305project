package com.mycompany.wolfiebook;

import com.mycompany.wolfiebook.Posts;
import com.mycompany.wolfiebook.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-11-25T04:48:37")
@StaticMetamodel(Comments.class)
public class Comments_ { 

    public static volatile SingularAttribute<Comments, Date> dateCreated;
    public static volatile SingularAttribute<Comments, Integer> commentId;
    public static volatile SingularAttribute<Comments, Posts> postId;
    public static volatile CollectionAttribute<Comments, Users> usersCollection;
    public static volatile SingularAttribute<Comments, Users> authorId;
    public static volatile SingularAttribute<Comments, String> content;

}
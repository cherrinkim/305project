package com.mycompany.wolfiebook;

import com.mycompany.wolfiebook.Comments;
import com.mycompany.wolfiebook.Pages;
import com.mycompany.wolfiebook.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-11-25T14:59:03")
@StaticMetamodel(Posts.class)
public class Posts_ { 

    public static volatile SingularAttribute<Posts, Date> dateCreated;
    public static volatile SingularAttribute<Posts, Integer> postId;
    public static volatile CollectionAttribute<Posts, Comments> commentsCollection;
    public static volatile CollectionAttribute<Posts, Users> usersCollection;
    public static volatile SingularAttribute<Posts, Pages> pageId;
    public static volatile SingularAttribute<Posts, Users> authorId;
    public static volatile SingularAttribute<Posts, String> content;
    public static volatile SingularAttribute<Posts, Integer> commentCount;

}
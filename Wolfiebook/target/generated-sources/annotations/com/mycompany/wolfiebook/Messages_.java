package com.mycompany.wolfiebook;

import com.mycompany.wolfiebook.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-11-25T14:59:03")
@StaticMetamodel(Messages.class)
public class Messages_ { 

    public static volatile SingularAttribute<Messages, Users> receiver;
    public static volatile SingularAttribute<Messages, Users> sender;
    public static volatile SingularAttribute<Messages, String> subject;
    public static volatile SingularAttribute<Messages, Integer> messageId;
    public static volatile SingularAttribute<Messages, Date> dateSent;
    public static volatile SingularAttribute<Messages, String> content;

}
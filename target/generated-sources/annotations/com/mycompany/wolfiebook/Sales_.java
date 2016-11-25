package com.mycompany.wolfiebook;

import com.mycompany.wolfiebook.Advertisements;
import com.mycompany.wolfiebook.Employees;
import com.mycompany.wolfiebook.Users;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-11-24T20:12:07")
@StaticMetamodel(Sales.class)
public class Sales_ { 

    public static volatile SingularAttribute<Sales, Advertisements> advertisementId;
    public static volatile SingularAttribute<Sales, Employees> overseerId;
    public static volatile SingularAttribute<Sales, Integer> numberOfUnits;
    public static volatile SingularAttribute<Sales, Date> dateSold;
    public static volatile SingularAttribute<Sales, BigDecimal> chargeAmount;
    public static volatile SingularAttribute<Sales, Users> buyerId;
    public static volatile SingularAttribute<Sales, Integer> transactionId;
    public static volatile SingularAttribute<Sales, String> cardNumber;

}
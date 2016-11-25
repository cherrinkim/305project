package com.mycompany.wolfiebook;

import com.mycompany.wolfiebook.Employees;
import com.mycompany.wolfiebook.Sales;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-11-25T04:48:37")
@StaticMetamodel(Advertisements.class)
public class Advertisements_ { 

    public static volatile SingularAttribute<Advertisements, BigDecimal> unitPrice;
    public static volatile CollectionAttribute<Advertisements, Sales> salesCollection;
    public static volatile SingularAttribute<Advertisements, Integer> advertisementId;
    public static volatile SingularAttribute<Advertisements, String> itemName;
    public static volatile SingularAttribute<Advertisements, Integer> availableUnits;
    public static volatile SingularAttribute<Advertisements, Date> dateCreated;
    public static volatile SingularAttribute<Advertisements, String> company;
    public static volatile SingularAttribute<Advertisements, Employees> employeeId;
    public static volatile SingularAttribute<Advertisements, String> type;
    public static volatile SingularAttribute<Advertisements, String> content;

}
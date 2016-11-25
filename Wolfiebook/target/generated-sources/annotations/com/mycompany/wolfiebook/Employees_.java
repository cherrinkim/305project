package com.mycompany.wolfiebook;

import com.mycompany.wolfiebook.Advertisements;
import com.mycompany.wolfiebook.Sales;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-11-25T14:59:03")
@StaticMetamodel(Employees.class)
public class Employees_ { 

    public static volatile SingularAttribute<Employees, String> lastName;
    public static volatile SingularAttribute<Employees, String> address;
    public static volatile SingularAttribute<Employees, String> city;
    public static volatile SingularAttribute<Employees, Integer> employeeId;
    public static volatile SingularAttribute<Employees, String> telephone;
    public static volatile CollectionAttribute<Employees, Advertisements> advertisementsCollection;
    public static volatile SingularAttribute<Employees, String> employeePassword;
    public static volatile SingularAttribute<Employees, String> ssn;
    public static volatile SingularAttribute<Employees, String> zipcode;
    public static volatile CollectionAttribute<Employees, Sales> salesCollection;
    public static volatile SingularAttribute<Employees, String> firstName;
    public static volatile SingularAttribute<Employees, Date> dateStarted;
    public static volatile SingularAttribute<Employees, Boolean> isManager;
    public static volatile SingularAttribute<Employees, String> state;
    public static volatile SingularAttribute<Employees, BigDecimal> hourlyRate;

}
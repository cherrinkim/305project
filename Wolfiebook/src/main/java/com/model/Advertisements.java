/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author jeonghoon-kim
 */
@Entity
@Table(name = "Advertisements")
@NamedQueries({
    @NamedQuery(name = "Advertisements.findAll", query = "SELECT a FROM Advertisements a")
    , @NamedQuery(name = "Advertisements.findByAdvertisementId", query = "SELECT a FROM Advertisements a WHERE a.advertisementId = :advertisementId")
    , @NamedQuery(name = "Advertisements.findByType", query = "SELECT a FROM Advertisements a WHERE a.type = :type")
    , @NamedQuery(name = "Advertisements.findByDateCreated", query = "SELECT a FROM Advertisements a WHERE a.dateCreated = :dateCreated")
    , @NamedQuery(name = "Advertisements.findByCompany", query = "SELECT a FROM Advertisements a WHERE a.company = :company")
    , @NamedQuery(name = "Advertisements.findByItemName", query = "SELECT a FROM Advertisements a WHERE a.itemName = :itemName")
    , @NamedQuery(name = "Advertisements.findByUnitPrice", query = "SELECT a FROM Advertisements a WHERE a.unitPrice = :unitPrice")
    , @NamedQuery(name = "Advertisements.findByAvailableUnits", query = "SELECT a FROM Advertisements a WHERE a.availableUnits = :availableUnits")})
public class Advertisements implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "advertisement_id")
    private Integer advertisementId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "type")
    private String type;
    @Column(name = "date_created")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateCreated;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "company")
    private String company;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "item_name")
    private String itemName;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "content")
    private String content;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "unit_price")
    private BigDecimal unitPrice;
    @Basic(optional = false)
    @NotNull
    @Column(name = "available_units")
    private int availableUnits;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "advertisementId")
    private List<Sales> salesList;
    @JoinColumn(name = "employee_id", referencedColumnName = "employee_id")
    @ManyToOne(optional = false)
    private Employees employeeId;

    public Advertisements() {
    }

    public Advertisements(Integer advertisementId) {
        this.advertisementId = advertisementId;
    }

    public Advertisements(Integer advertisementId, String type, String company, String itemName, String content, BigDecimal unitPrice, int availableUnits) {
        this.advertisementId = advertisementId;
        this.type = type;
        this.company = company;
        this.itemName = itemName;
        this.content = content;
        this.unitPrice = unitPrice;
        this.availableUnits = availableUnits;
    }

    public Integer getAdvertisementId() {
        return advertisementId;
    }

    public void setAdvertisementId(Integer advertisementId) {
        this.advertisementId = advertisementId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getAvailableUnits() {
        return availableUnits;
    }

    public void setAvailableUnits(int availableUnits) {
        this.availableUnits = availableUnits;
    }

    public List<Sales> getSalesList() {
        return salesList;
    }

    public void setSalesList(List<Sales> salesList) {
        this.salesList = salesList;
    }

    public Employees getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Employees employeeId) {
        this.employeeId = employeeId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (advertisementId != null ? advertisementId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Advertisements)) {
            return false;
        }
        Advertisements other = (Advertisements) object;
        if ((this.advertisementId == null && other.advertisementId != null) || (this.advertisementId != null && !this.advertisementId.equals(other.advertisementId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.entities.Advertisements[ advertisementId=" + advertisementId + " ]";
    }
    
}

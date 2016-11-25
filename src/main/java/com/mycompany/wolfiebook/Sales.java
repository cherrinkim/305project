/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.wolfiebook;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jeonghoon-kim
 */
@Entity
@Table(name = "Sales")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sales.findAll", query = "SELECT s FROM Sales s")
    , @NamedQuery(name = "Sales.findByTransactionId", query = "SELECT s FROM Sales s WHERE s.transactionId = :transactionId")
    , @NamedQuery(name = "Sales.findByCardNumber", query = "SELECT s FROM Sales s WHERE s.cardNumber = :cardNumber")
    , @NamedQuery(name = "Sales.findByDateSold", query = "SELECT s FROM Sales s WHERE s.dateSold = :dateSold")
    , @NamedQuery(name = "Sales.findByNumberOfUnits", query = "SELECT s FROM Sales s WHERE s.numberOfUnits = :numberOfUnits")
    , @NamedQuery(name = "Sales.findByChargeAmount", query = "SELECT s FROM Sales s WHERE s.chargeAmount = :chargeAmount")})
public class Sales implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "transaction_id")
    private Integer transactionId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 16)
    @Column(name = "card_number")
    private String cardNumber;
    @Column(name = "date_sold")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateSold;
    @Basic(optional = false)
    @NotNull
    @Column(name = "number_of_units")
    private int numberOfUnits;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "charge_amount")
    private BigDecimal chargeAmount;
    @JoinColumn(name = "advertisement_id", referencedColumnName = "advertisement_id")
    @ManyToOne(optional = false)
    private Advertisements advertisementId;
    @JoinColumn(name = "buyer_id", referencedColumnName = "user_id")
    @ManyToOne(optional = false)
    private Users buyerId;
    @JoinColumn(name = "overseer_id", referencedColumnName = "employee_id")
    @ManyToOne
    private Employees overseerId;

    public Sales() {
    }

    public Sales(Integer transactionId) {
        this.transactionId = transactionId;
    }

    public Sales(Integer transactionId, String cardNumber, int numberOfUnits, BigDecimal chargeAmount) {
        this.transactionId = transactionId;
        this.cardNumber = cardNumber;
        this.numberOfUnits = numberOfUnits;
        this.chargeAmount = chargeAmount;
    }

    public Integer getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(Integer transactionId) {
        this.transactionId = transactionId;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public Date getDateSold() {
        return dateSold;
    }

    public void setDateSold(Date dateSold) {
        this.dateSold = dateSold;
    }

    public int getNumberOfUnits() {
        return numberOfUnits;
    }

    public void setNumberOfUnits(int numberOfUnits) {
        this.numberOfUnits = numberOfUnits;
    }

    public BigDecimal getChargeAmount() {
        return chargeAmount;
    }

    public void setChargeAmount(BigDecimal chargeAmount) {
        this.chargeAmount = chargeAmount;
    }

    public Advertisements getAdvertisementId() {
        return advertisementId;
    }

    public void setAdvertisementId(Advertisements advertisementId) {
        this.advertisementId = advertisementId;
    }

    public Users getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Users buyerId) {
        this.buyerId = buyerId;
    }

    public Employees getOverseerId() {
        return overseerId;
    }

    public void setOverseerId(Employees overseerId) {
        this.overseerId = overseerId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (transactionId != null ? transactionId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sales)) {
            return false;
        }
        Sales other = (Sales) object;
        if ((this.transactionId == null && other.transactionId != null) || (this.transactionId != null && !this.transactionId.equals(other.transactionId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.mycompany.wolfiebook.Sales[ transactionId=" + transactionId + " ]";
    }
    
}

package com.example.SWPKoiContructor.entities;

import javax.persistence.*;
import java.util.Calendar;

@Entity
public class LoyaltyPoint {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "loyalty_point_id")
    private int id;

    @Column(name = "date_apply")
    private Calendar dateApply;

    private int amount;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    public LoyaltyPoint() {
    }
    
    

    public LoyaltyPoint(int id, Calendar dateApply, int amount, Customer customer) {
        this.id = id;
        this.dateApply = dateApply;
        this.amount = amount;
        this.customer = customer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Calendar getDateApply() {
        return dateApply;
    }

    public void setDateApply(Calendar dateApply) {
        this.dateApply = dateApply;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
    
    
    
}
package com.example.SWPKoiContructor.entities;

import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name="Blog")
public class Blog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "blog_id")
    private int id;

    @Column(name="blog_name")
    private String name;
    @Column(name="blog_date_post")
    private Date datePost;
    
    @Column(name="blog_description",columnDefinition = "TEXT")
    private String description;
    @Column(name="blog_img_url")
    private String imgUrl;
    
    
    @Column(name="blog_status")
    private int status;

    @OneToOne(mappedBy = "blog",fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    private Content introContent;
    
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="staff_id")
    private Staff staff;

    public Blog(int id, String name, Date datePost, String description, String imgUrl, int status, Staff staff) {
        this.id = id;
        this.name = name;
        this.datePost = datePost;
        
        this.description = description;
        this.imgUrl = imgUrl;
        this.status = status;
        this.staff = staff;
    }

    
    public Blog(){

    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDatePost() {
        return datePost;
    }

    public void setDatePost(Date datePost) {
        this.datePost = datePost;
    }

    

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Content getIntroContent() {
        return introContent;
    }

    public void setIntroContent(Content introContent) {
        this.introContent = introContent;
    }

    
    
    public void addContent(Content content){
        this.introContent = content;
        content.setBlog(this);
    }
    
    
    
    
    public void addAuthor(Staff staff){
        this.staff = staff;
        staff.getBlogs().add(this);
    }
    
    public boolean isBlogBelongToAuthor(Staff staff){
        return staff != null && this.staff.getId() == staff.getId();
    }
    
    

    
    
    
}

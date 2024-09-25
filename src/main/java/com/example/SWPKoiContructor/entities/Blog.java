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
    @Lob
    @Column(name="blog_content",columnDefinition = "TEXT")
    private String content;
    @Column(name="blog_description",columnDefinition = "TEXT")
    private String description;
    @Column(name="blog_img_url")
    private String imgUrl;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="staff_id")
    private Staff staff;

    public Blog(int id, String name, Date datePost, String content, String description, String imgUrl, Staff staff) {
        this.id = id;
        this.name = name;
        this.datePost = datePost;
        this.content = content;
        this.description = description;
        this.imgUrl = imgUrl;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
}

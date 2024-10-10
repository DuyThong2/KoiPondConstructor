/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import java.util.Base64;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Admin
 */

@Entity
@Table(name="Intro_Content")
public class Content {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Lob
    @Column(name="content")
    private String content;
    
     @Column(name = "create_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createDate;

    @Column(name = "last_updated_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastUpdatedDate;
    
    
    @OneToOne
    @JoinColumn(name="service_id")
    private Service service;
    
    @OneToOne
    @JoinColumn(name="project_id")
    private Project project;
    
    @OneToOne
    @JoinColumn(name="blog_id")
    private Blog blog;
    
    @OneToOne
    @JoinColumn(name = "pre_design_id")
    private PreDesign preDesign;

    public Content() {
    }

    public Content(String content, Date createDate, Date lastUpdatedDate) {
        this.content = encodeBase64(content);
        this.createDate = createDate;
        this.lastUpdatedDate = lastUpdatedDate;
    }

    public Content(String content) {
        this.content = encodeBase64(content);
        createDate = new Date();
        lastUpdatedDate= createDate;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = encodeBase64(content);
    }
    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getLastUpdatedDate() {
        return lastUpdatedDate;
    }

    public void setLastUpdatedDate(Date lastUpdatedDate) {
        this.lastUpdatedDate = lastUpdatedDate;
    }

    public PreDesign getPreDesign() {
        return preDesign;
    }

    public void setPreDesign(PreDesign preDesign) {
        this.preDesign = preDesign;
    }
    
    
    private String encodeBase64(String content){
        return Base64.getEncoder().encodeToString(content.getBytes());
    }

    private String decodeBase64(String base64Content){
        return new String(Base64.getDecoder().decode(base64Content));
    }

}

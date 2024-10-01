/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.Table;

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
    
    
    @OneToOne
    @JoinColumn(name="service_id")
    private Service service;
    
    @OneToOne
    @JoinColumn(name="project_id")
    private Project project;
    
    @OneToOne
    @JoinColumn(name="blog_id")
    private Blog blog;

    public Content() {
    }

    public Content(int id, String content, Project project, Blog blog) {
        this.id = id;
        this.content = content;
        this.project = project;
        this.blog = blog;
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
        this.content = content;
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
    
    
    
    
}

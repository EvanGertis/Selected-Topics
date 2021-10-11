package com.company.app.model;

/*
 * Visualization.java
 * Author: Evan Gertis
 */

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="visualization")
@Data
public class WordMatch {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int id;
}

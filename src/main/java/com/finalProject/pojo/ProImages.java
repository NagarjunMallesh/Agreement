package com.finalProject.pojo;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

import com.finalProject.pojo.Listings;

@Entity
@Table(name="proImages")
public class ProImages {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int imgId;

    @Lob
    @Type(type = "binary")
    private byte[] data;

    

    public ProImages() {
    }

    public int getId() {
        return imgId;
    }

    public void setId(int id) {
        this.imgId = id;
    }

    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }

}
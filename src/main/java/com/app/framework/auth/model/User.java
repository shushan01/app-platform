package com.app.framework.auth.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;


@MappedSuperclass
public class User implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = -1101683279680617696L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;

    //    @NotNull
//    @Column(name = "user_name", length = 64)
    protected String userName;

    //    @NotNull
//    @Column(name = "password", length = 64)
    protected String password;

    //    @Column(name = "email", length = 64)
    protected String email;

    //    @Column(name = "phone", length = 64)
    protected String phone;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}

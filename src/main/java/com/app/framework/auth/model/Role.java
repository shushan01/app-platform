package com.app.framework.auth.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tb_role")
public class Role extends BaseEntity {

    /**
     *
     */
    private static final long serialVersionUID = -1101683279680617696L;

//    @NotNull
//    @Column(name = "name", length = 64)
    private String name;

//    @NotNull
//    @Column(name = "description", length = 64)
    private String description;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

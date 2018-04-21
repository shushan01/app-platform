package com.app.framework.auth.model;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by yangyijun on 2018/4/14.
 */
@Entity
@Table(name = "tb_authority")
public class Authority extends BaseEntity {
    /**
     *
     */
    private static final long serialVersionUID = -1101683279680617696L;

    //    @NotNull
    private String name;

    //    @NotNull
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

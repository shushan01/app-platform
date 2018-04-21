package com.app.framework.auth.model;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tb_role")
public class Role extends BaseEntity {

    /**
     *
     */
    private static final long serialVersionUID = -1101683279680617696L;

    @NotBlank(message = "角色名称不能为空")
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

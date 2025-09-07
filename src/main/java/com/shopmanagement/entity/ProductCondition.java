package com.shopmanagement.entity;

import com.fasterxml.jackson.annotation.JsonValue;

public enum ProductCondition {
    NEW,
    USED;
    
    @JsonValue
    public String getValue() {
        return this.name();
    }
}

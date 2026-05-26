package com.shopmanagement.entity;

import com.fasterxml.jackson.annotation.JsonValue;

public enum ProductLabel {
    NEW("new", "NEW"),
    USED("used", "USED");
    
    private final String label;
    private final String labelText;
    
    ProductLabel(String label, String labelText) {
        this.label = label;
        this.labelText = labelText;
    }
    
    public String getLabel() {
        return label;
    }
    
    @JsonValue
    public String getLabelText() {
        return labelText;
    }
    
    public static ProductLabel fromCondition(ProductCondition condition) {
        switch (condition) {
            case NEW:
                return NEW;
            case USED:
                return USED;
            default:
                return NEW;
        }
    }
}

package com.semanticbits.employee.search;

import java.util.List;
import org.springframework.stereotype.Component;

@Component("autoSuggestions")
public class AutoSuggestions {

    private List firstNames;
    private List lastNames;
    private List emails;

    public List getFirstNames() {
        return firstNames;
    }

    public void setFirstNames(List firstNames) {
        this.firstNames = firstNames;
    }

    public List getLastNames() {
        return lastNames;
    }

    public void setLastNames(List lastNames) {
        this.lastNames = lastNames;
    }

    public List getEmails() {
        return emails;
    }

    public void setEmails(List emails) {
        this.emails = emails;
    }
}

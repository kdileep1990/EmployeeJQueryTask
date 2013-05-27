package com.semanticbits.employee.search;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.semanticbits.employee.Employee;
import java.util.ArrayList;

@Repository("searchDao")
public class SearchDao {

    @Resource
    private AutoSuggestions autoSuggestions;
    @Resource
    private SessionFactory sessionFactory;
    private Employee[] employees;

    public AutoSuggestions getAutoSuggestions() {
        return autoSuggestions;
    }

    public Employee[] getEmployees() {
        return employees;
    }

    public void generateAutoSuggestions() {
        Session session = sessionFactory.openSession();
        String hql = "SELECT E.firstname,E.lastname,E.emailid FROM Employee E";
        System.out.println(hql);
        Query query = session.createQuery(hql);
        List results = query.list();
        List firstNames = new ArrayList();
        List lastNames = new ArrayList();
        List emails = new ArrayList();
        List roles = new ArrayList();
        for (int iterator = 0; iterator < results.size(); iterator++) {
            Object[] row = (Object[]) results.get(iterator);
            if (!firstNames.contains(row[0])) {
                firstNames.add(row[0]);
            }
            if (!lastNames.contains(row[1])) {
                lastNames.add(row[1]);
            }
            if (!emails.contains(row[2])) {
                emails.add(row[2]);
            }
        }
        autoSuggestions.setFirstNames(firstNames);
        autoSuggestions.setLastNames(lastNames);
        autoSuggestions.setEmails(emails);
    }

    public void searchEmployeeDetails(String firstName, String lastName, String role, String userType, String emailId) {
        Session session = sessionFactory.openSession();
        String hql = "";
        hql = "Select DISTINCT E FROM Employee E where ";
        if (!firstName.equals("")) {
            hql = hql + "E.firstname like'" + firstName + "%' and ";
        }
        if (!lastName.equals("")) {
            hql = hql + "E.lastname like '" + lastName + "%' and ";
        }
        if (!emailId.equals("")) {
            hql = hql + "E.emailid  like  '" + emailId + "%' and ";
        }
        hql = hql + "E.usertype='" + userType + "'";
        System.out.println(hql);
        Query query = session.createQuery(hql);
        List results = query.list();
        employees = new Employee[results.size()];
        for (int iterator = 0; iterator < results.size(); iterator++) {
            employees[iterator] = (Employee) results.get(iterator);
            employees[iterator].setPassword("");
        }
    }
}
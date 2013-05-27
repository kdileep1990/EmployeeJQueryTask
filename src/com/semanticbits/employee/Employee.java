package com.semanticbits.employee;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "employee", catalog = "employeedetails")
public class Employee implements java.io.Serializable {

    private String emailid;
    private String password;
    private String firstname;
    private String lastname;
    private String usertype;
    private Double salary;

    public Employee() {
    }

    public Employee(String emailid) {
        this.emailid = emailid;
    }

    public Employee(String emailid, String password, String firstname, String lastname, String usertype, Double salary) {
        this.emailid = emailid;
        this.password = password;
        this.firstname = firstname;
        this.lastname = lastname;
        this.usertype = usertype;
        this.salary = salary;
    }

    @Id
    @Column(name = "emailid", unique = true, nullable = false, length = 30)
    public String getEmailid() {
        return this.emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    @Column(name = "password", length = 30)
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "firstname", length = 30)
    public String getFirstname() {
        return this.firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    @Column(name = "lastname", length = 30)
    public String getLastname() {
        return this.lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    @Column(name = "usertype", length = 30)
    public String getUsertype() {
        return this.usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    @Column(name = "salary", precision = 22, scale = 0)
    public Double getSalary() {
        return this.salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }
}

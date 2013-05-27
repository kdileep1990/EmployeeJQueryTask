package com.semanticbits.employee.registration;

import com.semanticbits.employee.Employee;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository
public class RegistrationDao {

    @Resource
    private SessionFactory sessionFactory;
    private Session session;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;

    }

    public boolean saveUserInfo(Employee employee) {
        try {
            session = sessionFactory.openSession();
            session.getTransaction().begin();
            session.save(employee);
            session.getTransaction().commit();
            System.out.println("inserted");
            return true;
        } catch (org.hibernate.exception.ConstraintViolationException e) {
            session.getTransaction().rollback();
            return false;
        }
    }
}

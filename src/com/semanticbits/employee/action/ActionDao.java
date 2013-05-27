package com.semanticbits.employee.action;

import com.semanticbits.employee.Employee;
import javax.annotation.Resource;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

@Repository("actionDao")
public class ActionDao {

    @Resource
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public boolean deleteEmployeeDetails(String emailId) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            System.out.println(emailId + "hi");
//            Employee employee = (Employee) session.get(Employee.class, emailId);
//            session.delete(employee);
            String hql = "Delete from Employee E WHERE E.emailid = '" + emailId + "'";
            System.out.println(hql + " edit");
            Query query = session.createQuery(hql);
            int result = query.executeUpdate();
            tx.commit();
            return true;
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    public String editEmployeeDetails(String firstname, String lastname, String emailid, String salary, String oldemail) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            String hql = "UPDATE Employee E set E.firstname='" + firstname + "',E.lastname='" + lastname + "',E.emailid='" + emailid + "',E.salary =" + Double.parseDouble(salary) + ""
                    + " WHERE E.emailid = '" + oldemail + "'";
            System.out.println(hql + " edit");
            Query query = session.createQuery(hql);
            int result = query.executeUpdate();
            tx.commit();
            return "true";
        } catch (org.hibernate.exception.ConstraintViolationException e) {
            if (tx != null) {
                tx.rollback();
            }
            return "the emailid is already registered for another user";
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println("hi");
            e.printStackTrace();
            System.out.println("hi" + e.getMessage());
            return "unable to edit the employee";
        }
    }
}

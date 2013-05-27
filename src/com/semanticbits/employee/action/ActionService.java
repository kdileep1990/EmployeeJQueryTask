package com.semanticbits.employee.action;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

@Service("actionService")
public class ActionService {

    @Resource
    private ActionDao actionDao;

    public void setActionDao(ActionDao actionDao) {
        this.actionDao = actionDao;
    }

    public boolean deleteEmployee(String emailId) {
        return actionDao.deleteEmployeeDetails(emailId);
    }

    public String editEmployee(String firstname, String lastname, String emailid, String salary, String odlemail) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        return actionDao.editEmployeeDetails(firstname, lastname, emailid, salary, odlemail);
    }
}

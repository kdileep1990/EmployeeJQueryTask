package com.semanticbits.employee.action;

import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ActionController {

    @Resource
    private ActionService actionService;

    public void setActionService(ActionService actionService) {
        this.actionService = actionService;
    }

    @RequestMapping("/delete.html")
    public void delete(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        PrintWriter writer = response.getWriter();
        System.out.println(request.getParameter("emailid") + " delete");
        writer.write(String.valueOf(actionService.deleteEmployee(request.getParameter("emailid"))));
    }

    @RequestMapping("/edit.html")
    public void edit(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        System.out.println("hi");
        PrintWriter writer = response.getWriter();
        writer.write(actionService.editEmployee(request.getParameter("firstname"), request.getParameter("lastname"), request.getParameter("emailid"), request.getParameter("salary"), request.getParameter("oldemail")));
    }
}

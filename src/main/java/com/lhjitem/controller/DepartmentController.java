package com.lhjitem.controller;

import com.lhjitem.pojo.Department;
import com.lhjitem.pojo.GeneralReturnJson;
import com.lhjitem.service.DepartmentService;
import com.lhjitem.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    /**
     * 写一个得到所有部门的方法
     * @return
     */
    @RequestMapping("/depts")
    @ResponseBody
    public GeneralReturnJson getDepts(){
        List<Department> list = departmentService.getDepts();
        return GeneralReturnJson.success().add("depts", list);
    }
}

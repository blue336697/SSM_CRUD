package com.lhjitem.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhjitem.pojo.Employee;
import com.lhjitem.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 处理员工CRUD操作
 */
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;


    /**
     * 查询员工信息（分页查询）
     * pn是pageNumber
     * @return
     */
    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model){
        //为了分页查询，我们引入一个PageHelper分页插件
        //在查询之前只需要调用startPage，从第几页开始查，每页几个
        PageHelper.startPage(pn,5);
        List<Employee> employees = employeeService.getAllEmps();
        //查询完后pageInfo来包装查询后的结果（封装了详细的分页信息，包括我们查询出来的数据）
        // 只需要把这个pageInfo给页面后就不需要在关心什么了
        //传入连续显示的页数
        PageInfo page = new PageInfo(employees,5);
        //放到model中，以便页面使用
        model.addAttribute("pageInfo",page);

        return "list";
    }
}

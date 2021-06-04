package com.lhjitem.service;

import com.lhjitem.dao.EmployeeMapper;
import com.lhjitem.pojo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
public class EmployeeService {
    //调用dao层
    @Autowired
    EmployeeMapper employeeMapper;

    /**
     * 查询所有员工
     *
     * @return
     */
    public List<Employee> getAllEmps(){
        return employeeMapper.selectByExampleWithDept(null);
    }
}

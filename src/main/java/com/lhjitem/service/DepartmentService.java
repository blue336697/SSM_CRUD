package com.lhjitem.service;

import com.lhjitem.dao.DepartmentMapper;
import com.lhjitem.pojo.Department;
import com.lhjitem.pojo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDepts(){
        List<Department> departments = departmentMapper.selectByExample(null);
        return departments;
    }


}

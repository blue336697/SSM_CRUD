package com.lhjitem.service;

import com.lhjitem.dao.EmployeeMapper;
import com.lhjitem.pojo.Employee;
import com.lhjitem.pojo.EmployeeExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
public class EmployeeService {
    //调用dao层
    @Autowired
    private EmployeeMapper employeeMapper;

    /**
     * 更新员工
     * @param employee
     */
    public void updateEmp(Employee employee){
        employeeMapper.updateByPrimaryKeySelective(employee);
    }
    /**
     * 查询所有员工
     *
     * @return
     */
    public List<Employee> getAllEmps(){
        return employeeMapper.selectByExampleWithDept(null);
    }

    /**
     * 员工保存
     * @param employee
     */
    public void saveEmp(Employee employee){
        employeeMapper.insertSelective(employee);
    }

    /**
     * 检验用户名是否可用
     * count查出来不是0即为不可用。查出来是0就是可用即为true
     * @param empName
     * @return
     */
    public boolean checkEmp(String empName){
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count==0;
    }

    /**
     * 根据id查询用户并返回用户
     * @return
     */
    public Employee getEmp(Integer id){
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    /**
     * 根据员工id删除
     * @param id
     */
    public void delOneEmp(Integer id){
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void delAllEmp(List<Integer> ids){
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria= example.createCriteria();
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(example);
    }
}

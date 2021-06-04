package com.lhjitem.test;

import com.lhjitem.dao.DepartmentMapper;
import com.lhjitem.dao.EmployeeMapper;
import com.lhjitem.pojo.Department;
import com.lhjitem.pojo.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * 测试dao层是否能正常工作
 * 这里我们使用spring中的spring-test来测试，让mapper自动注入IOC容器中
 */
@RunWith(SpringJUnit4ClassRunner.class)
/*指定配置文件的位置*/
@ContextConfiguration(locations = "classpath:application.xml")
public class MapperTest {
    /*用Autowired注解直接自动注入*/
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;

    /**
     * 插入部门
     */
    @Test
    public void testAddDept(){
        departmentMapper.insertSelective(new Department(null, "男酮部门"));
        departmentMapper.insertSelective(new Department(null, "人力资源部"));
        departmentMapper.insertSelective(new Department(null, "烟酒生意部"));
        departmentMapper.insertSelective(new Department(null, "起飞部门"));
        departmentMapper.insertSelective(new Department(null, "JAVA开发部门"));
    }

    /**
     * 测试添加员工
     */
    @Test
    public void testAddEmp(){
        employeeMapper.insertSelective(new Employee(null,"张三","男","abc@qq.com",1));
        employeeMapper.insertSelective(new Employee(null,"李四","男","dfg@qq.com",2));
        employeeMapper.insertSelective(new Employee(null,"王五","男","hij@qq.com",3));
        employeeMapper.insertSelective(new Employee(null,"杨六","女","klm@qq.com",4));
        //批量添加，使用可以执行批量操作的sqlSession
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i=0; i<2; i++){
            String name = UUID.randomUUID().toString().substring(0,5)+ i;
            mapper.insertSelective(new Employee(null,name,"女",name+"@163.com",5));

        }

    }
}

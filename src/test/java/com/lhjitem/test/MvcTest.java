package com.lhjitem.test;


import com.github.pagehelper.PageInfo;
import com.lhjitem.pojo.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * 用spring-test测试提供的测试请求功能，测试crud请求的正确性
 */
@RunWith(SpringJUnit4ClassRunner.class)
/*WebAppConfiguration这个注解就是为了配置在spring中没有配置的ioc容器
*   WebApplicationContext就是在spring配置文件中没有配置的，所以采用这个方式
* */
@WebAppConfiguration
/*指定配置文件的位置*/
@ContextConfiguration(locations = {"classpath:application.xml", "classpath:springMVC.xml"})
public class MvcTest {
    //传入springMVC的ioc容器
    @Autowired
    WebApplicationContext context;
    //虚拟MVC的请求，获取到处理的结果
    MockMvc mockMvc;

    //初始化创建mockMvc
    @Before
    public void initMokMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception{
        //模拟请求拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps")
                .param("pn", "1")).andReturn();

        //请求成功以后，请求域中会有pageInfo，我们可以取出并进行验证
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码为："+pageInfo.getPageNum());
        System.out.println("总页码："+pageInfo.getPages());
        System.out.println("总记录数："+pageInfo.getTotal());
        System.out.println("在页面需要连续显示的页码");
        int[] nums = pageInfo.getNavigatepageNums();
        for(int i: nums){
            System.out.print(""+i);
        }
        //获取员工数据，因为我们一并将员工信息包装到了pageInfo
        List<Employee> list = pageInfo.getList();
        for (Employee employee : list) {
            System.out.println(employee);
        }
    }

}

package com.lhjitem.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lhjitem.pojo.Employee;
import com.lhjitem.pojo.GeneralReturnJson;
import com.lhjitem.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.filter.HttpPutFormContentFilter;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理员工CRUD操作
 */
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    /**
     * 单个删除多个删除功能二合一
     * 批量删除时每个id后面都跟着一个 -
     * @param ids
     * @return
     */
    @RequestMapping(value = "/emp/{empIds}", method = RequestMethod.DELETE)
    @ResponseBody
    public GeneralReturnJson delEmp(@PathVariable("empIds") String ids){
        //所以就判断是否带-就行了
        if(ids.contains("-")){
            List<Integer> list_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            for (String str_id : str_ids) {
                int id = Integer.parseInt(str_id);
                list_ids.add(id);
            }
            employeeService.delAllEmp(list_ids);
        }else {
            //不带-就是单个删除
            int id = Integer.parseInt(ids);
            employeeService.delOneEmp(id);
        }
        return GeneralReturnJson.success();
    }

    /**
     * 在员工编辑完成后保存员工，即为更新员工
     * rest风格下请求方式为put
     * 切记这里转入的id值的名字必须和对象属性的id值得名字相同，不然会为空
     *
     * 据我们所知，ajax中的type中是有put请求的，但如果直接发送不经过隐藏，除了id值封装在employee中
     * 其余的所有属性都是没有值的 ，但此时请求体中的所有属性都是有值的
     * 原因是：tomcat一看是用put请求就不会吧数据封装到request域中的map，而只有get或post才会封装进去
     * 解决方案是：SpringMVC中提供了一个叫做HttpPutFormContentFilter的过滤器来解决此问题
     *          原理是：将请求体中的数据重新包装成一个map，而request也被重新包装，所以就能拿到值了
     * @return
     */

    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
    @ResponseBody
    public GeneralReturnJson saveEmpAfterEdit(Employee employee){
        employeeService.updateEmp(employee);
        return GeneralReturnJson.success();
    }
    /**
     * 显示到编辑按钮中的模糊框中
     * @return
     */
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    @ResponseBody
    /*PathVariable注解是取出url路径中的关键字的值*/
    public GeneralReturnJson getEmp(@PathVariable("id") Integer id){
        Employee emp = employeeService.getEmp(id);
        return GeneralReturnJson.success().add("emp", emp);
    }

    /**
     * 检查用户名是否可用
     * @param empName
     * @return
     */
    @RequestMapping(value = "/checkEmpName" ,method = RequestMethod.GET)
    @ResponseBody
    public GeneralReturnJson checkEmpname(@RequestParam("empName") String empName){
        //进行错误信息显示的逻辑

        boolean result = employeeService.checkEmp(empName);
        if(result){
            return GeneralReturnJson.success();
        }else {
            return GeneralReturnJson.fail();
        }
    }

    //使用rest风格，post即为添加
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    /*Valid注解是标注这里要使用注解校验
    * BindingResult校验结果
    * */
    public GeneralReturnJson saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            //创建一个map，将错误信息返回给浏览器
            Map<String, Object> map = new HashMap<>();
            //如果校验失败不保存员工，在模糊框中显示后端校验失败的信息
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return GeneralReturnJson.fail().add("errorFields", map);
        }else {
            employeeService.saveEmp(employee);
            return GeneralReturnJson.success();
        }

    }

    /**
     * 以返回json的形式改写查询员工的方法，显示到展示列表中
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping(value = "/emps")
    @ResponseBody
    public GeneralReturnJson getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model){
        //为了分页查询，我们引入一个PageHelper分页插件
        //在查询之前只需要调用startPage，从第几页开始查，每页几个
        PageHelper.startPage(pn,5);
        List<Employee> employees = employeeService.getAllEmps();
        //查询完后pageInfo来包装查询后的结果（封装了详细的分页信息，包括我们查询出来的数据）
        // 只需要把这个pageInfo给页面后就不需要在关心什么了
        //传入连续显示的页数
        PageInfo page = new PageInfo(employees,5);
        //直接return
        return GeneralReturnJson.success().add("pageInfo", page);
    }
    /**
     * 查询员工信息（分页查询）
     * pn是pageNumber
     * @return
     *//*
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
    }*/
}

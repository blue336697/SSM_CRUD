package com.lhjitem.pojo;

import javax.validation.constraints.Pattern;

public class Employee {
    private Integer empId;

    /*这里之所以要用正则表达式校验，是因为我们前端也使用了十分复杂的校验规则，要做到统一规则
    *   所以在这里要用Pattern来自定义
    *   切记java代码中的正则表达式没有/
    *   还有在这里其实idea帮我们做了转义工作，在js中的正则表达式中转义字符是一个\，但在这个需要将一个\变成两个\\
    *   原因是\在这里拥有了二义性
    * */
    @Pattern(regexp = "(^[\\\\u4e00-\\\\u9fa5a-zA-Z][\\\\u4e00-\\\\u9fa5a-zA-Z]+$)|(^[\u2E80-\u9FFF]{2,5})"
            , message = "用户名首字母为中英文，至少两个字符")
    private String empName;

    private String gender;

    @Pattern(regexp = "^([a-zA-Z0-9]+[_|_|\\-|.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$")
    private String email;

    private Integer dId;

    private Department department;

    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", dId=" + dId +
                ", department=" + department +
                '}';
    }

    public Employee() {
    }

    public Employee(Integer empId, String empName, String gender, String email, Integer dId) {
        this.empId = empId;
        this.empName = empName;
        this.gender = gender;
        this.email = email;
        this.dId = dId;
    }

    //希望查询员工的同时部门信息也是查询好的
    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}
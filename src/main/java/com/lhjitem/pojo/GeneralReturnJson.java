package com.lhjitem.pojo;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的返回的类
 */
public class GeneralReturnJson {
    //代表状态码,例如自己指定100等于成功，200等于失败
    private int code;
    //提示错误信息
    private String msg;

    //用户要返回给浏览器的数据
    private Map<String, Object> extend = new HashMap<>();

    //定义成功返回信息
    public static GeneralReturnJson success(){
        GeneralReturnJson result = new GeneralReturnJson();
        //这里我们用3697代表成功
        result.setCode(3697);
        result.setMsg("处理成功！");
        return result;
    }

    //定义失败返回信息
    public static GeneralReturnJson fail(){
        GeneralReturnJson result = new GeneralReturnJson();
        //这里我们用627代表失败
        result.setCode(627);
        result.setMsg("处理失败！");
        return result;
    }
    //定义添加用户数据的add方法
    public GeneralReturnJson add(String key, Object value){
            this.getExtend().put(key,value);
            return this;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}

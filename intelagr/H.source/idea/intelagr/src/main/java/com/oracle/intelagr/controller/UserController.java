package com.oracle.intelagr.controller;

import com.oracle.intelagr.common.*;
import com.oracle.intelagr.entity.Function;
import com.oracle.intelagr.entity.Role;
import com.oracle.intelagr.entity.User;
import com.oracle.intelagr.service.IRoleService;
import com.oracle.intelagr.service.IUserService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.security.auth.Subject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private IUserService userService;
    @Autowired
    private IRoleService roleService;
    @RequestMapping("/login")
    @ResponseBody
    public JsonResult login(@RequestBody User user,HttpServletRequest request){

        List<User> list = userService.login(user);
        if(list.size()>0){
            if("02".equals(list.get(0).getLoginStatus())){
                return new JsonResult(false,"当前用户已被禁用");
            }
            //任何的Ajax响应 传回json格式的数据   统一格式
            //status:200 成功   status:0 失败
            //返回的提示消息 存在msg
            //返回的数据 (是对象、集合、)  存在data的key的value中
            //{status:200,msg:"提示内容",data:{}}
            //@ResponseBody 将对象  拼成json格式的字符串  其中的key是对象的属性名
            HttpSession session = request.getSession();
            session.setAttribute("user", list.get(0));
            return new JsonResult(true);
        }
        return new JsonResult(false,"用户名密码不正确");
    }
    @RequestMapping("/main")
    public String main(Map map,HttpServletRequest request){
        //角色权限的分配
        HttpSession session = request.getSession();
        User user= (User)session.getAttribute("user");
        List<Map> list = userService.getFunction(user.getUserID());
        map.put("menuList",list);
        return "/main";
    }
    @RequestMapping("/list")
    public String list(Map map, User user, PageModel pageModel){
        Map<String,Object> m = new HashMap<String,Object>();
        m.put("userID",user.getUserID());
        m.put("userName",user.getUserName());
        m.put("userType",user.getUserType());
        pageModel.setData(m);
        userService.queryForPage(pageModel);
        pageModel.setData(user);
        map.put("pageModel",pageModel);
        return "/user/userList";
    }
    @RequestMapping("/delete")
    @ResponseBody
    public JsonResult delete(@RequestBody String[] ids){
        /*String[] userIds = new String[ids.size()];
        ids.toArray(userIds);*/
        userService.delete(ids);
        return new JsonResult(true);
    }
    @RequestMapping("/add")
    public String add(Map map){
        //查询出所有的角色
        List<Role> list = roleService.selectAll();
        //角色拼成json格式的字符串，发送到页面上，格式为[{roleCode:100,roleName:"管理员"},{roleCode:101,roleName:"农业局"}]
        //java 对json的拼写和解析 利用json的工具jar包
        JSONArray array = new JSONArray();
        for(Role role:list){
            JSONObject obj = new JSONObject();
            obj.put("roleCode",role.getRoleCode());
            obj.put("roleName",role.getRoleName());
            array.add(obj);
        }
        map.put("roleList",array.toString());
        return "/user/addUser";
    }
    @RequestMapping("/save")
    @ResponseBody
    public JsonResult save(User user,String role,HttpServletRequest request){

        //将role参数中的数据整理到user的roles集合中
        if(role!=null){
            String[] roles = role.split(",");
            List<Role> list = new ArrayList<Role>();
            for(String s:roles){
                Role r = new Role();
                r.setRoleCode(s);
                list.add(r);
            }
            user.setRoles(list);
            //填充user的创建人，创建时间，修改人，修改时间
            BaseModel baseModel = CommonUtil.getBaseModel(request);
            user.setCreateUserId(baseModel.getCreateUserId());
            user.setCreateDate(baseModel.getCreateDate());
            user.setUpdateDate(baseModel.getUpdateDate());
            user.setUpdateUserId(baseModel.getUpdateUserId());
            userService.save(user);
        }
        return new JsonResult(true);
    }
    @RequestMapping("/edit")
    public String edit(String userID,Map map){
        User user = userService.selectById(userID);
        map.put("user",user);
        return "/user/basicInfoEdit";
    }
    @RequestMapping("/update")
    @ResponseBody
    public JsonResult update(User user,HttpServletRequest request){
        BaseModel baseModel = CommonUtil.getBaseModel(request);
        user.setUpdateDate(baseModel.getUpdateDate());
        user.setUpdateUserId(baseModel.getUpdateUserId());
        userService.update(user);
        return new JsonResult(true);
    }
    @RequestMapping("/resetPwdInit")
    public String resetPwdInit(String userID,Map map){
        User user = userService.selectById(userID);
        map.put("user",user);
        return "/user/editPass";
    }
    @RequestMapping("/resetPwd")
    @ResponseBody
    public JsonResult resetPwd(User user,HttpServletRequest request){
        User u = userService.selectById(user.getUserID());
        u.setPassword(MD5Util.getMD5Code(user.getPassword()));
        BaseModel baseModel = CommonUtil.getBaseModel(request);
        u.setUpdateDate(baseModel.getUpdateDate());
        u.setUpdateUserId(baseModel.getUpdateUserId());
        userService.update(u);
        return new JsonResult(true);
    }
    @RequestMapping("/startUse")
    @ResponseBody
    public JsonResult startUse(String userID,HttpServletRequest request){
        User u = userService.selectById(userID);
        if("01".equals(u.getLoginStatus())){
            return new JsonResult(false,"用户已经启动");
        }
        u.setLoginStatus("01");
        BaseModel baseModel = CommonUtil.getBaseModel(request);
        u.setUpdateDate(baseModel.getUpdateDate());
        u.setUpdateUserId(baseModel.getUpdateUserId());
        userService.update(u);
        return new JsonResult(true);
    }
    @RequestMapping("/endUse")
    @ResponseBody
    public JsonResult endUse(String userID,HttpServletRequest request){
        User u = userService.selectById(userID);
        if("02".equals(u.getLoginStatus())){
            return new JsonResult(false,"用户已经禁用");
        }
        u.setLoginStatus("02");
        BaseModel baseModel = CommonUtil.getBaseModel(request);
        u.setUpdateDate(baseModel.getUpdateDate());
        u.setUpdateUserId(baseModel.getUpdateUserId());
        userService.update(u);
        return new JsonResult(true);
    }
}

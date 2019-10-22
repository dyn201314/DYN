package com.oracle.intelagr.controller;

import com.oracle.intelagr.common.*;
import com.oracle.intelagr.entity.Function;
import com.oracle.intelagr.entity.Role;
import com.oracle.intelagr.entity.RoleFunction;
import com.oracle.intelagr.entity.User;
import com.oracle.intelagr.service.IFunctionService;
import com.oracle.intelagr.service.IRoleFunctionService;
import com.oracle.intelagr.service.IRoleService;
import com.oracle.intelagr.service.IUserService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;
    @Autowired
    private IFunctionService functionService;
    @Autowired
    private IRoleFunctionService roleFunctionService;
    @RequestMapping("/list")
    public String list(Map map, Role role, PageModel pageModel){
        Map<String,Object> m = new HashMap<String,Object>();
        m.put("roleCode",role.getRoleCode());
        m.put("roleName",role.getRoleName());
        pageModel.setData(m);
        roleService.queryForPage(pageModel);
        pageModel.setData(role);
        map.put("pageModel",pageModel);
        return "/role/roleList";
    }
    @RequestMapping("/delete")
    @ResponseBody
    public JsonResult delete(@RequestBody String[] ids){
        int[] roleids = new int[ids.length];
        for(int i = 0;i<roleids.length;i++){
            roleids[i]=Integer.parseInt(ids[i]);
        }
        roleService.delete(roleids);
        return new JsonResult(true);
    }
    @RequestMapping("/add")
    public String add(Map map){
        return "/role/addRole";
    }
    @RequestMapping("/save")
    @ResponseBody
    public JsonResult save(Role role,HttpServletRequest request){
        BaseModel baseModel = CommonUtil.getBaseModel(request);
        role.setCreateUserId(baseModel.getCreateUserId());
        role.setCreateDate(baseModel.getCreateDate());
        role.setUpdateDate(baseModel.getUpdateDate());
        role.setUpdateUserId(baseModel.getUpdateUserId());
        roleService.save(role);

        return new JsonResult(true);
    }
    @RequestMapping("/edit")
    public String edit(String roleId,Map map){
        Role role = roleService.queryById(Integer.parseInt(roleId));
        map.put("role",role);
        return "/role/editRole";
    }
    @RequestMapping("/update")
    @ResponseBody
    public JsonResult update(Role role,HttpServletRequest request){
        BaseModel baseModel = CommonUtil.getBaseModel(request);
        role.setUpdateDate(baseModel.getUpdateDate());
        role.setUpdateUserId(baseModel.getUpdateUserId());
        roleService.update(role);
        return new JsonResult(true);
    }
    @RequestMapping("/roleAuth")
    public String roleAuth(int id,Map m){
        Role role = roleService.queryById(id);
        m.put("role",role);
        //找出所有的权限
        List<Function> funList = functionService.selectAll();
        //找出这个角色具有的权限
        Map mp = new HashMap();
        mp.put("roleCode",role.getRoleCode());
        List<RoleFunction> roleFunctionList = roleFunctionService.query(mp);
        //一级菜单和二级菜单的集合
        List<Map> list = new ArrayList<Map>();
        Map moduleMap = new HashMap();
        for(Function function:funList){
            if(function.getModuleCode()!=null){
                    if(moduleMap.get(function.getModuleCode())==null){
                        Map map = new HashMap();
                        list.add(map);
                        moduleMap.put(function.getModuleCode(),map);
                        map.put("parent",function);
                        List<Function> childList = new ArrayList<Function>();
                        childList.add(function);
                        map.put("child",childList);
                    }else{
                        Map map = (Map)moduleMap.get(function.getModuleCode());
                        List<Function> childList = (List<Function>)map.get("child");
                        childList.add(function);
                    }
                }
        }
        //将上面的List<Map>集合整理为
        //[{id:1,pid:0,text:"我的控制台",children:[
        //		{id:2,pid:1,text:"代办事项"},
        //		{id:3,pid:1,text:"个人信息"},
        //		{id:4,pid:1,text:"修改密码"}
        //	]}]  json数据

        // 整理为TreeModel的形式 在将TreeModel对象 转为 json数据

        // 序列化  将对象转为byte[]  过程
        // 序列化  将对象转为 json格式
        JSONArray array = new JSONArray();
        for(Map map:list){
            //就是一级菜单的json
           TreeModel model = new TreeModel();
           Function parent = (Function)map.get("parent");
           model.setId(String.valueOf(parent.getModuleCode()));
           model.setText(parent.getModuleName());
           //构建一级菜单中子菜单的json
           List<Function> chilren = (List<Function>)map.get("child");
           for(Function fun:chilren){
               TreeModel child = new TreeModel();
               child.setId(String.valueOf(fun.getFunctionCode()));
               child.setText(fun.getFunctionName());
               for(RoleFunction roleFunction :roleFunctionList){
                   if(roleFunction.getFunctionCode().equals(fun.getFunctionCode())){
                       child.setChecked("true");
                       break;
                   }
               }
               model.getChildren().add(child);
           }
           array.add(model);
        }


        //拼json [{一级菜单}]
        m.put("jsonData",array.toString());
        return "/role/roleAuth";
    }
    @RequestMapping("/saveRoleAuth")
    @ResponseBody
    public JsonResult saveRoleAuth(String roleCode,HttpServletRequest request){
        String[] funCodes = request.getParameterValues("funIds[]");
        //向rolefunctionmap表保存（删除表中该角色的权限，在添加）
        User user = (User)request.getSession().getAttribute("user");
        roleService.saveRoleAuth(roleCode,funCodes,user);
        return new JsonResult(true);
    }
}

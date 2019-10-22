package com.oracle.intelagr.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.intelagr.common.JsonResult;
import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.common.TreeModel;
import com.oracle.intelagr.entity.Function;
import com.oracle.intelagr.entity.Role;
import com.oracle.intelagr.entity.RoleFunction;
import com.oracle.intelagr.entity.User;
import com.oracle.intelagr.service.IFunctionService;
import com.oracle.intelagr.service.IRoleFunctionService;
import com.oracle.intelagr.service.IRoleService;

import net.sf.json.JSONArray;

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
	public String list(Role role,PageModel pageModel,Model model) {
		pageModel.setData(role);
		roleService.queryForPage(pageModel);
		model.addAttribute("pageModel", pageModel);
		return "/role/roleList";
	}
	@RequestMapping("/roleAuth")
	public String roleAuth(int id,Model model) {
		//找出传来id 的角色对象
		Role role = roleService.queryById(id);
		//查询全部菜单      List<Function>
		List<Function> funList = functionService.selectAll();
		//查询出拥有的菜单 List<RoleFunction>
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("roleCode", role.getRoleCode());
		List<RoleFunction> hasFunList = roleFunctionService.query(map);
		//将functionCode整理在map集合中，后面要查找循环的functionCode在Map中是否存在
		Map<String,String> hasFunMap = new HashMap<String,String>();
		for(RoleFunction rf:hasFunList) {
			hasFunMap.put(rf.getFunctionCode(), "1");
		}
		//所有的父菜单Map  key:moduleCode   value:moduleName
		Map<String,String> parentMap = new HashMap<String,String>();
		//子菜单的Map  key:moduleCode   value:moduleCode对应所有的Function的集合
		Map<String,List<Function>> childMap = new HashMap<String,List<Function>>();
		//Map 过滤数据 存储数据的功能
		Map moduleMap = new HashMap();
		// key: moduleCode   value : childMap
		// 如果循环的moduleCode在这个Map中不存在  ：向parentMap和childMap分别添加key-value
		// 如果循环的moduleCode在这个Map中存在：将循环的Function向chileMap中对应的List添加
		for(Function fun:funList) {
			if(moduleMap.get(fun.getModuleCode())==null) {
				parentMap.put(fun.getModuleCode(), fun.getModuleName());
				List<Function> functionList = new ArrayList<Function>();
				functionList.add(fun);
				childMap.put(fun.getModuleCode(), functionList);
				moduleMap.put(fun.getModuleCode(), childMap);
			}else {
				Map<String,List<Function>> m = (Map<String,List<Function>>)moduleMap.get(fun.getModuleCode());
				m.get(fun.getModuleCode()).add(fun);
			}
		}
		JSONArray jsonArr = new JSONArray();
		for(String moduleCode :parentMap.keySet()) {
			TreeModel parent = new TreeModel();
			parent.setId(moduleCode);
			parent.setText(parentMap.get(moduleCode));
			List children = new ArrayList<TreeModel>();
			for(Function fun:childMap.get(moduleCode)) {
				TreeModel child = new TreeModel();
				child.setId(fun.getFunctionCode());
				child.setText(fun.getFunctionName());
				//子菜单Function对象 在已存在的hasFunList中是否存在
				if(hasFunMap.get(fun.getFunctionCode())!=null) {
					child.setChecked("true");
				}
				children.add(child);
			}
			parent.setChildren(children);
			jsonArr.add(parent);
		}
		model.addAttribute("role", role);
		model.addAttribute("jsonData",jsonArr.toString());
		return "/role/roleAuth";
	}
	@RequestMapping("/saveRoleAuth")
	@ResponseBody
	public JsonResult saveRoleAuth(HttpServletRequest request) {

		String roleCode = request.getParameter("roleCode");
		String[] funIds = request.getParameterValues("funIds[]");
		User user = (User)request.getSession().getAttribute("user");
		roleService.saveRoleAuth(roleCode, funIds,user);
		return new JsonResult(true);
	}
	@RequestMapping("/add")
	public String add() {
		return "/role/addRole";
	}
	@RequestMapping("/save")
	@ResponseBody
	public JsonResult save(Role role,HttpServletRequest request) {
		HttpSession session = request.getSession();
		role.setCreateUserId(((User)session.getAttribute("user")).getUserID());
		role.setUpdateUserId(((User)session.getAttribute("user")).getUserID());
		role.setCreateDate(new Date());
		role.setUpdateDate(new Date());
		roleService.save(role);
		return new JsonResult(true);
	}
	@RequestMapping("/update")
	@ResponseBody
	public JsonResult update(Role role,HttpServletRequest request) {
		HttpSession session = request.getSession();
		role.setUpdateUserId(((User)session.getAttribute("user")).getUserID());
		role.setUpdateDate(new Date());
		roleService.update(role);
		return new JsonResult(true);
	}
	@RequestMapping("/edit")
	public String edit(int id,Model model) {
		Role role = roleService.queryById(id);
		model.addAttribute("role",role);
		return "/user/basicInfoEdit";
	}
	@RequestMapping("/delete")
	@ResponseBody
	public JsonResult delete(int id) {
		//roleService.delete(id);
		return new JsonResult(true);
	}
}

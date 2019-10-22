package com.oracle.intelagr.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.intelagr.common.Constants;
import com.oracle.intelagr.common.JsonResult;
import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.entity.Role;
import com.oracle.intelagr.entity.User;
import com.oracle.intelagr.service.IRoleService;
import com.oracle.intelagr.service.IServialNumService;
import com.oracle.intelagr.service.IUserService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IRoleService roleService;
	@RequestMapping("/login")
	@ResponseBody
	public JsonResult login(User user,HttpServletRequest request) {
		List<User> userList = userService.login(user);
		if(userList.size()>0) {
			HttpSession session = request.getSession();
			User u = userList.get(0);
			if("01".equals(u.getLoginStatus())) {
				session.setAttribute("user", userList.get(0));
				return new JsonResult(true);
			}else {
				return new JsonResult(false, "账号不可用");
			}			
		}else {
			return new JsonResult(false, "用户名或密码错误");
		}
	}
	@RequestMapping("/main")
	public String main(HttpServletRequest request,Model model) {
		//调用Service获得当前登录用户的权限
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		List<Map> menuList = userService.getFunction(user.getUserID());
		model.addAttribute("menuList", menuList);
		return "/main";
	}
	@RequestMapping("/list")
	public String list(User user,PageModel pageModel,Model model) {
		pageModel.setData(user);
		userService.queryForPage(pageModel);
		model.addAttribute("pageModel", pageModel);
		return "/user/userList";
	}
	@RequestMapping("/add")
	public String add(Model model) {
		//查询所有的角色 将角色拼成json
		List<Role> roleList = roleService.selectAll();
		//由于要跳转，而且将json传到jsp
		//拼json
		//JSONArray
		JSONArray arr = new JSONArray();
		for(Role r:roleList) {
			arr.add(r);
		}
		model.addAttribute("roleList", arr.toString());
		return "/user/addUser";
	}
	@RequestMapping("/save")
	@ResponseBody
	public JsonResult save(User user,HttpServletRequest request,String role) {
		//查询用户名是否存在
		User u = userService.selectById(user.getUserID());
		if(u!=null) {
			return new JsonResult(false, "用户名已存在");
		}
		//整理数据  创建User对象  构建User对象中的roles
		HttpSession session = request.getSession();
		user.setCreateUserId(((User)session.getAttribute("user")).getUserID());
		user.setUpdateUserId(((User)session.getAttribute("user")).getUserID());
		user.setCreateDate(new Date());
		user.setUpdateDate(new Date());
		String[] roleCodes = role.split(",");
		List<Role> roleList = new ArrayList<Role>();
		for(String roleCode:roleCodes) {
			Role r = new Role();
			r.setRoleCode(roleCode);
			roleList.add(r);
		}
		user.setRoles(roleList);
		//保存
		userService.save(user);
		return new JsonResult(true);
	}
	@RequestMapping("/update")
	@ResponseBody
	public JsonResult update(User user,HttpServletRequest request,String role) {
		//查询用户名是否存在
		/*User u = userService.selectById(user.getUserID());
		if(u!=null) {
			return new JsonResult(false, "用户名已存在");
		}*/
		//整理数据  创建User对象  构建User对象中的roles
		HttpSession session = request.getSession();
		user.setUpdateUserId(((User)session.getAttribute("user")).getUserID());
		user.setUpdateDate(new Date());
/*		String[] roleCodes = role.split(",");
		List<Role> roleList = new ArrayList<Role>();
		for(String roleCode:roleCodes) {
			Role r = new Role();
			r.setRoleCode(roleCode);
			roleList.add(r);
		}
		user.setRoles(roleList);*/
		//保存
		userService.update(user);
		return new JsonResult(true);
	}
	@RequestMapping("/edit")
	public String edit(String userID,Model model) {
		User user = userService.selectById(userID);
		model.addAttribute("user",user);
		return "/user/basicInfoEdit";
	}
	@RequestMapping("/delete")
	@ResponseBody
	public JsonResult delete(String userID) {
		userService.delete(userID);
		return new JsonResult(true);
	}
	@RequestMapping("/resetPwdInit")
	public String resetPwdInit(String userID,Model model) {
		model.addAttribute("userID",userID);
		return "/user/editPass";
	}
	@RequestMapping("/resetPwd")
	@ResponseBody
	public JsonResult resetPwd(String userID,String password) {
		userService.resetPwd(userID, password);
		return new JsonResult(true);
	}
	@RequestMapping("/startUse")
	@ResponseBody
	public JsonResult startUse(String userID) {
		userService.startUse(userID);
		return new JsonResult(true);
	}
	@RequestMapping("/endUse")
	@ResponseBody
	public JsonResult endUse(String userID) {
		userService.endUse(userID);
		return new JsonResult(true);
	}
}

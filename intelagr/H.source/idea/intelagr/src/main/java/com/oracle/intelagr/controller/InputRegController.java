package com.oracle.intelagr.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.intelagr.common.CommonUtil;
import com.oracle.intelagr.common.JsonResult;
import com.oracle.intelagr.entity.InputReg;
import com.oracle.intelagr.entity.User;
import com.oracle.intelagr.service.IFileManagerService;
import com.oracle.intelagr.service.IInputRegService;


@Controller
@RequestMapping("/inputReg")
public class InputRegController {
	@Autowired
	private IInputRegService inputRegService;
	@Autowired
	private IFileManagerService fileManagerService;
	@RequestMapping("/editInput")
	public String editInput(){
		return "/inputreg/inputRegEdit";
	}
	@RequestMapping("/save")
	@ResponseBody
	public JsonResult save(@RequestBody InputReg inputReg,HttpServletRequest request) {		
		HttpSession session = request.getSession();
		inputReg.setCreateDate(new Date());
		inputReg.setCreateUserId(((User)session.getAttribute("user")).getUserID());
		inputReg.setUpdateDate(new Date());
		inputReg.setUpdateUserId(((User)session.getAttribute("user")).getUserID());
		inputRegService.save(inputReg);
		CommonUtil.saveMfile(fileManagerService, "02", String.valueOf(inputReg.getId()), request);
		return new JsonResult(true);
	}
}

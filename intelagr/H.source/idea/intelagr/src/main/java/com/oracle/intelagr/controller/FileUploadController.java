package com.oracle.intelagr.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.intelagr.common.CommonUtil;
import com.oracle.intelagr.common.JsonResult;
import com.oracle.intelagr.common.MfileModel;
import com.oracle.intelagr.common.StringUtil;
import com.oracle.intelagr.common.UploadStatusModel;
import com.oracle.intelagr.entity.Mfile;
import com.oracle.intelagr.service.IFileManagerService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/file")
public class FileUploadController {
	private static final Logger log = LoggerFactory.getLogger(FileUploadController.class);

	@Autowired
	private IFileManagerService fileManagerService;
	
	@RequestMapping("/uploadInit")
	public String uploadInit(Model model, String bizType, String uploadDlgId, HttpServletRequest request) {
		System.out.println("------------controller--------------"+bizType+"---"+uploadDlgId);
		if(StringUtil.isNullOrEmpty(uploadDlgId)){
			uploadDlgId = "uploadDialog";
		}
		model.addAttribute("bizType", bizType);
		model.addAttribute("uploadDlgId", uploadDlgId);
		return "/fileupload/upload";
	}

	@RequestMapping("/upload")
	@ResponseBody
	public JsonResult upload(@RequestParam(value = "file") MultipartFile apkFile, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String bizType = request.getParameter("bizType");
		String fileInfo = request.getParameter("fileInfo");	
		MultipartFile file = apkFile;
		String originameName = file.getOriginalFilename();
		//if(originameName == null  || originameName.equals("")) continue;
		int index = originameName.lastIndexOf(".");
		String extName = originameName.substring(index+1);
		
		Date date = new Date();
		String newName = CommonUtil.getUUID() + "." + extName;
		String rootPath = request.getSession().getServletContext().getRealPath("/uploadtmp/");
		rootPath += "\\" + newName;
		FileUtils.writeByteArrayToFile(new File(rootPath), file.getBytes());
		
		MfileModel mfileModel = new MfileModel();
		mfileModel.setFilePath(newName);
		mfileModel.setFileInfo(fileInfo);
		mfileModel.setOriginalName(originameName);
		
		List<MfileModel> list;
		HttpSession session = request.getSession();
		Object obj = session.getAttribute(bizType+"fileList");
		if(obj == null) list = new ArrayList();
		else list = (List<MfileModel>)obj;
		list.add(mfileModel);
		session.setAttribute(bizType+"fileList", list);
		
		JsonResult jr = new JsonResult(true);
		response.setContentType("text/html");
		JSONObject json = JSONObject.fromObject(jr);
		response.getWriter().write(json.toString());
		
		return null;
	}
	
	//取上传的文件列表
	@RequestMapping("/fileList")
	@ResponseBody
	public void fileList(HttpServletRequest request, HttpServletResponse response, String bizType, String bizCode, String getTmpFlag) throws IOException {
		if( getTmpFlag == null ) getTmpFlag = "1";
		
		if(StringUtil.isNullOrEmpty(bizType)) return ;
		List<Mfile> list = new ArrayList<Mfile>();
		
		//取已经保存过的
		if(StringUtils.isNotEmpty( bizCode )){
			List<Mfile> mfileList = this.fileManagerService.getFileList(bizType, bizCode);
			if(mfileList != null) list.addAll(mfileList);
		}
		
		//如果需要取上传的临时文件 getTmpFlag字段传1
		if(!StringUtil.isNullOrEmpty(getTmpFlag) && getTmpFlag.equals("1")){
			HttpSession session = request.getSession();
			Object obj = session.getAttribute(bizType+"fileList");
			if(obj != null) {
				List<MfileModel> modelList = (List<MfileModel>)obj;
				for(int i=0; i< modelList.size(); i++){
					MfileModel model = modelList.get(i);
					Mfile mfile = new Mfile();
					mfile.setBizCode("");
					mfile.setBizType(bizType);
					mfile.setOriginalName(model.getOriginalName());
					mfile.setFilePath(model.getFilePath());
					mfile.setFileInfo(model.getFileInfo());
					mfile.setFileType(model.getFileType());
					list.add(mfile);
				}
			}
		}
		
		JsonResult jr = new JsonResult(true);
		jr.setData(list);
		response.setContentType("text/html");
		JSONObject json = JSONObject.fromObject(jr);
		response.getWriter().write(json.toString());
	}
	
	@RequestMapping("/getTmpFile")
	@ResponseBody
	public void getTmpFile(HttpServletRequest request, HttpServletResponse response, String bizType) throws IOException
	{
		HttpSession session = request.getSession();
		List list;
		Object obj = session.getAttribute(bizType+"fileList");
		if(obj == null) list = new ArrayList();
		else list = (List<MfileModel>)obj;
		JsonResult jr = new JsonResult(true);
		jr.setData(list);
		
		response.setContentType("text/html");
		JSONObject json = JSONObject.fromObject(jr);
		response.getWriter().write(json.toString());
	}
	
	@RequestMapping("/deleteFile")
	@ResponseBody
	public JsonResult delete(HttpServletRequest request, String filePath, String bizType, String bizCode)
	{
		JsonResult jr = new JsonResult(true);
		if(StringUtil.isNullOrEmpty(bizCode)){ //临时文件
			String rootPath = request.getSession().getServletContext().getRealPath("/uploadtmp/") ;
			rootPath += "/" + filePath;
			File file = new File(rootPath);
			if(file.isFile() && file.exists()){
				file.delete();
			}
			HttpSession session = request.getSession();
			Object obj = session.getAttribute(bizType+"fileList");
			if(obj != null){
				List list = (List)obj;
				Iterator<MfileModel> iter = list.iterator();  
				while(iter.hasNext())  
				{
					MfileModel model =  (MfileModel)iter.next();
					if(model.getFilePath().equals(filePath)){
						iter.remove();
						break;
					}
				}
			}
		}else{
			//已经存储
			this.fileManagerService.deleteFile(bizType, bizCode, filePath);
		}
		return jr;
	}
	
	@RequestMapping("/addVideo")
	@ResponseBody
	public JsonResult addVideo(HttpServletRequest request, String filePath, String fileInfo, String bizType, String bizCode)
	{
		boolean canAdd = true;
		if(!StringUtil.isNullOrEmpty(bizCode)){
			Mfile mfile = this.fileManagerService.getFile(bizType, bizCode, filePath);
			if(mfile != null) canAdd =false; 
		}
		if(!canAdd){
			 return new JsonResult(false, "该视频已经添加！");
		}
		
		List<MfileModel> list;
		HttpSession session = request.getSession();
		Object obj = session.getAttribute(bizType+"fileList");
		if(obj == null) list = new ArrayList();
		else list = (List<MfileModel>)obj;
		
		Iterator<MfileModel> iter = list.iterator();  
		while(iter.hasNext())  
		{
			MfileModel model =  (MfileModel)iter.next();
			if(model.getFilePath().equals(filePath)){
				canAdd =false; 
				break;
			}
		}
		if(!canAdd){
			 return new JsonResult(false, "该视频已经添加！");
		}
		
		MfileModel mfileModel = new MfileModel();
		mfileModel.setFilePath(filePath);
		mfileModel.setFileInfo(fileInfo);
		mfileModel.setOriginalName("");
		mfileModel.setFileType("02");
		list.add(mfileModel);
		session.setAttribute(bizType+"fileList", list);
		return new JsonResult(true);
	}
	
	@RequestMapping("/deleteVideoFile")
	@ResponseBody
	public JsonResult deleteVideoFile(HttpServletRequest request, String filePath, String fileInfo, String bizType, String bizCode)
	{
		JsonResult jr = new JsonResult(true);
		if(StringUtil.isNullOrEmpty(bizCode)){ //临时文件
			HttpSession session = request.getSession();
			Object obj = session.getAttribute(bizType+"fileList");
			if(obj != null){
				List list = (List)obj;
				Iterator<MfileModel> iter = list.iterator();  
				while(iter.hasNext())  
				{
					MfileModel model =  (MfileModel)iter.next();
					if(model.getFileType().equals("02") && model.getFilePath().equals(filePath)
							&& model.getFileInfo().equals(fileInfo)){
						iter.remove();
						break;
					}
				}
			}
		}else{
			this.fileManagerService.deleteFile(bizType, bizCode, filePath);
		}
		return jr;
	}
	
	@RequestMapping("/getUploadStatus")
	@ResponseBody
	public JsonResult getUploadStatus(HttpServletRequest request)
	{
		double percent = 0.0;
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("status");
		if(obj != null){
			UploadStatusModel statusModel = (UploadStatusModel)obj;
			percent = statusModel.getPercent();
		}
		JsonResult jr = new JsonResult(true);
		jr.setData(percent);
		return jr;
	}
}

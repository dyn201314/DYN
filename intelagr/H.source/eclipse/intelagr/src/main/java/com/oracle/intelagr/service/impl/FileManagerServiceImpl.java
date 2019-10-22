package com.oracle.intelagr.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.intelagr.common.MfileModel;
import com.oracle.intelagr.common.POVOConvertUtil;
import com.oracle.intelagr.entity.Mfile;
import com.oracle.intelagr.mapper.FileMapper;
import com.oracle.intelagr.service.IFileManagerService;



@Service
@Transactional
public class FileManagerServiceImpl implements  IFileManagerService
{
	private static final Logger log = LoggerFactory.getLogger(FileManagerServiceImpl.class);
	
	@Autowired
	protected FileMapper fileMapper;
  
	public void save(Mfile mfile)
	{
		this.fileMapper.insert(mfile);
	}
	
	public List<Mfile> getFileList(String bizType, String bizCode){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("bizType", bizType);
		map.put("bizCode", bizCode);
		return this.fileMapper.select(map);
	}

	@Override
	public void save(MfileModel mfileModel) {
		try{
			Mfile Mfile = null;
			if(mfileModel.getId() == null){
				Mfile = (Mfile) POVOConvertUtil.convert(mfileModel, "com.bicsoft.sy.entity.Mfile");
				this.fileMapper.insert(Mfile);
			}else{
			}
			this.fileMapper.update(Mfile);
		}
		catch (Exception e) {
			e.printStackTrace();
			log.error("UserService saveObject ServiceException:", e);
		}
	}
	
	public void deleteFile(String bizType, String bizCode, String filePath){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("bizType", bizType);
		map.put("bizCode", bizCode);
		map.put("filePath", filePath);
		List<Mfile> list = fileMapper.select(map);
		if(list.size()>0) {
		Mfile mfile = list.get(0);
		if(mfile != null){
			mfile.setDeleteFlag("Y");
			mfile.setUpdateDate(new Date());
			this.fileMapper.update(mfile);
		}
		}
	}
	
	public Mfile getFile(String bizType, String bizCode, String filePath){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("bizType", bizType);
		map.put("bizCode", bizCode);
		map.put("filePath", filePath);
		List<Mfile> list = fileMapper.select(map);
		if(list.size()>0) {
			return list.get(0);
		}
		return new Mfile();
	}
}

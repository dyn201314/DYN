package com.oracle.intelagr.service;

import java.util.List;

import com.oracle.intelagr.common.MfileModel;
import com.oracle.intelagr.entity.Mfile;

public interface IFileManagerService {
	public void save(Mfile mfile);
	
	public List<Mfile> getFileList(String bizType, String bizCode);

	public void save(MfileModel mfileModel);
	
	public void deleteFile(String bizType, String bizCode, String filePath);
	
	public Mfile getFile(String bizType, String bizCode, String filePath);
}

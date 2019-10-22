package com.oracle.intelagr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.intelagr.common.Constants;
import com.oracle.intelagr.common.DateTimeUtil;
import com.oracle.intelagr.entity.ServialNum;
import com.oracle.intelagr.mapper.ServialNumMapper;
import com.oracle.intelagr.service.IServialNumService;
@Service
public class ServialNumService implements IServialNumService{
	@Autowired
	private ServialNumMapper servailNumMapper;
	@Override
	public String getServialNum(String type) {
		List<ServialNum> list = servailNumMapper.select();
		ServialNum servialNum = list.get(0);
		ServialNum updateServialNum = new ServialNum();
		updateServialNum.setId(1);
		String result = "";
		if(list.size()>0) {
			if(Constants.BIZ_TYPE_BG.equals(type)) {				
				result = Constants.BIZ_TYPE_BG+DateTimeUtil.getCurrentDateByPattern("yyyyMMdd")+getNum(list.get(0).getBgNo());
				updateServialNum.setBgNo(servialNum.getBgNo()+1);
				servailNumMapper.update(updateServialNum);
			}else if(Constants.BIZ_TYPE_PT.equals(type)) {
				result = Constants.BIZ_TYPE_PT+DateTimeUtil.getCurrentDateByPattern("yyyyMMdd")+getNum(list.get(0).getpTNo());
				updateServialNum.setpTNo(servialNum.getpTNo()+1);
				servailNumMapper.update(updateServialNum);
			}else if(Constants.BIZ_TYPE_SL.equals(type)) {
				result = Constants.BIZ_TYPE_SL+DateTimeUtil.getCurrentDateByPattern("yyyyMMdd")+getNum(list.get(0).getsLNo());
				updateServialNum.setsLNo(servialNum.getsLNo()+1);
				servailNumMapper.update(updateServialNum);
			}else if(Constants.BIZ_TYPE_TR.equals(type)) {
				result = Constants.BIZ_TYPE_TR+DateTimeUtil.getCurrentDateByPattern("yyyyMMdd")+getNum(list.get(0).gettRNo());
				updateServialNum.settRNo(servialNum.gettRNo()+1);
				servailNumMapper.update(updateServialNum);
			}else if(Constants.BIZ_TYPE_TX.equals(type)) {
				result = Constants.BIZ_TYPE_TX+DateTimeUtil.getCurrentDateByPattern("yyyyMMdd")+getNum(list.get(0).gettXNo());
				updateServialNum.settXNo(servialNum.gettXNo()+1);
				servailNumMapper.update(updateServialNum);
			}			
		}
		return result;
	}
	public void updateServialNum(){
		ServialNum servialNum = servailNumMapper.selectById(1);
		if(servialNum != null){
			servialNum.setpTNo(0);
			servialNum.settXNo(0);
			servialNum.setsLNo(0);
			servialNum.settRNo(0);
			servialNum.setBgNo(0);
			servailNumMapper.update(servialNum);
		}
	}
	public String getNum(int servialNum) {
		String str = String.valueOf(servialNum);
		while(str.length()<6) {
			str = "0"+str;
		}
		return str;
	}

}

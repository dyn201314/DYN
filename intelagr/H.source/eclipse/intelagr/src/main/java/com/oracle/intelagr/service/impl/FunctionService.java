package com.oracle.intelagr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.intelagr.entity.Function;
import com.oracle.intelagr.mapper.FunctionMapper;
import com.oracle.intelagr.service.IFunctionService;
@Service
public class FunctionService implements IFunctionService {
	@Autowired
	private FunctionMapper functionMapper;
	@Override
	public List<Function> selectAll() {
		return functionMapper.selectAll();
	}

}

package com.oracle.intelagr.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.intelagr.entity.InputReg;
import com.oracle.intelagr.mapper.InputRegMapper;
import com.oracle.intelagr.service.IInputRegService;
@Service
public class InputRegService implements IInputRegService {
	@Autowired
	private InputRegMapper inputRegMapper;
	@Override
	public void save(InputReg inputReg) {
		inputRegMapper.insert(inputReg);
	}

}

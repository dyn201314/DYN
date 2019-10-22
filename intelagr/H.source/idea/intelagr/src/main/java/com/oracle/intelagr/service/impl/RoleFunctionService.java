package com.oracle.intelagr.service.impl;

import com.oracle.intelagr.entity.RoleFunction;
import com.oracle.intelagr.mapper.RoleFunctionMapper;
import com.oracle.intelagr.service.IRoleFunctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class RoleFunctionService implements IRoleFunctionService{
    @Autowired
    private RoleFunctionMapper roleFunctionMapper;
    @Override
    public List<RoleFunction> query(Map<String, Object> map) {
        return roleFunctionMapper.select(map);
    }
}

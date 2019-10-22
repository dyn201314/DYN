package com.oracle.intelagr.mapper;

import java.util.List;

import com.oracle.intelagr.entity.ServialNum;

public interface ServialNumMapper {
	public List<ServialNum> select();
	public ServialNum selectById(int id);
	public void update(ServialNum servialNum);
}

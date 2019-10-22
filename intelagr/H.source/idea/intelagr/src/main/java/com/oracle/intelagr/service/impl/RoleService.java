package com.oracle.intelagr.service.impl;

import com.oracle.intelagr.common.PageModel;
import com.oracle.intelagr.entity.Role;
import com.oracle.intelagr.entity.RoleFunction;
import com.oracle.intelagr.entity.User;
import com.oracle.intelagr.mapper.RoleFunctionMapper;
import com.oracle.intelagr.mapper.RoleMapper;
import com.oracle.intelagr.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class RoleService implements IRoleService{
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private RoleFunctionMapper roleFunctionMapper;
    @Override
    public List<Role> selectAll() {
        return roleMapper.selectAll();
    }

    @Override
    public void queryForPage(PageModel pageModel) {
        Map map = (Map)pageModel.getData();
        map.put("index",(pageModel.getPage()-1)*pageModel.getPageSize());
        map.put("pageSize",pageModel.getPageSize());
        List<Role> list = roleMapper.select(map);
        pageModel.setTotalCount(roleMapper.count(map));
        pageModel.setResult(list);
    }

    @Override
    public Role queryById(int id) {
        return roleMapper.selectById(id);
    }

    @Override
    @Transactional
    public void delete(int[] ids) {
        for(int roleid:ids){
            Role role = roleMapper.selectById(roleid);
            role.setDeleteFlag("Y");
            roleMapper.update(role);
            roleFunctionMapper.deleteRoleCode(role.getRoleCode());
        }

    }

    @Override
    public void update(Role role) {
        Role r = roleMapper.selectById(role.getId());
        r.setRoleCode(role.getRoleCode());
        r.setRoleName(role.getRoleName());
        r.setRemark(role.getRemark());
        roleMapper.update(r);
    }

    @Override
    public void save(Role role) {
        roleMapper.insert(role);
    }

    @Override
    @Transactional
    public void saveRoleAuth(String roleCode, String[] funIds, User user) {
        //删除角色的权限
        roleFunctionMapper.deleteRoleCode(roleCode);
        for(String funCode:funIds){
            RoleFunction roleFunction = new RoleFunction();
            roleFunction.setRoleCode(roleCode);
            roleFunction.setFunctionCode(funCode);
            roleFunction.setCreateDate(new Date());
            roleFunction.setCreateUserId(user.getUserID());
            roleFunction.setUpdateDate(new Date());
            roleFunction.setUpdateUserId(user.getUserID());
            roleFunctionMapper.insert(roleFunction);
        }

    }
}

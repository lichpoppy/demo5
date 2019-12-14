package com.great.springboot.service;


import com.great.springboot.bean.*;
import com.great.springboot.dao.UserMapper;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


@Service
public class UserService
{
    @Resource
    private UserMapper userMapper;

    //登录
    @Transactional
    public TbUser login(TbUser tbUser)
    {
        return userMapper.login(tbUser);
    }

    //表格查询
    @Transactional
    public List<TbUser> usertb(TbUser tbUser)
    {
        return userMapper.usertb(tbUser);
    }


    //总条数查询
    @Transactional
    public List<TbUser> userzong(TbUser tbUser)
    {
        return userMapper.userzong(tbUser);
    }


    //人员增加
    @Transactional
    public int adduser(TbUser tbUser)
    {

        return userMapper.adduser(tbUser);
    }


    //人员删除
    @Transactional
    public int deuser(TbUser tbUser)
    {

        return userMapper.deuser(tbUser);
    }

    //修改
    @Transactional
    public int modify(TbUser tbUser)
    {

        return userMapper.modify(tbUser);
    }

    //修改
    @Transactional
    public int file(TbUser tbUser)
    {
        return userMapper.modify(tbUser);
    }


    //动态菜单显示
    @Transactional
    public  ArrayList<Menu>dynamicmenu( )
    {
        return userMapper.dynamicmenu();
    }



    //角色查询
    @Transactional
    public List<Role>  Inquirerole()
    {
        return userMapper.Inquirerole();
    }

    //权限管理
    @Transactional
    public List<Power> Tree ()
    {
        return userMapper.Tree();
    }


    //权限管理修改
    @Transactional
    public int distribution(int roleid, List<Integer> menuid)
    {
        return userMapper.distribution(roleid,menuid);
    }

    //操作日志
    @Transactional
    public int  dayinfo(Tblog tblog){

        return userMapper.dayinfo(tblog);
    }


    //表格查询
    @Transactional
    public List<Filetb> filetiao(Filetb filetb)
    {
        return userMapper.filetiao(filetb);
    }


    //表格查询
    @Transactional
    public List<Filetb> filezong(Filetb filetb)
    {
        return userMapper.filezong(filetb);
    }
}

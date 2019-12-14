package com.great.springboot.dao;



import com.great.springboot.bean.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;


@Mapper
public interface UserMapper
{
      //登录
      public TbUser login(TbUser tbUser);

      //用户表格
      public List<TbUser> usertb(TbUser tbUser);


      //查询总条数
      public List<TbUser> userzong(TbUser tbUser);


      //人员增加
      public int adduser(TbUser tbUser);


      //人员删除
      public int deuser(TbUser tbUser);


      //人员增加
      public int modify(TbUser tbUser);

//
//      //文件上传
//      public int file(TbUser tbUser);

      //动态菜单
      public  ArrayList<Menu> dynamicmenu( );


      //查询角色
      public List<Role>  Inquirerole();


      //查询角色
      public List<Power>  Tree();


      //权限管理修改
      public int distribution(@Param("roleid")int roleid,@Param("List")List<Integer>menuid);



      //日志操作
      public int  dayinfo(Tblog tblog);



      //用户表格
      public List<Filetb> filetiao(Filetb filetb);


      //查询总条数
      public List<Filetb> filezong(Filetb filetb);
}

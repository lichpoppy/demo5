package com.great.springboot.controller;



import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.great.springboot.bean.*;
import com.great.springboot.bean.Filetb;
import com.great.springboot.log.Log;
import com.great.springboot.service.UserService;
import org.apache.commons.io.FileUtils;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import java.io.*;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
public class Loging
{

@Resource
private UserService userService;


    //登录界面
    @RequestMapping("/Login")
    @Log(operationType="后台登录",operationName="管理员后台登录")
    public String Login(){
	    	String index="WorkLogin";
	    	return index;
	   }

	//登录界面
	@RequestMapping("/LoginUser")
	@Log(operationType="前端登录",operationName="用户前端登录")
	public String LoginUser(){
		String index="UserLogin";
		return index;
	}

	//用户查询界面
	@RequestMapping("/WorkManage")
	@Log(operationType="用户查询界面",operationName="管理员打开用户查询界面")
	public String WorkManage(){

		return "WorkManage";
	}


	//权限管理界面
	@RequestMapping("/Authority")
	@Log(operationType="权限管理界面",operationName="管理员进行打开权限管理界面方法")
	public ModelAndView Authority(){
		ModelAndView modelAndView = new ModelAndView();
		List<Role> list=userService.Inquirerole();

		modelAndView.addObject("role",list);
		modelAndView.setViewName("Authority");

		return modelAndView;

	}


   //登录验证
	@RequestMapping("/login.action")
	@Log(operationType="后台登录验证",operationName="管理员进行后台登录验证方法")

	public ModelAndView Loging(String username, String password )
	{
		TbUser tbUser = new TbUser();
		ModelAndView modelAndView = new ModelAndView();
		tbUser.setUsername(username);
		tbUser.setUserpass(password);

		System.out.println("账号----------------------"+tbUser.getUsername());
		System.out.println("密码----------------------"+tbUser.getUserpass());

		TbUser tbUser2 = userService.login(tbUser);
		if (tbUser2 != null)
		{

			modelAndView.addObject("username",tbUser.getUsername());

			LinkedHashMap<String,ArrayList<Menu>> map=dynamicmenu();
			modelAndView.addObject("menu",map);

			modelAndView.setViewName("WorkMenu");
			System.out.println("成功");
			return modelAndView;
		}else {
			System.out.println("失败");
		}
		return null;
	}

	//登录验证
	@RequestMapping("/userlogin.action")
	@Log(operationType="前端登录验证",operationName="用户进行前端登录验证方法")

	public ModelAndView UserLogin(String username, String password )
	{
		TbUser tbUser = new TbUser();
		ModelAndView modelAndView = new ModelAndView();
		tbUser.setUsername(username);
		tbUser.setUserpass(password);

		System.out.println("账号----------------------"+tbUser.getUsername());
		System.out.println("密码----------------------"+tbUser.getUserpass());

		TbUser tbUser2 = userService.login(tbUser);
		if (tbUser2 != null)
		{

			modelAndView.addObject("username",tbUser.getUsername());

			LinkedHashMap<String,ArrayList<Menu>> map=dynamicmenu();
			modelAndView.addObject("menu",map);

			modelAndView.setViewName("FileCenter");
			System.out.println("成功");
			return modelAndView;
		}else {
			System.out.println("失败");
		}
		return null;
	}

	//用户表格显示
	@RequestMapping("/user.action")
	@ResponseBody
	@Log(operationType="用户表格显示",operationName="管理员打开用户表格显示方法")
	public Msg userTb(TbUser tbUser, String page){

		Msg msg = new Msg();
		tbUser.setUsername(tbUser.getUsername());
		tbUser.setPage((Integer.valueOf(page) -1)*5);
		List<TbUser>  list= userService.usertb(tbUser);
		List<TbUser>  pageList= userService.userzong(tbUser);


		int mun = pageList.size();
		msg= new Msg(new BigDecimal("0"),"",new BigDecimal(mun),list);
		return msg;
	}


	//人员增加
	@RequestMapping("/add.action")
	@ResponseBody
	@Log(operationType="增加",operationName="管理员进行增加用户")
	public Msg adduser(TbUser tbUser)
	{
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time =sdf.format(date);
		tbUser.setRegtime(time);
		int i =userService.adduser(tbUser);
		Msg msg =new Msg();
		if (i>0){
			msg.setMsg("1");
		}else {
			msg.setMsg("2");
		}
		return msg;
	}


	//人员删除
	@RequestMapping("/delete.action")
	@ResponseBody
	@Log(operationType="删除",operationName="管理员进行删除用户")
	public Msg deuser(TbUser tbUser)
	{

		int i =userService.deuser(tbUser);
		Msg msg =new Msg();
		if (i>0){
			msg.setMsg("1");
		}else {
			msg.setMsg("2");
		}
		return msg;
	}


	//人员修改
	@RequestMapping("/modify.action")
	@ResponseBody
	@Log(operationType="修改",operationName="管理员进行人员修改")
	public Msg modify(TbUser tbUser)
	{

		int i =userService.modify(tbUser);
		Msg msg =new Msg();
		if (i>0){
			msg.setMsg("1");
		}else {
			msg.setMsg("2");
		}
		return msg;
	}


	//文件上传
	@RequestMapping("/file.action")
	@ResponseBody
	@Log(operationType="文件上传",operationName="用户进行文件上传")
	public JSONObject file(Filetb filetb, MultipartFile file)
	{
		  System.out.println("进入");
          String filePath ="D:/Khada/";
		  System.out.println("filePath--------"+filePath);
		  System.out.println("sy------"+System.currentTimeMillis());
		  System.out.println("mu------"+file.getOriginalFilename());

          String fileName =filePath+System.currentTimeMillis()+"_"+file.getOriginalFilename();
		  FileOutputStream fo;
		  JSONObject obj=new JSONObject();
		  obj.put("msg","ok");


			  try
			  {
				  fo= new FileOutputStream(new File(fileName));
				  IOUtils.copy(file.getInputStream(),fo);
			  } catch (IOException e)
			  {
				  obj.put("msg","error");
				  e.printStackTrace();
			  }
           return obj;





	}


	//权限管理树形
	@RequestMapping("/Tree.action")
	@ResponseBody
	@Log(operationType="权限管理树形",operationName="管理员打开权限管理树形")
	public List<Power> Tree(){
		List<Power> list = userService.Tree();

//		for (int i = 0; i < list.size(); i++)
//		{
//			System.out.println(list.get(i).getTitle());
//			for (int j = 0; j <list.get(i).getChildren().size() ; j++)
//			{
//				System.out.println(list.get(i).getChildren().get(j).getTitle());
//			}
//		}

	   	return list;
	}


	//动态菜单
	@RequestMapping("/dynamicmenu.action")
	@ResponseBody
	@Log(operationType="动态菜单",operationName="登录后进行动态菜单显示")
	public LinkedHashMap<String, ArrayList<Menu>>dynamicmenu(){
		LinkedHashMap<String, ArrayList<Menu>>map= new LinkedHashMap<>();
		ArrayList<Menu> menu= userService.dynamicmenu();

		for (int i=0;i<menu.size();i++){

			String first=menu.get(i).getMenuname();

             if(map.containsKey(first)){
                ArrayList<Menu> arrayList=map.get(first);
                arrayList.add(menu.get(i));
             }else {
	             ArrayList<Menu> arrayList=new ArrayList<>();
	             arrayList.add(menu.get(i));
	             map.put(first,arrayList);
             }
		}

      return  map;
	}


	//分配菜单
	@RequestMapping("/distribution.action")
	@ResponseBody
	@Log(operationType="分配菜单",operationName="超级管理员进行分配菜单")
	public Msg distribution(String msg,String msg2){
		System.out.println("msg-------------"+msg);
		System.out.println("msg2-------------"+msg2);

		Gson gson = new Gson();

		List<Integer> menuid = new ArrayList<>();
        List<Power> tb=gson.fromJson(msg, new TypeToken<List<Power>>() {}.getType());
		for (int i = 0; i <tb.size() ; i++)
		{
			menuid.add(Integer.parseInt(tb.get(i).getId()));
			for (int j = 0; j <tb.get(i).getChildren().size() ; j++)
			{
				menuid.add(Integer.parseInt(tb.get(i).getChildren().get(i).getId()));

			}
		}
         //解析JSON数据

		userService.distribution(Integer.parseInt(msg2),menuid);
		Msg msg1=new Msg();
        return msg1;
}



	//文档下载表格显示
	@RequestMapping("/FileSearch.action")
	@ResponseBody
	@Log(operationType="文档下载界面",operationName="用户进行文档下载界面表格显示")
    public Msg FileSearch(Filetb filetb, String page){
		Msg msg = new Msg();
//		tbUser.setUsername(tbUser.getUsername());

		filetb.setPage((Integer.valueOf(page) -1)*5);
		List<Filetb>  list= userService.filetiao(filetb);
		List<Filetb>  pageList= userService.filezong(filetb);
		System.out.println("---------------12"+list.size());
		System.out.println("---------------12"+pageList.size());
		int mun = pageList.size();
		msg= new Msg(new BigDecimal("0"),"",new BigDecimal(mun),list);
		return msg;
}



	@RequestMapping("/Download.action")
	@Log(operationType="文档下载",operationName="用户进行文档下载")
	public ResponseEntity<byte[]> export(String fileName) throws IOException
	{
		System.out.println("文件下载："+fileName);
		File file = new File("E:\\文件下载文件夹\\" + fileName);//上传保存的文件路径
		HttpHeaders headers = new HttpHeaders();

		// MediaType:互联网媒介类型 contentType：具体请求中的媒体类型信息
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDispositionFormData("attachment", fileName);

		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
	}



}

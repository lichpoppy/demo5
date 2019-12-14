package com.great.springboot.aop;


import com.great.springboot.bean.Tblog;
import com.great.springboot.log.Log;
import com.great.springboot.service.UserService;



import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

@Aspect
@Component

public class aopLog
{
	@Resource
	private UserService userService;
  @Pointcut("execution(public * com.great.springboot.controller..*.*(..))")

	public void aopLog(){

	}
	@After(value = "aopLog()")
	public void after(JoinPoint joinPoint){


//
		//获取名字
//		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder
//				.getRequestAttributes();
//		HttpServletRequest request = requestAttributes.getRequest();
//
//				System.out.println(request.getSession().getAttribute("username").toString()+"你好");
		try
		{
			String targetName = joinPoint.getTarget().getClass().getName();
			System.out.println(targetName);
			String methodName = joinPoint.getSignature().getName();
			Object[] arguments = joinPoint.getArgs();
			Class targetClass = Class.forName(targetName);
			Method[] methods = targetClass.getMethods();
			String operationType = "";
			String operationName = "";
			for (Method method : methods) {
				if (method.getName().equals(methodName)) {
					Class[] clazzs = method.getParameterTypes();
					if (clazzs.length == arguments.length) {
						operationType = method.getAnnotation(Log.class).operationType();
						operationName = method.getAnnotation(Log.class).operationName();
						break;
					}
				}
			}
			Tblog tblog=new Tblog();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
			Date date = new Date(System.currentTimeMillis());
			String time=df.format(date);
			tblog.setOperatingtime(time);
			tblog.setOperationtype(operationType);
			tblog.setInformation(operationName);
			System.out.println("日志类型-------"+operationType);
			System.out.println("日志详细-------"+operationName);
			userService.dayinfo(tblog);




		} catch (ClassNotFoundException ex)
		{
			ex.printStackTrace();
		}


	}


}

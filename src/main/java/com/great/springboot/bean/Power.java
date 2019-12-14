package com.great.springboot.bean;

import java.util.List;

public class Power
{
	public String title;
	public String id;
	public List<Power> children;


	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public List<Power> getChildren()
	{
		return children;
	}

	public void setChildren(List<Power> children)
	{
		this.children = children;
	}
}

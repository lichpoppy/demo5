package com.great.springboot.bean;

public class Menu
{
	public int menuid;
	public String menuname;
	public int secondaryid;
	public String  menupath;
    public String towmenuname;

	public String getTowmenuname()
	{
		return towmenuname;
	}

	public void setTowmenuname(String towmenuname)
	{
		this.towmenuname = towmenuname;
	}

	public int getMenuid()
	{
		return menuid;
	}

	public void setMenuid(int menuid)
	{
		this.menuid = menuid;
	}

	public String getMenuname()
	{
		return menuname;
	}

	public void setMenuname(String menuname)
	{
		this.menuname = menuname;
	}

	public int getSecondaryid()
	{
		return secondaryid;
	}

	public void setSecondaryid(int secondaryid)
	{
		this.secondaryid = secondaryid;
	}

	public String getMenupath()
	{
		return menupath;
	}

	public void setMenupath(String menupath)
	{
		this.menupath = menupath;
	}
}

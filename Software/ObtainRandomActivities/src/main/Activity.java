package main;

public class Activity 
{
	private int id;	
	private String role;
    private String module;
    private String description;
    
	public Activity(int id, String role, String module, String description) 
	{
       this.id          = id;
       this.role        = role;
       this.module      = module;
       this.description = description;
	}

	public int getId() 
	{
		return id;
	}

	public void setId(int id) 
	{
		this.id = id;
	}

	public String getModule() 
	{
		return module;
	}

	public void setModule(String module) 
	{
		this.module = module;
	}

	public String getDescription() 
	{
		return description;
	}

	public void setDescription(String description) 
	{
		this.description = description;
	}
	

	public String getRole() 
	{
		return role;
	}

	public void setRole(String role) 
	{
		this.role = role;
	}

	@Override
	public String toString() 
	{
		return "Activity [id=" + id + ", role=" + role + ", module=" + module + ", description=" + description + "]";
	}

}

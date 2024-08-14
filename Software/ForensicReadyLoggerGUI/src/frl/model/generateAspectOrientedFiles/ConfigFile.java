package frl.model.generateAspectOrientedFiles;

import java.io.Serializable;

// This Class is to store the data, it has the same attributes as the ConfigFileFormEvent Class
//Package #8
//Class #1
public class ConfigFile implements Serializable 
{

	private static final long serialVersionUID = -542727119035768593L;

	// Counter for the Employees, start with number 1
	private static int count = 1;
	private int id;
	private String featuresConfigFile;
	private String projectName;
	private String jarFileName;
	private String projectInputDir;
	private String projectOutputDir;
	private String programmingLanguage;
	private String dbms;
	private String inputMethod;
	private String startProjectMethod;
	private String endProjectMethod;
	private String connectProjectMethod;
	private String connectProjectMethodReturnValue;
	private String connectProjMethodType;
	private String remoteOperatingSystem;	
	private String projectOutputRemoteDir;	
	private String projectLogDir;	
	private String projectLibDir;	
	
    // Constructor #1 of the AOPFile Class that assigns an ID
    // Method #1
	public ConfigFile(String projectName, String jarFileName, 
			          String projectInputDir, String projectOutputDir, String programmingLanguage, 
			          String dbms, String inputMethod, String startProjectMethod, 
			          String endProjectMethod, String connectProjectMethod, 
			          String connectProjectMethodReturnValue,
			          String connectProjMethodType,
			          String remoteOperatingSystem, 
			          String projectOutputRemoteDir)
	{
		this.projectName          = projectName; 
		this.jarFileName          = jarFileName; 
        this.projectInputDir      = projectInputDir; 
        this.projectOutputDir     = projectOutputDir; 
        this.programmingLanguage  = programmingLanguage; 
        this.dbms                 = dbms; 
        this.inputMethod          = inputMethod; 
        this.startProjectMethod   = startProjectMethod; 
        this.endProjectMethod     = endProjectMethod; 
        this.connectProjectMethod = connectProjectMethod; 
        this.connectProjectMethodReturnValue = connectProjectMethodReturnValue;
        this.connectProjMethodType = connectProjMethodType;
        this.remoteOperatingSystem = remoteOperatingSystem; 
        this.projectOutputRemoteDir = projectOutputRemoteDir;
		
	    // Everytime that I create a new AOPFile, it will increase the count counter
	    this.id = count;
	    count++;
	    
	}
	
    // Constructor #2 of the AOPFile Class that assigns an ID
    // Method #2
	public ConfigFile(int id, String projectName, String jarFileName, 
	                  String projectInputDir, String projectOutputDir, String programmingLanguage, 
	                  String dbms, String inputMethod, String startProjectMethod, 
	                  String endProjectMethod, String connectProjectMethod, 
	                  String connectProjectMethodReturnValue,
	                  String connectProjMethodType,
	                  String remoteOperatingSystem, 
	                  String projectOutputRemoteDir, 
	                  String projectLogDir, 
	                  String projectLibDir)
	{
		// Calls the Constructor #1 of the AOPFile Class
        this(projectName, jarFileName, 
             projectInputDir, projectOutputDir, programmingLanguage,
             dbms, inputMethod, startProjectMethod, 
             endProjectMethod, connectProjectMethod, 
             connectProjectMethodReturnValue,
             connectProjMethodType, remoteOperatingSystem, 
             projectOutputRemoteDir);
		
		this.id = id;
		this.projectLogDir = projectLogDir;
		this.projectLibDir = projectLibDir;
		
	}
	
    // Constructor #4 of the AOPFile Class that assigns an ID
    // Method #3
	public ConfigFile(int id, String projectName, String jarFileName, 
	                  String projectInputDir, String projectOutputDir)
	{
	   this.id               = id; 	
       this.projectName      = projectName; 
	   this.jarFileName      = jarFileName; 
       this.projectInputDir  = projectInputDir; 
       this.projectOutputDir = projectOutputDir; 
	}

	public int getId() 
	{
		return id;
	}

	public void setId(int id) 
	{
		this.id = id;
	}

	public String getFeaturesConfigFile() 
	{
		return featuresConfigFile;
	}

	public void setFeaturesConfigFile(String featuresConfigFile) 
	{
		this.featuresConfigFile = featuresConfigFile;
	}

	public String getProjectName() 
	{
		return projectName;
	}

	public void setProjectName(String projectName) 
	{
		this.projectName = projectName;
	}

	public String getJarFileName() 
	{
		return jarFileName;
	}

	public void setJarFileName(String jarFileName) 
	{
		this.jarFileName = jarFileName;
	}

	public String getProjectInputDir() 
	{
		return projectInputDir;
	}

	public void setProjectInputDir(String projectInputDir) 
	{
		this.projectInputDir = projectInputDir;
	}

	public String getProjectOutputDir() 
	{
		return projectOutputDir;
	}

	public void setProjectOutputDir(String projectOutputDir) 
	{
		this.projectOutputDir = projectOutputDir;
	}

	public String getProgrammingLanguage() 
	{
		return programmingLanguage;
	}

	public void setProgrammingLanguage(String programmingLanguage) 
	{
		this.programmingLanguage = programmingLanguage;
	}

	public String getDbms() 
	{
		return dbms;
	}

	public void setDbms(String dbms) 
	{
		this.dbms = dbms;
	}

	public String getInputMethod() 
	{
		return inputMethod;
	}

	public void setInputMethod(String inputMethod) 
	{
		this.inputMethod = inputMethod;
	}

	public String getStartProjectMethod() 
	{
		return startProjectMethod;
	}

	public void setStartProjectMethod(String startProjectMethod) 
	{
		this.startProjectMethod = startProjectMethod;
	}

	public String getEndProjectMethod() 
	{
		return endProjectMethod;
	}

	public void setEndProjectMethod(String endProjectMethod) 
	{
		this.endProjectMethod = endProjectMethod;
	}

	public String getConnectProjectMethod() 
	{
		return connectProjectMethod;
	}

	public void setConnectProjectMethod(String connectProjectMethod) 
	{
		this.connectProjectMethod = connectProjectMethod;
	}
	
	public String getConnectProjectMethodReturnValue() 
	{
		return connectProjectMethodReturnValue;
	}

	public void setConnectProjectMethodReturnValue(String connectProjectMethodReturnValue) 
	{
		this.connectProjectMethodReturnValue = connectProjectMethodReturnValue;
	}

	public String getRemoteOperatingSystem() 
	{
		return remoteOperatingSystem;
	}

	public void setRemoteOperatingSystem(String remoteOperatingSystem) 
	{
		this.remoteOperatingSystem = remoteOperatingSystem;
	}
	
	public String getConnectProjMethodType() 
	{
		return connectProjMethodType;
	}

	public void setConnectProjMethodType(String connectProjMethodType) 
	{
		this.connectProjMethodType = connectProjMethodType;
	}

	public String getProjectOutputRemoteDir() 
	{
		return projectOutputRemoteDir;
	}

	public void setProjectOutputRemoteDir(String projectOutputRemoteDir) 
	{
		this.projectOutputRemoteDir = projectOutputRemoteDir;
	}

	public String getProjectLogDir() {
		return projectLogDir;
	}

	public void setProjectLogDir(String projectLogDir) {
		this.projectLogDir = projectLogDir;
	}

	public String getProjectLibDir() {
		return projectLibDir;
	}

	public void setProjectLibDir(String projectLibDir) {
		this.projectLibDir = projectLibDir;
	}

	@Override
	public String toString() {
		return "ConfigFile [id=" + id + ", featuresConfigFile=" + featuresConfigFile + ", projectName=" + projectName
				+ ", jarFileName=" + jarFileName + ", projectInputDir=" + projectInputDir + ", projectOutputDir="
				+ projectOutputDir + ", programmingLanguage=" + programmingLanguage + ", dbms=" + dbms
				+ ", inputMethod=" + inputMethod + ", startProjectMethod=" + startProjectMethod + ", endProjectMethod="
				+ endProjectMethod + ", connectProjectMethod=" + connectProjectMethod
				+ ", connectProjectMethodReturnValue=" + connectProjectMethodReturnValue + ", connectProjMethodType="
				+ connectProjMethodType + ", remoteOperatingSystem=" + remoteOperatingSystem
				+ ", projectOutputRemoteDir=" + projectOutputRemoteDir + ", projectLogDir=" + projectLogDir
				+ ", projectLibDir=" + projectLibDir + "]";
	}
	
}

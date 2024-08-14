package frl.gui.projectTable;

import java.util.List;
import javax.swing.table.AbstractTableModel;

import frl.model.generateAspectOrientedFiles.ConfigFile;

// This class is a Wrapper for my Data
//Package #6
//Class #7
public class ProjectTableModel extends AbstractTableModel 
{
	private static final long serialVersionUID = 1L;

	// Define an atribute
    private List<ConfigFile> configFileDb;
        
    private String[] projectColNames = { "Id", "Project Name", "JAR Name", "Input Folder", "Output Folder", "Source Code", 
    		"DBMS", "Input Method", "Start Method", "End Method", "Connect Method", "Connect Value",
            "Connect Type", "Remote OS", "Remote Folder", "Log Folder", "Lib Folder" };

 	// Define the Constructor of the Class empty, without any code inside
    // Method #1
	public ProjectTableModel() 
	{
		
	}
	
	@Override
	// Method #2
	public String getColumnName(int column) 
	{
		return projectColNames[column];
	}

	// Define a Method for Class
	// Method #3
	public void setData(List<ConfigFile> configFileDb) 
	{
       this.configFileDb = configFileDb;
	}
	
	// Define the Methods of the Class
	@Override
	// Method #4
	public int getRowCount() 
	{
	   return configFileDb.size();	
	}

	@Override
	// Method #5
	// There are 6 columns defined at this tableModel
	public int getColumnCount() 
	{
	   return 17;
	}
	
	@Override
	// Method #6
	public Object getValueAt(int row, int col) 
	{
       ConfigFile configFile;
       
       configFile = configFileDb.get(row);
       
       switch(col) 
       {
          case 0:
    	     return configFile.getId();
    	     
          case 1:
    	     return configFile.getProjectName();
    	     
          case 2:
    	     return configFile.getJarFileName();
    	     
          case 3:
    	     return configFile.getProjectInputDir();
    	     
          case 4:
    	     return configFile.getProjectOutputDir();
    	         	     
          case 5:
    	     return configFile.getProgrammingLanguage();
    	     
          case 6:
    	     return configFile.getDbms();
    	     
          case 7:
    	     return configFile.getInputMethod();
    	     
          case 8:
    	     return configFile.getStartProjectMethod();
    	     
          case 9:
    	     return configFile.getEndProjectMethod();
    	     
          case 10:
    	     return configFile.getConnectProjectMethod();
    	     
           case 11:
     	     return configFile.getConnectProjectMethodReturnValue();
     	     
          case 12:
    	     return configFile.getConnectProjMethodType();
    	     
          case 13:
    	     return configFile.getRemoteOperatingSystem();
    	     
          case 14:
    	     return configFile.getProjectOutputRemoteDir();   
    	     
          case 15:
    	     return configFile.getProjectLogDir();

          case 16:
    	     return configFile.getProjectLibDir();    
    	     
       }
       return null;
	}

}

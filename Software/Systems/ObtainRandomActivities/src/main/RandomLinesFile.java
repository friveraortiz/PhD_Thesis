package main;
import java.io.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;
import java.util.Scanner;

public class RandomLinesFile 
{
    static ArrayList<Activity> activityList = new ArrayList<Activity>();
    static ArrayList<Integer> idList = new ArrayList<Integer>();
	static Activity activityRecord;
	static String role="", module="", description="";
	static int id=0, minAct=0, maxAct=0;
	   
	public static void readTextFile(String textFileName) 
	{
	   // Initialize Variables	
	   String errorMessage1="", errorMessage2="", textLine="", idStr="";
	   String[] fields;
	   File file;	
	   BufferedReader br = null;
	   
	   file = new File(textFileName);
	   activityList.clear();
	   
       try 
       {
	      br = new BufferedReader(new FileReader(file));
	   } 
       catch (FileNotFoundException e1) 
       {
          errorMessage1 = e1.getMessage();
    	  errorMessage2 = "Error XXXX: Occurred while opening the Text File : " + System.lineSeparator();
    	  errorMessage2 = errorMessage2 + textFileName + System.lineSeparator();
    	  errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
	   }
       
       try 
       {
	      while((textLine=br.readLine()) != null)
		  {
		     // Separate each of the 3 fields by a comma delimiter
		     fields = textLine.split(",");
		     
		     idStr       = fields[0];
		     role        = fields[1];
		     module      = fields[2];
		     description = fields[3];
		     
		     // Convert from String DataType to Integer DataType
		     id = Integer.parseInt(idStr);
		    		
		     // Store the 4 fields into a Activity Record
		     activityRecord = new Activity(id, role, module, description); 
		     
		     // Store the record into an ArrayList
		     activityList.add(activityRecord);
		     idList.add(id);
		     
		  }
	      
	      System.out.println("This Text File was loaded and stored internally: " + textFileName);
	   } 
       catch (IOException e2) 
       {
          errorMessage1 = e2.getMessage();
     	  errorMessage2 = "Error XXXX: Occurred while reading the lines of the Text File : " + System.lineSeparator();
     	  errorMessage2 = errorMessage2 + textFileName + System.lineSeparator();
     	  errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
	   }
       
       try 
       {
	      br.close();
	   } 
       catch (IOException e3) 
       {
          errorMessage1 = e3.getMessage();
     	  errorMessage2 = "Error XXXX: Occurred while closing the Text File : " + System.lineSeparator();
     	  errorMessage2 = errorMessage2 + textFileName + System.lineSeparator();
     	  errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
	   }

	}
	
	public static void printArrayList()
	{
	   int i;	
	   
	   for(i = 0; i < activityList.size(); i++) 
	   {
	      id          = activityList.get(i).getId();
	      role        = activityList.get(i).getRole();
	      module      = activityList.get(i).getModule();
	      description = activityList.get(i).getDescription();

	      System.out.println("Counter              : " + i);
		  System.out.println("Activity Id          : " + id);
		  System.out.println("User Role            : " + role);
		  System.out.println("System Module        : " + module);
		  System.out.println("Activity Description : " + description);
	   }
	}
	
	public static void obtainMinMaxId()
	{
	   
	   minAct = Collections.min(idList);
	   maxAct = Collections.max(idList);
	   
	   System.out.println("This Text File has as a SMALLEST Activity Number #: " + minAct + " and a LARGEST Activity Number #: " + maxAct);
	}
	
	public static int generateRandomNumber(int minNumber, int maxNumber)
	{
	   Random rand;
	   int randomNumber=0;
		
	   rand = new Random();

	   // Generate a Random Number
	   randomNumber = rand.nextInt((maxNumber - minNumber) + 1) + minNumber;
	   
	   return randomNumber;
	}
	
	public static void getRandomActivities(int randomTotalAct)
	{
	   int i=1, j=0, randomActNum=0;
	   String line1="",line2="";
	   StringBuffer sb;
	   
	   while (i <= randomTotalAct) 
	   {
          // Generate a random Activity Number 
	      randomActNum = generateRandomNumber(minAct, maxAct);
		  System.out.println("Random Activity Number =>: " + randomActNum);
		  
		  j = randomActNum - 1;
		  
		  // Obtain the data from this Random Activity Number  
	      id          = activityList.get(j).getId();
		  role = activityList.get(j).getRole();

	      module      = activityList.get(j).getModule();
	      description = activityList.get(j).getDescription();
	      
	      sb= new StringBuffer(description);  
	      
	      sb = sb.deleteCharAt(sb.length()-1);  
	      
	      line1 = module + "," + sb;
	      
		  line2 = id + "," +role + "," + module + "," + sb;

		  System.out.println("Id          : " + id);
		  System.out.println("Role        : " + role);
		  System.out.println("Module      : " + module);
		  System.out.println("Description : " + sb);
		  System.out.println("Line 1      : " + line1);
		  System.out.println("Line 2      : " + line2);
	      
		  i++;
	   }
	   
	}
	
	public static String getFileName(String userRole)	
	{
	   String path, fileName="";	
	   
	   path = "/Users/fannyriveraortiz/eclipse-workspace/ObtainRandomActivities/input/";
	   
	   fileName = path;
	   
	   switch(userRole) 
	   {
	      case "Admin_HRM":
	         fileName = fileName + "HRM_Activities_Admin_HRM.txt";
	      break;
	      
	      case "Employee_HRM":
	         fileName = fileName + "HRM_Activities_Employee.txt";
	      break;
	      
	      case "Manager_HRM":
	         fileName = fileName + "HRM_Activities_Manager.txt";
	      break;
	      
	      case "Admin_G_OH":
	         fileName = fileName + "OH_Activities_Admin_General_OH.txt";
	      break;
	      
	      case "Admin_S_OH":
		     fileName = fileName + "OH_Activities_Admin_Settings_OH.txt";
		  break;
	      
	      case "Physician_OH":
	         fileName = fileName + "OH_Activities_Physician.txt";
	      break;
	      
	      default:
	         fileName = "";
	      break;   

	    }
	   
	   return fileName;
	}

	public static void main(String[] args) 
	{
	   int randomTotalAct=0;
	   String activities="", userLevel="";
	   

	   Scanner reader = new Scanner(System.in);  // Reading from System.in
	   
	   System.out.print("Enter the User Role in the Software System =>: ");
	   userLevel = reader.next();

	   reader.close();
	   
	   // Obtain the fileName based on the User Level
	   activities = getFileName(userLevel);
	   
	   if(activities == null || activities.trim().isEmpty()== true) 
	   {
	      System.out.println("The User Role : " + userLevel + " Does NOT exist in this Program."); 
	   }
	   else
	   {	   
	      System.out.println("This is the RECEIVED INPUT INFORMATION: ");
	      System.out.println("User Role : " + userLevel);
	      System.out.println("FileName  : " + activities);
	      System.out.println();
	   
	      // Read a Text File and store it into an ArrayList
          readTextFile(activities);
       
          // Obtain the Minimum and Maximum Values related to the Activity Id from the ArrayList
          obtainMinMaxId();
       
          // Get a random number of total activities
          randomTotalAct = generateRandomNumber(1, 6);
       
	      System.out.println("Generating =>: " + randomTotalAct + " Random Activities in TOTAL");
	   
	      getRandomActivities(randomTotalAct);
	   
	   }
	}

}

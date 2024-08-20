package frl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import org.aspectj.lang.Signature;
import java.util.Arrays;
import java.util.ArrayList;

public aspect FrlDatabaseMethods_1
{
   String projectName="HRMApplication";
   String projectOutputDir="/Users/fannyriveraortiz/eclipse-workspace/Directories/Output/";
   String umlSeqDiagTextFileName1="IncidentSequenceDiagram.txt";
   String guiLibs="java.awt;javax.swing;org.eclipse.swt;javafx;org.apache.pivot.wtk;";
   String bluePrintObject1="class";
   String objectOrientedDelimiter1=".";
   String startParameters="(";
   String endParameters=")";
   String newLine1="%n";
   String whiteSpaceWordsDelimiter1=" ";
   
   String guiLibDelimiter=";";
   String invalidSpecialCharacter="$";
   String validSpecialCharacter="_";
   String member1="actor";
   String member2="participant";
   String startSendMessage="->";
   String endSendMessage=":";
   String userName="User";

   String startNote="note left of";
   String endNote="end note";
   String colorDelimiter="#";
   String colorNote="lightskyblue";
   String position="order";
   String space="||20||";
   String startDivision="== Authenticates to the";
   String endDivision="==";
   
   String connectProjectMethod="controller.UserController.validateUser";
   String connectProjectMethod1="model.UserDatabase.getUserLevel";
   Object connectProjectMethodReturnValue="true";
   Object connectProjectMethodReturnValue1="Admin, Manager, Employee";
   String connectProjectMethodType="ReturnType";
   String connectProjectMethodType1="ReturnType";
   
   String endUMLSeqDiagram="@enduml";
   String umlSeqDiagPngFileName1="IncidentSequenceDiagram.png";
   String umlSeqDiagTextFileName2="IncidentSequenceDiagramTEMPORAL.txt";
   
   String umlSeqDiagTextFile=projectOutputDir + umlSeqDiagTextFileName1;
   String callerClass="", calleeClass="", callerClassLine, calleeClassLine;
   String packageMethod="", classMethod="";
   String nameMethod="", fullMethod="", callerSuperClass="", calleeSuperClass="";
   String callerType="", calleeType="", note="";
   String line="", content="", fullMethodName="";
   int actorOrder=1, partOrder=0, methodsCounter=0, userCounter=1;
   boolean callerGuiFlag= false, calleeGuiFlag=false, connectionFlag=false;
   Class<?> callerClassObj1, callerClassObj2, calleeClassObj1, calleeClassObj2; 
   Signature method;
   Object[] methodArgs;
   String umlSeqDiagPngFile=projectOutputDir  + umlSeqDiagPngFileName1;
   int numberLines=0;
   String umlSeqDiagTextFile2=projectOutputDir + umlSeqDiagTextFileName2;
   File inputFile  = new File(umlSeqDiagTextFile);
   File outputFile = new File(umlSeqDiagTextFile2);
   String errorMessage1="", errorMessage2="", currentUser="", defaultUser="User_1";
   int methodExists=0;
   
   pointcut databaseMethods(): 
      call(boolean controller.UserController.validateUser(..)) || 
      call(model.UserLevel model.UserDatabase.getUserLevel(..)) || 
      call(void test.TestUserDb.main(..)) || 
      call(void test.TestLoginDb.main(..)) || 
      call(void test.TestTravelRequestDb.main(..)) || 
      call(void test.TestEmployeeDb.main(..)) || 
      call(void test.TestModuleDb.main(..)) || 
      call(void controller.UserController.load(..)) || 
      call(void controller.UserController.delete(..)) || 
      call(void controller.UserController.save(..)) || 
      call(boolean controller.UserController.validateUser(..)) || 
      call(model.UserLevel controller.UserController.getUserLevel(..)) || 
      call(void controller.UserController.loadUser(..)) || 
      call(boolean controller.UserController.validateUserName(..)) || 
      call(boolean controller.UserController.validateDeleteUser(..)) || 
      call(boolean controller.UserController.validateEmployee(..)) || 
      call(boolean controller.UserController.validateEmail(..)) || 
      call(ArrayList<model.Employee> controller.UserController.loadFullNameEmployees(..)) || 
      call(void controller.TravelRequestController.load(..)) || 
      call(void controller.TravelRequestController.delete(..)) || 
      call(void controller.TravelRequestController.save(..)) || 
      call(int controller.TravelRequestController.maxNumTravelRequest(..)) || 
      call(void controller.TravelRequestController.loadTravelRequest(..)) || 
      call(ArrayList<model.Employee> controller.TravelRequestController.loadFullNameEmployees(..)) || 
      call(void controller.EmployeeController.load(..)) || 
      call(void controller.EmployeeController.delete(..)) || 
      call(void controller.EmployeeController.save(..)) || 
      call(boolean controller.EmployeeController.validateFullName(..)) || 
      call(int controller.EmployeeController.maxNumEmployee(..)) || 
      call(boolean controller.EmployeeController.validateDeleteEmployee1(..)) || 
      call(boolean controller.EmployeeController.validateDeleteEmployee2(..)) || 
      call(void controller.EmployeeController.loadEmployee(..)) || 
      call(ArrayList<model.Employee> controller.EmployeeController.loadSupervisors(..)) || 
      call(void controller.ModuleController.saveModules(..)) || 
      call(java.lang.String[] controller.ModuleController.getModules(..)) || 
      call(java.lang.String[][] controller.ModuleController.getSubModules(..)) || 
      call(void model.UserDatabase.load(..)) || 
      call(void model.UserDatabase.delete(..)) || 
      call(void model.UserDatabase.save(..)) || 
      call(boolean model.UserDatabase.validateUser(..)) || 
      call(model.UserLevel model.UserDatabase.getUserLevel(..)) || 
      call(void model.UserDatabase.loadUser(..)) || 
      call(boolean model.UserDatabase.validateUserName(..)) || 
      call(boolean model.UserDatabase.validateDeleteUser(..)) || 
      call(boolean model.UserDatabase.validateEmployee(..)) || 
      call(boolean model.UserDatabase.validateEmail(..)) || 
      call(ArrayList<model.Employee> model.UserDatabase.loadFullNameEmployees(..)) || 
      call(void model.TravelRequestDatabase.load(..)) || 
      call(void model.TravelRequestDatabase.delete(..)) || 
      call(void model.TravelRequestDatabase.save(..)) || 
      call(int model.TravelRequestDatabase.maxNumTravelRequest(..)) || 
      call(void model.TravelRequestDatabase.loadTravelRequest(..)) || 
      call(ArrayList<model.Employee> model.TravelRequestDatabase.loadFullNameEmployees(..)) || 
      call(void model.EmployeeDatabase.load(..)) || 
      call(void model.EmployeeDatabase.delete(..)) || 
      call(void model.EmployeeDatabase.save(..)) || 
      call(boolean model.EmployeeDatabase.validateFullName(..)) || 
      call(int model.EmployeeDatabase.maxNumEmployee(..)) || 
      call(boolean model.EmployeeDatabase.validateDeleteEmployee1(..)) || 
      call(boolean model.EmployeeDatabase.validateDeleteEmployee2(..)) || 
      call(void model.EmployeeDatabase.loadEmployee(..)) || 
      call(ArrayList<model.Employee> model.EmployeeDatabase.loadSupervisors(..)) || 
      call(void model.ModuleDatabase.saveModules(..)) || 
      call(java.lang.String[] model.ModuleDatabase.getModules(..)) || 
      call(java.lang.String[][] model.ModuleDatabase.getSubModules(..));
   
   before(): databaseMethods()
   {
      // Obtain the Caller Class Object
	  try
	  {
         callerClassObj1 = thisEnclosingJoinPointStaticPart.getSignature().getDeclaringType();
	  }
	  catch(Exception e1)
      {
         errorMessage1 = e1.getMessage();
         errorMessage2 = "Error FRL: Occurred while getting the Caller Class Object 1." + System.lineSeparator();
         errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
      }
	  
      // Get the Caller Class Details
      try
      {
         getCallerClassDetails(callerClassObj1);
      }
      catch(Exception e2)
      {
         errorMessage1 = e2.getMessage();
         errorMessage2 = "Error FRL: Occurred while getting the Caller Class Details." + System.lineSeparator();
         errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
      }

      // Obtain the Callee Class Object
      try
      {
         calleeClassObj1 = thisJoinPoint.getTarget().getClass();
      }
	  catch(Exception e3)
      {
         errorMessage1 = e3.getMessage();
         errorMessage2 = "Error FRL: Occurred while getting the Callee Class Object 1." + System.lineSeparator();
         errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
      }
	    
      // Validate the callee Class Object 1 that is not null
      if(calleeClassObj1 != null)
      {	 
    	 // Get the Callee Class Details 
    	 try
    	 {
            getCalleeClassDetails(calleeClassObj1);
    	 }
    	 catch(Exception e4)
         {
            errorMessage1 = e4.getMessage();
            errorMessage2 = "Error FRL: Occurred while getting the Callee Class Details." + System.lineSeparator();
            errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
         }	 
      }
      else
      {	  
         calleeClass = "Unknown";
      }  
        
      // Get the details of the Method being executed
      method        = thisJoinPoint.getSignature();
      packageMethod = method.getDeclaringType().getPackage().toString();
      packageMethod = packageMethod.replace("package ","");  
      classMethod   = method.getDeclaringType().getSimpleName();
      nameMethod    = method.getName();
      methodArgs    = thisJoinPoint.getArgs();
      fullMethod	= nameMethod + startParameters;
      
      // Build the full Method Name
      fullMethodName = packageMethod + "." + classMethod + "." + nameMethod;
      
      // Validate if we are executing the first connect project method
      if(fullMethodName.equals(connectProjectMethod))
      { 
         try
         {
            userConnection();
            assignUser();
            
            if(currentUser.equals("Unknown") == true || userCounter == 1 )
            { 	
               currentUser = defaultUser;
            }
         }
         catch(Exception e1)
         {
            errorMessage1 = e1.getMessage();
            errorMessage2 = "Error FRL: Occurred while adding an indication of the connection Method." + System.lineSeparator();
            errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
         }  
      }
      
      /* Validate if the CallerClass is a Graphical User Interface Class
         Build the Caller Class Line */
      if(callerGuiFlag == true)
      {	  
    	 // Build the method line 
         fullMethod = fullMethod + endParameters;
         
         if(currentUser.isEmpty() == true || currentUser == null)
            currentUser = "Unknown";
            
            // Build the note line
            note = startNote   + whiteSpaceWordsDelimiter1 + currentUser + whiteSpaceWordsDelimiter1 + colorDelimiter + colorNote + 
                   whiteSpaceWordsDelimiter1 + newLine1 + callerClass + 
                   newLine1 + endNote + newLine1;
            
         // Assign the value to the Caller Class
         if(currentUser.isEmpty() == false)
         {	 
            callerClass = currentUser;
            partOrder++;
            
            // Build the caller Class Line
            callerClassLine = member1 + whiteSpaceWordsDelimiter1  + callerClass + 
        		              whiteSpaceWordsDelimiter1 + position + whiteSpaceWordsDelimiter1 + partOrder;
         }   
         else
        	 callerClass = "Unknown";
      }   
      else
      {	  
    	 // Build the method line  
         fullMethod = fullMethod + Arrays.toString(methodArgs) + endParameters;
         
         // The note line will be empty
         note = "";
         
         // Validate that the Caller Class is EMPTY
         if(callerClass.isEmpty()== true)
         {	 
            callerClass = currentUser;
         }   
         
         partOrder++;
         
         // Build the caller Class Line
         callerClassLine = member2 + whiteSpaceWordsDelimiter1 + callerClass + 
        		           whiteSpaceWordsDelimiter1 + position + whiteSpaceWordsDelimiter1 + partOrder;
      }   
      
      if(calleeClass.isEmpty() == true) 
      {	  
         calleeClass = currentUser;
      }
      
      partOrder++;
      
      // Build the callee Class Line
      calleeClassLine = member2 + whiteSpaceWordsDelimiter1 + calleeClass + 
    		            whiteSpaceWordsDelimiter1 + position + whiteSpaceWordsDelimiter1 + partOrder;
      
      /* Validate if the Callee Class and Caller Class are Known,
         Then update the UML Sequence Diagram Text and Image Files    
         Generate the Plant UML line to generate the UML Sequence Diagram Text File */
      if (currentUser.equals("Unknown") == false)
      {	
    	 // Update the Sequence Diagram Text File    	     	 
 	     updateSeqDiagTextFile(callerClass, calleeClass, fullMethod, note, callerClassLine, calleeClassLine);  
      } 
	        
   } 

   pointcut connect(): 
      call(boolean controller.UserController.validateUser(..))||
      call(model.UserLevel model.UserDatabase.getUserLevel(..));
   	            
   after() returning(Object methodReturnValue1): connect() && args(..)
   {  
      Object[] parameterValues;
      String currentMethod="", currentValue="", methodValues="";
      int i=0;
      
      try
      {
    	 // Current executed Method
         method = thisJoinPoint.getSignature();
         
         // Get the Information about the Parameters: Names and Types	  
	     parameterValues = thisJoinPoint.getArgs();
	  
	     // Assign String values to variables
	     currentMethod = method.toString();
	  
	     // Get the List of return values for this Connect Method
	     methodValues = connectProjectMethodReturnValue1.toString();

	     if(currentMethod.contains(connectProjectMethod1))
         {	  
            if(connectProjectMethodType1.equals("Parameter"))
        	{
               for(i = 0; i < parameterValues.length; i++)
               {	   
                  currentValue = parameterValues[i].toString();
               }   
               
               if(methodValues.contains(currentValue))
               {
                  assignUser();
                  connectionFlag = true;
                  userCounter++; 
               }
               else
               {	
                  currentUser = defaultUser;
               }
            }    
            else 
               if(connectProjectMethodType1.equals("ReturnType"))
               {
                  currentValue = methodReturnValue1.toString();
                  
                  if(methodValues.contains(currentValue))
                  {
                     assignUser();   
                     connectionFlag = true;
                     userCounter++; 
                  }
                  else
                  {	
                     currentUser = defaultUser;
                  }	
               }
               else
            	   if(connectProjectMethodType1.equals("Method"))
                   {
            	      assignUser();   
                      connectionFlag = true;
                      userCounter++; 
                   }
            } 
            else
               if(currentMethod.contains(connectProjectMethod) && connectionFlag == false)
               { 
                  currentValue = methodReturnValue1.toString();
                   
                  userCounter = 1;
                  currentUser = defaultUser;
                  assignUser();
               }
            
           }
           catch(Exception e2)
	       {
	          errorMessage1 = e2.getMessage();
              errorMessage2 = "Error FRL: Occurred while getting the Details of the Connection Method." + System.lineSeparator();
              errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
	       } 
      
   }
   
   public void assignUser()
   {
      currentUser = userName + validSpecialCharacter + userCounter;
   }

   public void userConnection()
   {
   	  methodsCounter = 0;
      line    = "";
      content = "";
      
      // Add a division in the UML Sequence Diagram Text File  
      line = startDivision + whiteSpaceWordsDelimiter1 + 
             projectName   + whiteSpaceWordsDelimiter1 + 
             endDivision   + newLine1;

      content = content + line;

      content = String.format(content);
      
      // Write this division into the UML Sequence Diagram Text File
      writeTextFile(umlSeqDiagTextFile, content);
   }
   
   public void updateSeqDiagTextFile(String inputCallerClass, String inputCalleeClass, 
		                             String inputMethod, String inputNote, String inputCallerClassLine,
		                             String inputCalleeClassLine)
   {
      line    = "";
      content = "";
      
      /* Generating the content of the Text File which contains Plant UML instructions
         to generate the UML Sequence Diagram */
      line    = inputCallerClassLine + newLine1;
      content = content + line;
      
      line    = inputCalleeClassLine + newLine1;
      content = content + line;
      
      line    = inputNote;
      content = content + line;

      // Increase the methods Counter
      methodsCounter ++;
      
      line = inputCallerClass + whiteSpaceWordsDelimiter1 + startSendMessage + 
    		 inputCalleeClass + endSendMessage            + whiteSpaceWordsDelimiter1 + 
    		 methodsCounter   + objectOrientedDelimiter1  + inputMethod + newLine1;
      content = content + line;     
      
      line    = space + newLine1;
      content = content + line;
      
      content = String.format(content);

      // Write the Plant Uml Line into the UML Sequence Diagram Text File
      writeTextFile(umlSeqDiagTextFile, content);   
   } 
   
   public void writeTextFile(String textfile, String content)
   {
      FileWriter fw = null;
      BufferedWriter bw;
      File file;

      try
      {
         // Create a new textFile
         file = new File(textfile);

         if(file.exists())
         {
            fw = new FileWriter(file,true);
            bw = new BufferedWriter(fw);

            // Write in the textFile
            fw.append(content);

            // Close the textFile
            bw.close();
         }
         
      }
      catch(Exception e1)
      {
         errorMessage1 = e1.getMessage();
         errorMessage2 = "Error FRL: Occurred while opening the UML Sequence Diagram Text File: " + umlSeqDiagTextFile + System.lineSeparator();
		 errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
		 System.out.println(errorMessage2);
      }
   }  
   
   public boolean validateSuperClass(String inputSuperClass)
   {
      String inputGuiLibStr, lib;
      String [] guiLibsArray; 
      int c=0;
      boolean guiFlag = false;	

      inputGuiLibStr = guiLibs;
   
      // Get the Array from the Input GUI Library String
      guiLibsArray = inputGuiLibStr.split(guiLibDelimiter); 
   
      while(c < guiLibsArray.length && guiFlag == false)
      {
         lib = guiLibsArray[c];
         
         // Validate if the inputSuperClass contains the current Library prefix
	     if(inputSuperClass.contains(lib))
	        guiFlag = true;	
	  
	     c++;
      } 
   
      return guiFlag;   
   }  

   public String getSuperClass(Class<?>  inputClass)
   {
      // Obtain the Class and SuperClass of the current Method Body File
      String superClass = "";
		  		  		  
      // Get the superclass from the class
      Class<?> superclz = inputClass.getSuperclass();
      superClass = superclz.toString();
   
      return superClass;  
   }

   public Class<?> getUpdatedClass(String inputClass)
   {
      Class<?> classObj = null;
	
      try 
      {
         classObj = Class.forName(inputClass);
      } 
      catch (ClassNotFoundException e1) 
      {
         errorMessage1 = e1.getMessage();
	     errorMessage2 = "Error FRL: Occurred while creating a New Class." + System.lineSeparator();
		 errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
		 System.out.println(errorMessage2);
      }
	
      return classObj;	
   }
   
   public String validateClass(String inputClass)
   {
      String outputClass = inputClass, element1, searchWhiteSpace="\\s+";	
      String[] elements;
   
      // Replace the bluePrintObject: "class" for ""
      if(outputClass.contains(bluePrintObject1))
         outputClass = outputClass.replace(bluePrintObject1,"");
	
      // Remove the WhiteSpaces from the beginning of the string
      outputClass = outputClass.replaceFirst(searchWhiteSpace, "");
   
      // Replace the specialCharacter1:"$" for "_"
      if(outputClass.contains(invalidSpecialCharacter))
      {	   
	     // Replace the dollarDelimiter:"$" for "_"
         outputClass = outputClass.replace(invalidSpecialCharacter, validSpecialCharacter);

	     // Divide the string in two parts using the "_" delimiter
         elements = outputClass.split(validSpecialCharacter); 
      
         // Get the first part
  	     element1 = elements[0];
         outputClass = element1;
      
      }   
   
      return outputClass;
   }
   
   public void getCalleeClassDetails(Class<?> calleeClassObj0)
   {
	  // Get the calleeClass 
      calleeClass = calleeClassObj0.toString();

	  // Validate the calleeClass
	  calleeClass = validateClass(calleeClass);

	  //Get the Updated Object Class 
	  calleeClassObj2 = getUpdatedClass(calleeClass);

	  //Get the superClass of the caller Class
	  calleeSuperClass = getSuperClass(calleeClassObj2);
	
	  // Get the flag of the callerSuperClass GUI
	  calleeGuiFlag = validateSuperClass(calleeSuperClass);

	  // Validate if callerSuperClass corresponds to GUI
	  if(calleeGuiFlag == true)
	  {
	     calleeType = member1;
	  }
	  else
	     calleeType = member2;
   }
   
   public void getCallerClassDetails(Class<?> callerClassObj0)
   {  
      // Get the caller Class
      callerClass = callerClassObj0.toString();

	  // Validate the caller Class
	  callerClass = validateClass(callerClass);

	  // Get the Updated Object Class 
	  callerClassObj2 = getUpdatedClass(callerClass);

	  // Get the superClass of the caller Class
	  callerSuperClass = getSuperClass(callerClassObj2);

	  // Get the flag of the callerSuperClass GUI
	  callerGuiFlag = validateSuperClass(callerSuperClass);

	  // Validate if callerSuperClass corresponds to GUI
	  if(callerGuiFlag == true)
	  {	
	     callerType = member1;
	  }
	  else
	     callerType = member2;
   }
   
}

package frl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.LineNumberReader;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

import net.sourceforge.plantuml.GeneratedImage;
import net.sourceforge.plantuml.SourceFileReader;

public aspect FrlStart
{
   String projectOutputDir="C:\\Users\\friverao\\eclipse-workspace\\Directories\\Output\\";
   String umlSeqDiagTextFileName1="IncidentSequenceDiagram.txt";
   String umlSeqDiagPngFileName1="IncidentSequenceDiagram.png";
   
   String newLine1="%n";
   String startUMLSeqDiagram="@startuml";
   String endUMLSeqDiagram="@enduml";
   String umlSeqDiagTextFileName2="IncidentSequenceDiagramTEMPORAL.txt";
   
   String startDivision="== Authenticates to the";
   String startSendMessage="->";
   String endSendMessage=":";
   String objectOrientedDelimiter1=".";
   String objectOrientedDelimiter2="~";
   String position="order";

   String umlSeqDiagTextFile=projectOutputDir + umlSeqDiagTextFileName1;
   String umlSeqDiagPngFile=projectOutputDir  + umlSeqDiagPngFileName1;
   String method, content="";
   
   int lines=0; 
   String umlSeqDiagTextFile2=projectOutputDir + umlSeqDiagTextFileName2;
   File inputFile  = new File(umlSeqDiagTextFile);
   File outputFile = new File(umlSeqDiagTextFile2);
   String errorMessage1="", errorMessage2="";
   
   /* Evaluation Start */
   long time1, time2, duration;
   /* Evaluation End */
   
   pointcut start(): 
      execution(void org.isf.menu.gui.Menu.main(..));

   after(): start()
   {
      /* Evaluation Start */
	  // Send the Output of the Screen into a File 
	  PrintStream out = null;
	  try 
	  {
	     out = new PrintStream(new FileOutputStream(projectOutputDir + "Console_Output.txt"));
	  } 
	  catch (FileNotFoundException e) 
	  {
	     e.printStackTrace();
	  }
		  
	  System.setOut(out);
		  
	  System.out.println("Message FRL: Welcome to the Forensic-Ready Logger ...");
	  	   
	  // Delete UML Sequence Diagram previous Files
	  deleteFiles();
	  
	  /* Evaluation Start (TIME 1) */
	  time1 = System.currentTimeMillis();
	  /* Evaluation End */
	  
	  // Create a new UML Sequence Diagram Text File
	  createSeqDiagramTextFile(umlSeqDiagTextFile);
	  
	  /* Evaluation Start (TIME 2) */
	  time2 = System.currentTimeMillis();
	  duration = time2 - time1;
	  System.out.println("Message FRL: The UML Sequence Diagram FILES were CREATED in =>: " + duration + " milliseconds");      
	  /* Evaluation End */
   }
   
   pointcut end(): 
      call(void exit(..));
   	                      
   before(): end()
   {
      /* Evaluation Start (TIME 1) */
	  time1 = System.currentTimeMillis(); 
	  /* Evaluation End */ 
		  
      // Create and update the UML Sequence Diagram Files 
      updateFiles();
      
	  /* Evaluation Start (TIME 2) */
	  time2 = System.currentTimeMillis();
	  duration = time2 - time1;
	  System.out.println("Message FRL: The UML Sequence Diagram FILES were FINISHED in =>: " + duration + " milliseconds");      
	  /* Evaluation End */
      
	  String replaceUser = umlSeqDiagTextFile.replace("friverao", "f7");
	  
	  System.out.println("Message FRL: UML Sequence Diagram Text File created  : "+replaceUser);
	  replaceUser = umlSeqDiagPngFile.replace("fannyriveraortiz", "f7");
	  System.out.println("Message FRL: UML Sequence Diagram Image File created : " + replaceUser);
      
      /*System.out.println("Message FRL: UML Sequence Diagram Text File created  : " + umlSeqDiagTextFile);
      System.out.println("Message FRL: UML Sequence Diagram Image File created : " + umlSeqDiagPngFile);*/
      System.out.println("Message FRL: Good Bye to the Forensic-Ready Logger.");
   }
   
   public void deleteSeqDiagramFile(String fileName)
   {
      File file;
      
      file = new File(fileName);
      
      // Delete an existing UML Sequence Diagram File
	  if(file.exists() && !file.isDirectory()) 
	     file.delete();  
	  else
		  file = new File(fileName);
   }
   
   public void deleteFiles()
   {
      // Delete UML Sequence Diagram Text File
	  deleteSeqDiagramFile(umlSeqDiagTextFile);
	  
	  // Delete UML Sequence Diagram Image File
      deleteSeqDiagramFile(umlSeqDiagPngFile); 
   }
   
   public void writeTextFile(String textFile, String content)
   {
      FileWriter fw = null;
      BufferedWriter bw;
      File file;

      try
      {
         // Create a new textFile
         file = new File(textFile);

         // Validate if the textFile exists
         if (!file.exists()) 
         {
            file.createNewFile();
            fw = new FileWriter(file.getAbsoluteFile());
         }
         else
            fw = new FileWriter(file, true);
         
         bw = new BufferedWriter(fw);

         // Write in the textFile
         fw.append(content);

         // Close the textFile
         bw.close();
         
      }
      catch(Exception e1)
      {
         errorMessage1 = e1.getMessage();
         errorMessage2 = "Error FRL: Occurred while opening the UML Sequence Diagram Text File: " + textFile + System.lineSeparator();
         errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
         System.out.println(errorMessage2);
      }   
   }  
   
   public void createSeqDiagramTextFile(String textFile)
   {
      content = "";

      // Plant UML Instructions
      content = startUMLSeqDiagram + newLine1;
      content = content + "skinparam backgroundColor #EEEBDC"   + newLine1;
      content = content + "skinparam sequence {"                + newLine1;
      content = content + "ArrowColor DarkBlue"                 + newLine1;
      content = content + "ActorBorderColor DarkBlue"           + newLine1;
      content = content + "LifeLineBorderColor blue"            + newLine1;
      content = content + "LifeLineBackgroundColor DarkBlue"    + newLine1;
      content = content + "ParticipantBorderColor DarkBlue"     + newLine1;
      content = content + "ParticipantBackgroundColor DarkBlue" + newLine1;
      content = content + "ParticipantFontName Impact"          + newLine1;
      content = content + "ParticipantFontSize 17"              + newLine1;
      content = content + "ParticipantFontColor #A9DCDF"        + newLine1;
      content = content + "ActorBackgroundColor DarkBlue"       + newLine1;
      content = content + "ActorFontColor DarkBlue"             + newLine1;
      content = content + "ActorFontSize 17"                    + newLine1;
      content = content + "ActorFontName Aapex"                 + newLine1;
      content = content + "}"                                   + newLine1;
         
      content = String.format(content);
      
      // Write the Plant Uml Lines into the UML Sequence Diagram Text File
	  writeTextFile(textFile, content); 
   }

   public void createSeqDiagramPngFile(String textFile)
   {
      File file1 = new File(textFile); 
	  SourceFileReader reader = null;
	  List<GeneratedImage> list = null;
	  
	  // Create the Reader of the UML Sequence Diagram Text File
	  try 
	  {
	     reader = new SourceFileReader(file1);
	  } 
	  catch (IOException e1) 
	  {
	     errorMessage1 = e1.getMessage();
	     errorMessage2 = "Error FRL: Occurred while reading the UML Sequence Diagram Text File: " + textFile + System.lineSeparator();
	     errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
         System.out.println(errorMessage2);
	  }
	   
	  // Generate the list of images using the Sequence Diagram Text File
	  try 
	  {
	     list = reader.getGeneratedImages();
	  } 
	  catch (IOException e2) 
	  {
	     errorMessage1 = e2.getMessage();
		 errorMessage2 = "Error FRL: Occurred while generating the UML Sequence Diagram Image File." + System.lineSeparator();
		 errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
         System.out.println(errorMessage2);
	  }
	   
	  // Generated the UML Sequence Diagram Image File in a PNG Image File
	  file1 = list.get(0).getPngFile();
	  
   }
   
   public void countLinesTextFile()
   {
		try 
		{
			LineNumberReader lineNumberReader = new LineNumberReader(new FileReader(umlSeqDiagTextFile));
			lineNumberReader.skip(Long.MAX_VALUE);
			lines = lineNumberReader.getLineNumber();
			lineNumberReader.close();
		} 
		catch (Exception e1) 
		{
		   errorMessage1 = e1.getMessage();
		   errorMessage2 = "Error FRL: Occurred while counting the lines of the UML Sequence Diagram Text File." + System.lineSeparator();
		   errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
	       System.out.println(errorMessage2);
		}		
   }
   
   public  void deleteLineTextFile(String inputString) throws Exception
   {
	  String line="";
	  int c=0;
	  
	  try 
	  {
	     try (BufferedReader reader = new BufferedReader(new FileReader(inputFile));
		    		
		    BufferedWriter writer = new BufferedWriter(new FileWriter(outputFile))) 
		 {
		
		    while ((line = reader.readLine()) != null) 
		    {
		       c++;
		       
		       if(c != lines)
		       {	
		          if (!line.equals(inputString)) 
		          {
		             writer.write(line);
		             writer.newLine();
		          }
		       }
		       else
		       {		
		          writer.write(line);
	              writer.newLine();
		       }   
		    }
		 }
		 catch (Exception e1) 
		 {
		    errorMessage1 = e1.getMessage();
			errorMessage2 = "Error FRL: Occurred while writing a new UML Sequence Diagram Text File without double @enduml instructions." + System.lineSeparator();
		    errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
		    throw new Exception(errorMessage1);
		 }

		 if (inputFile.delete()) 
		 {
		    // Rename the output file to the input file
		    if (!outputFile.renameTo(inputFile)) 
		    {
		       errorMessage1 = "Error FRL: Ocurred while renaming the File: " + umlSeqDiagTextFile2 + " to " + umlSeqDiagTextFile;	
		       throw new Exception(errorMessage1);
		    }
		 } 
		 else
		 {
	        errorMessage1 = "Error FRL: Ocurred while deleting the File: " + umlSeqDiagTextFile;
		    throw new Exception(errorMessage1);
		 }
	  } 
	  catch (Exception e2) 
	  {
	     errorMessage1 = e2.getMessage();
	     errorMessage2 = "Error FRL: Occurred while deleting or renaming the new UML Sequence Diagram Text File without double @enduml instructions." + System.lineSeparator();
	     errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
	     throw new Exception(errorMessage2);
      }
   }

   public void changeMethodStepOrder()throws Exception
   {
	  String currentLine="", newLine="", intermLine="", methodName="", delimiter="", actor1="", actor2="", userName="";
	  int order=0, methodNumber=0, endOrderPos=0, endMessagePos=0, lineNumber=0, userLine=0;
	  String[] parts;
	  ArrayList<String> userList = new ArrayList<>();
	  boolean userFlag=false;
	  
	  delimiter="\\" + objectOrientedDelimiter1;
	  actor1="actor";
	  actor2="participant";
	  
	  try 
	  {
	     try ( BufferedReader reader = new BufferedReader(new FileReader(inputFile));
		    		
		       BufferedWriter writer = new BufferedWriter(new FileWriter(outputFile))) 
		    		
		 {
		    while ((currentLine = reader.readLine()) != null) 
		    {
	           if (currentLine.contains(startDivision))
	           {
	              userFlag = true;
	              userLine = lineNumber + 1;
	              
	              // Assign the content to the newLine variable 
	              newLine = currentLine;
	           }
		       else 
		    	  if(userFlag == true && lineNumber == userLine)
		    	  {
		    		 // Validate the currentLine contains actor and order strings 
		    		 if(currentLine.contains(actor1) && currentLine.contains(position)) 
		    		 {	 
		    	        // Obtain the UserName 
		    		    endOrderPos = currentLine.indexOf(position);      
		    		    intermLine = currentLine.substring(0, endOrderPos);
			            
			            parts = intermLine.split(actor1);
			            userName = parts[1];
			            userName = userName.trim();
			            userFlag = false;
			            
			            if(userList.contains(userName) == false)
			            {
			               userList.add(userName);
			               methodNumber=0;
			            }			            
		    		 }
		    		 
		    		 // Assign the content to the newLine variable 
		    	     newLine = currentLine;
		    	  }
	           
		          // Verify if the currentLine contains the String "order"
		    	  if ( (currentLine.contains(actor1) || (currentLine.contains(actor2) ) &&
		    	       (currentLine.contains(position) == true))) 
		          {
		             order ++; 
		             endOrderPos = currentLine.indexOf(position);      
		             parts = currentLine.split(position);
		             newLine = currentLine.substring(0, endOrderPos);
		             
		             // Assign the content to the newLine variable 
		             newLine = newLine + position + " " + order;
		          }
		          else
		    	     // Verify if the currentLine contains the startSendMessage(->) and the endSendMessage(:) Strings
		             if (currentLine.contains(startSendMessage) && currentLine.contains(endSendMessage)) 
		             {
		                methodNumber++;		
		                endMessagePos = currentLine.indexOf(endSendMessage);  
		                parts = currentLine.split(endSendMessage);
		             
		                // Remove all the White Spaces from the beginning of the string
		                parts[1] = parts[1].trim();
		                
		                methodName = parts[1];
		                parts = methodName.split(delimiter);
		                methodName = parts[1];
		                newLine = currentLine.substring(0,endMessagePos);
		                
		                // Assign the content to the newLine variable 
		                newLine = newLine + endSendMessage + " " + methodNumber + objectOrientedDelimiter1 + methodName;
		             }
		             else
		             { 
		            	// Assign the content to the newLine variable 
		                newLine = currentLine;
		             }
	           
	              lineNumber++;
	              
	              // Write the newLine variable into the UML Sequence Diagram Text File
	              writer.write(newLine);
	              writer.newLine();
		    }
		    
		 }
		 catch (Exception e1) 
		 {
		    errorMessage1 = e1.getMessage();
			errorMessage2 = "Error FRL: Occurred while Loading the UML Sequence Diagram Text File : " + System.lineSeparator();
			errorMessage2 = errorMessage2 + inputFile + System.lineSeparator();
		    errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
		    throw new Exception(errorMessage2);
		 }

		 if (inputFile.delete()) 
		 {
		    // Rename the output file to the input file
		    if (!outputFile.renameTo(inputFile)) 
		    {
		       errorMessage1 = "Error FRL: Ocurred while renaming the File: " + umlSeqDiagTextFile2 + " to " + umlSeqDiagTextFile;	
		       throw new Exception(errorMessage1);
		    }
		 } 
		 else
		 {
	        errorMessage1 = "Error FRL: Ocurred while deleting the File: " + umlSeqDiagTextFile;
		    throw new Exception(errorMessage1);
		 }
		 
	  } 
	  catch (Exception e2) 
	  {
	     errorMessage1 = e2.getMessage();
	     errorMessage2 = "Error FRL: Occurred while changing the order of Method Steps in the new UML Sequence Diagram Text File" + System.lineSeparator();
	     errorMessage2 = errorMessage2 + inputFile + System.lineSeparator();
	     errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
	     throw new Exception(errorMessage2);
      }
   }   
 
   public void updateFiles()
   {
	  // Update the UML Sequence Diagram Text File with the @endUml Instruction  
      content = endUMLSeqDiagram + newLine1;
      content = String.format(content);
      
      // Write the contents into the UML Sequence Diagram Text File
      writeTextFile(umlSeqDiagTextFile, content);
      
	  // Conting the number of lines of the UML Sequence Diagram Text File
	  countLinesTextFile();
	  
	  // Deleting the repeated @enduml instructions
	  try 
	  {
	     deleteLineTextFile(endUMLSeqDiagram);
	  } 
	  catch (Exception e1) 
	  {
	     errorMessage1 = e1.getMessage();
		 System.out.println(errorMessage1);
	  }
	  
	  // Change the Method Step Numbers and the Order Number
	  // In the Methods
	  try 
	  {
	     changeMethodStepOrder();
	  } 
	  catch (Exception e2) 
	  {
	     errorMessage1 = e2.getMessage();
		 System.out.println(errorMessage1);
	  }
	  
      // Create the UML Sequence Diagram Image File
   	  createSeqDiagramPngFile(umlSeqDiagTextFile);  
   }  
   
}

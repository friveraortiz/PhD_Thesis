package frl.process.generateLoggingInstructions;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;

import java.util.ArrayList;

import org.apache.commons.io.FileUtils;

import frl.controller.generateLoggingInstructions.AOPFinalFileController;
import frl.gui.generateLoggingInstructions.AOPFinalFileFormEvent;
import frl.model.configuration.ClassMethod;
import frl.model.configureAspectOrientedFiles.FieldType;
import frl.model.configureAspectOrientedFiles.PropertyType;
import frl.model.configureAspectOrientedFiles.TextFileDetails;
import frl.model.configureAspectOrientedFiles.TextFileProperties;
import frl.model.loadUMLSequenceDiagram.AnnotationType;
import frl.model.loadUMLSequenceDiagram.UMLSequenceDiagramFinal;

public class GenerateLoggingInstructions 
{

   public String generateAnnotationFile(String databaseConfigFile, AOPFinalFileFormEvent ev, 
                                        AOPFinalFileController aopFinalFileController) throws Exception
   {
      String errorMessage1="", errorMessage2="", projectName="", projectOutputDir="", 
	         annotationFilePrefix="", validSpecialCharacter="",
	     	 valueDelimiter="", endStatementDelimiter="", fullMethodName="", methodOwner="",  
	     	 methodShortName="", fullAnnotationCondition="", annotationElement1="", annotationOperator="", 
	     	 annotationElement2="", initialElement1="", finalElement1="", annotationFilePathName="", line="";
      
	  int c=0, projectId=0, length=0, methodCounter=0, lastDot=0;
	  AnnotationType annotationType;
	  String[] parts = new String[]{""};
	 	  
      File fout = null;
	  FileOutputStream fos = null;
	  BufferedWriter bw = null;
	 	  
	  ArrayList<UMLSequenceDiagramFinal> umlSeqDiagramFinalList = new ArrayList<UMLSequenceDiagramFinal>();

      // Get the values from the GUI
	  projectId                = ev.getProjectId();
	  projectName              = ev.getProjectName();
	  projectOutputDir         = ev.getProjectOutputDir();
	  annotationFilePrefix     = ev.getAnnotationFilePrefix();
	  validSpecialCharacter    = ev.getValidSpecialCharacter();
	  valueDelimiter           = ev.getValueDelimiter();
	  endStatementDelimiter    = ev.getEndStatementDelimiter();
	  
	  /*
	  System.out.println("Project Id                 : " + projectId);
	  System.out.println("Project Name               : " + projectName);
	  System.out.println("Project Input Dir          : " + projectInputDir);
	  System.out.println("Project Output Dir         : " + projectOutputDir);
	  System.out.println("Programming Language Id    : " + progrLanguageId);
	  System.out.println("Programming Language Name  : " + progLanguageName);
	  System.out.println("Object Oriented Delimiter1 : " + objectOrientedDelimiter1);
	  System.out.println("Data Type Full ClassName   : " + dataTypeFullClassName);
	  System.out.println("Data Type Short ClassName  : " + dataTypeShortClassName);
	  System.out.println("Data Type String List      : " + dataTypeStringList);
	  System.out.println("Data Type Number List      : " + dataTypeNumberList);
	  
	  System.out.println("Annotation File            : " + annotationFile);
	  System.out.println("Annotation File Prefix     : " + annotationFilePrefix);
	  System.out.println("Find White Spaces          : " + findWhiteSpaces);
	  System.out.println("Valid Special Character    : " + validSpecialCharacter);
	  System.out.println("Value Delimiter            : " + valueDelimiter);
	  System.out.println("End Statement Delimiter    : " + endStatementDelimiter);
	  */
	  
	  //System.out.println("*** Generate Annotation File Method ***");
	  
	  // Process 
	  try 
	  {
	     // Load the Annotations
	  	 umlSeqDiagramFinalList = aopFinalFileController.loadAnnotations(databaseConfigFile, projectId);
	  } 
	  catch (Exception e1) 
	  {
	     errorMessage1 = e1.getMessage();
         throw new Exception(errorMessage1);
	  }
	  	  
	  // Build the annotation File Path Name
	  annotationFilePathName = projectOutputDir + File.separator + projectName + validSpecialCharacter + annotationFilePrefix;
	  	  
	  
	  //System.out.println("Annotation File Path Name: " + annotationFilePathName);
	  	  
	  FileUtils.deleteQuietly(new File(annotationFilePathName));
	  	  
	  try 
	  {
	     fout = new File(annotationFilePathName);
	 	 fos  = new FileOutputStream(fout);
	 	 bw   = new BufferedWriter(new OutputStreamWriter(fos));

	     for (c = 0; c < umlSeqDiagramFinalList.size(); c++) 
	     {
	        annotationType          = umlSeqDiagramFinalList.get(c).getAnnotationType();
	        fullMethodName          = umlSeqDiagramFinalList.get(c).getLineType2(); 
	        methodOwner             = umlSeqDiagramFinalList.get(c).getDatumCategory2();
	        methodShortName         = umlSeqDiagramFinalList.get(c).getDatumValue();
	        fullAnnotationCondition = umlSeqDiagramFinalList.get(c).getAnnotationDetails();
	 	    annotationElement1      = umlSeqDiagramFinalList.get(c).getAnnotationElement1();
	 	    annotationOperator      = umlSeqDiagramFinalList.get(c).getAnnotationOperator();
	 	    annotationElement2      = umlSeqDiagramFinalList.get(c).getAnnotationElement2();
	 	 
	 	    methodCounter++;
	 	   	 
	 	    // Split the annotation Element between the whitespace
	 	    parts  = annotationElement1.split("\\s+");
	 	    length = parts.length;
	 	   		   	 
	 	    // Build the initialElement1
	 	    if(length > 1)
	 	       initialElement1 = parts[1];
	 	    else
	 	       initialElement1 = parts[0];
	 	   	
	 	    //System.out.println("Length(BLANKS): " + length);
	 	    //System.out.println("Parts: "+ java.util.Arrays.toString(parts));
	 	   
	 	    //System.out.println("Parts 0 : " + parts[0]);
	 	    //System.out.println("Parts 1 : " + parts[1]);
	 	    //System.out.println("Initial Element 1:" + initialElement1);
	 	   
            /*  
	 	    parts  = initialElement1.split("\\.");
	 	    length = parts.length;
	 	   	 
	 	    if(length > 1)
	           finalElement1 = parts[1];
	        else
	 	       finalElement1 = parts[0];
	 	    */   
	 	    
	 	    // Validate if there are any "."
	 	    parts  = initialElement1.split("\\.");
	 	    length = parts.length;
	 	   
	 	    // Build the finalElement1
	 	    if(length > 1)
	 	    {	
	 	       lastDot       = initialElement1.lastIndexOf(".") + 1; 
	 	       finalElement1 = initialElement1.substring(lastDot);
	 	    }
	 	    else
	 	       finalElement1 = parts[0];
	 	   	 	
	 	    /*ystem.out.println("Length(DOT): " + length);
	 	    System.out.println("Parts: "+ java.util.Arrays.toString(parts));
	 	    System.out.println("Final Element 1: " + finalElement1);
	 	    System.out.println("Last Dot: "+ lastDot);
	 	    System.out.println("Substring: " + initialElement1.substring(lastDot));
	 	   
	 	    System.out.println("Annotation Type   : " + annotationType);
	 	    System.out.println("Full Method Name  : " + fullMethodName);
	 	    System.out.println("Method Owner      : " + methodOwner);
	 	    System.out.println("Method Short Name : " + methodShortName);
	 	 
	 	    System.out.println("Full Annotation Condition: "+ fullAnnotationCondition);
	 	    System.out.println("Method Short Name    : " + methodShortName);
	 	    System.out.println("Annotation Element 1 : " + annotationElement1);
	 	    System.out.println("Annotation Element 2 : " + annotationElement2);
	 	    System.out.println("Final Element        : " + finalElement1);
	 	    */
	 	    
	 	    line = annotationType          + valueDelimiter + 
	 			   methodCounter           + valueDelimiter + 
	 	   	       fullMethodName          + valueDelimiter + 
	 	   	       methodOwner             + valueDelimiter + 
	 	   	       methodShortName         + valueDelimiter +
	 	   	       fullAnnotationCondition + valueDelimiter +
	 	   	       finalElement1           + valueDelimiter + 
	 	   	       annotationOperator      + valueDelimiter +
	 	   	       annotationElement2      + endStatementDelimiter + 
	 	   		   System.lineSeparator();
	 	   	 
	 	    //System.out.println("Line : " + line);
	 	   
	 	    // Write the line into the Annotations File
	 	    try 
	 	    {
	 	       bw.write(line);
	 	    } 
	 	    catch (Exception e3)
	 	    {
	 	       errorMessage1 = e3.getMessage();
		       errorMessage2 = "Error XXXX while creating the Annotation File: "+ annotationFilePathName + System.lineSeparator();
		       errorMessage2 = errorMessage2 + errorMessage1;
	 	       bw.close();
	 	       fos.close();
		       throw new Exception(errorMessage2);
	 	    } 

	     }
	       
	     try 
	     {
	        bw.close();
	        fos.close();
	     } 
	     catch (Exception e4) 
	     {
	        errorMessage1 = e4.getMessage();
		    errorMessage2 = "Error XXXX while closing the Annotation File: "+ annotationFilePathName + System.lineSeparator();
		    errorMessage2 = errorMessage2 + errorMessage1;
		    throw new Exception(errorMessage2);	
	      }
	   
	  } 
	  catch (Exception e2)
	  {
	     errorMessage1 = e2.getMessage();
	     errorMessage2 = "Error XXXX while opening the Annotation File: " + annotationFilePathName + System.lineSeparator();
	     errorMessage2 = errorMessage2 + errorMessage1;
 	     bw.close();
 	     fos.close();
	     throw new Exception(errorMessage2);
	  } 
	   
	   //System.out.println("The Following File was generated");
	   //System.out.println("Location: " + annotationFilePathName);
		  
      return annotationFilePathName;
   }
   
   
   public String generateFile(String directory, String fileName, String content) throws Exception
   {
      String errorMessage1="", errorMessage2="", 
	 	     filePathName="";
	  File fout = null;
	  FileOutputStream fos = null;
	  BufferedWriter bw = null;	  
	  	  
	  //System.out.println("Project Output Dir : " + projectOutputDir);
 
  	  filePathName = directory + File.separator + fileName;
  	  
  	  //System.out.println("Location: " + filePathName);
  	  
  	  FileUtils.deleteQuietly(new File(filePathName));
  	  
 	  try 
 	  {
 	     fout = new File(filePathName);
 	   	 fos  = new FileOutputStream(fout);
 	   	 bw   = new BufferedWriter(new OutputStreamWriter(fos));
 	  } 
 	  catch (Exception e1)
 	  {
	     errorMessage1 = e1.getMessage();	  
		 errorMessage2 = "Error XXXX while opening the Log4J Properties File: " + filePathName + System.lineSeparator();
		 errorMessage2 = errorMessage2 + errorMessage1;
		 fos.close();
		 bw.close();
		 throw new Exception(errorMessage2);	
 	  } 

 	  // Write the content of the Log4J Properties File
 	  try 
 	  {
 	     bw.write(content);
 	  } 
 	  catch (Exception e2)
 	  {
 	     errorMessage1 = e2.getMessage();		  
 		 errorMessage2 = "Error XXXX Ocurred while creating the File: " + filePathName + System.lineSeparator();
 		 errorMessage2 = errorMessage2 + errorMessage1;
 	     bw.close();
 	     fos.close();
 		 throw new Exception(errorMessage2);	
 	  } 
 	   	 
 	  try 
 	  {
 	     bw.close();
 	     fos.close();
 	  } 
 	  catch (Exception e3) 
 	  {
  	     errorMessage1 = e3.getMessage();		  
  		 errorMessage2 = "Error XXXX Ocurred while closing the File: " + filePathName + System.lineSeparator();
  		 errorMessage2 = errorMessage2 + errorMessage1;
  		 throw new Exception(errorMessage2);	
 	  } 
 	  
      return filePathName;	   
   }
   
   public String generateLogLibPropertesFile(String logDirectory, String outputDirectory) throws Exception
   {
      String errorMessage1="", fileName1="", content="", fileName2="";
	  
	  fileName1="log4j.properties";
	  
 	  content = "";
      content = "# Define the root logger with appender file" + System.lineSeparator();
      content = content + "log = " + logDirectory + System.lineSeparator();
      content = content + "log4j.rootLogger = ALL, file" + System.lineSeparator();
      content = content + "# Create a Daily Log File" + System.lineSeparator();
      content = content + "log4j.appender.file=org.apache.log4j.DailyRollingFileAppender" + System.lineSeparator();
      content = content + "log4j.appender.file.File=${log}/forensicReadyLogger_${current.date.time}.log" + System.lineSeparator();
      content = content + "log4j.appender.file.Append=true" + System.lineSeparator();
      content = content + "log4j.appender.file.layout=org.apache.log4j.PatternLayout" + System.lineSeparator();
      content = content + "log4j.appender.file.layout.ConversionPattern=%d{dd/MM/yyyy hh:mm:ss aa z} %-5p %c{1}:%L - %m%n";
	  
	  try
	  {
	     fileName2 = generateFile(outputDirectory, fileName1, content);
	  } 
	  catch (Exception e1) 
	  {
	     errorMessage1 = e1.getMessage();	  
	  	 throw new Exception(errorMessage1);
	  }   
	   
      return fileName2;  
   }
   
   
   public String createAnnotatedMethodList(int projectId, String databaseConfigFile, 
		                                   AOPFinalFileFormEvent ev, 
		                                   AOPFinalFileController aopFinalFileController) throws Exception
   {
      String methodList="", errorMessage1="", methodFullName="", line="", startCallMethod="", endCallMethod1="", 
    		 callMethodDelimiter="", guiLibDelimiter="", returnType1="", returnType2="", methodPrefixName="",
    		 value1="class", value2="ArrayList", value3="List", value4="<", value5=">";
      int c=0, length=0;
	  ArrayList<ClassMethod> classMethodList = new ArrayList<ClassMethod>();
      
	  //System.out.println("Inside createAnnotatedMethodList method ...");
	  
	  // Get the data from the GUI
	  startCallMethod     = ev.getStartCallMethod();
	  endCallMethod1      = ev.getEndCallMethod1();
	  callMethodDelimiter = ev.getCallMethodDelimiter();
	  guiLibDelimiter     = ev.getGuiLibDelimiter();
	  
	  //System.out.println("*** INSIDE THE Create Annotated Method List Method ***");
	  
	  // Load the Method Details from the Annotations
	  try 
	  {
	     classMethodList = aopFinalFileController.loadAnnotatedMethodsDet(databaseConfigFile, projectId);
	  } 
	  catch (Exception e1) 
	  {
	     errorMessage1 = e1.getMessage();	  
	  	 throw new Exception(errorMessage1);
	  }
	  
	  length = classMethodList.size() - 1;
	  //System.out.println("Lenght: " + length);
	  
	  if(classMethodList != null ) 
	  { 
	     for(c = 0; c < classMethodList.size(); c++)
		 {
	        
	        methodFullName   = classMethodList.get(c).getFullMethodName();
	        returnType1      = classMethodList.get(c).getReturnType1();
	        returnType2      = classMethodList.get(c).getReturnType2();
		    line             = "";	
		    methodPrefixName = "";
	        
		    /*
		    System.out.println("Counter            : " + c);
		    System.out.println("Method Full Name 1 : " + methodFullName);
		    System.out.println("Return Type 1      : " + returnType1);
		    System.out.println("Return Type 2      : " + returnType2);
		    */
		    
		    
		    if(methodFullName.contains(value1))
		    {
		       //System.out.println("The method contains a class data type");
		       methodFullName  = methodFullName.replace(value1, returnType2);
		    }

		    if(returnType1.contains(value2))
		    {
		       methodPrefixName  = returnType1 + value4 + returnType2  + value5;
		       
		       methodFullName  = methodFullName.replace(value2, methodPrefixName);
		    }
		    else
		    	 if( returnType1.contains(value3) )
		    	 {
		    	    methodPrefixName  = returnType1 + value4 + returnType2  + value5;
				       
				    methodFullName  = methodFullName.replace(value3, methodPrefixName);
		    	 }
		    
		    
		    /*System.out.println("Method Prefix Name : " + methodPrefixName);
		    
		    System.out.println("Method Full Name 2 : " + methodFullName);
		    */
	        
	        /*if(c == 0)
	        {	
	           line = "      " + startCallMethod + methodFullName + endCallMethod1 + callMethodDelimiter + System.lineSeparator();
	           
	           System.out.println("CASE 1");
	        }   
		    else
		       if(c < length)
		       {	   
	              line = "      " + startCallMethod + methodFullName + endCallMethod1 + callMethodDelimiter + System.lineSeparator();
	              System.out.println("CASE 2");
		       }
	        else
	        	if(c == length)
	        	{	
	 	           line = "      " + startCallMethod + methodFullName + endCallMethod1 + guiLibDelimiter;
	 	           System.out.println("CASE 3");
	        	}  */
	        
        	if(c == length)
        	{	
 	           line = "      " + startCallMethod + methodFullName + endCallMethod1 + guiLibDelimiter;
 	           //System.out.println("CASE 1");
        	} 
        	else
		       if(c < length)
		       {	   
	              line = "      " + startCallMethod + methodFullName + endCallMethod1 + callMethodDelimiter + System.lineSeparator();
	              //System.out.println("CASE 2");
		       }

	        
	        /*
	        System.out.println("Counter : "+ c);
	        */
	        
	        methodList = methodList + line;
	        
	        /*System.out.println("Line         : "+ line);
	        System.out.println("Method List 1: "+ methodList);*/
	        
		 }
	  }   
      
	  //System.out.println("Method List 2: "+ methodList);
	  
      return methodList;
	   
   }
   
   public String generateAOPFile(String databaseConfigFile, AOPFinalFileFormEvent ev, AOPFinalFileController aopFinalFileController) throws Exception
   {
      String errorMessage1="", errorMessage2="", lineText="", propertyName="", propertyValue="", propertyDataType="", line="",
    		 confPropertyName1="", content="", property="", findString="", assignValueDelimiter="",
    		 fileName1="", fileName2="", projectOutputDir="";
      
      //libDirectory="", 
      
      int headerId=0, linePropertyId=0, c=0, projectId=0;
	  FieldType lineType = null;
	  PropertyType propertyType = null;
	  TextFileProperties textFilePropertiesRecord = null;
	  ArrayList<TextFileDetails> textFileDetailsList = new ArrayList<TextFileDetails>();
	
	  // Get the data from the GUI
	  headerId             = 3;
	  projectId            = ev.getProjectId();
	  confPropertyName1    = ev.getConfPropertyName1();
	  findString           = ev.getFindString();
	  assignValueDelimiter = ev.getAssignValueDelimiter();
	  fileName1            = ev.getTextFileNameExt3();
	  projectOutputDir     = ev.getProjectOutputDir();
	  
	  //libDirectory         = ev.getLibDirectory();
	 
	  
	  //System.out.println("AOP Directory            : " + aOPDirectory);
	  //System.out.println("Project Output Directory : " + projectOutputDir);
	  
	  // Load the AOP Details
	  try 
	  {
	     textFileDetailsList = aopFinalFileController.loadAOPFileDetails(databaseConfigFile, headerId);
	  } 
	  catch (Exception e1) 
	  {
	     errorMessage1 = e1.getMessage();	  
	  	 throw new Exception(errorMessage1);
	  }
	  
	  if(textFileDetailsList != null ) 
	  {
	     for(c = 0; c < textFileDetailsList.size(); c++)
		 {
	        lineText   = textFileDetailsList.get(c).getText();
	        lineType   = textFileDetailsList.get(c).getType();
	        linePropertyId  = textFileDetailsList.get(c).getPropertyId();
	        
	        /*
		    System.out.println("");
			System.out.println("AOP Details"); 
	        System.out.println("Line Text    : " + lineText);
	        System.out.println("Line Type    : " + lineType);
	        
	        System.out.println("Project Id   : " + projectId);
	        System.out.println("Header Id    : " + headerId);
	        System.out.println("Line Prop Id : " + linePropertyId);
	        
	        */
	        
	        if(linePropertyId > 0)
	        {
	      	   // Load the AOP Properties
	      	   try 
	      	   {
	      	      textFilePropertiesRecord = aopFinalFileController.loadAOPFileProperties(databaseConfigFile, projectId, headerId, linePropertyId);
	      	   } 
	      	   catch (Exception e2) 
	      	   {
	      	      errorMessage1 = e2.getMessage();	  
	      	  	  throw new Exception(errorMessage1);
	      	   }
	      	   	      	 
	     	   if(textFilePropertiesRecord != null ) 
	    	   {
	     		  //System.out.println("Text File Properties Record is not null"); 
	     		  
	    	      propertyName     = textFilePropertiesRecord.getName();
	    	      propertyValue    = textFilePropertiesRecord.getValue(); 
	    	      propertyDataType = textFilePropertiesRecord.getDataType();
	    	      propertyType     = textFilePropertiesRecord.getType();
	    	     
	    	      /*
	    	      System.out.println("");
	    	      System.out.println("AOP Properties");
	    	     
	    	      System.out.println("Property Name      : " + propertyName);
	    	      System.out.println("Property Value     : " + propertyValue);
	    	      System.out.println("Property Data Type : " + propertyDataType);
	    	      System.out.println("Property Type      : " + propertyType);
	    	      */
	    	      
	    	   }
	     	   else
	     	   {
			      errorMessage1 = "Error XXXX: The details of the following text file property are NULL" + System.lineSeparator();
			      errorMessage2 = errorMessage1 + "Project Identifier: " + projectId + System.lineSeparator();
			 	  errorMessage2 = errorMessage1 + "Header Identifier: " + headerId + System.lineSeparator();
			 	  errorMessage2 = errorMessage2 + "Property Identifier: " + linePropertyId + System.lineSeparator();
			 	  throw new Exception(errorMessage2);	
	     	   }
	     	   
	        }
	        
	        line = "";
	        
	        // Build the line for the text
	        if(lineType.equals(FieldType.Fixed))
	           line = lineText;
	        else
	        {  
	           if(propertyType.equals(PropertyType.Attribute) )
	           {	
	              property = "";
	              
	              // Validate that property Value is not null or empty
	              if(propertyValue != null && !propertyValue.trim().isEmpty()) 
	              {	  
		             if(propertyValue.substring(0, 1).equals(findString)) 
			            propertyValue = propertyValue.replace(findString, findString+findString);
	              }
	              
	        	  if(propertyDataType.equals("String"))
	                 property = propertyName + assignValueDelimiter + "\"" + propertyValue + "\"";
	        	  else
	        		  property = propertyName + assignValueDelimiter + propertyValue;
	        	  
	              line = lineText.replace(confPropertyName1, property);
	              
	              //System.out.println("ORIGINAL Line: " + line);
	              
	              /*
	              if(propertyName.equals("annotationFile"))
	              {
	            	  line = line.replace(projectOutputDir + System.getProperty("file.separator"), libDirectory);
	            	  //System.out.println("MODIFIED Line =>:" + line);
	              }
	              */
	              
	              
	           }
	           else
	        	   if (propertyType.equals(PropertyType.Component))
	        	      line = lineText.replace(confPropertyName1, propertyValue);
	        	   else
	        		   if (propertyType.equals(PropertyType.Method))
	        		   {	 
	        		      line = createAnnotatedMethodList(projectId, databaseConfigFile, ev, aopFinalFileController);
	        		      //line = lineText.replace(confPropertyName1, line);
	        		   }   
	        }   
	        
	        //System.out.println("Line: " + line);
	        content = content + line + System.lineSeparator();
	        
	        	
	     }
	  }	
	  
	  try
	  {
	     fileName2 = generateFile(projectOutputDir, fileName1, content);
	  } 
	  catch (Exception e3) 
	  {
	     errorMessage1 = e3.getMessage();	  
	  	 throw new Exception(errorMessage1);
	  }
	  
	  return fileName2;
 
   }
   
   public String getNewDirectoryPath(String operatingSystem, String directory) throws Exception
   {
      String newValue="", findString="\\", propertyValue="", errorMessage1="", errorMessage2="";
      
      try 
      {
         // Windows Operating Systems 
	     if(operatingSystem.contains("Windows"))
	     {
	        if (!directory.endsWith(findString) ) 
	        {
	           // Append the file separator based on the operating system
	           directory = directory + findString;
	         } 
	         //System.out.println("Remote Output Dir 2: " + remoteOutputDir);
	         
	        propertyValue = directory;	
	         
	       if(propertyValue.contains(findString))
	       {
		      newValue = propertyValue.replace(findString, findString + findString);
		    }
	    }
	    else
	    { 
	       // Mac OSX and Linux Operating Systems 
	       if (!directory.endsWith(File.separator) ) 
	       {
	          // Append the file separator based on the operating system
	          directory = directory + File.separator;
	       } 
	         
	       //System.out.println("Remote Output Dir 2: " + remoteOutputDir);
	       propertyValue = directory;
		   newValue = propertyValue; 
	    }
     }
     catch (Exception e1) 
     {
        errorMessage1 = e1.getMessage();
    	errorMessage2 = "Error XXXX: Occurred while getting the new Path." + System.lineSeparator();
    	errorMessage2 = errorMessage2 + "Operating System: " + operatingSystem + System.lineSeparator();
    	errorMessage2 = errorMessage2 + "Directory: " + directory + System.lineSeparator();
 		errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
    	throw new Exception(errorMessage2);
 	 }
	  
      return newValue;	  
   }
   
   public String getNewFilePath(String operatingSystem, String directory, String file1) throws Exception
   {
      String errorMessage1="", errorMessage2="", newValue="", fileName="", errorMessage="";
      File file2;
      
      try
      {
         // Create a File object
         file2 = new File(file1);

         // Get the file name
         fileName = file2.getName();

      }   
      catch (Exception e1) 
      {
   	     errorMessage1 = e1.getMessage();
   		 errorMessage2 = "Error XXXX: Occurred while converting from a String dataype in a Path datatype." + System.lineSeparator();
   		 errorMessage2 = errorMessage2 + "Filename: " + fileName + System.lineSeparator();
		 errorMessage2 = errorMessage2 + "Error Message: " + errorMessage1;
   	     throw new Exception(errorMessage2);
	  }

      try
      {
         newValue = getNewDirectoryPath(operatingSystem, directory);
      }
      catch (Exception e1) 
      {
   	     errorMessage = e1.getMessage();
   	     newValue = "";
   	     throw new Exception(errorMessage);
	  }
      
      newValue = newValue + fileName;
            
      return newValue;	   
   }
   
   public String generateLoggingInstructions(String databaseConfigFile, 
		                                     String featuresConfigFile, 
		                                     AOPFinalFileFormEvent ev, 
                                             AOPFinalFileController aopFinalFileController)
   {
      String errorMessage="", projectOutputDir="", remoteOS="", remoteOutputDir="", logDirectory="", 
    		 libDirectory="", libFileName="", fileName="", propertyName="", propertyValue="";
      int projectId=0, headerId=0;
      
      System.out.println("Update the Project with the Logging Details ...");
      
      try 
	  {
         aopFinalFileController.updateProjectLoggingDetails(databaseConfigFile, ev);
	  } 
      catch (Exception e1) 
      {
   	     errorMessage = e1.getMessage();
   	     return errorMessage;
	  }
            
      System.out.println("Generating the files to create the Logging Instructions ...");

	  // Get the information to build the aspect file: FrlLoggingMethods.aj
      headerId  = 3;
      
      projectId        = ev.getProjectId();
      projectOutputDir = ev.getProjectOutputDir();
	  remoteOS         = ev.getRemoteOS();
	  remoteOutputDir  = ev.getRemoteOutputDir();
	  logDirectory     = ev.getLogDirectory();
	  libDirectory     = ev.getLibDirectory();
	  
	  /*
	  System.out.println("Information to generate the aspect file: FrlLoggingMethods.aj");
	  System.out.println("Project Id         : " + projectId);
	  System.out.println("Project Name       : " + projectName);
	  System.out.println("Project Output Dir : " + projectOutputDir);
	  System.out.println("Remote OS          : " + remoteOS);
	  System.out.println("Remote Output Dir  : " + remoteOutputDir);
	  System.out.println("Log Directory      : " + logDirectory);
	  System.out.println("Lib Directory      : " + libDirectory);
	  */
      // Generate the Annotation File
      try 
	  {
         fileName = generateAnnotationFile(databaseConfigFile, ev, aopFinalFileController);
	  } 
      catch (Exception e2) 
      {
   	     errorMessage = e2.getMessage();
   	     return errorMessage;
	  }
      
      System.out.println("The Annotation file was generated in:" + System.lineSeparator() + fileName);
            
	  propertyName = "annotationFile";
	  
	  // Get the path for the Annotation File which will be stored in the aspect file 
	  try
	  {
	     propertyValue = getNewFilePath(remoteOS, remoteOutputDir, fileName);
	  }
      catch (Exception e3) 
      {
   	     errorMessage = e3.getMessage();
   	     return errorMessage;
	  }

	  /*System.out.println("Property Name:  " + propertyName);
	  System.out.println("Property Value: " + propertyValue);
	  */
     
	  // Update the property name and property value in the text_file_property table
	  try 
	  {
	     aopFinalFileController.updateTextFileProperties(databaseConfigFile, projectId, headerId, propertyName, propertyValue);
	  } 
	  catch (Exception e4) 
	  {
	     errorMessage = e4.getMessage();
	     return errorMessage;
	  }  
	  
	  propertyName = "logFile";
	  
	  // Get the path for the Log4J.Properties File which will be stored in the aspect file 
	  try
	  {
	     propertyValue = getNewDirectoryPath(remoteOS, logDirectory);
	  }
      catch (Exception e5) 
      {
   	     errorMessage = e5.getMessage();
   	     return errorMessage;
	  }
	  
	  /*System.out.println("Property Name:  " + propertyName);
	  System.out.println("Property Value: " + propertyValue);
	  */
      
      // Generate the Log4J Properties File
      try 
	  {
         fileName = generateLogLibPropertesFile(propertyValue, projectOutputDir);
	  } 
      catch (Exception e6) 
      {
   	     errorMessage = e6.getMessage();
   	     return errorMessage;
	  }
      
      System.out.println("The Log4J properties file was generated in: " + System.lineSeparator() + fileName);
      
	  propertyName = "log4jConfPath";
	  libFileName  = "log4j.properties";
	  
	  // Get the path for the Log4J.Properties File which will be stored in the aspect file 
	  try
	  {
	     propertyValue = getNewDirectoryPath(remoteOS, libDirectory);
	  }
      catch (Exception e7) 
      {
   	     errorMessage = e7.getMessage();
   	     return errorMessage;
	  }
	  
	  propertyValue = propertyValue + libFileName;
	  
	  //System.out.println("Property Name:  " + propertyName);
	  //System.out.println("Property Value: " + propertyValue);
      
      
      // Update the property name and property value in the text_file_property table
	  try 
	  {
	     aopFinalFileController.updateTextFileProperties(databaseConfigFile, projectId, headerId, propertyName, propertyValue);
	  } 
	  catch (Exception e8) 
	  {
	     errorMessage = e8.getMessage();
	     return errorMessage;
	  }  
      
      // Generate the AOP Final File
      try 
	  {
         fileName = generateAOPFile(databaseConfigFile, ev, aopFinalFileController);
	  } 
      catch (Exception e9) 
      {
   	     errorMessage = e9.getMessage();
   	     return errorMessage;
	  }
      
      System.out.println("The AOP File was generated in: " + System.lineSeparator() + fileName);
      
      
      return errorMessage;
   }
}

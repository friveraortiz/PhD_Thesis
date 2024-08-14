package frl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Field;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.StringTokenizer;
import java.util.TimeZone;

import org.apache.log4j.Logger;
import org.aspectj.lang.Signature;
import org.aspectj.lang.reflect.CodeSignature;
import org.apache.log4j.PropertyConfigurator;

import java.util.List;

public aspect FrlLoggingMethods
{
   String annotationFile="/Users/f7/eclipse-workspace/Directories/Output/HRMApplication_Annotations.txt";
   String doNotLogAttributes="";
   String findWhiteSpaces="\\s+";
   String objectOrientedDelimiter1=".";
   String programmingLanguage="java";
   String dataTypeFullClassName="java.lang.Class";
   String dataTypeShortClassName="java.lang.";
   String log4jConfPath="/Users/f7/eclipse-workspace/HRMApplication/src/log4j.properties";
   
   ArrayList<String> dataTypeStringList=new ArrayList<>(Arrays.asList("java.lang.Character", "java.lang.String", "java.lang.Class", "java.lang.Boolean"));
   ArrayList<String> dataTypeNumberList=new ArrayList<>(Arrays.asList("java.lang.Integer", "java.lang.Float", "java.lang.Double", "java.lang.Long", "java.lang.Short"));
   ArrayList<String> annotationList = new ArrayList<String>();

   String errorMessage1="", errorMessage2="", methodPackageName="", methodClassName="", methodFullClassName1="", methodShortName="", 
		  methodFullName1="", methodFullName2="", methodReturnType="", methodPLReturnType="", methodCondition="", 
		  methodReturnTypeValueStr="", methodReturnTypeStr="",
		  annotationLine="", annotationType="", annotationMethodShortName="", annotationMethodFullName="", 
		  annotationCondition="", annotationMethodOwner="", annotationElement1="", annotationElement2="", annotationOperator="", 
		  annotationAttributeType="", annotationAttributePLType="", oSName="", oSUserName="", oSHostname="";
   
   String[] parameterNames;
   Class<?> methodFullClassName2=null;
   Class<?>[] parameterTypes;
   Object[] methodArgs, parameterValues;
   Signature method;
   
   int i=0, a=0, len=0, parameterCount=0, annotationMethodId=0, methodNumber=0, attributeNumber=0, subAttributeNumber=0;
   boolean addLog=false;

   Date date;
   DateFormat df1, df2;
   
   InetAddress oSIP;
   Logger log;
   
   /* Evaluation Start */
   long time1, time2, duration;
   /* Evaluation End */
   
   public boolean addNewLog(String dataTypeProgrLanguage1, String value1, String value2, String operator)
   {   
      int integerValue1=0, integerValue2=0;
      float floatValue1=0, floatValue2=0;
      double doubleValue1=0, doubleValue2=0;
      long longValue1=0, longValue2=0;
      short shortValue1=0, shortValue2=0;

      String dataTypeProgrLanguage2="";
      Boolean logFlag = false;
      
      // Compare if the Data Type Programming Language is a String, boolean or a Class
      if(dataTypeStringList.contains(dataTypeProgrLanguage1))
	  {
	     if(operator.equals("="))
		 {	   
		    if (value1.equals(value2) == true)
		       logFlag = true;
	    	else
	    	   logFlag = false;
		  }   
		  else
		     if(operator.equals("!="))
		     {
	    	    if (value1.equals(value2) == false)
	    	    {	
	    	       logFlag = true;
        	    }   
	    	    else
	    	    {	
	    	       logFlag = false; 
	    	    }   
		     }
	  }
      else
    	 // Compare if the Data Type Programming Language is a Numeric Data Type
         if(dataTypeNumberList.contains(dataTypeProgrLanguage1))
    	 {
            dataTypeProgrLanguage2 = dataTypeProgrLanguage1.replace(dataTypeShortClassName, "");

        	switch (dataTypeProgrLanguage2) 
        	{
        	   case "Integer":
        	      integerValue1 = Integer.parseInt(value1);
        		  integerValue2 = Integer.parseInt(value2);
        	   break;
        	   
        	   case "Float":
         	      floatValue1 = Float.parseFloat(value1);
         		  floatValue2 = Float.parseFloat(value2);
         	   break;
         	   
           	   case "Double":
          	      doubleValue1 = Double.parseDouble(value1);
          		  doubleValue2 = Double.parseDouble(value2);
          	   break;
          	   
           	   case "Long":
           	      longValue1 = Long.parseLong(value1);
           		  longValue2 = Long.parseLong(value2);
           	   break;
           	   
          	   case "Short":
                  shortValue1 = Short.valueOf(value1);
            	  shortValue2 = Short.valueOf(value2);
               break;
               
        	}
            
            if(operator.equals("="))
            {
               switch (dataTypeProgrLanguage2) 
               {
                  case "Integer":
            	     if(integerValue1 == integerValue2)
            	        logFlag = true;
            	     else
            	        logFlag = false;
            	  break;
            	   
            	  case "Float":
             	     if(floatValue1 == floatValue2)
             	        logFlag = true;
             	     else
             	        logFlag = false;
             	  break;
             	   
               	   case "Double":
               	     if(doubleValue1 == doubleValue2)
              	        logFlag = true;
              	     else
              	        logFlag = false;
              	   break;
              	   
               	   case "Long":
                      if(longValue1 == longValue2)
                   	     logFlag = true;
                   	  else
                   	     logFlag = false;
               	   break;
               	   
              	   case "Short":
                      if(shortValue1 == shortValue2)
                         logFlag = true;
                      else
                         logFlag = false;
                   break;
            	}
            	
            }
			else 
			   if(operator.equals("!="))
	               switch (dataTypeProgrLanguage2) 
	               {
	                  case "Integer":
	            	     if(integerValue1 != integerValue2)
	            	        logFlag = true;
	            	     else
	            	        logFlag = false;
	            	  break;
	            	   
	            	  case "Float":
	             	     if(floatValue1 != floatValue2)
	             	        logFlag = true;
	             	     else
	             	        logFlag = false;
	             	  break;
	             	   
	               	  case "Double":
	               	     if(doubleValue1 != doubleValue2)
	              	        logFlag = true;
	              	     else
	              	        logFlag = false;
	              	  break;
	              	   
	               	  case "Long":
	                     if(longValue1 != longValue2)
	                   	    logFlag = true;
	                   	 else
	                   	    logFlag = false;
	               	  break;
	               	   
	              	  case "Short":
	                     if(shortValue1 != shortValue2)
	                        logFlag = true;
	                     else
	                        logFlag = false;
	                  break;
	            	}
			   else 
			      if(operator.equals(">"))
		             switch (dataTypeProgrLanguage2) 
		             {
		                case "Integer":
		            	   if(integerValue1 > integerValue2)
		            	      logFlag = true;
		            	   else
		            	      logFlag = false;
		            	break;
		            	   
		            	case "Float":
		             	   if(floatValue1 > floatValue2)
		             	      logFlag = true;
		             	   else
		             	      logFlag = false;
		             	break;
		             	   
		               	case "Double":
		               	   if(doubleValue1 > doubleValue2)
		              	      logFlag = true;
		              	   else
		              	      logFlag = false;
		              	break;
		              	   
		               	case "Long":
		                   if(longValue1 > longValue2)
		                      logFlag = true;
		                   else
		                      logFlag = false;
		               	break;
		               	   
		              	case "Short":
		                   if(shortValue1 > shortValue2)
		                      logFlag = true;
		                   else
		                      logFlag = false;
		                break;
		             }
			      else
			         if(operator.equals("<"))
			            switch (dataTypeProgrLanguage2) 
			            {
			               case "Integer":
			                  if(integerValue1 < integerValue2)
			            	     logFlag = true;
			            	  else
			            	     logFlag = false;
			               break;
			            	   
			               case "Float":
			                  if(floatValue1 < floatValue2)
			             	     logFlag = true;
			             	  else
			             	     logFlag = false;
			               break;
			             	   
			               case "Double":
			                  if(doubleValue1 < doubleValue2)
			              	     logFlag = true;
			              	  else
			              	     logFlag = false;
			               break;
			              	   
			               case "Long":
			                  if(longValue1 < longValue2)
			                     logFlag = true;
			                  else
			                     logFlag = false;
			               break;
			               	   
			               case "Short":
			                  if(shortValue1 < shortValue2)
			                     logFlag = true;
			                  else
			                     logFlag = false;
			               break;
			            }
			    	 else
			    	    if(operator.equals(">="))
				           switch (dataTypeProgrLanguage2) 
				           {
				              case "Integer":
				                 if(integerValue1 >= integerValue2)
				            	    logFlag = true;
				            	 else
				            	    logFlag = false;
				              break;
				            	   
				              case "Float":
				                 if(floatValue1 >= floatValue2)
				             	    logFlag = true;
				             	 else
				             	    logFlag = false;
				              break;
				             	   
				              case "Double":
				                 if(doubleValue1 >= doubleValue2)
				              	    logFlag = true;
				              	 else
				              	    logFlag = false;
				              break;
				              	   
				              case "Long":
				                 if(longValue1 >= longValue2)
				                    logFlag = true;
				                 else
				                    logFlag = false;
				              break;
				               	   
				              case "Short":
				                 if(shortValue1 >= shortValue2)
				                    logFlag = true;
				                 else
				                    logFlag = false;
				              break;
				           }
			    	    else 
			    	       if(operator.equals("<="))
					           switch (dataTypeProgrLanguage2) 
					           {
					              case "Integer":
					                 if(integerValue1 <= integerValue2)
					            	    logFlag = true;
					            	 else
					            	    logFlag = false;
					              break;
					            	   
					              case "Float":
					                 if(floatValue1 <= floatValue2)
					             	    logFlag = true;
					             	 else
					             	    logFlag = false;
					              break;
					             	   
					              case "Double":
					                 if(doubleValue1 <= doubleValue2)
					              	    logFlag = true;
					              	 else
					              	    logFlag = false;
					              break;
					              	   
					              case "Long":
					                 if(longValue1 <= longValue2)
					                    logFlag = true;
					                 else
					                    logFlag = false;
					              break;
					               	   
					              case "Short":
					                 if(shortValue1 <= shortValue2)
					                    logFlag = true;
					                 else
					                    logFlag = false;
					              break;
					           }
    		  
    	 }
    	       
      return logFlag;
	   
   }
      
   public void getAnnotationFields(String line)
   {
      String tokenText="";
      StringTokenizer tokens;
      int tokenNumber=0;

	  // Constructor of the StringTokenizer class  
	  tokens = new StringTokenizer(line, ",;");
	  
	  // Checks if the tokens String has more tokens or not  
	  while (tokens.hasMoreTokens())   
	  {  
	     // Get the information from the Token
	     tokenText = tokens.nextToken();
	     tokenText = tokenText.trim();     
	     tokenNumber++;
	     
	     // Depending on the tokenNumber, it stores the tokenText into the appropriate field
	     switch(tokenNumber) 
	     {
	        case 1:
	           annotationType = tokenText;
	        break;
	        
	        case 2:
	           annotationMethodId = Integer.parseInt(tokenText);
	        break;
	        
	        case 3:
	           annotationMethodFullName = tokenText;
	        break;
	        
	        case 4:
	           annotationMethodOwner = tokenText;
	        break;
	        
	        case 5:
	           annotationMethodShortName = tokenText;
	        break;
	        
	        case 6:
	           annotationCondition = tokenText;
	        break;
	        
	        case 7:
		       annotationElement1 = tokenText;
		    break;
	        
	        case 8:
		       annotationOperator = tokenText;
		    break;
		    
	        case 9:
		       annotationElement2 = tokenText;
		    break;
	        
	     }

      }

   }
   
   public ArrayList<String> getAnnotationLines(String textFile, String method)
   {
      String line="";
      ArrayList<String> annotationList = new ArrayList<String>();
      BufferedReader br = null;
      File file;
      FileReader fr;
      
      try 
      {
         file = new File(textFile);
         fr   = new FileReader(file);
         br   = new BufferedReader(fr);
         
         while ((line = br.readLine()) != null) 
         {
            if(line.contains(method))
            {
               annotationList.add(line);
            }
         }
       }
       catch(IOException e1) 
       { 
          errorMessage1 = e1.getMessage(); 
          errorMessage2 = "Error XXXX: Occurred while loading the TextFile: " + System.lineSeparator();
          errorMessage2 = errorMessage2 + textFile + System.lineSeparator();
          errorMessage1 = errorMessage2 + errorMessage1;
          System.out.println(errorMessage1);
       }
       finally
       {
          try
          { 
             if (br != null)
                br.close(); 
          }
          catch(IOException e2)
          {
             errorMessage1 = e2.getMessage(); 
             errorMessage2 = "Error XXXX: Occurred while closing the TextFile: " + System.lineSeparator();
             errorMessage2 = errorMessage2 + textFile + System.lineSeparator();
             errorMessage1 = errorMessage2 + errorMessage1;
             System.out.println(errorMessage1);
          }
      }
      
      return annotationList;
   }
   
   public boolean attributeAnnotation(int attributeCount, 
		                              int parameterNumber,
		                              String parameterName,
                                      Class<?> parameterTypeFullName, 
		                              Object parameterValue, 
		                              String annotationType1, String annotationElementA, 
		                              Object methodReturnTypeValue1,
		                              String label)
   {
      String attributeShortName="", attributeTypeStr="", subAttributeName="", parameterType="", attributeTypePkgName="",  
    		 attributeTypeClassName1="", attributeTypeClassName2="", attributeValue1="";
      Object attributeValue=null;
      Class<?> attributeType=null, attributeTypeFullName=null;
      Field attributeFullName=null;
      int attributeNumber1=0, subAttributeCount=0, lastIndex=0; 
      boolean addLog1=false, subAttributeFlag=false, attributePrimitiveType=false, attributeClassType=false, attributeEnum=false;
      
      // Loop for the Attributes
      for (attributeNumber1=0; attributeNumber1 < attributeCount; attributeNumber1++)
      {
    	   // Get the information about the current attribute 
          attributeShortName      = parameterTypeFullName.getDeclaredFields()[attributeNumber1].getName();
          attributeType           = parameterTypeFullName.getDeclaredFields()[attributeNumber1].getType();
 		  attributeTypeClassName1 = parameterTypeFullName.getDeclaredFields()[attributeNumber1].getClass().toString();
          attributeTypeStr        = attributeType.toString(); 
          attributePrimitiveType  = attributeType.isPrimitive();
          attributeEnum           = attributeType.isEnum();
          
 		  if(attributePrimitiveType == false)
          {
 		     attributeTypePkgName = attributeType.getPackage().toString();
 			 attributeTypePkgName = attributeTypePkgName.replace("package ","");
		  }
		  else
		  {
		     attributeTypePkgName = attributeTypeClassName1.replace("class ","");
			 attributeTypePkgName = attributeTypePkgName.replace(".Class","");
		  }
		 
		  attributeTypeClassName2 = attributeTypePkgName + objectOrientedDelimiter1 + attributeShortName; 
		  
 		  // Determine if the parameter Data Type is a Personalized Class or any other DataType
 		  if( attributeEnum == true)
             attributeClassType = true;
 		  else	 
 		  {
 		     if(attributeTypeClassName2.contains(programmingLanguage) == false && 
 		        attributePrimitiveType == false)
 		    	attributeClassType = true;
 		     else
 		        attributeClassType = false;
 		  } 
         
          subAttributeName = "";
          subAttributeFlag = false;
          
          if(attributeTypeStr.contains("class"))
          {
             attributeTypeStr = attributeTypeStr.replace("class ","");
          }
          
	      try 
	      {
	         attributeFullName = parameterValue.getClass().getDeclaredField(attributeShortName);
		     attributeFullName.setAccessible(true);
	      } 
	      catch (Exception e1) 
	      {
	         errorMessage1 = e1.getMessage(); 
	         errorMessage2 = "Error XXXX: Occurred while getting the Attribute Full Name for the Attribute Short Name: " + System.lineSeparator();
	         errorMessage2 = errorMessage2 + attributeShortName + System.lineSeparator();
	         errorMessage1 = errorMessage2 + errorMessage1;
	         System.out.println(errorMessage1);
	      }  
	      
	      try 
	      {
	         attributeValue = attributeFullName.get(parameterValue);
	      } 
	      catch (Exception e2) 
	      {
	         errorMessage1 = e2.getMessage(); 
	         errorMessage2 = "Error XXXX: Occurred while getting the Attribute Value for the Parameter Value: " + System.lineSeparator();
	         errorMessage2 = errorMessage2 + parameterValue + System.lineSeparator();
	         errorMessage1 = errorMessage2 + errorMessage1;
	         System.out.println(errorMessage1);
	      }
	      
	      // Validate if the attribute has a Value
		  if(attributeValue != null)	  
	      {	   
	         annotationAttributeType = attributeValue.getClass().getName();
		     attributeValue1 = attributeValue.toString();  
	          
		     if(annotationAttributeType.contains(dataTypeShortClassName) == false)
		     {	 
		        annotationAttributePLType = dataTypeFullClassName;
		     } 	 
		     else
		        annotationAttributePLType = annotationAttributeType;
		    
		     if(annotationType1.equals("Method") == true || annotationType1.equals("ReturnType") == true)
		     {	  
		        if(doNotLogAttributes.contains(attributeShortName) == false)
		        {	 
		           // Validate that is NOT a Class Data Type	
		           if (attributeClassType == false)	
		           {
				      // Logging Instructions for the value of the Attribute
			          addLogDetails(label, 0, attributeShortName.trim(), attributeTypeStr.trim());
			          addLogValue(label, attributeValue1.trim(), attributeTypeStr.trim());
				      addLog1 = true;
		           }
		           else	   
		  		   {	  	
		        	  // Logging Instructions for the value of the Attribute
		        	  addLogDetails(label, 0, attributeShortName.trim(), attributeTypeStr.trim()); 
			          addLog1 = true;

			          // Obtain the Full Name of the Personalized Class 
		   		      try 
		   		      {
		   			     attributeTypeFullName = Class.forName(attributeTypeStr); 
		   			  } 
		   		      catch (Exception e1) 
		   		      {
		   		         errorMessage1 = e1.getMessage(); 
		   		         errorMessage2 = "Error XXXX: Occurred while getting the Class Name for the Attribute Type Class: " + System.lineSeparator();
		   		         errorMessage2 = errorMessage2 + attributeTypeStr + System.lineSeparator();
		   		         errorMessage1 = errorMessage2 + errorMessage1;
		   		         System.out.println(errorMessage1);
		   			  }
		   		      
				      // Validate that is an Enum
				      if(attributeEnum == true)
				      {
				         // Get the Parameter Type
				         parameterType = attributeValue1.getClass().getName();

				         // Logging Instructions for the value of the Attribute
				         addLogValue(label, attributeValue1.trim(), attributeTypeStr.trim());
						 addLog1 = true;
				      }
				      else
				      {	 
				         subAttributeCount = attributeTypeFullName.getDeclaredFields().length;
				      
				         if(subAttributeCount > 0)
				         {	
				            /* Evaluation Start (TIME 1) */
				       	    time1 = System.currentTimeMillis();
				       	    /* Evaluation End */
				       	  
				    	    log.info("The Attribute Name: " + attributeShortName.trim() + " has the followings Sub-Attributes:");
				    	    
				    		/* Evaluation Start (TIME 2) */
				    		time2 = System.currentTimeMillis();
				    		duration = time2 - time1;
				    		System.out.println("Message FRL: The Security Log for the ATTRIBUTE-SUBATTRIBUTES INFORMATION was CREATED in =>: " + duration + " milliseconds"); 
				    		/* Evaluation End */ 
				    	    
				    	    subAttributeNumber = 0;

				    	    addLog1 = attributeAnnotation(subAttributeCount, parameterNumber, attributeShortName, attributeTypeFullName, 
				    		                              attributeValue, annotationType1, annotationElement1,
		                                                  methodReturnTypeValue1, "SubAttribute");
				         }
				      
				      }
		        	   
		  		   }

		        }
		     }
		     else
		     {
		        if(annotationType1.equals("Parameter") == true)
		    	{	
				   if(doNotLogAttributes.contains(attributeShortName) == false)
			       {	
			          // Validate that is NOT a Class Data Type
			          if (attributeClassType == false)	
			          {
					     // Validate if the current executed attribute value that is the same as as attribute value 
						 // of one of the Annotated methods in the Annotation File (CONDITION 1)	 
					     if(attributeShortName.equals(annotationElementA))
					     {	
					        addLog1 = addNewLog(annotationAttributePLType, attributeValue1, annotationElement2, annotationOperator);

				            if(addLog1 == true)
				            {	 
			                   parameterType = parameterTypeFullName.toString();
			                   parameterType = parameterType.replace("class "," ");
			                        
			                   // Create the header of the Log containing the details of the Method
							   addLogMethodHeader();
			       			   addLogDetails("Parameter", parameterNumber, parameterName.trim(), parameterType.trim());
			       				     
							   // Logging Instructions for the value of the Attribute
			       			   addLogDetails(label, 0, attributeShortName.trim(), attributeTypeStr.trim());
			       			   addLogValue(label, attributeValue1.trim(), attributeTypeStr.trim());
			  			       addLog1 = true;
				            }
					     }
			          }
			          else	   
				  	  {	
	                     // Obtain the Full Name of the Personalized Class 
					   	 try 
					     {
					        attributeTypeFullName = Class.forName(attributeTypeStr); 
					   	 } 
					     catch (Exception e1) 
					   	 {
					        errorMessage1 = e1.getMessage(); 
					   		errorMessage2 = "Error XXXX: Occurred while getting the Class Name for the Attribute Type Class: " + System.lineSeparator();
					   		errorMessage2 = errorMessage2 + attributeTypeStr + System.lineSeparator();
					   		errorMessage1 = errorMessage2 + errorMessage1;
					   		System.out.println(errorMessage1);
					   	 }
					   			
					     // Validate that is an Enum
						 if(attributeEnum == true)
					     { 
						    // Get the Parameter Type
						    parameterType = parameterTypeFullName.toString();
				            parameterType = parameterType.replace("class "," ");
				              
					        // Validate if the current executed attribute value that is the same as as attribute value 
						    // of one of the Annotated methods in the Annotation File (CONDITION 2)	 
				            if(attributeShortName.equals(annotationElementA))
						    {        	 
						       addLog1 = addNewLog(annotationAttributePLType, attributeValue1, annotationElement2, annotationOperator);
						             
						       if(addLog1 == true)
						       {	 
				                  // Create the header of the Log containing the details of the Method
							      addLogMethodHeader();
							      addLogDetails("Parameter", parameterNumber, parameterName.trim(), parameterType.trim());
									   
							      // Logging Instructions for the value of the Attribute
				       		      addLogDetails(label, 0, attributeShortName.trim(), attributeTypeStr.trim());
				       		      addLogValue(label, attributeValue1.trim(), attributeTypeStr.trim());
							      addLog1 = true;
						       }
						    }
						 }
						 else
                         {	 
						    subAttributeCount = attributeTypeFullName.getDeclaredFields().length;
						    
							// Validate if the Annotation Condition includes a SubAttribute
                            if(annotationCondition.contains(".") == true)
							{
							   lastIndex = annotationCondition.lastIndexOf(".", annotationCondition.indexOf("="));
							   
							   if(lastIndex != -1)
							   {
							      subAttributeName = annotationCondition.substring(lastIndex + 1, annotationCondition.indexOf("=")).trim();
							      subAttributeFlag = true;
							   }
							}
							         
							if(subAttributeCount > 0 && subAttributeFlag == true)
							{	  
							   subAttributeNumber = 0;
								
							   // Logging Instructions for the value of the Attribute 
							   addLog1 = attributeAnnotation(subAttributeCount, parameterNumber, attributeShortName, attributeTypeFullName, 
							    		                     attributeValue, annotationType1, subAttributeName,
					                                         methodReturnTypeValue1, "SubAttribute");
							}
							      
					     }
							      
					 }
					   
			      }


		        }
		    }
	     }
	     else
	        { 
	    	   annotationAttributeType = "";
	        }
	      
       }      
      
      return addLog1;
   }
   
   public boolean parameterAnnotation(String[] parameterNames1, Class<?>[] parameterTypes1, int parameterCount1, 
		                              Object[] parameterValues1, String annotationType1, Object methodReturnTypeValue1)
   {

      int parameterNumber1=0, parameterNumber2=0, attributeCount=0;
      String parameterTypeShortName="", parameterTypePkgName="", parameterName="", parameterValue2="", parameterType="", 
    		 parameterPLType="", parameterTypeClassName1="", parameterTypeClassName2="", objectString="";
      Object parameterValue=null;
      long parameterValuesCount=0;
      boolean addLog1=false, parameterPrimitiveType=false, parameterClassType=false, parameterEnum=false;
      
      Class<?> parameterTypeFullName=null;
      
	  // Loop for the Parameters
	  for (parameterNumber1=0; parameterNumber1 < parameterCount1; parameterNumber1++) 
	  {
		 // Get the information about the current parameter 
	     parameterTypeShortName  = parameterTypes1[parameterNumber1].getSimpleName();
		 parameterTypeClassName1 = parameterTypes1[parameterNumber1].getClass().toString();
		 
		 // Validate if the Parameter Data Type is boolean, byte, char, short, int, long, float, and double.
		 parameterPrimitiveType  = parameterTypes1[parameterNumber1].isPrimitive();
		 
		 if(parameterPrimitiveType == false)
         {
		    parameterTypePkgName = parameterTypes1[parameterNumber1].getPackage().toString();
		    parameterTypePkgName = parameterTypePkgName.replace("package ","");
		 }
		 else
		 {
		    parameterTypePkgName = parameterTypeClassName1.replace("class ","");
		    parameterTypePkgName = parameterTypePkgName.replace(".Class","");
		 }
		 
		 parameterTypeClassName2 = parameterTypePkgName + objectOrientedDelimiter1 + parameterTypeShortName;
		 parameterName           = parameterNames1[parameterNumber1];
		 parameterValue          = parameterValues1[parameterNumber1];
		 parameterEnum           = parameterTypes1[parameterNumber1].isEnum();
		 parameterNumber2++;
		 
		 if(parameterValue != null)
		 {
		    objectString = parameterValue.toString(); 
		 }
		 else
		 {
		    objectString = "";
		 }              
         
		 if(objectString != null && objectString.isEmpty() == false)
		    parameterValuesCount = 1;
		 else
		    parameterValuesCount = 0;
		 
		 // Determine if the parameter Data Type is a Personalized Class or any other DataType
		 if( parameterEnum == true)
            parameterClassType = true;
		 else	 
		 {
		    if(parameterTypeClassName2.contains(programmingLanguage) == false && 
		       parameterPrimitiveType == false)
			   parameterClassType = true;
		    else
		       parameterClassType = false;
		 } 
		 
		 // Validate if the Parameter Data Type is NOT a Personalized Class
		 if (parameterClassType == false)
		 {
		    // The Parameter has a PRIMITIVE DATA TYPE(int, char, String, etc)
			// and does not have any Attributes 
		    if(parameterValuesCount == 1)
		    {
		       if(annotationType1.equals("Method") == true || annotationType1.equals("ReturnType") ==true)
		       {
		           // Get the Parameter Type
		           parameterValue2 = parameterValue.toString();
		           parameterType   = parameterValue2.getClass().getName();
		           
		           // Logging Instructions for the value of the Parameter
			       addLogDetails("Parameter", parameterNumber2, parameterName.trim(), parameterType.trim());
				   addLogValue("Parameter", parameterValue2.trim(), parameterType.trim());
				   addLog1 = true;
		       }
		       else
		       {
		          if(annotationType1.equals("Parameter"))
			      {
			         parameterValue2    = parameterValue.toString();
					 parameterValue2    = parameterValue2.trim();
					 annotationElement2 = annotationElement2.trim(); 
					    
					 // Validate that the Parameter Name is equal to the Annotation Element 1 (Condition 1)
					 if (parameterName.equals(annotationElement1) == true)
					 {	
					    parameterType = parameterValue2.getClass().getName();
					    	   
					    if(parameterType.contains(dataTypeShortClassName) == false)
					        parameterPLType = dataTypeFullClassName;
					    else
					        parameterPLType = parameterType;
					    
					    // Validate that the Parameter Value is equal to the Annotation Element 2 (Condition 2)
					    addLog1 = addNewLog(parameterPLType, parameterValue2, annotationElement2, annotationOperator);

					    // If Condition 1 and Condition 2 are met, we can create a new log
						if(addLog1 == true)
						{	
						   methodReturnTypeValueStr = "";
								    
						   if (methodReturnTypeValue1 != null)	
						      methodReturnTypeValueStr = methodReturnTypeValue1.toString();
							 
						   // Create the header of the Log containing the details of the Method
						   addLogMethodHeader();

						   // Logging Instructions for the value of the Parameter
						   addLogDetails("Parameter", parameterNumber2, parameterName.trim(), parameterType.trim());
						   addLogValue("Parameter", parameterValue2.trim(), parameterType.trim());
					     }
				      } 
			       }
		        }
		     }
		  }
		  else
		  {
		     // Validate if the Parameter Data Type is a Personalized Class 
			 // Obtain the Full Name of the Personalized Class 			     
			 try 
			 {
			    parameterTypeFullName = Class.forName(parameterTypeClassName2); 
			 } 
			 catch (Exception e1) 
			 {
			    errorMessage1 = e1.getMessage(); 
			    errorMessage2 = "Error XXXX: Occurred while getting the Class Name for the Parameter Type Class: " + System.lineSeparator();
			    errorMessage2 = errorMessage2 + parameterTypeClassName2 + System.lineSeparator();
			    errorMessage1 = errorMessage2 + errorMessage1;
			    System.out.println(errorMessage1);
			 }
		     
		     if(annotationType1.equals("Method") == true || annotationType1.equals("ReturnType") ==true )
	         {
	            // Get the Parameter Type
	            parameterType = parameterTypeClassName2;
	            parameterType = parameterType.replace("class "," ");
	             
	            // Logging Instructions for the value of the Parameter
	            addLogDetails("Parameter", parameterNumber2, parameterName.trim(), parameterType.trim());
			    addLog1 = true;
	         }

		     // Validate that is an Enum
			 if(parameterEnum == true)
			 {	
				 if(annotationType1.equals("Method") == true || annotationType1.equals("ReturnType") ==true )
		         {
			        // Logging Instructions for the value of the Parameter
					addLogValue("Parameter", objectString.trim(), parameterType.trim());
				    addLog1 = true;
		         }
				 else
					 if(annotationType1.equals("Parameter") == true) 
					 {
						parameterValue2    = parameterValue.toString();
						parameterValue2    = parameterValue2.trim();
						annotationElement2 = annotationElement2.trim();
						    
						// Validate that the Parameter Name is equal to the Annotation Element 1 (Condition 1)
						if (parameterName.equals(annotationElement1) == true)
						{	
						   parameterType = parameterValue2.getClass().getName();
						    	   
						   if(parameterType.contains(dataTypeShortClassName) == false)
						      parameterPLType = dataTypeFullClassName;
						   else
						      parameterPLType = parameterType;
						   
						   // Validate that the Parameter Value is equal to the Annotation Element 2 (Condition 2)
						   addLog1 = addNewLog(parameterPLType, parameterValue2, annotationElement2, annotationOperator);
						   
						   // If Condition 1 and Condition 2 are met, we can create a new log
						   if(addLog1 == true)
						   {	
							  // Create the header of the Log containing the details of the Method
							  addLogMethodHeader();
							  
							  parameterType = parameterTypeClassName2;

							  // Logging Instructions for the value of the Parameter
							  addLogDetails("Parameter", parameterNumber2, parameterName.trim(), parameterType.trim());
							  addLogValue("Parameter", parameterValue2.trim(), parameterType.trim());
						   }
						   
					    }
						 
					 }
			 }
		     else
		     {
		        // Obtain the number of attributes that this Parameter has
	            attributeCount = parameterTypeFullName.getDeclaredFields().length;
	            
	            // Obtain the Attributes of the Parameter with Personalized Class Data Type
	            if(attributeCount > 0)
	            {	  
                    if(annotationType1.equals("Method") == true || annotationType1.equals("ReturnType") ==true  ) 
                    {	
                       /* Evaluation Start (TIME 1) */
                  	   time1 = System.currentTimeMillis();
                  	   /* Evaluation End */
                  	  
                       // Logging Instructions for the value of the Parameter	
                       log.info("The Parameter Name: " + parameterName + " has the following Attributes:");
                       
                       /* Evaluation Start (TIME 2) */
			    	   time2 = System.currentTimeMillis();
			    	   duration = time2 - time1;
			    	   System.out.println("Message FRL: The Security Log for the PARAMETER-ATTRIBUTES INFORMATION was CREATED in =>: " + duration + " milliseconds"); 
			    	   /* Evaluation End */ 
			    		
                    }   
                    
                    attributeNumber = 0;
                    subAttributeNumber = 0;
                    
	                addLog1 = attributeAnnotation(attributeCount, parameterNumber2, parameterName, parameterTypeFullName, 
                                                  parameterValue, annotationType1, annotationElement1, 
                                                  methodReturnTypeValue1, "Attribute");
	             }
	          
		      }
		   }
      }

	  return addLog1;

   }
   
   public void addLogMethodHeader()
   {      
      PropertyConfigurator.configure(log4jConfPath); 
      log = Logger.getLogger(methodFullClassName2);
      
      methodNumber++;
      
      /* Evaluation Start (TIME 1) */
	  time1 = System.currentTimeMillis();
	  /* Evaluation End */
      
	  log.info("OS Name              : " + oSName);
	  log.info("OS Current Time      : " + df1.format(date));
	  //log.info("OS IP Address        : " + oSIP);
	  log.info("OS IP Address        : " + "189.122.67.106");
	  //log.info("OS Hostname          : " + oSHostname);
	  log.info("OS Hostname          : " + "f7.local");
	  //log.info("OS UserName          : " + oSUserName);
	  log.info("OS UserName          : " + "f7");
	  log.info("Annotation Type      : " + annotationType);
	  log.info("Method Number        : " + methodNumber);
	  log.info("Method Name          : " + methodFullName2);
	  log.info("Method Return Type   : " + methodReturnType);
	  log.info("Method Return Value  : " + methodReturnTypeValueStr);	 
	  
	  /* Evaluation Start (TIME 2) */
	  time2 = System.currentTimeMillis();
	  duration = time2 - time1;
	  System.out.println("Message FRL: The Security Log for the HEADER: "+ methodFullName2  +" was CREATED in =>: " + duration + " milliseconds"); 
	  /* Evaluation End */
   }
   
   public void addLogDetails(String element, int number, String name, String dataType)
   {		  
       /* Evaluation Start (TIME 1) */
	   time1 = System.currentTimeMillis();
	   /* Evaluation End */
	   
	   // Validate if the element is an Attribute or a SubAttribute
	   if(element.equals("Attribute") == true )
	   {	
		  // Increase the counter 
	      attributeNumber++;
		  log.info(element + " Number     : " + attributeNumber); 
	   }   
	   else 
		   if(element.equals("SubAttribute"))
		   {
		      // Increase the counter 
			  subAttributeNumber++;
			  log.info(element + " Number     : " + subAttributeNumber); 
		   }
		   else   
		      // Validate if the element is a Parameter
	         if(element.equals("Parameter") == true)
		        log.info(element + " Number     : " + number); 
	   	   
	   log.info(element + " Name       : " + name);
	   log.info(element + " Type       : " + dataType);
	   
	   /* Evaluation Start (TIME 2) */
	   time2 = System.currentTimeMillis();
	   duration = time2 - time1;
	   System.out.println("Message FRL: The Security Log for the DETAIL: " + name + " was CREATED in =>: " + duration + " milliseconds"); 
	   /* Evaluation End */ 
   }
   
   public void addLogValue(String element, String value, String dataType)
   {  
      SimpleDateFormat parseFormat, dateFormat;
      Date date;
      String formattedDate="";
	   
      if(dataType.equals("java.util.Date"))
      {
    	 try
    	 {
            parseFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy");
            dateFormat  = new SimpleDateFormat("dd/MM/yyyy");
            date = parseFormat.parse(value);
            formattedDate = dateFormat.format(date);
            value = formattedDate;
    	 } 
    	 catch (ParseException e1) 
    	 {
	        errorMessage1 = e1.getMessage(); 
	        errorMessage2 = "Error XXXX: Occurred while converting the : " + element + System.lineSeparator();
	        errorMessage2 = errorMessage2 + "Data type : " + dataType + System.lineSeparator();
	        errorMessage2 = errorMessage2 + "Value     : " + value + System.lineSeparator();
	        errorMessage1 = errorMessage2 + errorMessage1;
	        System.out.println(errorMessage1);
         }
      }
      
      /* Evaluation Start (TIME 1) */
	  time1 = System.currentTimeMillis();
	  /* Evaluation End */
      
      log.info(element + " Value      : " + value);  
      
	  /* Evaluation Start (TIME 2) */
	  time2 = System.currentTimeMillis();
	  duration = time2 - time1;
	  System.out.println("Message FRL: The Security Log for the VALUE: "+ value +" was CREATED in =>: " + duration + " milliseconds"); 
	  /* Evaluation End */ 
   }
   
   pointcut loggingMethods(): 
      call(boolean controller.UserController.validateUser(..))||
      call(boolean model.UserDatabase.validateUser(..))||
      call(model.UserLevel controller.UserController.getUserLevel(..))||
      call(model.UserLevel model.UserDatabase.getUserLevel(..))||
      call(void controller.ModuleController.saveModules(..))||
      call(void model.ModuleDatabase.saveModules(..))||
      call(java.lang.String[] controller.ModuleController.getModules(..))||
      call(java.lang.String[] model.ModuleDatabase.getModules(..))||
      call(java.lang.String[][] controller.ModuleController.getSubModules(..))||
      call(java.lang.String[][] model.ModuleDatabase.getSubModules(..))||
      call(ArrayList<model.Employee> controller.TravelRequestController.loadFullNameEmployees(..))||
      call(ArrayList<model.Employee> model.TravelRequestDatabase.loadFullNameEmployees(..))||
      call(int controller.TravelRequestController.maxNumTravelRequest(..))||
      call(int model.TravelRequestDatabase.maxNumTravelRequest(..))||
      call(void controller.TravelRequestController.load(..))||
      call(void model.TravelRequestDatabase.load(..))||
      call(void controller.TravelRequestController.save(..))||
      call(void model.TravelRequestDatabase.save(..));

                           
   after() returning(Object methodReturnTypeValue): loggingMethods() && args(..)
   {
	  // Get the Information about the Method
	  method               = thisJoinPoint.getSignature();
		  
      methodPackageName    = method.getDeclaringType().getPackage().toString();
      methodPackageName    = methodPackageName.replace("package ","");
		  
	  methodClassName      = method.getDeclaringType().getSimpleName();
	  methodFullClassName1 = methodPackageName + objectOrientedDelimiter1 + methodClassName; 
		  
	  methodShortName      = method.getName();
	  methodFullName1      = method.toString();
	  methodArgs           = thisJoinPoint.getArgs();
	  methodFullName2      = methodPackageName + objectOrientedDelimiter1 + methodClassName + objectOrientedDelimiter1 + methodShortName;
	  
	  if (methodReturnTypeValue != null)
	  {	  
         methodReturnType = methodReturnTypeValue.getClass().getName();
	  }   
	  else
	  {	  
	     if( methodFullName1.contains("void"))
		 {
		    methodReturnType      = "void";
		    methodReturnTypeValue = "";
		 } 
		 else
		 {
		    methodReturnType    = "";
		    methodReturnTypeValue = "";
		 }  
	  }  
		  
      if(methodReturnType.contains(dataTypeShortClassName) == false)
	     methodPLReturnType = dataTypeFullClassName;
	  else
	     methodPLReturnType = methodReturnType;

	  // Getting Information about the Operating System
	  oSUserName = System.getProperty("user.name");
	  oSName     = System.getProperty("os.name");
	  
	  // Getting the IP Address
	  try
	  {
	     oSIP = InetAddress.getLocalHost();
	     oSHostname = oSIP.getHostName();
	  }
	  catch (UnknownHostException e1) 
	  {
	     errorMessage1  = e1.getMessage(); 
	     errorMessage2  = "Error XXXX: Occurred while getting the IP Address" + System.lineSeparator();
	     errorMessage1  = errorMessage2 + errorMessage1;
	     System.out.println(errorMessage1);
	  }
	  
	  // Get the Current Date, Time and TimeZone
	  // Define the date format
	  date = new Date();
	  df1 = new SimpleDateFormat("dd/MM/YYYY hh:mm:ss a z");
	  df1.setTimeZone(TimeZone.getDefault());
			 
	  df2 = new SimpleDateFormat("dd_MM_YYYY");
	  df2.setTimeZone(TimeZone.getDefault());
	  System.setProperty("current.date.time", df2.format(date));
	  
	  // Getting the Class Name for the Method
	  try 
	  {
	     methodFullClassName2 = Class.forName(methodFullClassName1);
	  } 
	  catch (ClassNotFoundException e2) 
	  {
	     errorMessage1 = e2.getMessage(); 
	     errorMessage2 = "Error XXXX: Occurred while getting the Class Name for the Method: " + System.lineSeparator();
	     errorMessage2 = errorMessage2 + methodFullClassName1 + System.lineSeparator();
	     errorMessage1 = errorMessage2 + errorMessage1;
	     System.out.println(errorMessage1);
	  }
	  
	  // Get the Information about the Annotations from the Annotation Text File : annotationFile
	  annotationList = getAnnotationLines(annotationFile, methodFullName2);
	  
	  // Loop into the annotationList ArrayList
	  for (a = 0; a < annotationList.size(); a++) 
	  {
	     // Get the Annotation Line 	  
	     annotationLine = annotationList.get(a);
	     
	     // Get the Annotation Fields 
	     getAnnotationFields(annotationLine);
	     
		 // Validate if the current executed method is included as one of the Annotated methods in the Annotation File
	     // If so, create a new log Entry
		 if(methodShortName.contains(annotationMethodShortName))
		 {
	        // Get the Information about the Parameters: Names and Types
	        parameterNames  = ((CodeSignature) thisJoinPoint.getSignature()).getParameterNames();
	        parameterTypes  = ((CodeSignature) thisJoinPoint.getSignature()).getParameterTypes();
	        parameterCount  = parameterNames.length;	  
	        parameterValues = thisJoinPoint.getArgs();
	       
		    if(annotationType.equals("Method"))
		    {  
		       methodReturnTypeValueStr = "";
	
			   if (methodReturnTypeValue != null)	
			      methodReturnTypeValueStr = methodReturnTypeValue.toString();
			   else   
			      methodReturnTypeValueStr = "";
			   
			   // Create the header of the Log containing the details of the Method
			   addLogMethodHeader();
				 
			   // Verify if this Method has parameters
			   // If so log the values of such parameters
	    	   addLog = parameterAnnotation(parameterNames, parameterTypes, parameterCount, parameterValues, "Method", methodReturnTypeValue);
                   
               if(addLog == false)
               {
            	   
            	  /* Evaluation Start (TIME 1) */
            	  time1 = System.currentTimeMillis();
            	  /* Evaluation End */
            		  
			      // Add a line indicating there is NO INPUT Parameters
			      log.info("The Method: " + methodShortName.trim() + " DOES NOT have any Parameters");
			      
				  /* Evaluation Start (TIME 2) */
				  time2 = System.currentTimeMillis();
				  duration = time2 - time1;
				  System.out.println("Message FRL: The Security Log for the METHOD-PARAMETERS INFORMATION #1 was CREATED in =>: " + duration + " milliseconds"); 
				  /* Evaluation End */ 
			      
               }
		    }
		    else
		       if(annotationType.equals("ReturnType"))
			   {
		          // Validate if the current executed method returns value is the same as as one of the Annotated methods in the Annotation File
		          addLog = addNewLog(methodPLReturnType, methodReturnTypeValue.toString(), annotationElement2, annotationOperator);						
						
				  if(addLog == true)
				  {	 
				     methodReturnTypeValueStr = "";
					    
				     if (methodReturnTypeValue != null)	
					    methodReturnTypeValueStr = methodReturnTypeValue.toString();
				     
				     // Create the header of the Log containing the details of the Method
				     addLogMethodHeader();
		    	     addLog = parameterAnnotation(parameterNames, parameterTypes, parameterCount, parameterValues, "ReturnType", methodReturnTypeValue);
		    	     
		             if(addLog == false)
		             {
		                /* Evaluation Start (TIME 1) */
		           	    time1 = System.currentTimeMillis();
		           	    /* Evaluation End */
		           	  
					    // Add a line indicating there is NO INPUT Parameters
					    log.info("The Method: " + methodShortName.trim() + " DOES NOT have any Parameters");
					    
					    /* Evaluation Start (TIME 2) */
						time2 = System.currentTimeMillis();
						duration = time2 - time1;
						System.out.println("Message FRL: The Security Log for the METHODS-PARAMETERS INFORMATION #2 was CREATED in =>: " + duration + " milliseconds"); 
						/* Evaluation End */ 
		             }
				  }
			    }
		        else
		           if(annotationType.equals("Parameter"))
		    	   {
				      log = Logger.getLogger(methodFullClassName2);
				     
				      // Validate if the current executed method has a parameter name and parameter value that is the same as as parameter name and a parameter value 
				      // of one of the Annotated methods in the Annotation File
		    		  addLog = parameterAnnotation(parameterNames, parameterTypes, parameterCount, parameterValues, "Parameter", methodReturnTypeValue);
		    		 
		    		  if(addLog == true)
					  {		
					     methodReturnTypeValueStr = "";
						    
					     if (methodReturnTypeValue != null)	
						    methodReturnTypeValueStr = methodReturnTypeValue.toString();
					    
				      } 
		    	   }
	           }
	        }
	  
        }	   
}

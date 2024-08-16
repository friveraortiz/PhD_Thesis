package frl.gui.loadUMLSequenceDiagram;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import javax.swing.JTextField;

import frl.controller.generateAspectOrientedFiles.AOPFileController;
import frl.gui.configFile.ProgLangDetTablePanel;
import frl.gui.toolBar.ToolBar;
import frl.model.generateAspectOrientedFiles.DBMS;
import frl.model.generateAspectOrientedFiles.InputMethod;
import frl.model.generateAspectOrientedFiles.ProgrammingLanguageHeader;

public class UMLSequenceDiagramFormPanel extends JPanel
{
	private static final long serialVersionUID = 1L;
	
    // Define Labels //
	// Tab 1
	private JLabel projectIdLabel;
    private JLabel projectNameLabel;
    private JLabel jarFileNameLabel;
    private JLabel projInputDirLabel;
    private JLabel projOutputDirLabel;
    private JLabel progLanguageLabel;
    private JLabel dbmsLabel;
    private JLabel inputMethodLabel;
    private JLabel startProjMethodLabel;
    private JLabel endProjMethodLabel;
    private JLabel connectProjMethodLabel;
    
    // Tab 3
    private JLabel operatingSystemLabel;

    // Tab 4
    private JLabel umlSeqDiagramImageLabel0;
    private JLabel umlSeqDiagramTextLabel0;
    private JLabel umlSeqDiagramTextLabel1;
    private JLabel umlSeqDiagramTextLabel2;
    private JLabel umlSeqDiagramTextLabel3;
    private JLabel userNameLabel1;
    private JLabel userNameLabel2;

    // Define TextFields //
    public JTextField projectIdField;
    public JTextField projectNameField;
    public JTextField jarFileNameField;
    public JTextField projInputDirField;
    public JTextField projOutputDirField;
    public JTextField startProjMethodField;
    public JTextField endProjMethodField;
    public JTextField connectProjMethodField;
    public JTextField operatingSystemField;
    public JTextField umlSeqDiagramImageField0;
    public JTextField umlSeqDiagramTextField0;
    public JTextField umlSeqDiagramTextField1;
    public JTextField umlSeqDiagramTextField2;
    public JTextField umlSeqDiagramTextField3;
    public JTextField userNameTextField1;
    public JTextField userNameTextField2;
    
    // Define ComboBoxes //
    public JComboBox<String> progLanguageCombo;
    public JComboBox<String> dbmsCombo;
    public JComboBox<String> inputMethodCombo;
    
    // Define Buttons //
	public JButton openUmlSeqDiagramImageBtn0;
	public JButton openUmlSeqDiagramTextBtn0;
	public JButton openUmlSeqDiagramTextBtn1;
	public JButton openUmlSeqDiagramTextBtn2;
	public JButton openUmlSeqDiagramTextBtn3;
	
	public JButton generateBtn;
	public JButton deleteBtn;
	public JButton changeBtn;
	public JButton mergeBtn;
	public JButton cleanBtn;
	public JButton cancelBtn;

    public JPanel panel1 = new JPanel();
    public JPanel panel2 = new JPanel();
    public JPanel panel3 = new JPanel();
    public JPanel buttonPane = new JPanel();
    public JTabbedPane umlSequenceDiagramTabPanel = new JTabbedPane();

    // Controller
    private AOPFileController aopFileController;
    
    // Listener //
    private UMLSequenceDiagramFormListener umlSequenceDiagramFileFormListener;
    
    // Table //
    private ProgLangDetTablePanel progLangDetTablePanel;

	public UMLSequenceDiagramFormPanel(String databaseConfigFile, String featuresConfigFile)
	{
		Dimension dim = getPreferredSize();
		
		// Set the Size of the Form
		dim.height = 500;
		dim.width = 1000;
		setPreferredSize(dim);
		
		// Define an object for the Controller Class
		aopFileController = new AOPFileController();
		
		// Define an object for the Table Panel Class
        progLangDetTablePanel = new ProgLangDetTablePanel();
        
        // Define an object for the ProgLangDetTablePanel Class
        progLangDetTablePanel.setData(aopFileController.getProgLangDet());
		
		// Create the Fields //
		projectIdLabel = new JLabel("Project Id: ");
		projectIdField = new JTextField(10); 
		 
		// Make the projectIdField not editable
		Color color = Color.LIGHT_GRAY;
		projectIdField.setBackground(color);
	    projectIdField.setToolTipText("Identifier of the Project Application");
		
	    // Set the color of the Form
	    this.setBackground(Color.lightGray);
	     
	    projectNameLabel = new JLabel("Project Name: ");
	    projectNameField = new JTextField(40);
	    projectNameField.setBackground(color);
	    projectNameField.setToolTipText("Project Application Name");
	    
	    jarFileNameLabel = new JLabel("JAR File Name: ");
	    jarFileNameField = new JTextField(40);
	    jarFileNameField.setBackground(color);
	    jarFileNameField.setToolTipText("Java Archive File Name");
	    
	    projInputDirLabel = new JLabel("Input Directory: ");
	    projInputDirField = new JTextField(40);
	    projInputDirField.setBackground(color);
	    projInputDirField.setToolTipText("Project Input Folder");
	    
	    projOutputDirLabel = new JLabel("Output Directory: ");
	    projOutputDirField = new JTextField(40);
	    projOutputDirField.setBackground(color);
	    projOutputDirField.setToolTipText("Project Output Folder");
	    
	    color = Color.WHITE;
	    progLanguageLabel = new JLabel("Programming Language: ");
		progLanguageCombo = new JComboBox<String>(); 
		progLanguageCombo.setBackground(color);
		progLanguageCombo.setToolTipText("Project Source Code Language");
		
	    dbmsLabel = new JLabel("DBMS: ");    
		dbmsCombo = new JComboBox<String>(); 
		dbmsCombo.setBackground(color);
		dbmsCombo.setToolTipText("Database Management System");
			    
	    inputMethodLabel = new JLabel("Input Method: ");
	    inputMethodCombo = new JComboBox<String>(); 
		inputMethodCombo.setBackground(color);
		inputMethodCombo.setToolTipText("Input Method");
	    
	    startProjMethodLabel = new JLabel("Start Method: ");
	    startProjMethodField = new JTextField(40);
	    startProjMethodField.setBackground(color);
	    startProjMethodField.setToolTipText("Project Start Method Name");
	    
	    endProjMethodLabel = new JLabel("End Method: ");
	    endProjMethodField = new JTextField(40);
	    endProjMethodField.setBackground(color);
	    endProjMethodField.setToolTipText("Project End Method Name");
	    
	    connectProjMethodLabel = new JLabel("Connect Method: ");
	    connectProjMethodField = new JTextField(40);
	    connectProjMethodField.setBackground(color);
	    connectProjMethodField.setToolTipText("Project Connect Method Name");
	    	    
		color = Color.LIGHT_GRAY;
	    operatingSystemLabel = new JLabel("Operating System: ");
	    operatingSystemField = new JTextField(40);
	    operatingSystemField.setBackground(color);
	    operatingSystemField.setToolTipText("Operating System");
	    
		color = Color.LIGHT_GRAY;
		umlSeqDiagramImageLabel0 = new JLabel("UML Sequence Diagram Image File: ");
		umlSeqDiagramImageField0 = new JTextField(40);
		umlSeqDiagramImageField0.setBackground(color);
		umlSeqDiagramImageField0.setToolTipText("Unified Modelling Language Sequence Diagram Image File");
			    
		openUmlSeqDiagramImageBtn0 = new JButton("Opens an Image File");
		openUmlSeqDiagramImageBtn0.setToolTipText("Opens a Unified Modelling Language Sequence Diagram Image File from the File System");
		
		color = Color.LIGHT_GRAY;
		umlSeqDiagramTextLabel0 = new JLabel("UML Sequence Diagram Text File: ");
		umlSeqDiagramTextField0 = new JTextField(40);
		umlSeqDiagramTextField0.setBackground(color);
		umlSeqDiagramTextField0.setToolTipText("Unified Modelling Language Sequence Diagram Text File");
			    
		openUmlSeqDiagramTextBtn0 = new JButton("Opens a Text File");
		openUmlSeqDiagramTextBtn0.setToolTipText("Opens a Unified Modelling Language Sequence Diagram Text File from the File System");

		color = Color.LIGHT_GRAY;
		umlSeqDiagramTextLabel1 = new JLabel("UML Sequence Diagram Text File 1: ");
		umlSeqDiagramTextField1 = new JTextField(40);
		umlSeqDiagramTextField1.setBackground(color);
		umlSeqDiagramTextField1.setToolTipText("Unified Modelling Language Sequence Diagram Text File");
			    
		openUmlSeqDiagramTextBtn1 = new JButton("Opens a Text File");
		openUmlSeqDiagramTextBtn1.setToolTipText("Opens a Unified Modelling Language Sequence Diagram Text File from the File System");
		
		color = Color.LIGHT_GRAY;
		umlSeqDiagramTextLabel2 = new JLabel("UML Sequence Diagram Text File 2: ");
		umlSeqDiagramTextField2 = new JTextField(40);
		umlSeqDiagramTextField2.setBackground(color);
		umlSeqDiagramTextField2.setToolTipText("Unified Modelling Language Sequence Diagram Text File");
			    
		openUmlSeqDiagramTextBtn2 = new JButton("Opens a Text File");
		openUmlSeqDiagramTextBtn2.setToolTipText("Opens a Unified Modelling Language Sequence Diagram Text File from the File System");
		
		
		color = Color.LIGHT_GRAY;
		umlSeqDiagramTextLabel3 = new JLabel("UML Sequence Diagram Text File: ");
		umlSeqDiagramTextField3 = new JTextField(40);
		umlSeqDiagramTextField3.setBackground(color);
		umlSeqDiagramTextField3.setToolTipText("Unified Modelling Language Sequence Diagram Text File");
							    
		openUmlSeqDiagramTextBtn3 = new JButton("Opens a Text File");
		openUmlSeqDiagramTextBtn3.setToolTipText("Opens a Unified Modelling Language Sequence Diagram Text File from the File System");
		
		userNameLabel1 = new JLabel("Current User Name: ");
		userNameTextField1 = new JTextField(40);
		userNameTextField1.setBackground(color);
		userNameTextField1.setToolTipText("Initial User Name");
		
		userNameLabel2 = new JLabel("New User Name: ");
		userNameTextField2 = new JTextField(40);
		userNameTextField2.setBackground(color);
		userNameTextField2.setToolTipText("Final User Name");
		

	    // JButtons Objects //
		generateBtn = new JButton("Generate");
		generateBtn.setToolTipText("Process the UML Sequence Diagram Files and generates the screen to annotate the UML Sequence Diagram.");
		
		deleteBtn = new JButton("Delete");
		deleteBtn.setToolTipText("Eliminates the Configuration of the Project Application from the Forensic-Ready Logger System");

		changeBtn = new JButton("Change User Name");
		changeBtn.setToolTipText("Modifies the User Name inside a UML Sequence Diagram Text File.");
		
		mergeBtn = new JButton("Merge");
		mergeBtn.setToolTipText("Combine Two UML Sequence Diagram Text Files into One File.");

		cleanBtn = new JButton("Clean");
		cleanBtn.setToolTipText("Cleans all the fields in the UML Sequence Diagram Form");

		cancelBtn = new JButton("Cancel");
		cancelBtn.setToolTipText("Closes the UML Sequence Diagram Form");

		// Declare the Listeners //

		// Listener for the progLanguageCombo
		progLanguageCombo.addActionListener(new ActionListener() 
		{
			@Override
			public void actionPerformed(ActionEvent e) 
			{
				UMLSequenceDiagramFormEvent ev;
				String projectIdS1="", progLanguage1="";
				
				// Obtain the value of the Objects //
				projectIdS1   = projectIdField.getText();
				progLanguage1 = (String) progLanguageCombo.getSelectedItem();  
				
				// Validate if the Id is not null
				if(projectIdS1 != null && !projectIdS1.isEmpty()) 
				{ 
				   int projectId1 = Integer.parseInt(projectIdS1);
				   // Calling the constructor # 1 for the UMLSequenceDiagramForm Event Class
				   ev = new UMLSequenceDiagramFormEvent(this, projectId1, "programmingLanguage", progLanguage1);
				}
				else
				{
				   // Calling the constructor # 2 for the UMLSequenceDiagram Form Event Class
				   ev = new UMLSequenceDiagramFormEvent(this, "programmingLanguage", progLanguage1);
				}
				
				if(umlSequenceDiagramFileFormListener != null) 
				{
				   umlSequenceDiagramFileFormListener.progLanguageComboEventOccurred(ev);
				}	
			}
			
		});
		
		openUmlSeqDiagramImageBtn0.addActionListener(new ActionListener() 
		{
			@Override
			public void actionPerformed(ActionEvent e) 
			{
				UMLSequenceDiagramFormEvent ev;
				String projectIdS1, umlSeqDiagramImage;
				
				// Obtain the value of the Objects //
				projectIdS1        = projectIdField.getText();
				umlSeqDiagramImage = umlSeqDiagramImageField0.getText();
				
				// Validate if the Id is not null
				if(projectIdS1 != null && !projectIdS1.isEmpty()) 
				{ 
				   int projectId1 = Integer.parseInt(projectIdS1);
				   // Calling the constructor # 1 for the UMLSequenceDiagramForm Event Class
				   ev = new UMLSequenceDiagramFormEvent(this, projectId1, "UMLSeqDiagramImage", umlSeqDiagramImage);
				}
				else
				{
				   // Calling the constructor # 2 for the UMLSequenceDiagram Form Event Class
				   ev = new UMLSequenceDiagramFormEvent(this, "UMLSeqDiagramImage", umlSeqDiagramImage);
				}
				
				if(umlSequenceDiagramFileFormListener != null) 
				{
				   umlSequenceDiagramFileFormListener.openUmlSeqDiagramImageEventOccurred_0(ev);
				}	
			}
			
		});
		
		openUmlSeqDiagramTextBtn0.addActionListener(new ActionListener() 
		{
			@Override
			public void actionPerformed(ActionEvent e) 
			{
				UMLSequenceDiagramFormEvent ev;
				String projectIdS1, umlSeqDiagramFile;
				
				// Obtain the value of the Objects //
				projectIdS1       = projectIdField.getText();
				umlSeqDiagramFile = umlSeqDiagramTextField0.getText();
				
				// Validate if the Id is not null
				if(projectIdS1 != null && !projectIdS1.isEmpty()) 
				{ 
				   int projectId1 = Integer.parseInt(projectIdS1);
				   // Calling the constructor # 1 for the UMLSequenceDiagramForm Event Class
				   ev = new UMLSequenceDiagramFormEvent(this, projectId1, "UMLSeqDiagramFile", umlSeqDiagramFile);
				}
				else
				{
				   // Calling the constructor # 2 for the UMLSequenceDiagram Form Event Class
				   ev = new UMLSequenceDiagramFormEvent(this, "UMLSeqDiagramFile", umlSeqDiagramFile);
				}
				
				if(umlSequenceDiagramFileFormListener != null) 
				{
				   umlSequenceDiagramFileFormListener.openUmlSeqDiagramTextEventOccurred_0(ev);
				}	
			}
			
		});
		
		openUmlSeqDiagramTextBtn1.addActionListener(new ActionListener() 
		{
			@Override
			public void actionPerformed(ActionEvent e) 
			{
				UMLSequenceDiagramFormEvent ev;
				String projectIdS1, umlSeqDiagramFile;
				
				// Obtain the value of the Objects //
				projectIdS1       = projectIdField.getText();
				umlSeqDiagramFile = umlSeqDiagramTextField1.getText();
				
				// Validate if the Id is not null
				if(projectIdS1 != null && !projectIdS1.isEmpty()) 
				{ 
				   int projectId1 = Integer.parseInt(projectIdS1);
				   // Calling the constructor # 1 for the UMLSequenceDiagramForm Event Class
				   ev = new UMLSequenceDiagramFormEvent(this, projectId1, "UMLSeqDiagramFile", umlSeqDiagramFile);
				}
				else
				{
				   // Calling the constructor # 2 for the UMLSequenceDiagram Form Event Class
				   ev = new UMLSequenceDiagramFormEvent(this, "UMLSeqDiagramFile", umlSeqDiagramFile);
				}
				
				if(umlSequenceDiagramFileFormListener != null) 
				{
				   umlSequenceDiagramFileFormListener.openUmlSeqDiagramTextEventOccurred_1(ev);
				}	
			}
			
		});
		
		openUmlSeqDiagramTextBtn2.addActionListener(new ActionListener() 
		{
			@Override
			public void actionPerformed(ActionEvent e) 
			{
				UMLSequenceDiagramFormEvent ev;
				String projectIdS1, umlSeqDiagramFile;
				
				// Obtain the value of the Objects //
				projectIdS1       = projectIdField.getText();
				umlSeqDiagramFile = umlSeqDiagramTextField2.getText();
				
				// Validate if the Id is not null
				if(projectIdS1 != null && !projectIdS1.isEmpty()) 
				{ 
				   int projectId1 = Integer.parseInt(projectIdS1);
				   // Calling the constructor # 1 for the UMLSequenceDiagramForm Event Class
				   ev = new UMLSequenceDiagramFormEvent(this, projectId1, "UMLSeqDiagramFile", umlSeqDiagramFile);
				}
				else
				{
				   // Calling the constructor # 2 for the UMLSequenceDiagram Form Event Class
				   ev = new UMLSequenceDiagramFormEvent(this, "UMLSeqDiagramFile", umlSeqDiagramFile);
				}
				
				if(umlSequenceDiagramFileFormListener != null) 
				{
				   umlSequenceDiagramFileFormListener.openUmlSeqDiagramTextEventOccurred_2(ev);
				}	
			}
			
		});		
		
		openUmlSeqDiagramTextBtn3.addActionListener(new ActionListener() 
		{
			@Override
			public void actionPerformed(ActionEvent e) 
			{
				UMLSequenceDiagramFormEvent ev;
				String projectIdS1, umlSeqDiagramFile;
				
				// Obtain the value of the Objects //
				projectIdS1       = projectIdField.getText();
				umlSeqDiagramFile = umlSeqDiagramTextField3.getText();
				
				// Validate if the Id is not null
				if(projectIdS1 != null && !projectIdS1.isEmpty()) 
				{ 
				   int projectId1 = Integer.parseInt(projectIdS1);
				   // Calling the constructor # 1 for the UMLSequenceDiagramForm Event Class
				   ev = new UMLSequenceDiagramFormEvent(this, projectId1, "UMLSeqDiagramFile", umlSeqDiagramFile);
				}
				else
				{
				   // Calling the constructor # 2 for the UMLSequenceDiagram Form Event Class
				   ev = new UMLSequenceDiagramFormEvent(this, "UMLSeqDiagramFile", umlSeqDiagramFile);
				}
				
				if(umlSequenceDiagramFileFormListener != null) 
				{
				   umlSequenceDiagramFileFormListener.openUmlSeqDiagramTextEventOccurred_3(ev);
				}	
			}
			
		});	
		
		// Listener for the Generate Button
		generateBtn.addActionListener(new ActionListener() 
		{
			@Override
			public void actionPerformed(ActionEvent e) 
			{
				UMLSequenceDiagramFormEvent ev;
				boolean umlSequenceDiagramFileSaved = false;
				int id, rowCount;
				
				String idS ="", projectName="", jarFileName="", 
				       projInputDir="", projOutputDir="", progLanguage="", dbms="",
			           inputMethod="", startProjMethod="", endProjMethod="", connectProjMethod="",
			           operatingSystem="";
				String newLine1="", newLine2="", objectOrientedDelimiter1="", startMethod="", endMethod="", 
					   startParameters="", endParameters="", singleLineComment="", endStatementDelimiter="", 
					   startClassList="", endClassList="", bluePrintObject1="", bluePrintObject2="", 
					   initializeObjectName="", initializeObjectMethod="", subProgramObject="", 
					   methodNameException="", printMessage="", startLineNum="", startArray="", endArray="",
					   umlSeqDiagramImage, umlSeqDiagramText;
				
				// Obtain the value of the Objects //
				idS                = projectIdField.getText();
			    projectName        = projectNameField.getText();
			    jarFileName        = jarFileNameField.getText();
			    projInputDir       = projInputDirField.getText();
			    projOutputDir      = projOutputDirField.getText();
			    progLanguage       = (String) progLanguageCombo.getSelectedItem();  
			    dbms               = (String) dbmsCombo.getSelectedItem();  
			    inputMethod        = (String) inputMethodCombo.getSelectedItem();  
			    startProjMethod    = startProjMethodField.getText();
			    endProjMethod      = endProjMethodField.getText();
			    connectProjMethod  = connectProjMethodField.getText();
			    operatingSystem    = operatingSystemField.getText();
			    umlSeqDiagramImage = umlSeqDiagramImageField0.getText();
			    umlSeqDiagramText  = umlSeqDiagramTextField0.getText();
			    
			    // Get the count of the records of the programming language detail table
			    rowCount = progLangDetTablePanel.getRowCount();
			    
			    if(rowCount > 0)
			    {	
			       newLine1                 = progLangDetTablePanel.getRowColSel(0, 2);
			       newLine2                 = progLangDetTablePanel.getRowColSel(1, 2);
			       objectOrientedDelimiter1 = progLangDetTablePanel.getRowColSel(2, 2);
			       startMethod              = progLangDetTablePanel.getRowColSel(3, 2);
			       endMethod                = progLangDetTablePanel.getRowColSel(4, 2);
			       startParameters          = progLangDetTablePanel.getRowColSel(5, 2);
			       endParameters            = progLangDetTablePanel.getRowColSel(6, 2);
			       singleLineComment        = progLangDetTablePanel.getRowColSel(7, 2);
			       endStatementDelimiter    = progLangDetTablePanel.getRowColSel(8, 2);
			       startClassList           = progLangDetTablePanel.getRowColSel(9, 2);
			       endClassList             = progLangDetTablePanel.getRowColSel(10, 2);
			       bluePrintObject1         = progLangDetTablePanel.getRowColSel(11, 2);
			       bluePrintObject2         = progLangDetTablePanel.getRowColSel(12, 2);
			       initializeObjectName     = progLangDetTablePanel.getRowColSel(13, 2);
			       initializeObjectMethod   = progLangDetTablePanel.getRowColSel(14, 2);
			       subProgramObject         = progLangDetTablePanel.getRowColSel(15, 2);
			       methodNameException      = progLangDetTablePanel.getRowColSel(16, 2);
			       printMessage             = progLangDetTablePanel.getRowColSel(17, 2);
			       startLineNum             = progLangDetTablePanel.getRowColSel(18, 2);
			       startArray               = progLangDetTablePanel.getRowColSel(19, 2);
			       endArray                 = progLangDetTablePanel.getRowColSel(20, 2);
			    }
			    			    
				// Validate if the Id is not null
				if( (idS != null && !idS.isEmpty())) 
				{ 
				   id = Integer.parseInt(idS);
				   // Calling the constructor # 2 for the UMLSequenceDiagramForm Event Class
				   ev = new UMLSequenceDiagramFormEvent(this, id, featuresConfigFile, databaseConfigFile,
						                        projectName, 
						                        jarFileName, projInputDir, projOutputDir, 
						                        progLanguage, dbms, inputMethod, 
				                                startProjMethod, endProjMethod, connectProjMethod,
				                                operatingSystem, newLine1, newLine2, objectOrientedDelimiter1, 
				                                startMethod, endMethod, startParameters, endParameters, 
				                                singleLineComment, endStatementDelimiter, startClassList, 
				                                endClassList, bluePrintObject1, bluePrintObject2, 
				                                initializeObjectName, initializeObjectMethod, subProgramObject, 
				                                methodNameException, printMessage, startLineNum, startArray, endArray,
				                                umlSeqDiagramImage, umlSeqDiagramText);
				}
				else
				{
				   // Calling the constructor # 3 for the UMLSequenceDiagram Form Event Class
				   ev = new UMLSequenceDiagramFormEvent(this, featuresConfigFile, databaseConfigFile,
						                        projectName, 
						                        jarFileName, projInputDir, projOutputDir, 
						                        progLanguage, dbms, inputMethod, 
                                                startProjMethod, endProjMethod, connectProjMethod,
                                                operatingSystem, newLine1, newLine2, objectOrientedDelimiter1, 
				                                startMethod, endMethod, startParameters, endParameters, 
				                                singleLineComment, endStatementDelimiter, startClassList, 
				                                endClassList, bluePrintObject1, bluePrintObject2, 
				                                initializeObjectName, initializeObjectMethod, subProgramObject, 
				                                methodNameException, printMessage, startLineNum, startArray, endArray, 
				                                umlSeqDiagramImage, umlSeqDiagramText);
				}
				
				if(umlSequenceDiagramFileFormListener != null) 
				{
				   umlSequenceDiagramFileSaved = umlSequenceDiagramFileFormListener.generateEventOccurred(ev);
			       
				   // Validate that the user has been saved
				   if (umlSequenceDiagramFileSaved == true) 
				   {
			          // Clear all the fields except the text area
				      cleanFields(databaseConfigFile);
				   }
				   
		       }	
			}
			
		});
		
		// Listener for the Change Button
		changeBtn.addActionListener(new ActionListener() 
		{
			@Override
			public void actionPerformed(ActionEvent e) 
			{
		       UMLSequenceDiagramFormEvent ev;
			   boolean umlSequenceDiagramFileSaved = false;
			   int id=0;
				
			   String idS ="", projectName="", projOutputDir="", userName1="", userName2="", umlSeqDiagramText="";
				
			   // Obtain the value of the Objects //
			   idS           = projectIdField.getText();
			   projectName   = projectNameField.getText();
			   projOutputDir = projOutputDirField.getText();
			   userName1     = userNameTextField1.getText();
			   userName2     = userNameTextField2.getText();
			   umlSeqDiagramText = umlSeqDiagramTextField3.getText();
			    			    			    

			   id = Integer.parseInt(idS);
			   
			   
			   // Calling the constructor # 2 for the UMLSequenceDiagramForm Event Class
			   ev = new UMLSequenceDiagramFormEvent(this, id, featuresConfigFile, databaseConfigFile,
						                            projectName, projOutputDir, userName1, userName2, umlSeqDiagramText);
				
				if(umlSequenceDiagramFileFormListener != null) 
				{
				   umlSequenceDiagramFileSaved = umlSequenceDiagramFileFormListener.changeEventOccurred(ev);
			       
				   // Validate that the user has been saved
				   if (umlSequenceDiagramFileSaved == true) 
				   {
			          // Clear all the fields except the text area
				      cleanFields(databaseConfigFile);
				   }
				   
		       }	
				
			}
		});
		
		// Listener for the Merge Button
		mergeBtn.addActionListener(new ActionListener() 
		{
			@Override
			public void actionPerformed(ActionEvent e) 
			{
			   UMLSequenceDiagramFormEvent ev;
			   boolean umlSequenceDiagramFileSaved = false;
			   int id=0;
					
			   String idS ="", projectName="", projOutputDir="", umlSeqDiagramText1="", umlSeqDiagramText2="";
					
			   // Obtain the value of the Objects //
			   idS           = projectIdField.getText();
			   projectName   = projectNameField.getText();
			   projOutputDir = projOutputDirField.getText();
			   umlSeqDiagramText1 = umlSeqDiagramTextField1.getText();
			   umlSeqDiagramText2 = umlSeqDiagramTextField2.getText();
			   

			   id = Integer.parseInt(idS);
				   
				   
			   // Calling the constructor # 2 for the UMLSequenceDiagramForm Event Class
			   ev = new UMLSequenceDiagramFormEvent(this, id, featuresConfigFile, databaseConfigFile,
							                       projectName, projOutputDir, umlSeqDiagramText1, umlSeqDiagramText2);
					
			   if(umlSequenceDiagramFileFormListener != null) 
			   {
			      umlSequenceDiagramFileSaved = umlSequenceDiagramFileFormListener.mergeEventOccurred(ev);
				       
			      // Validate that the user has been saved
				  if (umlSequenceDiagramFileSaved == true) 
				  {
				     // Clear all the fields except the text area
					 cleanFields(databaseConfigFile);
				  }
					   
			   }	
		    }
				
		});

		// Listener for the Delete Button
		deleteBtn.addActionListener(new ActionListener() 
		{
			@Override
			public void actionPerformed(ActionEvent e) 
			{
				UMLSequenceDiagramFormEvent ev = null;
				boolean umlSequenceDiagramFileDeleted=false;
				String idS ="", projectName="", projOutputDir="";
				int id;
					
			    // Obtain the value of the Objects //
			    idS           = projectIdField.getText();
				projectName   = projectNameField.getText();
				projOutputDir = projOutputDirField.getText();
				
				// Validate if the Id is not null
				if(idS != null && !idS.isEmpty()) 
				{ 
				   id = Integer.parseInt(idS);
				   
				   // Calling the constructor # 1 for the UMLSequenceDiagramForm Event Class
				   ev = new UMLSequenceDiagramFormEvent(this, featuresConfigFile, databaseConfigFile,
						                        id, projectName, projOutputDir);
				}
				
				if(umlSequenceDiagramFileFormListener != null) 
				{
				   umlSequenceDiagramFileDeleted = umlSequenceDiagramFileFormListener.deleteEventOccurred(ev);
				}
				
				if (umlSequenceDiagramFileDeleted == true) 
				{
			       // Clear all the fields except the text area
			   	   cleanFields(databaseConfigFile);
				}   
			}
			
		});

		// Listener for the Clean Button
		cleanBtn.addActionListener(new ActionListener() 
		{
			@Override
			public void actionPerformed(ActionEvent e) 
			{
			   cleanFields(databaseConfigFile);
			}
			
		});	
		
		// Listener for the Cancel Button
		cancelBtn.addActionListener(new ActionListener() 
		{
			@Override
			public void actionPerformed(ActionEvent e) 
			{
			   cleanFields(databaseConfigFile);
			   
			   // Makes invisible the ConfigFileFormPanel Form
			   setVisible(false);
			   
			   // Makes visible the UserToolBar Add New Button
			   ToolBar.addNewButton.setVisible(true);
			   
			   if(umlSequenceDiagramFileFormListener != null) 
			   {
			      umlSequenceDiagramFileFormListener.cancelEventOccurred();
			   }
			}
		});
		
		// Clean all the fields in the Configuration File Form
		cleanFields(databaseConfigFile);
		
        // Allocate the visual components into the Configuration File Form
		layoutComponents();
		
	}
	
 	// Method #2
	public void layoutComponents() 
	{
        // set grid layout for the frame
		setLayout(new BorderLayout());
	    setBackground(Color.lightGray);
        
        panel1.setLayout(new GridBagLayout());
        panel2.setLayout(new GridBagLayout());
        panel3.setLayout(new GridBagLayout());

        
        // Tab 1: UML Sequence Diagram Information
        // Add the components panel
        
        addComponent(1, 1, 1, 1, umlSeqDiagramImageLabel0, panel1, "UML Sequence Diagram");
        addComponent(1, 2, 1, 1, umlSeqDiagramImageField0, panel1, "UML Sequence Diagram");
        addComponent(1, 3, 1, 1, openUmlSeqDiagramImageBtn0, panel1, "UML Sequence Diagram");
        
        addComponent(2, 1, 1, 1, umlSeqDiagramTextLabel0, panel1, "UML Sequence Diagram");
        addComponent(2, 2, 1, 1, umlSeqDiagramTextField0, panel1, "UML Sequence Diagram");
        addComponent(2, 3, 1, 1, openUmlSeqDiagramTextBtn0, panel1, "UML Sequence Diagram");
        
        
        // Tab 2: Change User Name
        // Add the components panel
                
        addComponent(1, 1, 1, 1, userNameLabel1, panel2, "Change User Name");
        addComponent(1, 2, 1, 1, userNameTextField1, panel2, "Change User Name");
        
        addComponent(2, 1, 1, 1, userNameLabel2, panel2, "Change User Name");
        addComponent(2, 2, 1, 1, userNameTextField2, panel2, "Change User Name");
        
        addComponent(3, 1, 1, 1, umlSeqDiagramTextLabel3, panel2, "Change User Name");
        addComponent(3, 2, 1, 1, umlSeqDiagramTextField3, panel2, "Change User Name");
        addComponent(3, 3, 1, 1, openUmlSeqDiagramTextBtn3, panel2, "Change User Name");
        
        // Tab 3: Merge UML Sequence Diagram Text Files
        // Add the components panel
        
        addComponent(1, 1, 1, 1, umlSeqDiagramTextLabel1, panel3, "Merge Files");
        addComponent(1, 2, 1, 1, umlSeqDiagramTextField1, panel3, "Merge Files");
        addComponent(1, 3, 1, 1, openUmlSeqDiagramTextBtn1, panel3, "Merge Files");
        
        addComponent(2, 1, 1, 1, umlSeqDiagramTextLabel2, panel3, "Merge Files");
        addComponent(2, 2, 1, 1, umlSeqDiagramTextField2, panel3, "Merge Files");
        addComponent(2, 3, 1, 1, openUmlSeqDiagramTextBtn2, panel3, "Merge Files");
        
        // Add the buttons panel
        createButtonsPanel();
        
        // Put everything together, using the content pane's BorderLayout.
        add(umlSequenceDiagramTabPanel, BorderLayout.CENTER);
        add(buttonPane, BorderLayout.SOUTH);
        
	}
	
	public void addComponent(int line, int column, int height, int width, 
			                 JComponent component, JComponent compnum, 
			                 String tabName) 
	{
       GridBagConstraints gbc = new GridBagConstraints();
       buttonPane.setBackground(Color.lightGray);
       gbc.gridy = line;
       gbc.gridx = column;
       gbc.gridheight = 1;
       gbc.gridwidth = 1;
       gbc.anchor = GridBagConstraints.WEST;
       gbc.insets = new Insets(1, 5, 3, 5);
       gbc.weightx = 1.0;
       gbc.weighty = 1.0;

       gbc.gridx++;
       gbc.gridheight = height;
       gbc.gridwidth = width;
       compnum.add(component, gbc);

       add(umlSequenceDiagramTabPanel);
       umlSequenceDiagramTabPanel.addTab(tabName, compnum);    
    }
	
   public void createButtonsPanel()
   {
      buttonPane.setLayout(new FlowLayout());
      buttonPane.setBackground(Color.lightGray);      
      buttonPane.add(generateBtn);
      buttonPane.add(changeBtn);
      buttonPane.add(mergeBtn);
      buttonPane.add(deleteBtn);
      buttonPane.add(cleanBtn);
      buttonPane.add(cancelBtn);
   }

   public void setUserFormListener(UMLSequenceDiagramFormListener listener) 
   {
	   this.umlSequenceDiagramFileFormListener = listener;
   }
   
   // Method #4
   public void cleanFields(String databaseConfigFile) 
   {
      // Clean all the fields in the form
	  umlSeqDiagramImageField0.setText("");
	  umlSeqDiagramTextField0.setText("");
	  umlSeqDiagramTextField1.setText("");
	  umlSeqDiagramTextField2.setText("");
	  umlSeqDiagramTextField3.setText("");
	  userNameTextField1.setText("");
	  userNameTextField2.setText("");  
   }
   
   public void assignDefaultValues(String databaseConfigFile)
   {
      String progLangSel="", OS="";
	   
	  // Load current Programming Languages from the FRL Database
	  loadProgLanguages(databaseConfigFile);
	  progLanguageCombo.setSelectedItem("Java");
	  
	  // Load current DBMS from the FRL Database
	  loadDBMS(databaseConfigFile);
	  dbmsCombo.setSelectedItem("MySQL");
	  
	  // Load current Input Methods from the FRL Database
	  loadInputMethods(databaseConfigFile);
	  inputMethodCombo.setSelectedItem("Database");
	  
	  // Load the Details of the Programming Language that is selected
	  progLangSel = (String) progLanguageCombo.getSelectedItem();
      loadingProgLangDet(databaseConfigFile, progLangSel);
      
      OS = System.getProperty("os.name");
      operatingSystemField.setText(OS);
   }	 
   	
   public void loadProgLanguages(String databaseConfigFile) 
   {
	  String errorMessage1 = "";
	  
      // Delete all the current values in the Combo
	  progLanguageCombo.removeAllItems();
	      
	  try 
	  {
	     // Obtain an ArrayList of all the current Programming Languages from the FRL Database
		 ArrayList<ProgrammingLanguageHeader> pL = aopFileController.loadProgLanguagesHeader(databaseConfigFile);
		     
		 // Read all the current Programming Language ArrayList
		 for (int i = 0; i < pL.size(); i++) 
		 {
		    String progLangName = pL.get(i).getName();
			    
			// Assign an Programming Language to the Programming Language Combo
		    progLanguageCombo.addItem(progLangName);
	      }
		     
	   } 
       catch (Exception e) 
	   {
	      errorMessage1 = e.getMessage();
		  JOptionPane.showMessageDialog(this, errorMessage1, "Loading the Programming Languages in the Combo.", JOptionPane.ERROR_MESSAGE);	
	   }
   }
   
   public void loadDBMS(String databaseConfigFile) 
   {
      String errorMessage1 = "";      
      // Delete all the current values in the Combo
	  dbmsCombo.removeAllItems();
	  
	  try 
	  {
	     // Obtain an ArrayList of all the current DBMS from the FRL Database
		 ArrayList<DBMS> dB = aopFileController.loadDBMS(databaseConfigFile);
		     
		 // Read all the current DBMS ArrayList
		 for (int i = 0; i < dB.size(); i++) 
		 {
		    String dbmsName = dB.get(i).getName();
			    
			// Assign an DBMS to the DBMS Combo
		    dbmsCombo.addItem(dbmsName);
	      }
		 
	   } 
       catch (Exception e) 
	   {
	      errorMessage1 = e.getMessage();
		  JOptionPane.showMessageDialog(this, errorMessage1, "Loading the DBMS in the Combo.", JOptionPane.ERROR_MESSAGE);	
	   }
   }
   
   public void loadInputMethods(String databaseConfigFile) 
   {
      String errorMessage1 = "";
      
      // Delete all the current values in the Combo
	  inputMethodCombo.removeAllItems();
	  
	  try 
	  {
	     // Obtain an ArrayList of all the current Input Methods from the FRL Database
		 ArrayList<InputMethod> iM = aopFileController.loadInputMethods(databaseConfigFile);
		     
		 // Read all the current Input Method ArrayList
		 for (int i = 0; i < iM.size(); i++) 
		 {
		    String inputMethodName = iM.get(i).getName();
			    
			// Assign an DBMS to the Input Method Combo
		    inputMethodCombo.addItem(inputMethodName);
	      }
		     
	   } 
       catch (Exception e) 
	   {
	      errorMessage1 = e.getMessage();
		  JOptionPane.showMessageDialog(this, errorMessage1, "Loading the DBMS in the Combo.", JOptionPane.ERROR_MESSAGE);	

	   }
   }
   
   // Method #4
   public void loadingProgLangDet(String databaseConfigFile, String progLang)
   {
      String errorMessage="";	   

	  try 
	  {
	     aopFileController.loadProgLangDet(databaseConfigFile, progLang);
	  } 
	  catch (Exception e) 
	  {
         errorMessage = e.getMessage();
	  }
	  
	  progLangDetTablePanel.refresh();
	  if(errorMessage.isEmpty() == false)
           JOptionPane.showMessageDialog(this, errorMessage, "Loading the Programing Languages into the Combo.", JOptionPane.ERROR_MESSAGE);
   }
   
   public void enableFields()
   {
      Color color; 
		  
	  color = Color.LIGHT_GRAY; 
	   
	  // Do not allow to edit in these fields
      projectIdField.setEditable(false);
	  projectNameField.setEditable(false);
	  jarFileNameField.setEditable(false);
	  projInputDirField.setEditable(false);
	  projOutputDirField.setEditable(false);
	  startProjMethodField.setEditable(false);
	  endProjMethodField.setEditable(false);
	  connectProjMethodField.setEditable(false);
	  operatingSystemField.setEditable(false);
	  
	  umlSeqDiagramImageField0.setEditable(false);
	  umlSeqDiagramTextField0.setEditable(false);
	  
      projectIdField.setBackground(color);
	  projectNameField.setBackground(color);
	  jarFileNameField.setBackground(color);
	  projInputDirField.setBackground(color);
	  projOutputDirField.setBackground(color);
	  startProjMethodField.setBackground(color);
	  endProjMethodField.setBackground(color);
	  connectProjMethodField.setBackground(color);
	  operatingSystemField.setBackground(color);
	  
	  umlSeqDiagramImageField0.setBackground(color);
	  umlSeqDiagramTextField0.setBackground(color);

	  // Make all these fields not navigable
	  projectIdField.setFocusable(false);
	  projectNameField.setFocusable(false);
	  jarFileNameField.setFocusable(false);
	  projInputDirField.setFocusable(false);
	  projOutputDirField.setFocusable(false);
	  startProjMethodField.setFocusable(false);
	  endProjMethodField.setFocusable(false);
	  connectProjMethodField.setFocusable(false);
	  operatingSystemField.setFocusable(false);
	  umlSeqDiagramImageField0.setFocusable(false);
	  umlSeqDiagramTextField0.setFocusable(false);

	  // Do not allow to edit these combos
	  progLanguageCombo.setEnabled(false);
	  progLanguageCombo.setBackground(color);
	  dbmsCombo.setEnabled(false);
	  dbmsCombo.setBackground(color);
	  inputMethodCombo.setEnabled(false);
	  inputMethodCombo.setBackground(color);
	  
	  // Make all these fields not navigable
	  progLanguageCombo.setFocusable(false);
	  dbmsCombo.setFocusable(false);
	  inputMethodCombo.setFocusable(false);
	    
	  // Make visible these open buttons
	  openUmlSeqDiagramImageBtn0.setEnabled(true);
	  openUmlSeqDiagramTextBtn0.setEnabled(true);
	  
	  // Make all these fields navigable
	  openUmlSeqDiagramImageBtn0.setFocusable(true);
	  openUmlSeqDiagramTextBtn0.setFocusable(true);
   }
   
   public void disableFields()
   {
      Color color; 
		  
	  color = Color.LIGHT_GRAY; 
		   
      // Do not allow to edit in these fields
      projectIdField.setEditable(false);
	  projectNameField.setEditable(false);
	  jarFileNameField.setEditable(false);
	  projInputDirField.setEditable(false);
	  projOutputDirField.setEditable(false);
	  startProjMethodField.setEditable(false);
	  endProjMethodField.setEditable(false);
	  connectProjMethodField.setEditable(false);
	  operatingSystemField.setEditable(false);
		  
	  umlSeqDiagramImageField0.setEditable(false);
	  umlSeqDiagramTextField0.setEditable(false);
		  
      projectIdField.setBackground(color);
	  projectNameField.setBackground(color);
	  jarFileNameField.setBackground(color);
	  projInputDirField.setBackground(color);
	  projOutputDirField.setBackground(color);
	  startProjMethodField.setBackground(color);
	  endProjMethodField.setBackground(color);
	  connectProjMethodField.setBackground(color);
	  operatingSystemField.setBackground(color);
		  
	  umlSeqDiagramImageField0.setBackground(color);
	  umlSeqDiagramTextField0.setBackground(color);

	  // Make all these fields not navigable
	  projectIdField.setFocusable(false);
	  projectNameField.setFocusable(false);
	  jarFileNameField.setFocusable(false);
	  projInputDirField.setFocusable(false);
	  projOutputDirField.setFocusable(false);
	  startProjMethodField.setFocusable(false);
	  endProjMethodField.setFocusable(false);
	  connectProjMethodField.setFocusable(false);
	  operatingSystemField.setFocusable(false);

	  umlSeqDiagramImageField0.setFocusable(false);
	  umlSeqDiagramTextField0.setFocusable(false);

	  // Do not allow to edit these combos
	  progLanguageCombo.setEnabled(false);
	  progLanguageCombo.setBackground(color);
	  dbmsCombo.setEnabled(false);
	  dbmsCombo.setBackground(color);
	  inputMethodCombo.setEnabled(false);
	  inputMethodCombo.setBackground(color);
		  
	  // Make all these fields not navigable
	  progLanguageCombo.setFocusable(false);
	  dbmsCombo.setFocusable(false);
	  inputMethodCombo.setFocusable(false);
		    
	  // Make not visible these open buttons
	  openUmlSeqDiagramImageBtn0.setEnabled(false);
	  openUmlSeqDiagramTextBtn0.setEnabled(false);
		  
	  // Make all these fields navigable
	  openUmlSeqDiagramImageBtn0.setFocusable(false);
	  openUmlSeqDiagramTextBtn0.setFocusable(false);
   }
   
   public void enableSaveButton()
   {
      // Make visible the following buttons
	  generateBtn.setVisible(true);
	  deleteBtn.setVisible(false);
	  changeBtn.setVisible(true);
	  mergeBtn.setVisible(true);
		  
	  // Make all these fields navigable or not navigable
	  generateBtn.setFocusable(true);
	  deleteBtn.setFocusable(false);
	  cleanBtn.setFocusable(true);
	  cancelBtn.setFocusable(true);

	  changeBtn.setFocusable(true);
	  mergeBtn.setFocusable(true);

   }
   
   public void enableDeleteButton()
   {
      // Make visible the following buttons
	  generateBtn.setVisible(false);
	  changeBtn.setVisible(false);
	  mergeBtn.setVisible(false);
	  
	  deleteBtn.setVisible(true);
		  
	  // Make all these fields not navigable
	  generateBtn.setFocusable(false);
	  deleteBtn.setFocusable(true);
	  
	  cleanBtn.setFocusable(true);
	  cancelBtn.setFocusable(true);
	  
	  changeBtn.setFocusable(false);
	  mergeBtn.setFocusable(false);
   }
   
   public void enableViewButton()
   {
      // Make visible the following buttons
	  generateBtn.setVisible(false);
	  deleteBtn.setVisible(false);
	  changeBtn.setVisible(false);
	  mergeBtn.setVisible(false);
		  
	  // Make all these fields not navigable
	  generateBtn.setFocusable(false);
	  deleteBtn.setFocusable(false);
	  
	  cleanBtn.setFocusable(true);
	  cancelBtn.setFocusable(true);
	  
	  changeBtn.setFocusable(false);
	  mergeBtn.setFocusable(false);
   }
   
}
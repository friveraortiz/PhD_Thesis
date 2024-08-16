package frl.gui.loadUMLSequenceDiagram;
import java.util.EventListener;


//Package #6
//Class #3
public interface UMLSequenceDiagramFormListener extends EventListener 
{   
   // Method #1
   public boolean openUmlSeqDiagramImageEventOccurred_0(UMLSequenceDiagramFormEvent e); 
   
   // Method #2
   public boolean openUmlSeqDiagramTextEventOccurred_0(UMLSequenceDiagramFormEvent e); 
   
   // Method #3
   public boolean openUmlSeqDiagramTextEventOccurred_1(UMLSequenceDiagramFormEvent e); 
   
   // Method #4
   public boolean openUmlSeqDiagramTextEventOccurred_2(UMLSequenceDiagramFormEvent e); 
   
   // Method #5
   public boolean openUmlSeqDiagramTextEventOccurred_3(UMLSequenceDiagramFormEvent e); 
   
   // Method #6
   public boolean progLanguageComboEventOccurred(UMLSequenceDiagramFormEvent e);
   
   // Method #7
   public boolean generateEventOccurred(UMLSequenceDiagramFormEvent e); 
   
   // Method #8
   public boolean changeEventOccurred(UMLSequenceDiagramFormEvent e); 
   
   // Method #9
   public boolean mergeEventOccurred(UMLSequenceDiagramFormEvent e); 
   
   // Method #10
   public boolean deleteEventOccurred(UMLSequenceDiagramFormEvent e); 
   
   // Method #11
   public boolean cancelEventOccurred(); 
   
}
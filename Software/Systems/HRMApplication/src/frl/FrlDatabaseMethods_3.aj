package frl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import org.aspectj.lang.Signature;
import java.util.Arrays;
import java.util.List;

public aspect FrlDatabaseMethods_3
{
   String projectName="OpenHospital";
   String projectOutputDir="C:\\Users\\friverao\\eclipse-workspace\\Directories\\Output\\";
   String umlSeqDiagTextFileName1="IncidentSequenceDiagram.txt";
   String guiLibs="java.awt;javax.swing;com.github.lgooddatepicket;javax.image.io;org.dcm4che2;com.trolltech.qt.gui;java.beans;com.jgoodies.forms;com.jgoodies.binding;com.github.sarxos.webcam;org.jivesoftware.smack;org.isf.utils.jobjects.ModalJFrame;org.imgscalr;";
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
   
   String connectProjectMethod="org.isf.menu.gui.Login.acceptPwd";
   String connectProjectMethod1="org.isf.menu.manager.UserBrowsingManager.getMenu";
   Object connectProjectMethodReturnValue=123;
   Object connectProjectMethodReturnValue1="admin, guest, doctor, sysadmin, physician";
   String connectProjectMethodType="ReturnType";
   String connectProjectMethodType1="Parameter";
   
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
   
   /* Evaluation Start */
   long time1, time2, duration;
   /* Evaluation End */
   
   pointcut databaseMethods(): 
      call(boolean org.isf.distype.manager.DiseaseTypeBrowserManager.deleteDiseaseType(..)) || 
      call(List<org.isf.distype.model.DiseaseType> org.isf.distype.manager.DiseaseTypeBrowserManager.getDiseaseType(..)) || 
      call(boolean org.isf.distype.service.DiseaseTypeIoOperation.isCodePresent(..)) || 
      call(boolean org.isf.distype.service.DiseaseTypeIoOperation.updateDiseaseType(..)) || 
      call(List<org.isf.distype.model.DiseaseType> org.isf.distype.service.DiseaseTypeIoOperation.getDiseaseTypes(..)) || 
      call(boolean org.isf.distype.service.DiseaseTypeIoOperation.newDiseaseType(..)) || 
      call(boolean org.isf.distype.service.DiseaseTypeIoOperation.deleteDiseaseType(..)) || 
      call(org.isf.hospital.model.Hospital org.isf.hospital.manager.HospitalBrowsingManager.getHospital(..)) || 
      call(org.isf.hospital.model.Hospital org.isf.hospital.manager.HospitalBrowsingManager.updateHospital(..)) || 
      call(java.lang.String org.isf.hospital.manager.HospitalBrowsingManager.getHospitalCurrencyCod(..)) || 
      call(org.isf.hospital.model.Hospital org.isf.hospital.service.HospitalIoOperations.getHospital(..)) || 
      call(org.isf.hospital.model.Hospital org.isf.hospital.service.HospitalIoOperations.updateHospital(..)) || 
      call(java.lang.String org.isf.hospital.service.HospitalIoOperations.getHospitalCurrencyCod(..)) || 
      call(boolean org.isf.patvac.manager.PatVacManager.updatePatientVaccine(..)) || 
      call(List<org.isf.patvac.model.PatientVaccine> org.isf.patvac.manager.PatVacManager.getPatientVaccine(..)) || 
      call(boolean org.isf.patvac.manager.PatVacManager.newPatientVaccine(..)) || 
      call(boolean org.isf.patvac.manager.PatVacManager.deletePatientVaccine(..)) || 
      call(int org.isf.patvac.manager.PatVacManager.getProgYear(..)) || 
      call(javax.persistence.criteria.CriteriaQuery<org.isf.patvac.model.PatientVaccine> org.isf.patvac.service.PatVacIoOperationRepositoryImpl.getPatientVaccineQuery(..)) || 
      call(List<org.isf.patvac.model.PatientVaccine> org.isf.patvac.service.PatVacIoOperationRepositoryImpl.findAllByCodesAndDatesAndSexAndAges(..)) || 
      call(java.lang.Integer org.isf.patvac.service.PatVacIoOperationRepository.findMaxCodeWhereVaccineDate(..)) || 
      call(java.lang.Integer org.isf.patvac.service.PatVacIoOperationRepository.findMaxCode(..)) || 
      call(boolean org.isf.patvac.service.PatVacIoOperations.updatePatientVaccine(..)) || 
      call(List<org.isf.patvac.model.PatientVaccine> org.isf.patvac.service.PatVacIoOperations.getPatientVaccine(..)) || 
      call(boolean org.isf.patvac.service.PatVacIoOperations.newPatientVaccine(..)) || 
      call(boolean org.isf.patvac.service.PatVacIoOperations.deletePatientVaccine(..)) || 
      call(boolean org.isf.patvac.service.PatVacIoOperations.isCodePresent(..)) || 
      call(List<org.isf.patvac.model.PatientVaccine> org.isf.patvac.service.PatVacIoOperations.findForPatient(..)) || 
      call(int org.isf.patvac.service.PatVacIoOperations.getProgYear(..)) || 
      call(void org.isf.patvac.service.VaccinePatientMergedEventListener.handle(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportPatientExaminationPdf(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getExamsListPdf(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getDiseasesListPdf(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getOperationsListPdf(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportAdmissionPdf(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportBillZPL(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportBillTxt(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportBillPdf(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportBillGroupedPdf(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportBillGroupedTxt(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportOpdPdf(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportPatientPdf(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportWardVisitPdf(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportPatientVersion2Pdf(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportPharmaceuticalOrderPdf(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportPharmaceuticalStockPdf(..)) || 
      call(void org.isf.stat.manager.JasperReportsManager.getGenericReportPharmaceuticalStockExcel(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportPharmaceuticalStockCardPdf(..)) || 
      call(void org.isf.stat.manager.JasperReportsManager.getGenericReportPharmaceuticalStockCardExcel(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportPharmaceuticalStockWardPdf(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportUserInDatePdf(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportUserInDateTxt(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportDischargePdf(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportFromDateToDatePdf(..)) || 
      call(void org.isf.stat.manager.JasperReportsManager.getGenericReportFromDateToDateExcel(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.getGenericReportMYPdf(..)) || 
      call(void org.isf.stat.manager.JasperReportsManager.getGenericReportMYExcel(..)) || 
      call(void org.isf.stat.manager.JasperReportsManager.addBundleParameter(..)) || 
      call(void org.isf.stat.manager.JasperReportsManager.addSubReportsBundleParameters(..)) || 
      call(void org.isf.stat.manager.JasperReportsManager.addReportBundleParameter(..)) || 
      call(org.isf.stat.dto.JasperReportResultDto org.isf.stat.manager.JasperReportsManager.generateJasperReport(..)) || 
      call(List<org.isf.supplier.model.Supplier> org.isf.supplier.manager.SupplierBrowserManager.getAll(..)) || 
      call(List<org.isf.supplier.model.Supplier> org.isf.supplier.manager.SupplierBrowserManager.getList(..)) || 
      call(boolean org.isf.supplier.manager.SupplierBrowserManager.saveOrUpdate(..)) || 
      call(org.isf.supplier.model.Supplier org.isf.supplier.manager.SupplierBrowserManager.getByID(..)) || 
      call(List<org.isf.supplier.model.Supplier> org.isf.supplier.service.SupplierIoOperationRepository.findAllWhereNotDeleted(..)) || 
      call(List<org.isf.supplier.model.Supplier> org.isf.supplier.service.SupplierOperations.getAll(..)) || 
      call(List<org.isf.supplier.model.Supplier> org.isf.supplier.service.SupplierOperations.getList(..)) || 
      call(boolean org.isf.supplier.service.SupplierOperations.saveOrUpdate(..)) || 
      call(org.isf.supplier.model.Supplier org.isf.supplier.service.SupplierOperations.getByID(..)) || 
      call(boolean org.isf.patient.manager.PatientBrowserManager.isNamePresent(..)) || 
      call(boolean org.isf.patient.manager.PatientBrowserManager.mergePatient(..)) || 
      call(void org.isf.patient.manager.PatientBrowserManager.validateMergePatients(..)) || 
      call(List<org.isf.patient.model.Patient> org.isf.patient.manager.PatientBrowserManager.getPatient(..)) || 
      call(List<org.isf.patient.model.Patient> org.isf.patient.manager.PatientBrowserManager.getPatients(..)) || 
      call(List<org.isf.patient.model.Patient> org.isf.patient.manager.PatientBrowserManager.getPatientsByOneOfFieldsLike(..)) || 
      call(org.isf.patient.model.Patient org.isf.patient.manager.PatientBrowserManager.getPatientAll(..)) || 
      call(org.isf.patient.model.Patient org.isf.patient.manager.PatientBrowserManager.savePatient(..)) || 
      call(boolean org.isf.patient.manager.PatientBrowserManager.deletePatient(..)) || 
      call(int org.isf.patient.manager.PatientBrowserManager.getNextPatientCode(..)) || 
      call(org.isf.patient.model.Patient org.isf.patient.manager.PatientBrowserManager.getPatientByName(..)) || 
      call(org.isf.patient.model.Patient org.isf.patient.manager.PatientBrowserManager.getPatientById(..)) || 
      call(java.lang.String[] org.isf.patient.manager.PatientBrowserManager.getMaritalList(..)) || 
      call(java.lang.String org.isf.patient.manager.PatientBrowserManager.getMaritalTranslated(..)) || 
      call(java.lang.String org.isf.patient.manager.PatientBrowserManager.getMaritalKey(..)) || 
      call(java.lang.String[] org.isf.patient.manager.PatientBrowserManager.getProfessionList(..)) || 
      call(java.lang.String org.isf.patient.manager.PatientBrowserManager.getProfessionTranslated(..)) || 
      call(java.lang.String org.isf.patient.manager.PatientBrowserManager.getProfessionKey(..)) || 
      call(void org.isf.patient.manager.PatientBrowserManager.buildMaritalHashMap(..)) || 
      call(void org.isf.patient.manager.PatientBrowserManager.buildProfessionHashMap(..)) || 
      call(List<org.isf.patient.model.Patient> org.isf.patient.service.PatientIoOperationRepository.findByNameAndDeletedOrderByName(..)) || 
      call(List<org.isf.patient.model.Patient> org.isf.patient.service.PatientIoOperationRepository.findAllWhereIdAndDeleted(..)) || 
      call(int org.isf.patient.service.PatientIoOperationRepository.updateDeleted(..)) || 
      call(java.lang.Integer org.isf.patient.service.PatientIoOperationRepository.findMaxCode(..)) || 
      call(List<org.isf.patient.model.Patient> org.isf.patient.service.PatientIoOperationRepositoryImpl.getPatientsByParams(..)) || 
      call(javax.persistence.criteria.CriteriaQuery<org.isf.patient.model.Patient> org.isf.patient.service.PatientIoOperationRepositoryImpl.createQuerySearchingForPatientContainingGivenWordsInHisProperties(..)) || 
      call(List<org.isf.patient.model.Patient> org.isf.patient.service.PatientIoOperationRepositoryImpl.findByFieldsContainingWordsFromLiteral(..)) || 
      call(boolean org.isf.patient.service.PatientIoOperations.isCodePresent(..)) || 
      call(org.isf.patient.model.Patient org.isf.patient.service.PatientIoOperations.getPatient(..)) || 
      call(List<org.isf.patient.model.Patient> org.isf.patient.service.PatientIoOperations.getPatients(..)) || 
      call(List<org.isf.patient.model.Patient> org.isf.patient.service.PatientIoOperations.getPatientsByOneOfFieldsLike(..)) || 
      call(org.isf.patient.model.Patient org.isf.patient.service.PatientIoOperations.getPatientAll(..)) || 
      call(org.isf.patient.model.Patient org.isf.patient.service.PatientIoOperations.savePatient(..)) || 
      call(boolean org.isf.patient.service.PatientIoOperations.updatePatient(..)) || 
      call(boolean org.isf.patient.service.PatientIoOperations.deletePatient(..)) || 
      call(boolean org.isf.patient.service.PatientIoOperations.isPatientPresentByName(..)) || 
      call(int org.isf.patient.service.PatientIoOperations.getNextPatientCode(..)) || 
      call(boolean org.isf.patient.service.PatientIoOperations.mergePatientHistory(..)) || 
      call(boolean org.isf.menu.manager.UserBrowsingManager.newUserGroup(..)) || 
      call(List<org.isf.menu.model.User> org.isf.menu.manager.UserBrowsingManager.getUser(..)) || 
      call(boolean org.isf.menu.manager.UserBrowsingManager.updateUser(..)) || 
      call(boolean org.isf.menu.manager.UserBrowsingManager.updateUserGroup(..)) || 
      call(org.isf.menu.model.User org.isf.menu.manager.UserBrowsingManager.getUserByName(..)) || 
      call(java.lang.String org.isf.menu.manager.UserBrowsingManager.getUsrInfo(..)) || 
      call(boolean org.isf.menu.manager.UserBrowsingManager.newUser(..)) || 
      call(boolean org.isf.menu.manager.UserBrowsingManager.updatePassword(..)) || 
      call(List<org.isf.menu.model.UserMenuItem> org.isf.menu.manager.UserBrowsingManager.getGroupMenu(..)) || 
      call(boolean org.isf.menu.manager.UserBrowsingManager.setGroupMenu(..)) || 
      call(boolean org.isf.menu.manager.UserBrowsingManager.deleteGroup(..)) || 
      call(java.lang.String org.isf.menu.manager.UserBrowsingManager.getCurrentUser(..)) || 
      call(boolean org.isf.menu.manager.UserBrowsingManager.deleteUser(..)) || 
      call(List<org.isf.menu.model.UserGroup> org.isf.menu.manager.UserBrowsingManager.getUserGroup(..)) || 
      call(void org.isf.menu.service.GroupMenuIoOperationRepository.deleteWhereUserGroup(..)) || 
      call(List<java.lang.Object[]> org.isf.menu.service.UserMenuItemIoOperationRepository.findAllWhereUserId(..)) || 
      call(int org.isf.menu.service.UserIoOperationRepository.updatePassword(..)) || 
      call(List<org.isf.menu.model.User> org.isf.menu.service.UserIoOperationRepository.findAllWhereUserGroupNameByOrderUserNameAsc(..)) || 
      call(int org.isf.menu.service.UserIoOperationRepository.updateDescription(..)) || 
      call(boolean org.isf.menu.service.MenuIoOperations.newUserGroup(..)) || 
      call(List<org.isf.menu.model.UserMenuItem> org.isf.menu.service.MenuIoOperations.getMenu(..)) || 
      call(List<org.isf.menu.model.User> org.isf.menu.service.MenuIoOperations.getUser(..)) || 
      call(boolean org.isf.menu.service.MenuIoOperations.updateUser(..)) || 
      call(boolean org.isf.menu.service.MenuIoOperations.updateUserGroup(..)) || 
      call(org.isf.menu.model.User org.isf.menu.service.MenuIoOperations.getUserByName(..)) || 
      call(java.lang.String org.isf.menu.service.MenuIoOperations.getUsrInfo(..)) || 
      call(boolean org.isf.menu.service.MenuIoOperations.isUserNamePresent(..)) || 
      call(boolean org.isf.menu.service.MenuIoOperations.isGroupNamePresent(..)) || 
      call(boolean org.isf.menu.service.MenuIoOperations.newUser(..)) || 
      call(boolean org.isf.menu.service.MenuIoOperations.updatePassword(..)) || 
      call(List<org.isf.menu.model.UserMenuItem> org.isf.menu.service.MenuIoOperations.getGroupMenu(..)) || 
      call(boolean org.isf.menu.service.MenuIoOperations.deleteGroup(..)) || 
      call(boolean org.isf.menu.service.MenuIoOperations.deleteGroupMenu(..)) || 
      call(boolean org.isf.menu.service.MenuIoOperations.insertGroupMenu(..)) || 
      call(boolean org.isf.menu.service.MenuIoOperations.deleteUser(..)) || 
      call(List<org.isf.menu.model.UserGroup> org.isf.menu.service.MenuIoOperations.getUserGroup(..)) || 
      call(List<org.isf.menu.model.UserGroup> org.isf.menu.service.UserGroupIoOperationRepository.findAllByOrderByCodeAsc(..)) || 
      call(int org.isf.menu.service.UserGroupIoOperationRepository.updateDescription(..)) || 
      call(boolean org.isf.ward.manager.WardBrowserManager.isCodePresent(..)) || 
      call(org.isf.ward.model.Ward org.isf.ward.manager.WardBrowserManager.newWard(..)) || 
      call(org.isf.ward.model.Ward org.isf.ward.manager.WardBrowserManager.updateWard(..)) || 
      call(int org.isf.ward.manager.WardBrowserManager.getCurrentOccupation(..)) || 
      call(List<org.isf.ward.model.Ward> org.isf.ward.manager.WardBrowserManager.getWardsNoMaternity(..)) || 
      call(List<org.isf.ward.model.Ward> org.isf.ward.manager.WardBrowserManager.getWards(..)) || 
      call(boolean org.isf.ward.manager.WardBrowserManager.deleteWard(..)) || 
      call(org.isf.ward.model.Ward org.isf.ward.manager.WardBrowserManager.findWard(..)) || 
      call(boolean org.isf.ward.manager.WardBrowserManager.maternityControl(..)) || 
      call(boolean org.isf.ward.service.WardIoOperations.isCodePresent(..)) || 
      call(org.isf.ward.model.Ward org.isf.ward.service.WardIoOperations.newWard(..)) || 
      call(org.isf.ward.model.Ward org.isf.ward.service.WardIoOperations.updateWard(..)) || 
      call(int org.isf.ward.service.WardIoOperations.getCurrentOccupation(..)) || 
      call(List<org.isf.ward.model.Ward> org.isf.ward.service.WardIoOperations.getWardsNoMaternity(..)) || 
      call(List<org.isf.ward.model.Ward> org.isf.ward.service.WardIoOperations.getWards(..)) || 
      call(boolean org.isf.ward.service.WardIoOperations.deleteWard(..)) || 
      call(org.isf.ward.model.Ward org.isf.ward.service.WardIoOperations.findWard(..)) || 
      call(List<org.isf.pricesothers.model.PricesOthers> org.isf.pricesothers.manager.PricesOthersManager.getOthers(..)) || 
      call(boolean org.isf.pricesothers.manager.PricesOthersManager.updateOther(..)) || 
      call(boolean org.isf.pricesothers.manager.PricesOthersManager.newOther(..)) || 
      call(boolean org.isf.pricesothers.manager.PricesOthersManager.deleteOther(..)) || 
      call(boolean org.isf.pricesothers.service.PriceOthersIoOperations.isCodePresent(..)) || 
      call(List<org.isf.pricesothers.model.PricesOthers> org.isf.pricesothers.service.PriceOthersIoOperations.getOthers(..)) || 
      call(boolean org.isf.pricesothers.service.PriceOthersIoOperations.updateOther(..)) || 
      call(boolean org.isf.pricesothers.service.PriceOthersIoOperations.newOthers(..)) || 
      call(boolean org.isf.pricesothers.service.PriceOthersIoOperations.deleteOthers(..)) || 
      call(void org.isf.examination.manager.ExaminationBrowserManager.remove(..)) || 
      call(void org.isf.examination.manager.ExaminationBrowserManager.saveOrUpdate(..)) || 
      call(org.isf.examination.model.PatientExamination org.isf.examination.manager.ExaminationBrowserManager.getByID(..)) || 
      call(void org.isf.examination.manager.ExaminationBrowserManager.buildDiuresisDescriptionHashMap(..)) || 
      call(void org.isf.examination.manager.ExaminationBrowserManager.buildBowelDescriptionHashMap(..)) || 
      call(void org.isf.examination.manager.ExaminationBrowserManager.validateExamination(..)) || 
      call(List<org.isf.examination.model.PatientExamination> org.isf.examination.manager.ExaminationBrowserManager.getLastNByPatID(..)) || 
      call(List<org.isf.examination.model.PatientExamination> org.isf.examination.manager.ExaminationBrowserManager.getByPatID(..)) || 
      call(List<java.lang.String> org.isf.examination.manager.ExaminationBrowserManager.getDiuresisDescriptionList(..)) || 
      call(List<java.lang.String> org.isf.examination.manager.ExaminationBrowserManager.getBowelDescriptionList(..)) || 
      call(List<java.lang.String> org.isf.examination.manager.ExaminationBrowserManager.getAuscultationList(..)) || 
      call(java.lang.String org.isf.examination.manager.ExaminationBrowserManager.getAuscultationTranslated(..)) || 
      call(java.lang.String org.isf.examination.manager.ExaminationBrowserManager.getBowelDescriptionTranslated(..)) || 
      call(java.lang.String org.isf.examination.manager.ExaminationBrowserManager.getDiuresisDescriptionTranslated(..)) || 
      call(java.lang.String org.isf.examination.manager.ExaminationBrowserManager.getAuscultationKey(..)) || 
      call(java.lang.String org.isf.examination.manager.ExaminationBrowserManager.getBowelDescriptionKey(..)) || 
      call(java.lang.String org.isf.examination.manager.ExaminationBrowserManager.getDiuresisDescriptionKey(..)) || 
      call(void org.isf.examination.manager.ExaminationBrowserManager.buildAuscultationHashMap(..)) || 
      call(void org.isf.examination.service.ExaminationPatientMergedEventListener.handle(..)) || 
      call(List<org.isf.examination.model.PatientExamination> org.isf.examination.service.ExaminationIoOperationRepository.findByPatient_CodeOrderByPexDateDesc(..)) || 
      call(void org.isf.examination.service.ExaminationOperations.remove(..)) || 
      call(void org.isf.examination.service.ExaminationOperations.saveOrUpdate(..)) || 
      call(org.isf.examination.model.PatientExamination org.isf.examination.service.ExaminationOperations.getByID(..)) || 
      call(List<org.isf.examination.model.PatientExamination> org.isf.examination.service.ExaminationOperations.getLastNByPatID(..)) || 
      call(List<org.isf.examination.model.PatientExamination> org.isf.examination.service.ExaminationOperations.getByPatID(..)) || 
      call(void org.isf.serviceprinting.manager.PrintManager.print(..)) || 
      call(List<org.isf.vactype.model.VaccineType> org.isf.vactype.manager.VaccineTypeBrowserManager.getVaccineType(..)) || 
      call(boolean org.isf.vactype.manager.VaccineTypeBrowserManager.isCodePresent(..)) || 
      call(boolean org.isf.vactype.manager.VaccineTypeBrowserManager.updateVaccineType(..)) || 
      call(org.isf.vactype.model.VaccineType org.isf.vactype.manager.VaccineTypeBrowserManager.findVaccineType(..)) || 
      call(boolean org.isf.vactype.manager.VaccineTypeBrowserManager.newVaccineType(..)) || 
      call(boolean org.isf.vactype.manager.VaccineTypeBrowserManager.deleteVaccineType(..)) || 
      call(List<org.isf.vactype.model.VaccineType> org.isf.vactype.service.VacTypeIoOperation.getVaccineType(..)) || 
      call(boolean org.isf.vactype.service.VacTypeIoOperation.isCodePresent(..)) || 
      call(boolean org.isf.vactype.service.VacTypeIoOperation.updateVaccineType(..)) || 
      call(org.isf.vactype.model.VaccineType org.isf.vactype.service.VacTypeIoOperation.findVaccineType(..)) || 
      call(boolean org.isf.vactype.service.VacTypeIoOperation.newVaccineType(..)) || 
      call(boolean org.isf.vactype.service.VacTypeIoOperation.deleteVaccineType(..)) || 
      call(List<org.isf.vaccine.model.Vaccine> org.isf.vaccine.manager.VaccineBrowserManager.getVaccine(..)) || 
      call(org.isf.vaccine.model.Vaccine org.isf.vaccine.manager.VaccineBrowserManager.updateVaccine(..)) || 
      call(org.isf.vaccine.model.Vaccine org.isf.vaccine.manager.VaccineBrowserManager.findVaccine(..)) || 
      call(org.isf.vaccine.model.Vaccine org.isf.vaccine.manager.VaccineBrowserManager.newVaccine(..)) || 
      call(boolean org.isf.vaccine.manager.VaccineBrowserManager.deleteVaccine(..)) || 
      call(boolean org.isf.vaccine.manager.VaccineBrowserManager.isCodePresent(..)) || 
      call(List<org.isf.vaccine.model.Vaccine> org.isf.vaccine.service.VaccineIoOperations.getVaccine(..)) || 
      call(org.isf.vaccine.model.Vaccine org.isf.vaccine.service.VaccineIoOperations.updateVaccine(..)) || 
      call(org.isf.vaccine.model.Vaccine org.isf.vaccine.service.VaccineIoOperations.findVaccine(..)) || 
      call(org.isf.vaccine.model.Vaccine org.isf.vaccine.service.VaccineIoOperations.newVaccine(..)) || 
      call(boolean org.isf.vaccine.service.VaccineIoOperations.deleteVaccine(..)) || 
      call(boolean org.isf.vaccine.service.VaccineIoOperations.isCodePresent(..)) || 
      call(List<org.isf.therapy.model.TherapyRow> org.isf.therapy.manager.TherapyManager.getTherapyRows(..)) || 
      call(org.isf.therapy.model.TherapyRow org.isf.therapy.manager.TherapyManager.newTherapy(..)) || 
      call(boolean org.isf.therapy.manager.TherapyManager.deleteAllTherapies(..)) || 
      call(boolean org.isf.therapy.manager.TherapyManager.newTherapies(..)) || 
      call(org.isf.therapy.model.Therapy org.isf.therapy.manager.TherapyManager.createTherapy(..)) || 
      call(org.isf.therapy.model.TherapyRow org.isf.therapy.manager.TherapyManager.getTherapyRow(..)) || 
      call(List<org.isf.medicals.model.Medical> org.isf.therapy.manager.TherapyManager.getMedicalsOutOfStock(..)) || 
      call(void org.isf.therapy.service.TherapyPatientMergedEventListener.handle(..)) || 
      call(List<org.isf.therapy.model.TherapyRow> org.isf.therapy.service.TherapyIoOperations.getTherapyRows(..)) || 
      call(org.isf.therapy.model.TherapyRow org.isf.therapy.service.TherapyIoOperations.newTherapy(..)) || 
      call(boolean org.isf.therapy.service.TherapyIoOperations.deleteAllTherapies(..)) || 
      call(boolean org.isf.therapy.service.TherapyIoOperations.isCodePresent(..)) || 
      call(boolean org.isf.dicomtype.manager.DicomTypeBrowserManager.isCodePresent(..)) || 
      call(List<org.isf.dicomtype.model.DicomType> org.isf.dicomtype.manager.DicomTypeBrowserManager.getDicomType(..)) || 
      call(boolean org.isf.dicomtype.manager.DicomTypeBrowserManager.updateDicomType(..)) || 
      call(boolean org.isf.dicomtype.manager.DicomTypeBrowserManager.newDicomType(..)) || 
      call(boolean org.isf.dicomtype.manager.DicomTypeBrowserManager.deleteDicomType(..)) || 
      call(boolean org.isf.dicomtype.service.DicomTypeIoOperation.isCodePresent(..)) || 
      call(List<org.isf.dicomtype.model.DicomType> org.isf.dicomtype.service.DicomTypeIoOperation.getDicomType(..)) || 
      call(boolean org.isf.dicomtype.service.DicomTypeIoOperation.updateDicomType(..)) || 
      call(boolean org.isf.dicomtype.service.DicomTypeIoOperation.newDicomType(..)) || 
      call(boolean org.isf.dicomtype.service.DicomTypeIoOperation.deleteDicomType(..)) || 
      call(boolean org.isf.disctype.manager.DischargeTypeBrowserManager.isCodePresent(..)) || 
      call(List<org.isf.disctype.model.DischargeType> org.isf.disctype.manager.DischargeTypeBrowserManager.getDischargeType(..)) || 
      call(boolean org.isf.disctype.manager.DischargeTypeBrowserManager.newDischargeType(..)) || 
      call(boolean org.isf.disctype.manager.DischargeTypeBrowserManager.deleteDischargeType(..)) || 
      call(boolean org.isf.disctype.manager.DischargeTypeBrowserManager.updateDischargeType(..)) || 
      call(boolean org.isf.disctype.service.DischargeTypeIoOperation.isCodePresent(..)) || 
      call(List<org.isf.disctype.model.DischargeType> org.isf.disctype.service.DischargeTypeIoOperation.getDischargeType(..)) || 
      call(boolean org.isf.disctype.service.DischargeTypeIoOperation.newDischargeType(..)) || 
      call(boolean org.isf.disctype.service.DischargeTypeIoOperation.deleteDischargeType(..)) || 
      call(boolean org.isf.disctype.service.DischargeTypeIoOperation.updateDischargeType(..)) || 
      call(boolean org.isf.dicom.manager.SqlDicomManager.exist(..)) || 
      call(void org.isf.dicom.manager.SqlDicomManager.saveFile(..)) || 
      call(org.isf.dicom.model.FileDicom org.isf.dicom.manager.SqlDicomManager.loadDetails(..)) || 
      call(java.lang.Long[] org.isf.dicom.manager.SqlDicomManager.getSerieDetail(..)) || 
      call(boolean org.isf.dicom.manager.SqlDicomManager.deleteSerie(..)) || 
      call(long org.isf.dicom.manager.FileSystemDicomManager.getFirst(..)) || 
      call(void org.isf.dicom.manager.FileSystemDicomManager.saveFile(..)) || 
      call(org.isf.dicom.model.FileDicom org.isf.dicom.manager.FileSystemDicomManager.loadDetails(..)) || 
      call(java.lang.Long[] org.isf.dicom.manager.FileSystemDicomManager.getSerieDetail(..)) || 
      call(long org.isf.dicom.manager.FileSystemDicomManager.nextId(..)) || 
      call(void org.isf.dicom.manager.FileSystemDicomManager.setDir(..)) || 
      call(void org.isf.dicom.manager.FileSystemDicomManager.parseDicomProperties(..)) || 
      call(int org.isf.dicom.manager.FileSystemDicomManager.getFramesCount(..)) || 
      call(void org.isf.dicom.manager.FileSystemDicomManager.recourse(..)) || 
      call(java.io.File org.isf.dicom.manager.FileSystemDicomManager.getPatientDir(..)) || 
      call(List<org.isf.dicom.model.FileDicom> org.isf.dicom.service.DicomIoOperationRepository.findAllWhereIdAndNumberByOrderNameAsc(..)) || 
      call(List<org.isf.dicom.model.FileDicom> org.isf.dicom.service.DicomIoOperationRepository.findAllWhereIdGroupBySeriesInstanceUIDOrderSerDateDesc(..)) || 
      call(List<org.isf.dicom.model.FileDicom> org.isf.dicom.service.DicomIoOperationRepository.findAllWhereIdAndFileAndUid(..)) || 
      call(void org.isf.dicom.service.DicomIoOperationRepository.deleteByIdAndNumber(..)) || 
      call(int org.isf.dicom.service.DicomIoOperationRepository.seriesExists(..)) || 
      call(int org.isf.dicom.service.DicomIoOperationRepository.countFramesInSeries(..)) || 
      call(boolean org.isf.dicom.service.DicomIoOperations.exist(..)) || 
      call(void org.isf.dicom.service.DicomIoOperations.saveFile(..)) || 
      call(org.isf.dicom.model.FileDicom org.isf.dicom.service.DicomIoOperations.loadDetails(..)) || 
      call(boolean org.isf.dicom.service.DicomIoOperations.isSeriesPresent(..)) || 
      call(java.lang.Long[] org.isf.dicom.service.DicomIoOperations.getSerieDetail(..)) || 
      call(boolean org.isf.dicom.service.DicomIoOperations.isCodePresent(..)) || 
      call(boolean org.isf.dicom.service.DicomIoOperations.deleteSerie(..)) || 
      call(boolean org.isf.pregtreattype.manager.PregnantTreatmentTypeBrowserManager.isCodePresent(..)) || 
      call(boolean org.isf.pregtreattype.manager.PregnantTreatmentTypeBrowserManager.updatePregnantTreatmentType(..)) || 
      call(List<org.isf.pregtreattype.model.PregnantTreatmentType> org.isf.pregtreattype.manager.PregnantTreatmentTypeBrowserManager.getPregnantTreatmentType(..)) || 
      call(boolean org.isf.pregtreattype.manager.PregnantTreatmentTypeBrowserManager.newPregnantTreatmentType(..)) || 
      call(boolean org.isf.pregtreattype.manager.PregnantTreatmentTypeBrowserManager.deletePregnantTreatmentType(..)) || 
      call(boolean org.isf.pregtreattype.service.PregnantTreatmentTypeIoOperation.isCodePresent(..)) || 
      call(boolean org.isf.pregtreattype.service.PregnantTreatmentTypeIoOperation.updatePregnantTreatmentType(..)) || 
      call(List<org.isf.pregtreattype.model.PregnantTreatmentType> org.isf.pregtreattype.service.PregnantTreatmentTypeIoOperation.getPregnantTreatmentType(..)) || 
      call(boolean org.isf.pregtreattype.service.PregnantTreatmentTypeIoOperation.newPregnantTreatmentType(..)) || 
      call(boolean org.isf.pregtreattype.service.PregnantTreatmentTypeIoOperation.deletePregnantTreatmentType(..));
   
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
     	 /* Evaluation Start (TIME 1) */
     	 time1 = System.currentTimeMillis(); 
     	 /* Evaluation End */ 
     	 
    	 // Update the Sequence Diagram Text File    	     	 
 	     updateSeqDiagTextFile(callerClass, calleeClass, fullMethod, note, callerClassLine, calleeClassLine); 
 	     
 		 /* Evaluation Start (TIME 2) */
 		 time2 = System.currentTimeMillis();
 		 duration = time2 - time1;
 		 System.out.println("Message FRL: The UML Sequence Diagram METHOD EXCHANGE: " + fullMethod +  " was CREATED in =>: " + 
 		 duration + " milliseconds.");
 		 /* Evaluation End */  
 	  } 
	        
   } 

   pointcut connect(): 
      call(void org.isf.menu.gui.Login.acceptPwd(..))||
      call(List org.isf.menu.manager.UserBrowsingManager.getMenu(..));
   	            
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
      
      /* Evaluation Start (TIME 1) */
  	  time1 = System.currentTimeMillis(); 
  	  /* Evaluation End */ 
      
      // Write this division into the UML Sequence Diagram Text File
      writeTextFile(umlSeqDiagTextFile, content);
      
      /* Evaluation Start (TIME 2) */
 	  time2 = System.currentTimeMillis();
 	  duration = time2 - time1;
 	  
 	  System.out.println("Message FRL: The UML Sequence Diagram USER CONNECTION was CREATED in =>: " + 
 	 		 duration + " milliseconds.");    
 	  /* Evaluation End */
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

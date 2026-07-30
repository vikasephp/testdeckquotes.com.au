<?php
/*
<fusedoc fuse="fbx_Circuits.php">
	<responsibilities>
		I define the Circuits structure used with Fusebox 3.0.  Use slashes ("/") to delimit the circuit mapping, i.e.: $Fusebox["circuits"]["red"] = "home/folder/redCircuit";
	</responsibilities>
	<io>
		<out>
			<string name="$Fusebox['circuits'][*]" comments="set a variable for each circuit name" />
		</out>
	</io>
</fusedoc>
*/

$Fusebox['circuits']['home'] = './';

//Home Warranty Policy
$Fusebox['circuits']['home_warranty_policy'] = './home_warranty_policy/site/modules/site/frontend';

// site module
$Fusebox['circuits']['site'] = './site/modules/site/frontend';
$Fusebox['circuits']['admin'] = './site/modules/site/admin';

// page module
$Fusebox['circuits']['page'] = './site/modules/page/frontend';
$Fusebox['circuits']['pageAdmin'] = './site/modules/page/admin';

// user module
$Fusebox['circuits']['user'] = './site/modules/user/frontend';
$Fusebox['circuits']['userAdmin'] = './site/modules/user/admin';


// 404 module
$Fusebox['circuits']['404'] = './site/modules/404/frontend';
$Fusebox['circuits']['404Admin'] = './site/modules/404/admin';

// books module
$Fusebox['circuits']['category'] = './site/modules/category/frontend';
$Fusebox['circuits']['categoryAdmin'] = './site/modules/category/admin';

// business module
$Fusebox['circuits']['business'] = './site/modules/business/frontend';
$Fusebox['circuits']['businessAdmin'] = './site/modules/business/admin';

// Business status module
$Fusebox['circuits']['status'] = './site/modules/status/frontend';
$Fusebox['circuits']['statusAdmin'] = './site/modules/status/admin';

// Business interest module
$Fusebox['circuits']['interest'] = './site/modules/interest/frontend';
$Fusebox['circuits']['interestAdmin'] = './site/modules/interest/admin';

// Customer type module
$Fusebox['circuits']['types'] = './site/modules/types/frontend';
$Fusebox['circuits']['typesAdmin'] = './site/modules/types/admin';

// Customer status module
$Fusebox['circuits']['customerstatus'] = './site/modules/customerstatus/frontend';
$Fusebox['circuits']['customerstatusAdmin'] = './site/modules/customerstatus/admin';

// customer module
$Fusebox['circuits']['customer'] = './site/modules/customer/frontend';
$Fusebox['circuits']['customerAdmin'] = './site/modules/customer/admin';

//customersaller Module
$Fusebox['circuits']['customersaller'] = './site/modules/customersaller/frontend';
$Fusebox['circuits']['customersallerAdmin'] = './site/modules/customersaller/admin';

//doctypes Module
$Fusebox['circuits']['doctypes'] = './site/modules/doctypes/frontend';
$Fusebox['circuits']['doctypesAdmin'] = './site/modules/doctypes/admin';

//states Module
$Fusebox['circuits']['statesAdmin'] = './site/modules/states/admin';

//business_status_task Module
$Fusebox['circuits']['business_status_taskAdmin'] = './site/modules/business_status_task/admin';

//Proposal Task List Module
$Fusebox['circuits']['proposal_task_listAdmin'] = './site/modules/proposal_task_list/admin';

//Document check list
$Fusebox['circuits']['documentCheckListAdmin'] = './site/modules/documentCheckList/admin';

//Document check list
$Fusebox['circuits']['documentCheckListMiniAdmin'] = './site/modules/documentCheckListMini/admin';

//Custom document check list
$Fusebox['circuits']['customdocumentCheckListAdmin'] = './site/modules/customdocumentCheckList/admin';

//Business for sale listing
$Fusebox['circuits']['business_salelisting'] = './site/modules/business_salelisting/frontend';

//enquerysource Module
$Fusebox['circuits']['enquerysource'] = './site/modules/enquerysource/frontend';
$Fusebox['circuits']['enquerysourceAdmin'] = './site/modules/enquerysource/admin';

//enquerysource Module
$Fusebox['circuits']['vcard'] = './site/modules/vcard/frontend';
//emailtemplate Module
$Fusebox['circuits']['emailtemplate'] = './site/modules/emailtemplate/frontend';
$Fusebox['circuits']['emailtemplateAdmin'] = './site/modules/emailtemplate/admin';
//emailsystems
$Fusebox['circuits']['emailsystemsAdmin'] = './site/modules/emailsystems/admin';
//emailtracking
$Fusebox['circuits']['emailtrackingAdmin'] = './site/modules/emailtracking/admin';

//emailtypes
$Fusebox['circuits']['emailtypesAdmin'] = './site/modules/emailtypes/admin';

//authorizearea
$Fusebox['circuits']['authorizeareaAdmin'] = './site/modules/authorizearea/admin';

//datafields
$Fusebox['circuits']['datafieldsAdmin'] = './site/modules/datafields/admin';

//enquerysource Module
$Fusebox['circuits']['sellerlisting'] = './site/modules/sellerlisting/frontend';
$Fusebox['circuits']['sellerlistingAdmin'] = './site/modules/sellerlisting/admin';

//dochub Module
$Fusebox['circuits']['dochub'] = './site/modules/dochub/frontend';
$Fusebox['circuits']['dochubAdmin'] = './site/modules/dochub/admin';

//businessqa Module
$Fusebox['circuits']['businessqa'] = './site/modules/businessqa/frontend';
$Fusebox['circuits']['businessqaAdmin'] = './site/modules/businessqa/admin';

//surveyresponse Module
$Fusebox['circuits']['surveyresponse'] = './site/modules/surveyresponse/frontend';
$Fusebox['circuits']['surveyresponseAdmin'] = './site/modules/surveyresponse/admin';

//People Management Module
$Fusebox['circuits']['people_management'] = './site/modules/people_management/frontend';
$Fusebox['circuits']['people_managementAdmin'] = './site/modules/people_management/admin';


//Person Responsible Module
$Fusebox['circuits']['person_responsible'] = './site/modules/person_responsible/frontend';
$Fusebox['circuits']['person_responsibleAdmin'] = './site/modules/person_responsible/admin';

//Master list Module
$Fusebox['circuits']['master_list'] = './site/modules/master_list/frontend';
$Fusebox['circuits']['master_listAdmin'] = './site/modules/master_list/admin';

//Buyer Matches Module
$Fusebox['circuits']['buyermatches'] = './site/modules/buyermatches/frontend';
$Fusebox['circuits']['buyermatchesAdmin'] = './site/modules/buyermatches/admin';

//Buyer Matches Module
$Fusebox['circuits']['todolist'] = './site/modules/todolist/frontend';
$Fusebox['circuits']['todolistAdmin'] = './site/modules/todolist/admin';

//Template Docs Module
$Fusebox['circuits']['templatedoc'] = './site/modules/templatedoc/frontend';
$Fusebox['circuits']['templatedocAdmin'] = './site/modules/templatedoc/admin';

//Reports Module
$Fusebox['circuits']['reports'] = './site/modules/reports/frontend';
$Fusebox['circuits']['reportsAdmin'] = './site/modules/reports/admin';

//Guide Module
$Fusebox['circuits']['guide'] = './site/modules/guide/frontend';
$Fusebox['circuits']['guideAdmin'] = './site/modules/guide/admin';

//Bustrategydocs Module
$Fusebox['circuits']['bustrategydocs'] = './site/modules/bustrategydocs/frontend';
$Fusebox['circuits']['bustrategydocsAdmin'] = './site/modules/bustrategydocs/admin';

//CMA Module
$Fusebox['circuits']['cma'] = './site/modules/cma/frontend';
$Fusebox['circuits']['cmaAdmin'] = './site/modules/cma/admin';

//Lead Generation
$Fusebox['circuits']['lead'] = './site/modules/lead/frontend';
$Fusebox['circuits']['leadAdmin'] = './site/modules/lead/admin';

//Position
$Fusebox['circuits']['position'] = './site/modules/position/frontend';
$Fusebox['circuits']['positionAdmin'] = './site/modules/position/admin';

//Project Types
$Fusebox['circuits']['project_types'] = './site/modules/project_types/frontend';
$Fusebox['circuits']['project_typesAdmin'] = './site/modules/project_types/admin';





//Gallery
$Fusebox['circuits']['gallery'] = './site/modules/gallery/frontend';
$Fusebox['circuits']['galleryAdmin'] = './site/modules/gallery/admin';

//qa
$Fusebox['circuits']['qa'] = './site/modules/qa/frontend';
$Fusebox['circuits']['qaAdmin'] = './site/modules/qa/admin';

//Question Answer Stream
$Fusebox['circuits']['question_answer_stream'] = './site/modules/question_answer_stream/frontend';
$Fusebox['circuits']['question_answer_streamAdmin'] = './site/modules/question_answer_stream/admin';


//question answer
$Fusebox['circuits']['queans'] = './site/modules/queans/frontend';
$Fusebox['circuits']['queansAdmin'] = './site/modules/queans/admin';


//internal question answer
$Fusebox['circuits']['internal_queans'] = './site/modules/internal_queans/frontend';
$Fusebox['circuits']['internal_queansAdmin'] = './site/modules/internal_queans/admin';



//Courier Box Design Brochures
$Fusebox['circuits']['courierbox_design_brochures'] = './site/modules/courierbox_design_brochures/frontend';

//Design Interface
$Fusebox['circuits']['design_example'] = './site/modules/design_example/frontend';
$Fusebox['circuits']['design_exampleAdmin'] = './site/modules/design_example/admin';

//partners_types
$Fusebox['circuits']['partners_types'] = './site/modules/partners_types/frontend';
$Fusebox['circuits']['partners_typesAdmin'] = './site/modules/partners_types/admin';



//materials
$Fusebox['circuits']['material_management'] = './site/modules/material_management/frontend';
$Fusebox['circuits']['material_managementAdmin'] = './site/modules/material_management/admin';

//creation
$Fusebox['circuits']['creation'] = './site/modules/creation/frontend';
$Fusebox['circuits']['creationAdmin'] = './site/modules/creation/admin';

//project_types_task
$Fusebox['circuits']['project_types_task'] = './site/modules/project_types_task/frontend';
$Fusebox['circuits']['project_types_taskAdmin'] = './site/modules/project_types_task/admin';

//project_types_task
$Fusebox['circuits']['ohsprocedures'] = './site/modules/ohsprocedures/frontend';
$Fusebox['circuits']['ohsproceduresAdmin'] = './site/modules/ohsprocedures/admin';

//project_types_task
$Fusebox['circuits']['ohstemplates'] = './site/modules/ohstemplates/frontend';
$Fusebox['circuits']['ohstemplatesAdmin'] = './site/modules/ohstemplates/admin';

//Job_Pricing
$Fusebox['circuits']['priceing'] = './site/modules/priceing/frontend';
$Fusebox['circuits']['priceingAdmin'] = './site/modules/priceing/admin';

//projectcostcenter
$Fusebox['circuits']['projectcostcenter'] = './site/modules/projectcostcenter/frontend';
$Fusebox['circuits']['projectcostcenterAdmin'] = './site/modules/projectcostcenter/admin';

//Preports
$Fusebox['circuits']['preports'] = './site/modules/preports/frontend';
$Fusebox['circuits']['preportsAdmin'] = './site/modules/preports/admin';

//Preports
$Fusebox['circuits']['docs'] = './site/modules/docs/frontend';
$Fusebox['circuits']['docsAdmin'] = './site/modules/docs/admin';

//Followsource
$Fusebox['circuits']['followsource'] = './site/modules/followsource/frontend';
$Fusebox['circuits']['followsourceAdmin'] = './site/modules/followsource/admin';

//Followtypes
$Fusebox['circuits']['followtypes'] = './site/modules/followtypes/frontend';
$Fusebox['circuits']['followtypesAdmin'] = './site/modules/followtypes/admin';

//Form_fields
$Fusebox['circuits']['form_fieldstypes'] = './site/modules/form_fields/frontend';
$Fusebox['circuits']['form_fieldsAdmin'] = './site/modules/form_fields/admin';

//Styleformula
$Fusebox['circuits']['styleformula'] = './site/modules/styleformula/frontend';
$Fusebox['circuits']['styleformulaAdmin'] = './site/modules/styleformula/admin';

//KitomeStyleGuide
$Fusebox['circuits']['kitomestyleguide'] = './site/modules/kitomestyleguide/frontend';
$Fusebox['circuits']['kitomestyleguideAdmin'] = './site/modules/kitomestyleguide/admin';

//Calculator Decking
$Fusebox['circuits']['calculator'] = './site/modules/calculator/frontend';
$Fusebox['circuits']['calculatorAdmin'] = './site/modules/calculator/admin';

//Drawing and Design
$Fusebox['circuits']['drawing'] = './site/modules/drawing/frontend';
$Fusebox['circuits']['drawingAdmin'] = './site/modules/drawing/admin';

//Drawing and Design
$Fusebox['circuits']['galleries'] = './site/modules/galleries/frontend';
$Fusebox['circuits']['galleriesAdmin'] = './site/modules/galleries/admin';

//Email Library
$Fusebox['circuits']['email_library'] = './site/modules/email_library/frontend';
$Fusebox['circuits']['email_libraryAdmin'] = './site/modules/email_library/admin';

//Email Library New
$Fusebox['circuits']['emaillibrary'] = './site/modules/emaillibrary/frontend';
$Fusebox['circuits']['emaillibraryAdmin'] = './site/modules/emaillibrary/admin';

//Email Contacts
$Fusebox['circuits']['email_contactsAdmin'] = './site/modules/email_contacts/admin';

//Email Signature
$Fusebox['circuits']['email_signatureAdmin'] = './site/modules/email_signature/admin';

//Project Customer Type
$Fusebox['circuits']['projectcustomertypeAdmin'] = './site/modules/projectcustomertype/admin';

//Automated Reports
$Fusebox['circuits']['automated_reports'] = './site/modules/automated_reports/frontend';

//Meeting Minutes
$Fusebox['circuits']['meeting_minutes'] = './site/modules/meeting_minutes/frontend';

//Availability List
$Fusebox['circuits']['availability_list'] = './site/modules/availability_list/frontend';

//Customer QA
$Fusebox['circuits']['customer_qa'] = './site/modules/customer_qa/frontend';

//Financial Document Check List
$Fusebox['circuits']['documentCheckListFinancialAdmin'] = './site/modules/documentCheckListFinancial/admin';

//FDCH
$Fusebox['circuits']['fdch'] = './site/modules/fdch/frontend';

//Recruitment List
$Fusebox['circuits']['recruitment_list'] = './site/modules/recruitment_list/frontend';

//Style Text Report
$Fusebox['circuits']['styletextreport'] = './site/modules/styletextreport/frontend';

//Street Checklist
$Fusebox['circuits']['street_checklist'] = './site/modules/street_checklist/frontend';

//Position Matrix
$Fusebox['circuits']['position_matrix'] = './site/modules/position_matrix/frontend';

//Users Log
$Fusebox['circuits']['users_logAdmin'] = './site/modules/users_log/admin';

//Da Tracker
$Fusebox['circuits']['da_tracker'] = './site/modules/da_tracker/frontend';

//Staff Bulletins
$Fusebox['circuits']['staff_bulletin'] = './site/modules/staff_bulletin/frontend';

//Upload Test
$Fusebox['circuits']['upload_test'] = './site/modules/upload_test/frontend';

//Recorded Meetings
$Fusebox['circuits']['recorded_meeting'] = './site/modules/recorded_meeting/frontend';

// Styleformula_fpl

$Fusebox['circuits']['styleformula_fpl'] = './site/modules/styleformula_fpl/frontend';

// Air BB Database
$Fusebox['circuits']['air_bb_database'] = './site/modules/air_bb_database/frontend';

// Cgfb Street Sign
$Fusebox['circuits']['street_sign'] = './site/modules/street_sign/frontend';

//Contact List
$Fusebox['circuits']['contact_list'] = './site/modules/contact_list/frontend';

//Merge Report
$Fusebox['circuits']['mergereport'] = './site/modules/mergereport/frontend';

//Poincc
$Fusebox['circuits']['poincc'] = './site/modules/poincc/frontend';

//EDC
$Fusebox['circuits']['edc'] = './site/modules/edc/frontend';

//Prospect List
$Fusebox['circuits']['prospect_list'] = './site/modules/prospect_list/frontend';

//Mistake Log
$Fusebox['circuits']['mistake_log'] = './site/modules/mistake_log/frontend';

//Meeting Record Internal
$Fusebox['circuits']['meeting_recording_internal'] = './site/modules/meeting_recording_internal/frontend';

//Partners Agreements
$Fusebox['circuits']['partners_agreements'] = './site/modules/partners_agreements/frontend';

//Payment Status
$Fusebox['circuits']['payment_stageAdmin'] = './site/modules/payment_stage/admin';

//planning_progress_report
$Fusebox['circuits']['planning_progress_report'] = './site/modules/planning_progress_report/frontend';



//planning_assesment_quickreport
$Fusebox['circuits']['planning_assesment_quickreport'] = './site/modules/planning_assesment_quickreport/frontend';

//planning_assesment_oldreport
$Fusebox['circuits']['planning_assesment_oldreport'] = './site/modules/planning_assesment_oldreport/frontend';

//Proposal checklist  report
$Fusebox['circuits']['proposal_checklist_report'] = './site/modules/proposal_checklist_report/frontend';


//Report Page
$Fusebox['circuits']['report_page'] = './site/modules/report_page/frontend';


//Inclusions Report
$Fusebox['circuits']['inclusions_report'] = './site/modules/inclusions_report/frontend';

//Construction Report
$Fusebox['circuits']['construction_report'] = './site/modules/construction_report/frontend';

//Complete Report
$Fusebox['circuits']['complete_report'] = './site/modules/complete_report/frontend';

//Post Par Report
$Fusebox['circuits']['post_par_report'] = './site/modules/post_par_report/frontend';

//Design Report
$Fusebox['circuits']['design_report'] = './site/modules/design_report/frontend';

//Design Report
$Fusebox['circuits']['facts_sheets'] = './site/modules/facts_sheets/frontend';

//cma2
$Fusebox['circuits']['cma2'] = './site/modules/cma2/frontend';

//Current Project Inclusion
$Fusebox['circuits']['quick_select_buttonsAdmin'] = './site/modules/quick_select_buttons/admin';

//Inclusion Task Tracker
$Fusebox['circuits']['inclusions_task_tracker'] = './site/modules/inclusions_task_tracker/frontend';

//Trade Partners
$Fusebox['circuits']['trade_partnersAdmin'] = './site/modules/trade_partners/admin';


//documentclick_projects
$Fusebox['circuits']['documentclick_projectsAdmin'] = './site/modules/documentclick_projects/admin';

//Construction Task Tracker
$Fusebox['circuits']['construction_task_tracker'] = './site/modules/construction_task_tracker/frontend';

//Planning Task Tracker
$Fusebox['circuits']['planning_task_tracker'] = './site/modules/planning_task_tracker/frontend';

//Watch List
$Fusebox['circuits']['watch_list_report'] = './site/modules/watch_list_report/frontend';

//Warranty Log
$Fusebox['circuits']['warranty_log'] = './site/modules/warranty_log/frontend';

//Critical Numbers
$Fusebox['circuits']['critical_numbers'] = './site/modules/critical_numbers/frontend';

//Asset List
$Fusebox['circuits']['asset_list'] = './site/modules/asset_list/frontend';

//Initial Design Task Report
$Fusebox['circuits']['initial_design_task_report'] = './site/modules/initial_design_task_report/frontend';


//Process Street Checklist
$Fusebox['circuits']['process_street_checklist'] = './site/modules/process_street_checklist/admin';
$Fusebox['circuits']['process_street_checklistAdmin'] = './site/modules/process_street_checklist/admin';

//Brief Builder
$Fusebox['circuits']['brief_builder'] = './site/modules/brief_builder/frontend';

//Design Take Off Report
$Fusebox['circuits']['design_take_off_report'] = './site/modules/design_take_off_report/frontend';

//Design Development
$Fusebox['circuits']['design_development'] = './site/modules/design_development/frontend';

//Gcon Guide
$Fusebox['circuits']['gcon_guide'] = './site/modules/gcon_guide/frontend';

//Real Estate Report
$Fusebox['circuits']['real_estate_report'] = './site/modules/real_estate_report/frontend';

//Design Fact Sheet
$Fusebox['circuits']['design_fact_sheet'] = './site/modules/design_fact_sheet/frontend';

//Design Fact Sheet
$Fusebox['circuits']['proposal_report'] = './site/modules/proposal_report/frontend';

//Design QA
$Fusebox['circuits']['design_qa'] = './site/modules/design_qa/frontend';

//Agreed Text
$Fusebox['circuits']['agreed_text_customerAdmin'] = './site/modules/agreed_text_customer/admin';
$Fusebox['circuits']['agreed_text_inclusionAdmin'] = './site/modules/agreed_text_inclusion/admin';
$Fusebox['circuits']['agreed_text_planningAdmin'] = './site/modules/agreed_text_planning/admin';
$Fusebox['circuits']['agreed_text_constructionAdmin'] = './site/modules/agreed_text_construction/admin';

//Construction Pipeline Report
$Fusebox['circuits']['construction_pipeline_report'] = './site/modules/construction_pipeline_report/frontend';



//Designer Tracker
$Fusebox['circuits']['designer_tracker'] = './site/modules/designer_tracker/frontend';

//Action Plan
$Fusebox['circuits']['action_plan'] = './site/modules/action_plan/frontend';

//Document check list
$Fusebox['circuits']['poincc_componentAdmin'] = './site/modules/poincc_component/admin';

//test_page
$Fusebox['circuits']['test_page'] = './site/modules/test_page/frontend';

//Document check list
$Fusebox['circuits']['design_task_typeAdmin'] = './site/modules/design_task_type/admin';

//Job Agreement Builder
$Fusebox['circuits']['job_agreement_builder'] = './site/modules/job_agreement_builder/frontend';

//Purchase Order
$Fusebox['circuits']['purchase_order'] = './site/modules/purchase_order/frontend';

//Brochure Links
$Fusebox['circuits']['brochure_links'] = './site/modules/brochure_links/frontend';

//Construction in progress
$Fusebox['circuits']['construction_in_progress_report'] = './site/modules/construction_in_progress_report/frontend';

//Project Plans Report
$Fusebox['circuits']['project_plans_report'] = './site/modules/project_plans_report/frontend';

//Renovations
$Fusebox['circuits']['renovations'] = './site/modules/renovations/frontend';

//Pre Construction Report
$Fusebox['circuits']['pre_construction_report'] = './site/modules/pre_construction_report/frontend';

//Presented But Bot Signed Report
$Fusebox['circuits']['presented_but_not_signed_report'] = './site/modules/presented_but_not_signed_report/frontend';

//Design Q/A Report
$Fusebox['circuits']['design_qa_report'] = './site/modules/design_qa_report/frontend';

//Mobile List
$Fusebox['circuits']['mobile_list'] = './site/modules/mobile_list/frontend';

//Email List
$Fusebox['circuits']['email_list'] = './site/modules/email_list/frontend';

//Software List
$Fusebox['circuits']['software_list'] = './site/modules/software_list/frontend';

//Strategic_Alliance
$Fusebox['circuits']['strategic_alliance'] = './site/modules/strategic_alliance/frontend';

//Strategic_Alliance
$Fusebox['circuits']['design_process_task_report'] = './site/modules/design_process_task_report/frontend';

//Support List
$Fusebox['circuits']['support_list'] = './site/modules/support_list/frontend';

//Element Control Panel
$Fusebox['circuits']['element_control_panel'] = './site/modules/element_control_panel/frontend';

//Run New Report
$Fusebox['circuits']['run_new_report'] = './site/modules/run_new_report/frontend';

//Project_plans_qa_checklist_report
$Fusebox['circuits']['project_plans_qa_checklist_report'] = './site/modules/project_plans_qa_checklist_report/frontend';

//Renovation Task List Module
$Fusebox['circuits']['renovation_task_listAdmin'] = './site/modules/renovation_task_list/admin';

//Renovation check list
$Fusebox['circuits']['renovationCheckListAdmin'] = './site/modules/renovationCheckList/admin';

//Run New Report
$Fusebox['circuits']['letter_database'] = './site/modules/letter_database/frontend';

//Run New Report
$Fusebox['circuits']['vehicle_log'] = './site/modules/vehicle_log/frontend';

//Planning Meeting Minutes
$Fusebox['circuits']['planning_meeting_minutes'] = './site/modules/planning_meeting_minutes/frontend';

//Type
$Fusebox['circuits']['typeAdmin'] = './site/modules/type/admin';

//Planning Meeting Minutes
$Fusebox['circuits']['companies'] = './site/modules/companies/frontend';

//Renovation Report
$Fusebox['circuits']['renovation_report'] = './site/modules/renovation_report/frontend';

//Calculator Q/A
$Fusebox['circuits']['calculator_qa'] = './site/modules/calculator_qa/frontend';

//Calculator Fact Sheet
$Fusebox['circuits']['calculator_fact_sheet'] = './site/modules/calculator_fact_sheet/frontend';

//Contacts
$Fusebox['circuits']['contacts'] = './site/modules/contacts/frontend';

//Referral Log
$Fusebox['circuits']['referral_log'] = './site/modules/referral_log/frontend';

//Referral Log
$Fusebox['circuits']['construction_alert_report'] = './site/modules/construction_alert_report/frontend';

//Renovation Document Report
$Fusebox['circuits']['renovation_document_report'] = './site/modules/renovation_document_report/frontend';

//New south wales leads report
$Fusebox['circuits']['new_south_wales_leads_report'] = './site/modules/new_south_wales_leads_report/frontend';

//Special condition report
$Fusebox['circuits']['special_condition'] = './site/modules/special_condition/frontend';


//Renovation Style Formaula
$Fusebox['circuits']['renovation_styleformula'] = './site/modules/renovation_styleformula/frontend';

//Renovation Style Formaula
$Fusebox['circuits']['renovation_styletextreport'] = './site/modules/renovation_styletextreport/frontend';

//Renovation Style Formaula
$Fusebox['circuits']['renovation_convert_task_report'] = './site/modules/renovation_convert_task_report/frontend';

//Planning Dates Central Database 
$Fusebox['circuits']['planning_dates_central_database'] = './site/modules/planning_dates_central_database/frontend';

//Phone Log 
$Fusebox['circuits']['phone_log'] = './site/modules/phone_log/frontend';

//Phone Log 
$Fusebox['circuits']['delivery_tracking_report'] = './site/modules/delivery_tracking_report/frontend';

//Quality Assurance Report 
$Fusebox['circuits']['quality_assurance_report'] = './site/modules/quality_assurance_report/frontend';

//Management Report 
$Fusebox['circuits']['management_report'] = './site/modules/management_report/frontend';

//Salutation Report 
$Fusebox['circuits']['salutation_report'] = './site/modules/salutation_report/frontend';

//Customer Survey
$Fusebox['circuits']['customer_survey'] = './site/modules/customer_survey/frontend';

//Customer Survey
$Fusebox['circuits']['asset_list2'] = './site/modules/asset_list2/frontend';


//Warranty
$Fusebox['circuits']['warranty'] = './site/modules/warranty/frontend';

//Project Proposal status task unanswered report
$Fusebox['circuits']['pp_task_unasnwerd_qa_report'] = './site/modules/pp_task_unasnwerd_qa_report/frontend';



//Letter Delivery
$Fusebox['circuits']['letter_delivery'] = './site/modules/letter_delivery/frontend';

//Camera Report
$Fusebox['circuits']['camera_report'] = './site/modules/camera_report/frontend';

//Camera Report
$Fusebox['circuits']['lead_generation_report'] = './site/modules/lead_generation_report/frontend';

//Design Report Renovation
$Fusebox['circuits']['design_report_renovation'] = './site/modules/design_report_renovation/frontend';

//Planning Meeting List
$Fusebox['circuits']['planning_meeting_list'] = './site/modules/planning_meeting_list/frontend';

//Proposal Task Tracker
$Fusebox['circuits']['proposal_task_tracker'] = './site/modules/proposal_task_tracker/frontend';

//Weekly Payment Report
$Fusebox['circuits']['weekly_payment_report'] = './site/modules/weekly_payment_report/frontend';

//Proposal Document Checklist Report
$Fusebox['circuits']['proposal_document_checklist_report'] = './site/modules/proposal_document_checklist_report/frontend';

//Development Log
$Fusebox['circuits']['development_log'] = './site/modules/development_log/frontend';

//New Product Report
$Fusebox['circuits']['new_product_report'] = './site/modules/new_product_report/frontend';


//Planning Review Report
$Fusebox['circuits']['planning_review_report'] = './site/modules/planning_review_report/frontend';

//Progress Payment ( outside )
$Fusebox['circuits']['progress_payment'] = './site/modules/progress_payment/frontend';

//Customer NPS report 
$Fusebox['circuits']['complete_task_tracker'] = './site/modules/complete_task_tracker/frontend';

//Delivery Schedule Report
$Fusebox['circuits']['delivery_schedule_report'] = './site/modules/delivery_schedule_report/frontend';

//Item List Report
$Fusebox['circuits']['item_list_report'] = './site/modules/item_list_report/frontend';

//Contact Update Log
$Fusebox['circuits']['contact_update_log'] = './site/modules/contact_update_log/frontend';

//Roofing Report
$Fusebox['circuits']['roofing_report'] = './site/modules/roofing_report/frontend';

//Email List Builder
$Fusebox['circuits']['email_list_builder'] = './site/modules/email_list_builder/frontend';

//Construction Scheduler Report
$Fusebox['circuits']['construction_scheduler_report'] = './site/modules/construction_scheduler_report/frontend';

//Design Pricing Update Report
$Fusebox['circuits']['roofing_sales_report'] = './site/modules/roofing_sales_report/frontend';


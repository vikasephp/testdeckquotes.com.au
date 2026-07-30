<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="{{$BASE_URL}}" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="{{$BASE_URL}}css/admin/screen.css" rel="stylesheet" type="text/css" media="screen" /> 
<link rel="shortcut icon" href="{{$BASE_URL}}images/favicon.ico" >
<link rel="StyleSheet" href="{{$BASE_URL}}css/admin/dtree.css" type="text/css" />
<script type="text/javascript" src="{{$BASE_URL}}css/admin/dtree.js"></script>
 <script type='text/javascript' src='{{$BASE_URL}}js/swfobject.js'></script>
<title>{{$title}}</title>
</head>
<body>
   
   <table align="center" border="0" width="99%" >
   <tr><td>
   
    <div>
        <div id="site">
     <a href="{{$XFA.site}}">{{$SITE_NAME}}</a>
    
    	</div>
          <!-- login start -->
        <div id="login">
        {{if isset($_SESSION.user.user_id)}}
        {{$_SESSION.user.user_name}}&nbsp;|&nbsp;<a href="{{$XFA.logout}}">Logout</a>
        {{else}}
        <a href="{{$XFA.login}}/r/site.home">Login</a>
        {{/if}}
        </div>
        <!-- login end -->

        <!-- header start -->
        <div id="header" align="center" >
        <h1>{{$SITE_NAME}} - Administration</h1>
        </div>
        <!-- header end -->
    </div>        
  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="nav-back">
   <tr>
    <td>    
     <table border="1px;" width="100%" height="100%" align="center" bgcolor="#FFFFFF">
      <tr>
       <td width="250" valign="top">
			<table border="0"  align="left" cellpadding="0" cellspacing="0">
            <tr><td><img src="{{$BASE_URL}}css/admin/images/admin_panel.gif" border="0" /></td></tr>
 <tr><td align="left" style="padding-left:1px" valign="top" bgcolor="#FFFFFF" width="250">
  <DIV class="dtree">
		<p><a href="javascript: d.openAll();">open all</a> | <a href="javascript: d.closeAll();">close all</a></p>
			<script type="text/javascript">
            <!--
            d = new dTree('d');
            
            d.add(0,-1,'<B>Home</B>','{{$BASE_URL}}admin.home');
            d.add(1,0,'<B>Admin Options</B>');
            
            d.add(500,1,'<B>Pages</B>');
            d.add(501,500,'View/Edit','{{$BASE_URL}}pageAdmin.list');
            d.add(502,500,'Add','{{$BASE_URL}}pageAdmin.detail');
     
            d.add(100,1,'<B>Project Status</B>');
            d.add(200,100,'View/Edit','{{$BASE_URL}}statusAdmin.list');
            d.add(201,100,'Add','{{$BASE_URL}}statusAdmin.detail');
    		
	    d.add(106,1,'<B>Project Types</B>');
            d.add(209,106,'View/Edit','{{$BASE_URL}}project_typesAdmin.list');
            d.add(210,106,'Add','{{$BASE_URL}}project_typesAdmin.detail');
			
	    d.add(112,1,'<B>Project Status Tasks</B>');
            d.add(210,112,'View/Edit','{{$BASE_URL}}business_status_taskAdmin.list');
            d.add(21,112,'Add','{{$BASE_URL}}business_status_taskAdmin.detail');
	    d.add(22,112,'Search Merge and Print Tasks','{{$BASE_URL}}business_status_taskAdmin.search_merge');
	    d.add(23,112,'Add/Edit QA','{{$BASE_URL}}business_status_taskAdmin.qa_add');
	    d.add(24,112,'List QA','{{$BASE_URL}}business_status_taskAdmin.qa_list');
	    d.add(25,112,'Delete Log','{{$BASE_URL}}business_status_taskAdmin.delete_log');
	    d.add(26,112,'Change Log','{{$BASE_URL}}business_status_taskAdmin.change_log');
	    d.add(27,112,'Add Task Auto Email Message','{{$BASE_URL}}business_status_taskAdmin.auto_email_text_task');
	    d.add(28,112,'List Task Auto  Email Message','{{$BASE_URL}}business_status_taskAdmin.auto_email_list');
	    d.add(29,112,'Add Task Auto Text Message','{{$BASE_URL}}business_status_taskAdmin.auto_task_text_msg');
	    d.add(30,112,'List Task Auto Text Message','{{$BASE_URL}}business_status_taskAdmin.auto_text_list');
			
	    d.add(1201,1,'<B>Proposal Task List</B>');
            d.add(991,1201,'View/Edit','{{$BASE_URL}}proposal_task_listAdmin.list');
            d.add(992,1201,'Add','{{$BASE_URL}}proposal_task_listAdmin.detail');
	    d.add(993,1201,'Search Merge and Print Tasks','{{$BASE_URL}}proposal_task_listAdmin.search_merge');
	    d.add(994,1201,'Add/Edit QA','{{$BASE_URL}}proposal_task_listAdmin.qa_add');
	    d.add(995,1201,'List QA','{{$BASE_URL}}proposal_task_listAdmin.qa_list');
	    
	    d.add(5001,1,'<B>Renovation Task List</B>');
            d.add(3001,5001,'View/Edit','{{$BASE_URL}}renovation_task_listAdmin.list');
            d.add(3002,5001,'Add','{{$BASE_URL}}renovation_task_listAdmin.detail');
	    d.add(3003,5001,'Search Merge and Print Tasks','{{$BASE_URL}}renovation_task_listAdmin.search_merge');
	    d.add(3004,5001,'Add/Edit QA','{{$BASE_URL}}renovation_task_listAdmin.qa_add');
	    d.add(3005,5001,'List QA','{{$BASE_URL}}renovation_task_listAdmin.qa_list');
	    
	    d.add(712,1,'<B>Types Task Management</B>');
            d.add(713,712,'View/Edit','{{$BASE_URL}}project_types_taskAdmin.list');
<!--        d.add(714,712,'Add','{{$BASE_URL}}project_types_taskAdmin.detail');
 -->
	    d.add(109,1,'<B>Projects Source Of Enquiry</B>');
            d.add(228,109,'View/Edit','{{$BASE_URL}}enquerysourceAdmin.list');
            d.add(229,109,'Add','{{$BASE_URL}}enquerysourceAdmin.detail');

	    d.add(139,1,'<B>Projects Cost Centres</B>');
            d.add(228,139,'View/Edit','{{$BASE_URL}}projectcostcenterAdmin.list');
            d.add(229,139,'Add','{{$BASE_URL}}projectcostcenterAdmin.detail');

	    d.add(312,1,'<B>Decks Inquiry Options</B>');
            d.add(400,312,'View/Edit','{{$BASE_URL}}creationAdmin.list');
            d.add(401,312,'Add','{{$BASE_URL}}creationAdmin.detail');

	    d.add(113,1,'<B>Document Check List</B>');
            d.add(202,113,'View/Edit','{{$BASE_URL}}documentCheckListAdmin.list');
            d.add(203,113,'Add','{{$BASE_URL}}documentCheckListAdmin.detail');	
			
			
	    d.add(1801,1,'<B>Edit or Merge – Quick Select Button</B>');
	    d.add(2801,1801,'Add Buttons','{{$BASE_URL}}quick_select_buttonsAdmin.detail');
            d.add(2802,1801,'View Buttons','{{$BASE_URL}}quick_select_buttonsAdmin.listbuttons');
	    d.add(2803,1801,'Select Document','{{$BASE_URL}}quick_select_buttonsAdmin.list');
            //d.add(203,113,'Add','{{$BASE_URL}}documentCheckListAdmin.detail');
			
	    d.add(1130,1,'<B>Document Check List Mini</B>');
            d.add(2020,1130,'View/Edit','{{$BASE_URL}}documentCheckListMiniAdmin.list');
            d.add(2030,1130,'Add','{{$BASE_URL}}documentCheckListMiniAdmin.detail');
	    
	    d.add(5002,1,'<B>Document Check List Renovation</B>');
            d.add(3006,5002,'View/Edit','{{$BASE_URL}}renovationCheckListAdmin.list');
            d.add(3007,5002,'Add','{{$BASE_URL}}renovationCheckListAdmin.detail');
			
	    d.add(1132,1,'<B>Document Check List Financial</B>');
            d.add(2040,1132,'View/Edit','{{$BASE_URL}}documentCheckListFinancialAdmin.list');
            d.add(2050,1132,'Add','{{$BASE_URL}}documentCheckListFinancialAdmin.detail');
			
		
		d.add(1140,1,'<B>Planning Project CheckList</B>');
            d.add(2040,1140,'View/Edit','{{$BASE_URL}}project_planning_checklistAdmin.list');
            d.add(2050,1140,'Add','{{$BASE_URL}}project_planning_checklistAdmin.detail');
            
        d.add(1142,1,'<B>Entities Referral</B>');
            d.add(2051,1142,'View/Edit','{{$BASE_URL}}entities_referralAdmin.list');
            d.add(2052,1142,'Add','{{$BASE_URL}}entities_referralAdmin.detail');
				
	    d.add(114,1,'<B>Custom Document Check List</B>');
            d.add(204,114,'View/Edit','{{$BASE_URL}}customdocumentCheckListAdmin.list');
            d.add(205,114,'Add','{{$BASE_URL}}customdocumentCheckListAdmin.detail');
			
	    d.add(115,1,'<B>Design Interface</B>');
            d.add(220,115,'View/Edit','{{$BASE_URL}}design_interfaceAdmin.list');
            d.add(221,115,'Add','{{$BASE_URL}}design_interfaceAdmin.detail');		
	
	
	    //d.add(1204,1,'<B>Poincc Component</B>');
	   // d.add(2011,1204,'View/Edit - Component','{{$BASE_URL}}poincc_componentAdmin.list');
            //d.add(2012,1204,'Add - Component','{{$BASE_URL}}poincc_componentAdmin.detail');
	
	    d.add(5003,1,'<B>Types</B>');
            d.add(2804,5003,'View/Edit - Types','{{$BASE_URL}}typeAdmin.list');
            d.add(2805,5003,'Add - Types','{{$BASE_URL}}typeAdmin.detail');
	    d.add(2806,5003,'View/Edit - Quotes','{{$BASE_URL}}poincc_componentAdmin.list');
            d.add(2807,5003,'Add - Quotes','{{$BASE_URL}}poincc_componentAdmin.detail');	
			
	    d.add(409,1,'<B>Email Type</B>');
            d.add(428,409,'View/Edit','{{$BASE_URL}}emailtypesAdmin.list');
            d.add(429,409,'Add','{{$BASE_URL}}emailtypesAdmin.detail');
			
	    d.add(120,1,'<B>Email Templates</B>');
            d.add(248,120,'View/Edit','{{$BASE_URL}}emailsystemsAdmin.list');
            d.add(249,120,'Add','{{$BASE_URL}}emailsystemsAdmin.detail');
			
	    d.add(1202,1,'<B>Agreed Text</B>');
            d.add(2003,1202,'View/Edit - Customer','{{$BASE_URL}}agreed_text_customerAdmin.list');
            d.add(2004,1202,'Add - Customer','{{$BASE_URL}}agreed_text_customerAdmin.detail');
	    
	    d.add(2005,1202,'View/Edit - Inclusion','{{$BASE_URL}}agreed_text_inclusionAdmin.list');
            d.add(2006,1202,'Add - Inclusion','{{$BASE_URL}}agreed_text_inclusionAdmin.detail');
	    
	    d.add(2007,1202,'View/Edit - Planning','{{$BASE_URL}}agreed_text_planningAdmin.list');
            d.add(2008,1202,'Add - Planning','{{$BASE_URL}}agreed_text_planningAdmin.detail');
	    
	    d.add(2009,1202,'View/Edit - Construction','{{$BASE_URL}}agreed_text_constructionAdmin.list');
            d.add(2010,1202,'Add - Construction','{{$BASE_URL}}agreed_text_constructionAdmin.detail');
	
	    d.add(1923,1,'<B>Email Signature</B>');
            d.add(2106,1923,'View/Edit','{{$BASE_URL}}email_signatureAdmin.list');
            d.add(2107,1923,'Add','{{$BASE_URL}}email_signatureAdmin.detail');		
			
	    d.add(1920,1,'<B>Trade Partners</B>');
            d.add(2101,1920,'View/Edit','{{$BASE_URL}}trade_partnersAdmin.list');
            d.add(2102,1920,'Add','{{$BASE_URL}}trade_partnersAdmin.detail');
	    
	    
	    d.add(1921,1,'<B>DocumentClick Projects</B>');
            d.add(2103,1921,'View/Edit','{{$BASE_URL}}documentclick_projectsAdmin.detail');
  		
	
	    d.add(1922,1,'<B>Process Street Checklist</B>');
            d.add(2104,1922,'View/Edit','{{$BASE_URL}}process_street_checklistAdmin.list');
            d.add(2105,1922,'Add','{{$BASE_URL}}process_street_checklist.detail');
			
	    d.add(1203,1,'<B>Email Contacts</B>');
            d.add(2005,1203,'View/Edit','{{$BASE_URL}}email_contactsAdmin.list');
            d.add(2006,1203,'Add','{{$BASE_URL}}email_contactsAdmin.detail');
			
	    d.add(1403,1,'<B>Payment Stages</B>');
            d.add(2105,1403,'View/Edit','{{$BASE_URL}}payment_stageAdmin.list');
            d.add(2106,1403,'Add','{{$BASE_URL}}payment_stageAdmin.detail');
			
			
	    d.add(1106,1,'<B>Project Customer Type</B>');
            d.add(1912,1106,'View/Edit','{{$BASE_URL}}projectcustomertypeAdmin.list');
	    d.add(1913,1106,'Add','{{$BASE_URL}}projectcustomertypeAdmin.detail');
			
			//d.add(1201,1,'<B>Email Library</B>');
            //d.add(2001,1201,'View/Edit','{{$BASE_URL}}emaillibraryAdmin.list');
            //d.add(2002,1201,'Add','{{$BASE_URL}}emaillibraryAdmin.detail');
			
	    d.add(309,1,'<B>Email Log</B>');
            d.add(328,309,'View/Edit','{{$BASE_URL}}emailtrackingAdmin.list');
			
	    d.add(105,1,'<B>Partnership Type</B>');
            d.add(207,105,'View/Edit','{{$BASE_URL}}partners_typesAdmin.list');
  	    d.add(208,105,'Add','{{$BASE_URL}}partners_typesAdmin.detail');

	    d.add(107,1,'<B>Job Price Options</B>');
            d.add(211,107,'View/Edit','{{$BASE_URL}}priceingAdmin.list');
            d.add(212,107,'Add','{{$BASE_URL}}priceingAdmin.detail');

	    d.add(108,1,'<B>Follow up Sources</B>');
            d.add(218,108,'View/Edit','{{$BASE_URL}}followsourceAdmin.list');
            d.add(219,108,'Add','{{$BASE_URL}}followsourceAdmin.detail');
		
	    d.add(110,1,'<B>Follow up Types</B>');
            d.add(238,110,'View/Edit','{{$BASE_URL}}followtypesAdmin.list');
            d.add(239,110,'Add','{{$BASE_URL}}followtypesAdmin.detail');
			
	    d.add(909,1,'<B>Form Fields</B>');
            d.add(928,909,'View/Edit','{{$BASE_URL}}form_fieldsAdmin.list');
            d.add(929,909,'Add','{{$BASE_URL}}form_fieldsAdmin.detail');
           
	    d.add(133,1,'<B>Material Brands</B>');
            d.add(250,133,'View/Edit','{{$BASE_URL}}brandsAdmin.list');
            d.add(251,133,'Add','{{$BASE_URL}}brandsAdmin.detail');
			
	    d.add(701,1,'<B>Material Suppliers</B>');
            d.add(802,701,'View/Edit','{{$BASE_URL}}suppliersAdmin.list');
	    d.add(803,701,'Add','{{$BASE_URL}}suppliersAdmin.detail');
			
			
	    d.add(1002,1,'<B>Person Responsible</B>');
            d.add(851,1002,'View/Edit','{{$BASE_URL}}person_responsibleAdmin.list');
	    d.add(852,1002,'Add','{{$BASE_URL}}person_responsibleAdmin.detail');
				
	    d.add(111,1,'<B>Materials</B>');
            d.add(240,111,'View/Edit','{{$BASE_URL}}materialsAdmin.list');
            d.add(241,111,'Add','{{$BASE_URL}}materialsAdmin.detail');
			
	    d.add(132,1,'<B>Materials Management</B>');
            d.add(238,132,'View/Edit','{{$BASE_URL}}material_managementAdmin.list');
            d.add(239,132,'Add','{{$BASE_URL}}material_managementAdmin.detail');
			
	    d.add(1001,1,'<B>Question Answer Stream</B>');
            d.add(838,1001,'View/Edit','{{$BASE_URL}}question_answer_streamAdmin.list');
            d.add(839,1001,'Add','{{$BASE_URL}}question_answer_streamAdmin.detail');
			
			
	    d.add(101,1,'<B>Users</B>');
            d.add(202,101,'View/Edit','{{$BASE_URL}}userAdmin.list');
	    d.add(203,101,'View/Edit Customers','{{$BASE_URL}}userAdmin.customers');
            d.add(204,101,'Add','{{$BASE_URL}}userAdmin.detail');
			
	    d.add(622,1,'<B>User log</B>');
            d.add(830,622,'View Log','{{$BASE_URL}}users_logAdmin.list');
			
			d.add(522,1,'<B>User Positions</B>');
            d.add(800,522,'View/Edit','{{$BASE_URL}}positionAdmin.list');
			d.add(401,522,'Add','{{$BASE_URL}}positionAdmin.detail');	
			
			d.add(901,1,'<B>Style Formula Types</B>');
            d.add(1802,901,'View/Edit','{{$BASE_URL}}styleformulaAdmin.list');
			d.add(1803,901,'Add','{{$BASE_URL}}styleformulaAdmin.detail');
			
			d.add(1101,1,'<B>Calculator Options - Decking</B>');
            d.add(1902,1101,'View/Edit','{{$BASE_URL}}calculatorAdmin.list');
			d.add(1903,1101,'Add','{{$BASE_URL}}calculatorAdmin.detail');
					
			d.add(1102,1,'<B>Calculator Options - Wrapping</B>');
            d.add(1904,1102,'View/Edit','{{$BASE_URL}}calculatorAdmin.list_wrapping');
			d.add(1905,1102,'Add','{{$BASE_URL}}calculatorAdmin.detail_wrapping');
			
			d.add(1103,1,'<B>Calculator Options - Sub Frame</B>');
            d.add(1906,1103,'View/Edit','{{$BASE_URL}}calculatorAdmin.list_subframe');
			d.add(1907,1103,'Add','{{$BASE_URL}}calculatorAdmin.detail_subframe');
			
			d.add(1104,1,'<B>Calculator Options - Handrail</B>');
            d.add(1908,1104,'View/Edit','{{$BASE_URL}}calculatorAdmin.list_handrail');
			d.add(1909,1104,'Add','{{$BASE_URL}}calculatorAdmin.detail_handrail');
			
			d.add(1105,1,'<B>Calculator Options - Stairs</B>');
            d.add(1910,1105,'View/Edit','{{$BASE_URL}}calculatorAdmin.list_stairs');
			d.add(1911,1105,'Add','{{$BASE_URL}}calculatorAdmin.detail_stairs');
					
            d.add(102,1,'<B>Change Password</B>');
            d.add(204,102,'Change Password','{{$BASE_URL}}admin.changePassword');
                       
            d.add(103,1,'<B>Log Out</B>');
            d.add(206,103,'Logout','site.logout');
            
            document.write(d);
               //--></SCRIPT>
	</DIV>
 </td></tr>
</table>
       </td>
       <td valign="top" bgcolor="#FFFFFF" height="650">
        <!-- content start -->
       		 <div id="content">
        {{foreach from=$fwSubViews item="fwSubView"}}
            <!-- sub-view start -->
            {{include file=$fwSubView}}
            <!-- sub-view end -->
        {{/foreach}}
        <!-- content end -->
        </div>
       </td>
     </tr>
     <tr>
     	<td colspan="2">
      	<!-- footer start -->
        <div id="footer">&nbsp;Developed By  <a href="http://www.ephpsolutions.com" target="_blank" title="EPHPSolutions.com">EPHPSolutions.com</a></div>
        <!-- footer end -->
        </td>
     </tr>
    </table>
   </td>
  </tr>
 </table>  
</body>
</html>
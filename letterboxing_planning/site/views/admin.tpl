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
   
   <table align="center" border="0" width="99%">
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
			
			d.add(712,1,'<B>Types Task Management</B>');
            d.add(713,712,'View/Edit','{{$BASE_URL}}project_types_taskAdmin.list');
<!--            d.add(714,712,'Add','{{$BASE_URL}}project_types_taskAdmin.detail');
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
			
			d.add(409,1,'<B>Email Type</B>');
            d.add(428,409,'View/Edit','{{$BASE_URL}}emailtypesAdmin.list');
            d.add(429,409,'Add','{{$BASE_URL}}emailtypesAdmin.detail');
			
			d.add(120,1,'<B>Email Templates</B>');
            d.add(248,120,'View/Edit','{{$BASE_URL}}emailsystemsAdmin.list');
            d.add(249,120,'Add','{{$BASE_URL}}emailsystemsAdmin.detail');
			

						
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
				
			d.add(111,1,'<B>Materials</B>');
            d.add(240,111,'View/Edit','{{$BASE_URL}}materialsAdmin.list');
            d.add(241,111,'Add','{{$BASE_URL}}materialsAdmin.detail');
			
			d.add(132,1,'<B>Materials Management</B>');
            d.add(238,132,'View/Edit','{{$BASE_URL}}material_managementAdmin.list');
            d.add(239,132,'Add','{{$BASE_URL}}material_managementAdmin.detail');
			
			d.add(101,1,'<B>Users</B>');
            d.add(202,101,'View/Edit','{{$BASE_URL}}userAdmin.list');
			d.add(203,101,'View/Edit Customers','{{$BASE_URL}}userAdmin.customers');
            d.add(204,101,'Add','{{$BASE_URL}}userAdmin.detail');
	
			d.add(522,1,'<B>User Positions</B>');
            d.add(800,522,'View/Edit','{{$BASE_URL}}positionAdmin.list');
			d.add(401,522,'Add','{{$BASE_URL}}positionAdmin.detail');	

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
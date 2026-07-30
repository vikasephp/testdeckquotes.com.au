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
            d.add(1,0,'<B>Super Admin Options</B>');
            
      /*    d.add(500,1,'<B>Pages</B>');
            d.add(501,500,'View/Edit','{{$BASE_URL}}pageAdmin.list');
            d.add(502,500,'Add','{{$BASE_URL}}pageAdmin.detail');
     */
		
            d.add(101,1,'<B>Administrators</B>');
            d.add(202,101,'View/Edit','{{$BASE_URL}}administratorsAdmin.list');
            d.add(203,101,'Add','{{$BASE_URL}}administratorsAdmin.detail');
            
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
       <td valign="top" bgcolor="#FFFFFF" height="500">
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
        <div id="footer">
        &nbsp;
        </div>
        <!-- footer end -->
        </td>
     </tr>
    </table>
   </td>
  </tr>
 </table>  
</body>
</html>
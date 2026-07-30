<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<base href="{{$BASE_URL}}" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<title>.:: {{$SITE_NAME}} - {{$title}} ::.</title>
<!-- Beginning of compulsory code below -->
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}/js/chrometheme/chromestyle2.css" />
<script type="text/javascript" src="{{$BASE_URL}}/js/chromejs/chrome.js">
</script>
<link href="{{$BASE_URL}}css/default/css/dropdown/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="{{$BASE_URL}}css/default/css/dropdown/themes/default/default.css" media="screen" rel="stylesheet" type="text/css" />
<link href="{{$BASE_URL}}css/default/loader.css" media="screen" rel="stylesheet" type="text/css" />
<link rel="canonical" href="{{$BASE_URL}}" />
<link rel="shortcut icon" href="{{$BASE_URL}}images/favicon.ico" >
<!--[if lt IE 7]>
<script type="text/javascript" src="{{$BASE_URL}}css/default/js/jquery/jquery.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/js/jquery/jquery.dropdown.js"></script>
<![endif]--> 
 
 <style>
		.black_overlay{
			display: none;
			position: absolute;
			top: 0%;
			left: 0%;
			bottom:0%;
			width: 100%;
			height: 320%;
			background-color: white;
			z-index:1001;
			-moz-opacity: 0.8;
			opacity:.80;
			filter: alpha(opacity=80);
		}
		.white_content {
			display: none;
			position: absolute;
			top: 50%;
			left: 45%;
			padding: 0px;
			border: 0px solid orange;
			background-color: white;
			z-index:1002;
			overflow: auto;
		}
	</style>
 
</head>

<body scroll="no">
   <!--StartHTML-->      
    <div align="center"> 
            <table  border="0" cellspacing="0" cellpadding="0" align="center" class="subtabel" width="99%">
                      <!-- Top Blue Bar Starts -->
                        <tr>
                           <td width="10" class="blueBarBg"><img src="{{$BASE_URL}}images/blu-strip-top-left.jpg" alt="" height="34"  /></td>
                            <td width="100%" align="left" valign="middle" class="blueBarBg">
                               <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                   <tr>
                                        <th width="90%" align="left">
                                         <p>
                                            Name:<span>
                                             	  {{if isset($_SESSION.user) && $_SESSION.user.user_id > 0}}
                                                  	{{$_SESSION.user.user_name}}
                                            {{/if}}
                                  
                                             </span>
                                         </p>
                                        </th>
											
                                   </tr>
                                </table>
                            </td>
                            <td width="2" align="right" class="blueBarBg"><img src="{{$BASE_URL}}images/blu-strip-top-right.jpg" alt="" width="12" height="34" /></td>
                       </tr>
               <tr bgcolor="#d3e8d6"><td colspan="3" height="30">&nbsp;</td></tr>        
               <tr><td colspan="3" width="100%">
               			 <table  border="0" cellspacing="0" cellpadding="0" align="center" id="peo_list-table"  width="100%">
                         	<tr bgcolor="#a0d9e9">
                            	<th width="150">HR: </th><td>Documents</td>
                            </tr>
                            <tr bgcolor="#d3e8d6">
                            	<th width="150">Role Description: </th><td>Documents</td>
                            </tr>
                            <tr bgcolor="#a0d9e9">
                            	<th width="150">Ideal Day: </th><td>Documents</td>
                            </tr>
                            <tr bgcolor="#d3e8d6">
                            	<th width="150">Contact Details: </th><td><div>Home Phone:<br>
                                					Mobile: <br />
                                                    Postal address: <br />
                                                    Street Address: <br />
                                                    Superannuation: <br />
                                                    Bank details:  <br />
                                                    Medical notes: 
                                </div> </td>
                            </tr>
                            </table>
                 </td>
                </tr>                

        </table>
        <!-- Main Table Ends -->
    </div>
</body>
</html>
   
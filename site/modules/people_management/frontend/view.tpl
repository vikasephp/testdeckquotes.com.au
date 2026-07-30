<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<base href="{{$BASE_URL}}" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<title>.:: {{$SITE_NAME}} - {{$title}} ::.</title>
<!-- Beginning of compulsory code below -->
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}/js/chrometheme/chromestyle2.css" />
<script type="text/javascript" src="{{$BASE_URL}}/js/chromejs/chrome.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery-1.7.2.js"></script>
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
    <div align="center" class="load_body"> 
     <table id="EMP-list-table" width="100%" style="border-collapse:collapse;">
      <tr><th colspan="4"><div align="center" class="headtag">Personal Contact Details</div></th></tr>
      <tr>
        <th class="labelhead" width="230">Full Name:</th><td>{{$detail.user_name}}</td>
        <th class="labelhead">Email Address:</th><td>{{$detail.user_email}}</td>
      </tr>
      <tr>
        <th class="labelhead">Gender:</th><td>{{$detail.customer_gender}}</td>
        <th class="labelhead">Date of Bitrth:</th><td>{{$detail.customer_dob}}</td>
      </tr>
      <tr>
        <th class="labelhead">Address:</th><td>{{$detail.customer_address}}</td>
        <th class="labelhead">Suburb:</th><td>{{$detail.customer_suburb}}</td>
      </tr>
      <tr>
        <th class="labelhead">State:</th><td>{{$detail.customer_state}}</td>
        <th class="labelhead">Postcode:</th><td>{{$detail.customer_zip}}</td>
      </tr>
      <tr>
        <th class="labelhead">Company:</th><td>{{$detail.customer_company}}</td>
        <th class="labelhead">Health:</th><td>{{$detail.customer_health}}</td>
      <tr>
        <th class="labelhead">Mobile Phone:</th><td>{{$detail.customer_phone}}</td>
        <th class="labelhead">Home Phone:</th><td>{{$detail.customer_phone_business}}</td>
      </tr>
      <tr>
        <th class="labelhead">Bank: </th><td>{{$detail.customer_bank_name}}</td>
        <th class="labelhead">Branch:</th><td>{{$detail.customer_branch_name}}</td>
      </tr>
      <tr>
        <th class="labelhead">Account Name:</th><td colspan="3">{{$detail.customer_account_name}}</td>
      </tr>
      <tr>
        <th class="labelhead">BSB:</th><td>{{$detail.customer_bsb}}</td>
        <th class="labelhead">Bank Account Number:</th><td>{{$detail.customer_account_number}}</td>
      </tr>
      <tr>
        <th class="labelhead">Tax file number:</th><td colspan="3">{{$detail.customer_tax_num}}</td>
      </tr>
      <tr>
        <th class="labelhead">Positions:</th>
        <td colspan="3">{{$detail.p_name}}</td> 
      </tr>
       <tr>
        <th>Super Fund Details:</th>
        <td colspan="3">{{$detail.customer_fund_details}}</td>
      </tr>
        <tr><th colspan="4"><div align="center" class="headtag">Citizenship Details</div></th></tr>
        
        <tr>
        <th>Australian Citizen:</th>
        <td colspan="3">
        	<table width="100%"><tr>
    <td width="10%" colspan="3">{{$detail.customer_auscitizen}}</td>
    <td>{{if $detail.customer_auscitizen_attached}}<div class="customer_auscitizen_attached"><a href="{{$BASE_URL}}files/user_docs/{{$detail.customer_auscitizen_attached}}" target="_blank" title="{{$detail.customer_auscitizen_attached}}">{{$detail.customer_auscitizen_attached|truncate:"35"}}</a></div>{{/if}}</td>		
</tr></table>
       </td>
      </tr>
          <tr><th colspan="4"><div align="center" class="headtag">Qualifications and Licences</div></th></tr>
        <tr>
        <th>Do you have a White Card:</th>
        <td colspan="3">
        	<table width="100%"><tr>
    <td width="10%" colspan="3">{{$detail.customer_white_card}}</td>
    <td>{{if $detail.customer_white_card_attached}}<div class="customer_white_card_attached"><a href="{{$BASE_URL}}files/user_docs/{{$detail.customer_white_card_attached}}" target="_blank" title="{{$detail.customer_white_card_attached}}">{{$detail.customer_white_card_attached|truncate:"35"}}</a></div>{{/if}}</td>		
</tr></table>
       </td>
      </tr> 
        <tr>
        <th class="labelhead">Drivers Licence Details:</th>
        <td colspan="3">
        	<table width="100%">
            <tr>
          <td width="50%">
    <table width="100%" id="none-table">
      <tr>
       <th><strong>Number:</strong>&nbsp;</th><th>{{$detail.customer_dld_number}}</th></tr><tr>
       <th><strong>Class:</strong>&nbsp;</th><th>{{$detail.customer_dld_class}}</th></tr><tr>
       <th><strong>Restrictions:</strong>&nbsp;</th><th>{{$detail.customer_dld_rest}}</th></tr>
       <tr><th><strong>Type:</strong>&nbsp;</th><th>{{$detail.customer_dld_type}}</th>
      </tr>
    </table>          
   </td>
   <td width="40%">{{if $detail.customer_dld_attached}}<div class="customer_dld_attached"><a href="{{$BASE_URL}}files/user_docs/{{$detail.customer_dld_attached}}" target="_blank" title="{{$detail.customer_dld_attached}}">{{$detail.customer_dld_attached|truncate:"35"}}</a></div>{{/if}}</td>
            </tr>
        	</table>
        </td>
      </tr> 
         <tr>
        <th>Formal qualifications:</th>
        <td colspan="2" width="40%">{{if $detail.customer_formail_qua}}<div class="customer_formail_qua"><a href="{{$BASE_URL}}files/user_docs/{{$detail.customer_formail_qua}}" target="_blank" title="{{$detail.customer_formail_qua}}">{{$detail.customer_formail_qua|truncate:"35"}}</a></div>{{/if}}</td>
      </tr>
     <tr><th colspan="4"><div align="center" class="headtag">Medical and Emergency Contact</div></th></tr> 
      <tr>
        <th class="labelhead">Emergency Contact:</th>
        <td colspan="3">{{$detail.customer_econatct}}</td>
      </tr>
      <tr>
        <th class="labelhead">Relationship:</th><td>{{$detail.customer_erelation}}</td>
        <th class="labelhead">Home Phone:</th><td>{{$detail.customer_ehomephone}}</td>
      </tr>
      <tr>
        <th class="labelhead">Work Phone:</th><td>{{$detail.customer_eworkphone}}</td>
        <th class="labelhead">Mobile:</th><td>{{$detail.customer_emobile}}</td>
      </tr>
       <tr>
        <th>Medical Practitioner details:</th>
        <td colspan="3">{{$detail.customer_emp_detail}}</td>
      </tr>
      <tr><th>Medical Conditions that we should be aware of:</th><td colspan="3">{{$detail.customer_emp_condition}}</td></tr> 
       <tr>
      	  <th colspan="4"> 
          <div class="user_docs" id="user_docs" align="left"></div>
          </th>
      </tr>
      <tr>
        <th>Status:</th>
        <td colspan="3">{{if $detail.customer_status == 0}} Current {{elseif $detail.customer_status == 1}} Previous {{/if}}</td>
      </tr>
    </table>
        <!-- Main Table Ends -->
    </div>
<script type="text/javascript">
	$(function() {  
	 $.get('{{$BASE_URL}}people_management.upload/userid/{{$detail.user_id}}', function(data) {
 		 $('.user_docs').html(data);
		}); 
    });  
	
 function del(id) 
	  	{	
			if(confirm("Are you sure you want to delete?")){
					   $(function() {  
					 $.get('{{$BASE_URL}}people_management.upload/del/1/userid/{{$detail.user_id}}/udid/'+id, function(data) {
					$('.user_docs').html(data);
				  }); 
				}); 
			  }
			}

	$(function() {
	   $('.del-docs').click( function() {
		if (confirm("Are you sure want to delete?")){
		var divclass =  $(this).attr('id');
		var URL = $(this).attr('href')+"/userid/{{$detail.user_id}}";  
			 $.get( URL, function(msg) {   
			 $("."+divclass).hide('slow');
			 });
		}	 
			 return false; // don't follow the link!
	   });
	});	
</script>    
</body>
</html>   
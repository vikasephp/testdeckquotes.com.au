<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>

<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />-->
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<style>
input[type="radio"], input[type="checkbox"] {
height:18px; 
width:18px;
padding:15px;
margin:10px;	
}
</style>

<div align="center" style="min-height:350px;">
    <h3 class="page-title">Site Camera Update Form</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="75%" cellpadding="10">
    <input type="hidden" name="camera[ca_id]" value="{{$detail.ca_id}}" />
   {{if $opr}} <tr><th colspan="2" style="color:#0C6; font-size:14px;">Record has been added in phone log</th></tr>{{/if}}
   
    <tr>
     <th style="text-align:left;">Employee Name</th>
    </tr>
     <tr> 
     <td><input type="text" name="camera[ca_employee_name]" style ="width:700px; height:25px;" value="{{$detail.ca_employee_name}}" /></td>
    </tr>
   
     <tr>
     <th style="text-align:left;">Type of Form</th>
    </tr>
     <tr> 
     <td>
     <input type="radio" name="camera[ca_type_of_form]" value="Borrowing cameras from office" onclick="show_site_addr();"/>Borrowing cameras from office<br />
     <input type="radio" name="camera[ca_type_of_form]" value="Moving cameras to another site" onclick="show_site_addr();"/>Moving cameras to another site<br />
     <input type="radio" name="camera[ca_type_of_form]" value="Returning cameras to office" onclick="disable_site_addr();"/>Returning cameras to office<br />
     <input type="radio" name="camera[ca_type_of_form]" value="Cameras damaged" onclick="disable_site_addr();"/>Cameras damaged<br />
     
     <script language="javascript">
     function disable_site_addr()
     {
	     
	$('#sitead').attr('disabled','disabled'); 
	$('#sitead1').hide();   
	$('#sitead2').hide(); 
	//$('#sitead1').show();   
	  
     }
     
     function show_site_addr()
     {
	     
	//$('#sitead').attr('disabled','disabled'); 
	$('#sitead1').show();   
	$('#sitead2').show(); 
	//$('#sitead1').show();   
	  
     }
     </script>
     
     </td>
    </tr>
   
    <tr id="sitead1">
     <th style="text-align:left;">Site Address</th>
    </tr>
     <tr id="sitead2"> 
     <td><input type="text" name="camera[ca_site_address]" style ="width:700px;height:25px;" value="{{$detail.ca_site_address}}" /></td>
    </tr>
   
   
    <tr>
     <th style="text-align:left;">Camera Label Number (Choose One Or More)</th>
    </tr>
     <tr> 
     <td>
    {{foreach from=$todetail key="key" item="item"}}
    <input type="checkbox" name="camera[ca_camera_lnumber][{{$item.to_option}}]" value="{{$item.to_option}}"/> {{$item.to_option}} <br />
    {{/foreach}}
     </td>
    </tr>
       
     <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("phone_log[ph_name]","req", "Please specify name.");
			//frmvalidator.addValidation("phone_log[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("phone_log[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>

<script>
	initSample();
</script>

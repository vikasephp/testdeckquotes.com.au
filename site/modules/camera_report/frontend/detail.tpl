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

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Site Address</th>
     <td><input type="text" name="{{$TABLE}}[cr_site_address]" style ="width:700px" value="{{$detail.cr_site_address}}" />
      </td>
    </tr>
   
   <tr>
     <th>Employee Name</th>
     <td><input  type="text" name="{{$TABLE}}[cr_empl_name]"  value="{{$detail.cr_empl_name}}" style="width:700px;" /> </td>
    </tr>
   
   
   <tr>
     <th>Camera Label Number</th>
     <td><input  type="text" name="{{$TABLE}}[cr_camera_label_num]"  value="{{$detail.cr_camera_label_num}}" style="width:700px;" /> </td>
    </tr>
    
    
    <tr>
     <th>Last Date and Time</th>
     <td><input  type="text" name="{{$TABLE}}[cr_last_update]"  value="{{$detail.cr_last_update}}" style="width:700px;" /> </td>
    </tr>
   
<!--    <tr>
     <th>Messages</th>
     <td>
      <textarea rows="5" name="{{$TABLE}}[ph_message]" id="editor1" class="ckeditor">{{$detail.ph_message|stripslashes}}</textarea>
     </td>
    </tr>-->
     
     <tr>
     <th>Status</th>
     <td> 
        <select name="{{$TABLE}}[cr_status]" >
                <option value="">Please Select </option>
                <option value="On Site" {{if $detail.cr_status eq 'On Site'}} selected="selected" {{/if}}>On Site</option>
                <option value="Returned" {{if $detail.cr_status eq 'Returned'}} selected="selected" {{/if}}>Returned</option>
                <option value="Damaged" {{if $detail.cr_status eq 'Damaged'}} selected="selected" {{/if}}>Damaged</option>
                <option value="On Site - not updating for more than 12 hrs" {{if $detail.cr_status eq 'On Site - not updating for more than 12 hrs'}} selected="selected" {{/if}}>On Site - not updating for more than 12 hrs</option>
                <option value="On Site - not updating for more than 24 hrs" {{if $detail.cr_status eq 'On Site - not updating for more than 24 hrs'}} selected="selected" {{/if}}>On Site - not updating for more than 24 hrs</option>
                
         </select>
     
     </td>
    </tr>
    
  
  
<!--  <tr>
     <th>Priority</th>
         <td><select name="{{$TABLE}}[ph_priority]" style="width:300px;"/>
          <option value="" {{if  $detail.ph_priority == ''}}selected{{/if}}>Please Select</option>
          {{foreach from=$todetail key="key3" item="item3"}}
          <option value="{{$item3.to_option}}"  {{if $detail.ph_priority == $item3.to_id}}selected{{/if}}> {{$item3.to_option}}</option>
          {{/foreach}}
        </select>  
    </td>   </td>
    </tr>
  
   
    <tr>
     <th>Steam </th>
     <td><input  type="text" name="{{$TABLE}}[ph_steam]"  value="{{$detail.ph_steam}}" style="width:700px;" /> </td>
    </td>
    </tr>  -->
   
     
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
			frmvalidator.addValidation("{{$TABLE}}[wa_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>

<script>
	initSample();
</script>
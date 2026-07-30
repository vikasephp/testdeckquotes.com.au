<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;"><br /><br />
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
   
  <tr>
  <th> Upload Image </th> 
  <td> <input type="file" name="scaned_letter" /> </td>      
  </tr>
   
    <tr>
     <th>Project Type</th>
     <td>
         <select name="{{$TABLE}}[ld_project_type]" style="width:300px;"/>
      	    <option value="" {{if  $detail.ld_project_type == ''}}selected{{/if}}>Please Select</option>
            <option value="Project-related"   {{if  $detail.ld_project_type == 'Project-related'}}selected{{/if}}>Project-related</option>
            <option value="Project-unrelated" {{if  $detail.ld_project_type == 'Project-unrelated'}}selected{{/if}}>Project-unrelated</option>
        </select> 
      </td>
    </tr>
   
     <tr>
        <th>Actioned Or Not</th>
        <td>
         <select name="{{$TABLE}}[ld_action]" style="width:300px;"/>
            <option value=""   {{if  $detail.ld_action == ''}}selected{{/if}}>Please Select</option>
            <option value="Actioned"   {{if  $detail.ld_action == 'Actioned'}}selected{{/if}}>Actioned</option>
            <option value="Unactioned" {{if  $detail.ld_action == 'Unactioned'}}selected{{/if}}>Unactioned</option>
         </select>   
        </td>
     </tr>
   
   <tr>
        <th>Sent From</th>
        <td>
         <input type="text"  name="{{$TABLE}}[ld_from]" style ="width:700px" value="{{$detail.ld_from}}" />
        </td>
     </tr>
   
   <tr>
     <th>Sent To</th>
     <td>
         <input type="text"  name="{{$TABLE}}[ld_to]" style ="width:700px" value="{{$detail.ld_to}}" />
      </td>
    </tr>
   
   <tr>
     <th>Who to action</th>
     <td>
         <input type="text"  name="{{$TABLE}}[ld_who_to_action]" style ="width:700px" value="{{$detail.ld_who_to_action}}" />
      </td>
    </tr>
   
    <tr>
     <th>Date of Mail</th>
     <td>
     <input type="text" name="{{$TABLE}}[ld_date]"  value="{{$detail.ld_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> 
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
			frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>
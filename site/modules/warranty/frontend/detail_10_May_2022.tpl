<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />-->

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
    <h3 class="page-title">New Warranty</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project Name</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key" item="item"}}
            <option value="{{$item.bsn_name}}" {{if $bsnid eq $item.bsn_id}} selected="selected" {{/if}}>
            {{$item.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[wa_project]" style ="width:700px" value="{{$detail.wa_project}}" />
      </td>
    </tr>
   
    <tr>
     <th>Contact Info</th>
     <td><input  type="text" name="{{$TABLE}}[wa_contact_info]"  value="{{$detail.wa_contact_info}}" style="width:700px;" /> </td>
    </tr>
   
   
    <tr>
     <th>Type </th>
     <td><input  type="text" name="{{$TABLE}}[wa_type]"  value="{{$detail.wa_type}}" style="width:700px;" /> </td>
    </td>
    </tr>  
   
   
    <tr>
     <th>Date</th>
     <td><input  type="text" name="{{$TABLE}}[wa_date]"  value="{{$detail.wa_date}}" id="demo1" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
     
    <tr>
     <th>Tenanted</th>
     <td><!--<input  type="text" name="{{$TABLE}}[wa_tenanted]"  value="{{$detail.wa_tenanted}}" style="width:700px;" />--> 
         <input type="checkbox" name="{{$TABLE}}[wa_tenanted]" {{if $detail.wa_tenanted eq 1 }} checked="checked" {{/if}}  />
      </td>
    </tr>
   
     <tr>
        <th>Complete and Close Letter</th>
        <td><input type="file" name="cc_letter" />
        {{if $detail.wa_cc_letter}} <a href="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wa_cc_letter}}" target="_blank">Download</a>{{/if}}
        </td>
     </tr>  
    
        <tr>
        <th>Problem Description</th>
        <td><textarea cols="120" rows="16" name="{{$TABLE}}[wa_prob_desc]" id="editor1" class="ckeditor" >{{$detail.wa_prob_desc|stripslashes}}</textarea>    
 </td>
     </tr> 
    
       
    
     <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Return To Warrranty List" onclick="location.href='{{$BASE_URL}}{{$XFA.home}}';" class="vsml" />
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

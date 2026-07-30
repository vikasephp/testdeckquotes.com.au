<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>

{{include file=$jdata}}
{{include file=$tiny_basic}}

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
     <th>Project</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[qm_project]" style ="width:700px" value="{{$detail.qm_project}}" />
      </td>
    </tr>
   
   {{if $detail.$ID}}
   <tr>
	   <th>Component</th>
	   <td> 
			<!-- {{foreach from=$cdetail key="key2" item="item2"}}
				{{if $item2.qb_id eq $detail.qm_component }}{{$item2.qb_component}}{{/if}}
			{{/foreach}} -->
			<select name="{{$TABLE}}[qm_component]"  >
				<option value="-1" {{if $detail.qm_component eq -1}} selected="selected" {{/if}}>Please Select </option>
				{{foreach from = $cdetail key="key2" item="item2"}}
				<option value="{{$item2.qb_id}}" {{if $item2.qb_id eq $detail.qm_component }} selected="selected" {{/if}}>{{$item2.qb_component}}</option>
				{{/foreach}}
			</select>   
	   </td>
   </tr>
   {{/if}}
   
   <tr>
     <th>Quote Description</th>
     <td><textarea name="{{$TABLE}}[qm_quote_desc]" id="editor"  cols="100" rows="15">{{$detail.qm_quote_desc}}</textarea> </td>
   </tr>
       
  <tr>
  <th> Upload Attachment </th> 
  <td>  <b>1.&nbsp;</b><input type="file" name="attach_1" />
        <b>2.&nbsp;</b><input type="file" name="attach_2" />
        <b>3.&nbsp;</b><input type="file" name="attach_3" /><br />
        <b>4.&nbsp;</b><input type="file" name="attach_4" />
        <b>5.&nbsp;</b><input type="file" name="attach_5" />
  </td>  
  
  <tr>
     <th>Quote Number</th>
     <td>
		<input type="text" name="{{$TABLE}}[qm_quote_number]" value="{{$detail.qm_quote_number}}" style ="width:700px" /> </td>
   </tr>
   
   <tr>
     <th>PO Number</th>
     <td>
		<input type="text" name="{{$TABLE}}[qm_po_number]" value="{{$detail.qm_po_number}}" style ="width:700px" /> </td>
   </tr>

  
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
		frmvalidator.addValidation("{{$TABLE}}[wa_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
        </script>
</div>

<script>
	initSample();
</script>
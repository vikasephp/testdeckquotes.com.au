<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>

<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />-->
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

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
        <th>Mistake Entry:</th>
        <td><textarea rows="8" name="{{$TABLE}}[ml_mistake]" id="editor1" class="ckeditor" >{{$detail.ml_mistake|stripslashes}}</textarea></td>
     </tr>
  
   <tr>
     <th>Person Created</th>
     <td>
     {{if $this_id}}
     <input  type="text" name="{{$TABLE}}[ml_person_created]"  value="{{$detail.ml_person_created}}" style="width:700px;" />
     {{else}}
     <input  type="text" name="{{$TABLE}}[ml_person_created]"  value="{{$user}}" style="width:700px;" />
     {{/if}}
      </td>
    </tr>
    
    
    <tr>
     <th>Date</th>
     <td>
     {{if $this_id}}
     <input type="text" name="{{$TABLE}}[ml_date]" value="{{$detail.ml_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo4" /> 
     {{else}}
      <input type="text" name="{{$TABLE}}[ml_date]" value="{{$currdate}}"  /> 
     {{/if}}
     </td>
    </tr>
    
    <tr>
     <th>Owner</th>
     <td>
     <select name="{{$TABLE}}[ml_owner]" class="lrg" >
        <option value="" selected="selected"> Please Select</option>
       {{foreach from = $owner key="key" item="item"}}
        <option value="{{$item.es_name}}" {{if $detail.ml_owner eq $item.es_name}} selected="selected" {{/if}}>{{$item.es_name}}</option>
      {{/foreach}}

     </td>
    </tr>
    
    <tr>
     <th>Priority</th>
     <td>
   
     <select name="{{$TABLE}}[ml_priority]"/>
                 <option value=""     {{if  $detail.ml_priority == ''}}selected{{/if}}>Please Select</option>
                 <option value="High" {{if  $detail.ml_priority == 'High'}}selected{{/if}}>High</option>
                 <option value="Medium" {{if  $detail.ml_priority == 'Medium'}}selected{{/if}}>Medium</option>
                 <option value="Low"    {{if  $detail.ml_priority == 'Low'}}selected{{/if}}>Low</option>
                 <option value="Not Applicable" {{if  $detail.ml_priority == 'Not Applicable'}}selected{{/if}}>Not Applicable</option>
        </select>
     </td>
    </tr>
    
   <tr>
     <th>Document Link 1</th>
     <td> <!--<input type="file" name="document" />-->
     <input  type="text" name="{{$TABLE}}[ml_link_1]"  value="{{$detail.ml_link_1}}" style="width:700px;" />
     </td>
    </tr>  
    
    <tr>
     <th>Document Link 2</th>
     <td> 
     <input  type="text" name="{{$TABLE}}[ml_link_2]"  value="{{$detail.ml_link_2}}" style="width:700px;" />
     </td>
    </tr>  
    
    
    <tr>
     <th>Document Link 3</th>
     <td> 
     <input  type="text" name="{{$TABLE}}[ml_link_3]"  value="{{$detail.ml_link_3}}" style="width:700px;" />
     </td>
    </tr>  
    
    
     <tr>
     <th>Stream</th>
     <td><input type="text" name="{{$TABLE}}[ml_stream]"  value="{{$detail.ml_stream}}" style="width:700px;" /></td>
    </tr>
    
    
    <tr>
     <th>Status </th>
     <td><select name="{{$TABLE}}[ml_status]" style="width:300px;"/>
                 <option value="Resolved"   {{if  $detail.ml_status == 'Resolved'}}selected{{/if}}>Resolved</option>
                 <option value="Unresolved" {{if  $detail.ml_status == 'Unresolved'}}selected{{/if}}>Unresolved</option>
        </select>  
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
			frmvalidator.addValidation("{{$TABLE}}[ml_mistake]","req", "Please specify mistake.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>

<script>
	initSample();
</script>
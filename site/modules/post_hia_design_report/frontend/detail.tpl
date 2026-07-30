<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

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
     <th>Project Name</th>
     <td>
   	<datalist id="project">
	   {{foreach from=$projdetail key="key1" item="item1"}}
		<option value="{{$item1.bsn_name}} (ID:{{$item1.bsn_id}})" >
		{{$item1.bsn_name}}
		</option>
		{{/foreach}}
  	</datalist>
    <input id="projectInput" type="text" list='project' name="{{$TABLE}}[ph_bsn_name]" style ="width:700px" value="{{$detail.ph_bsn_name}}" required="required"/>
	<input id="projectId" type="hidden" name="{{$TABLE}}[ph_bsn_id]" value="{{$detail.ph_bsn_id}}" />
	<script>
	document.getElementById('projectInput').addEventListener('change', function () {

		var input = this.value.trim();
		var hiddenId = document.getElementById('projectId');
		hiddenId.value = '';

		var options = document.querySelectorAll('#project option');

		options.forEach(function(option) {
			if (option.value === input) {
				var match = option.value.match(/\(ID:(\d+)\)$/);
				if (match) {
					hiddenId.value = match[1];
				}
			}
		});

	});
	</script>
      </td>
    </tr>
   
    
   
    <tr>
     <th>Type</th>
     <td>    <select name="{{$TABLE}}[ph_type]">
            {{foreach from=$typedetail key="key2" item="item2"}}
            <option value="{{$item2.et_id}}"  {{if $detail.ph_type eq $item2.et_id}} selected="selected" {{/if}} >{{$item2.et_option}}</option>
            {{/foreach}}
            </select>
         </td>
     </tr>
     
      <tr>
     <th>Urgency</th>
     <td>    <select name="{{$TABLE}}[ph_urgency]">
            {{foreach from=$urgencydetail key="key3" item="item3"}}
            <option value="{{$item3.pu_id}}"  {{if $detail.ph_urgency eq $item3.pu_id}} selected="selected" {{/if}} >{{$item3.pu_option}}</option>
            {{/foreach}}
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
		frmvalidator.addValidation("{{$TABLE}}[wa_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
        </script>
</div>

<script>
	initSample();
</script>
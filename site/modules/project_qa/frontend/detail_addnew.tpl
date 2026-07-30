<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css?timestamp={{ $time_css }}" />


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;"><br /><br /> 
    <h3 class="page-title">{{$title}}</h3>   <br /><br /> 
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">

    <input type="hidden" name="{{$TABLE}}[question_id]" value="{{$detail.id}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
    
   
   <tr>
     <th>Project</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_id}}|{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[project]" style ="width:700px" value="{{$detail.project}}" />
      </td>
    </tr>
   
   <tr>
  <th> Attachments </th> 
  <td> <input type="file" id = "file1" name="ques_attach_1"/>
       <input type="file" id = "file2" name="ques_attach_2"/>
       <input type="file" id = "file3" name="ques_attach_3" />
       <input type="file" id = "file4" name="ques_attach_4" />
       <input type="file" id = "file5" name="ques_attach_5" />
  </td>
  </tr>   
   
   <tr>
     <th>Question</th>
     <td>
     
     <textarea name="{{$TABLE}}[enquiry]" rows="5" cols="100">{{$detail.enquiry}}</textarea>
      </td>
    </tr>
  
    <tr>
     <th>Method</th>
     <td> 
        <select name="method" name="{{$TABLE}}[method]">
        <option value="">Pleaes Select</option>
        <option value="Phone"   {{if $item.method eq "Phone"}}  selected="selected" {{/if}}>Phone</option>
        <option value="Email"   {{if $item.method eq 'Email'}}  selected="selected" {{/if}}>Email</option>
        <option value="Website" {{if $item.method eq 'Website'}} selected="selected" {{/if}}>Website</option>
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

{{if $success_alert }} <div class="alert_info"> {{ $success_alert }} </div> {{/if}}
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
		frmvalidator.addValidation("{{$TABLE}}[rl_reffering_address]","req", "Please specify referring address.");
	
			
    </script>
</div>


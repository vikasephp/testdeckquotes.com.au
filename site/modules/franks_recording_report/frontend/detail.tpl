<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

<!--<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>-->

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
     <th>Date</th>
     <td><input type="text" name="{{$TABLE}}[fr_date]" style ="width:200px" value="{{$detail.fr_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic"/></td>
    </tr>
   
   
    <tr>
    <th>Business Name</th>
    <td><input type="text" name="{{$TABLE}}[fr_business_name]" style ="width:800px" value="{{$detail.fr_business_name}}" /></td>
    </tr>
   
     <tr>
     <th>Meeting Type</th>
     <td>
     <select name="{{$TABLE}}[fr_meeting_type]">
     <option value="Zoom">Zoom</option>
     <option value="Teams">Teams</option>
     </select>
      </td>
     </tr>
     
     
    <tr>
    <th>Project/Topic</th>
    <td><input type="text" name="{{$TABLE}}[fr_project_topic]" style ="width:800px" value="{{$detail.fr_project_topic}}" /></td>
    </tr>   
    
    <tr>
    <th>Recording Link</th>
    <td><input type="text" name="{{$TABLE}}[fr_recording_link]" style ="width:800px" value="{{$detail.fr_recording_link}}" /></td>
    </tr>
    
    <tr>
    <th>Transcript Link</th>
    <td><input type="text" name="{{$TABLE}}[fr_transcript_link]" style ="width:800px" value="{{$detail.fr_transcript_link}}" /></td>
    </tr>
       
  <tr>
  <th> Upload Transcript File </th> 
  <td> <input type="file" name="transcript" />
  </td>      
  </tr>
  
  <tr>
  <th> Action AI Transcript </th> 
  <td> 
  <!--<input type="file" name="actionAItranscript" />-->
  <input type="text" name="{{$TABLE}}[fr_actionAItranscript]" style="width:800px" value="{{$detail.fr_actionAItranscript}}" />
  </td>      
  </tr>
  
  <tr>
  <th> Upload Meeting Minutes File </th> 
  <td> <input type="file" name="meetingminutes" />
  </td>      
  </tr>
  
    <tr>
    <th>Notes</th>
    <td><input type="text" name="{{$TABLE}}[fr_notes]" style ="width:800px" value="{{$detail.fr_notes}}" /></td>
    </tr>
    
    
    <tr>
    <th>Sales Meeting ChatGPT Chat Link</th>
    <td><input type="text" name="{{$TABLE}}[fr_smtm_chatgpt]" style ="width:800px" value="{{$detail.fr_smtm_chatgpt}}" /></td>
    </tr>
    
      <tr>
      <th> Sales Meeting Live Word Document </th> 
      <td> <input type="text" name="{{$TABLE}}[fr_smtm_word_doc]" style ="width:800px" value="{{$detail.fr_smtm_word_doc}}" />
      </td>      
      </tr>
      
       <tr>
       <th>Sales Summary ChatGPT Chat Link</th>
       <td><input type="text" name="{{$TABLE}}[fr_ss_chatgpt]" style ="width:800px" value="{{$detail.fr_ss_chatgpt}}" /></td>
       </tr>
        
       <tr>
      <th>Sales Summary Live Word Document </th> 
      <td> <input type="text" name="{{$TABLE}}[fr_ss_word_doc]" style ="width:800px" value="{{$detail.fr_ss_word_doc}}" />
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
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
     <th>Date</th>
     <td><input type="text" name="{{$TABLE}}[de_date]" style ="width:200px" value="{{$detail.de_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /></td>
    </tr>
   
   <tr>
     <th>What</th>
     <td><input  type="text" name="{{$TABLE}}[de_what]"  value="{{$detail.de_what}}" style="width:700px;" /> </td>
    </tr>
   
       
     <tr>
     <th>Who</th>
     <td> <input  type="text" name="{{$TABLE}}[de_who]"  value="{{$detail.de_who}}" style="width:700px;" /> </td>
     </tr>
    
     <tr>
     <th>Total Hours</th>
     <td> <input  type="text" name="{{$TABLE}}[de_total_hours]"  value="{{$detail.de_total_hours}}" style="width:700px;" /> </td>
     </tr>
    
     <tr>
     <th>Status</th>
     <td> 
          <select name="{{$TABLE}}[de_status]"  >
                <option value="0">Please Select </option>
                <option value="In Progress" {{if $detail.de_status eq 'In Progress'}} selected="selected" {{/if}}>In Progress</option>
                <option value="Completed"   {{if $detail.de_status eq 'Completed'}} selected="selected" {{/if}}>Completed</option>
        </select>
     </td>
    </tr>
    
     <tr>
     <th>Task Type</th>
     <td> 
          <select name="{{$TABLE}}[de_type]"  >
                <option value="0">Please Select </option>
                <option value="Gcon Task" {{if $detail.de_type eq 'Gcon Task'}} selected="selected" {{/if}}>Gcon Task</option>
                <option value="BES Task" {{if $detail.de_type eq 'BES Task'}} selected="selected" {{/if}}>BES Task</option>
                <option value="Website Task"  {{if $detail.de_type eq 'Website Task'}} selected="selected" {{/if}}>Website Task</option>
                <option value="Server Task" {{if $detail.de_type eq 'Server Task'}} selected="selected" {{/if}}>Server Task</option>
                <option value="Other Task" {{if $detail.de_type eq 'Other Task'}} selected="selected" {{/if}}>Other Task</option>
        </select>
     </td>
    </tr>
   
   <tr>
     <th>Link To Dev Doc</th>
     <td> <input  type="text" name="{{$TABLE}}[de_doc_link]"  value="{{$detail.de_doc_link}}" style="width:700px;" /> </td>
     </tr>

 <tr>
     <th>Test Video</th>
     <td>
      <input type="file" name="test_video_1" />
      <input type="file" name="test_video_2" />
      <input type="file" name="test_video_3" />
      <input type="file" name="test_video_4" />
      <input type="file" name="test_video_5" />
      <input type="file" name="test_video_6" />
      <input type="file" name="test_video_7" />
     </td>
    </tr>	
 
 
     <tr>
     <th>Test Link 1</th>
     <td> <input  type="text" name="{{$TABLE}}[de_test_link_1]"  value="{{$detail.de_test_link_1}}" style="width:700px;" /> </td>
     </tr>  
     
       <tr>
     <th>Test Link 2</th>
     <td> <input  type="text" name="{{$TABLE}}[de_test_link_2]"  value="{{$detail.de_test_link_2}}" style="width:700px;" /> </td>
     </tr>
     
       <tr>
     <th>Test Link 3</th>
     <td> <input  type="text" name="{{$TABLE}}[de_test_link_3]"  value="{{$detail.de_test_link_3}}" style="width:700px;" /> </td>
     </tr>
     
       <tr>
     <th>Test Link 4</th>
     <td> <input  type="text" name="{{$TABLE}}[de_test_link_4]"  value="{{$detail.de_test_link_4}}" style="width:700px;" /> </td>
     </tr>
     
       <tr>
     <th>Test Link 5</th>
     <td> <input  type="text" name="{{$TABLE}}[de_test_link_5]"  value="{{$detail.de_test_link_5}}" style="width:700px;" /> </td>
     </tr>
     
       <tr>
     <th>Test Link 6</th>
     <td> <input  type="text" name="{{$TABLE}}[de_test_link_6]"  value="{{$detail.de_test_link_6}}" style="width:700px;" /> </td>
     </tr>
       <tr>
     <th>Test Link 7</th>
     <td> <input  type="text" name="{{$TABLE}}[de_test_link_7]"  value="{{$detail.de_test_link_7}}" style="width:700px;" /> </td>
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
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

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

<div align="center" style="min-height:350px;"><br />
    <h3 class="page-title">{{$title}}</h3>  <br />  
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key" item="item"}}
            <option value="{{$item.bsn_name}}" {{if $bsnid eq $item.bsn_id}} selected="selected" {{/if}}>
            {{$item.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
<input type="text" list='project' name="{{$TABLE}}[tc_project]" style="width:700px" value="{{$detail.tc_project}}" onmouseout="show_date(this.value)"  onchange="show_date(this.value)"/>
    <script language="javascript">
	
	function show_date(value)
	{
		
		$.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}timeline_report.show_date/value/"+value,
				   success: function(result){
					 //$("#tana").html(result);
					document.getElementById("tana").value = result;   
					  
			   }
			 });
			 
		$.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}timeline_report.show_date/value2/"+value,
				   success: function(result){
					document.getElementById("cd").value = result;   
					  
			   }
			 });	 
			
	}
	
	</script>
      </td>
    </tr>
   
    <tr>
     <th>Who is requesting </th>
     <td><datalist id='user'>
           {{foreach from=$userdetail key="key2" item="item2"}}
            <option value="{{$item2.user_name}}" {{if $bsnid eq $item2.bsn_id}} selected="selected" {{/if}}>
            {{$item2.user_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'user' name="{{$TABLE}}[tc_who_req]" style ="width:700px" value="{{$detail.tc_who_req}}" placeholder="Type in and select the user" /> 
    </td>
    </tr>  
   
    <tr>
     <th width="180">Letter Code:</th>
       <td>
        <select name="{{$TABLE}}[tc_letter_code]" class="input" />
          {{foreach from=$codedata key="key" item="item"}}	
                 <option value="{{$item.lc_letter_code}}" {{if $detail.tc_letter_code eq $item.lc_letter_code}} selected="selected"{{/if}} >
                 {{$item.lc_letter_code}}
                 </option> 
          {{/foreach}}
         </select>
     </td>
    </tr>  
   
    <tr>
     <th>Current Total Days</th>
     <td><input  type="text" name="{{$TABLE}}[tc_current_days]" id="cd" value="{{$detail.tc_current_days}}" autofocus oninput="this.value = this.value.replace(/[^0-9+]/g, '').replace(/(\..*?)\..*/g, '$1');" /> </td>
    </tr>
   
    <tr>
     <th>Days to be added</th>
     <td><input  type="text" name="{{$TABLE}}[tc_days_delay]" id="da" value="{{$detail.tc_days_delay}}" autofocus oninput="this.value = this.value.replace(/[^0-9+]/g, '').replace(/(\..*?)\..*/g, '$1');" /> </td>
  </tr>
   
   <!-- <tr>
     <th>New Days</th>
     <td><input  type="text" name="{{$TABLE}}[tc_new_days]" value="{{$detail.tc_new_days}}" id="tana3" readonly="readonly"/> </td>
    </tr>-->
   
   <tr>
     <th>Revised Commencement Date </th>
     <td><input  type="text" name="{{$TABLE}}[tc_rev_comm_date]"  value="{{$detail.tc_rev_comm_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
    
 <tr>
     <th>Revised Completion Date</th>
     <td> <!--<div id="tana">Test </div> -->
     <input  type="text" name="{{$TABLE}}[tc_rev_comp_date]" id="tana" value="{{$detail.tc_rev_comp_date}}"  readonly="readonly" /> </td>
    </tr>
  
  <!--<tr>
     <th>Auto Date</th>
     <td><input  type="text" name="{{$TABLE}}[tc_auto_date]" id="audt" value="{{$detail.tc_auto_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
  </tr> -->
   
   <tr>
     <th>Send Pathway </th>
     <td><select name="{{$TABLE}}[tc_send_pathway]" style="width:300px;"/>
      	<option value=""   {{if  $detail.tc_send_pathway == ''}}selected{{/if}}>Please Select</option>
        <option value="Email only" {{if  $detail.tc_send_pathway == 'Email only'}}selected{{/if}}>Email only</option>
        <option value="Email and Click and Send" {{if  $detail.tc_send_pathway == 'Email and Click and Send'}}selected{{/if}}>Email and Click and Send</option>
        </select>  
    </td>
    </tr>
   
  <tr>
  <th> Upload letter </th> 
  <td> <input type="file" name="letter" /></td>      
  </tr>
  
    
    <tr>
     <th>When letter emailed </th>
     <td><input  type="text" name="{{$TABLE}}[tc_letter_email]"  value="{{$detail.tc_letter_email}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
    
    <tr>
     <th>Who Letter Emailed </th>
     <td><datalist id='user'>
           {{foreach from=$userdetail key="key2" item="item2"}}
            <option value="{{$item2.user_name}}" {{if $bsnid eq $item2.bsn_id}} selected="selected" {{/if}}>
            {{$item2.user_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'user' name="{{$TABLE}}[tc_email_user]" style ="width:700px" value="{{$detail.tc_email_user}}" placeholder="Type in and select the user"/> 
    </td>
    </tr>  
  
    
    <tr>
     <th>Status </th>
     <td><select name="{{$TABLE}}[tc_status]" style="width:300px;"/>
                 <option value="Open"   {{if  $detail.tc_status == 'Open'}}selected{{/if}}>Open</option>
                 <option value="Closed" {{if  $detail.tc_status == 'Closed'}}selected{{/if}}>Closed</option>
        </select>  
    </td>
    </tr>  
  
    <tr>
        <th>Notes:</th>
        <td width="900">
        <textarea cols="1000" rows="25" name="{{$TABLE}}[tc_notes]" id="editor1" class="ckeditor" style="height:270px;">{{$detail.tc_notes|stripslashes}}</textarea>    
        </td>
   </tr>
  
   <tr>
  <th>Evidence</th> 
  <td> <input type="file" name="evidence" /></td>      
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
			frmvalidator.addValidation("{{$TABLE}}[tc_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>
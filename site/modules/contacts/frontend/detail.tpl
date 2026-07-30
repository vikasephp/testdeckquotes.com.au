<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
  <script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<style>
#fancybox-wrap {z-index:99999999;} 
</style>
<div align="center" style="min-height:350px;">
    <h3 class="page-title">Contacts</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="contacts[cs_id]" value="{{$detail.cs_id}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   {{if $msg}} <tr><th colspan="2" style="color:#FF0000;">{{$msg}}</th></tr>{{/if}}
   
   <tr>
     <th>Company Name</th>
     <td>
     {{if $co_id}}
     
     <input type="text" list = 'comp' name="contacts[cs_company]" style ="width:500px" value="{{$comp_name}}" />
     {{else}}
     <datalist id='comp'>
           {{foreach from=$comdetail  key="key" item="item"}}
            <option value="{{$item.co_id}} | {{$item.co_company_name}}">
            {{$item.co_company_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         
         <input type="text" list = 'comp' name="contacts[cs_company]" style ="width:500px" value="{{$cname}}" />
     {{/if}}
     <td> <input type="checkbox" name="contacts[cs_is_primary]"  {{if $detail.cs_is_primary eq 1 }} checked="checked" {{/if}} /> Primary Contact </td>
     
    </tr>
    
    <tr>
     <th>Positions</th>
     <td colspan="3">
		<!--<input type="text" name="contacts[cs_position]" style ="width:500px" value="{{$detail.cs_position}}" />-->
		<select name="contacts[cs_position_code]">
			<option value="">Please Select Position</option>
			{{foreach from=$contacts_position key="keycpos" item="itemcpos"}}
			<option value="{{$itemcpos.cp_id}}" {{if $detail.cs_position_code eq $itemcpos.cp_id}} selected="selected"{{/if}} >{{$itemcpos.cp_name}}</option>
			{{/foreach}}
		</select> 
	</td>
    </tr>  
    
   
   
    <tr>
     <th>First Name</th>
     <td><input  type="text" name="contacts[cs_first_name]"  value="{{$detail.cs_first_name}}" style="width:300px;" /> </td>
    
     <th>Surname</th>
     <td><input  type="text" name="contacts[cs_surname]"  value="{{$detail.cs_surname}}" style="width:300px;" /> </td>
    </tr> 
   
    <tr>
     <th>Landline</th>
     <td><input type="text" name="contacts[cs_landline]" value="{{$detail.cs_landline}}"  maxlength="15" pattern="[0][0-9]{9}" autofocus  title="Phone must start with 0"  style="width:300px;" oninput="this.value = this.value.replace(/[^0-9+]/g, '').replace(/(\..*?)\..*/g, '$1');" /> </td>
   
     <th>Mobile</th>
  <!--   <td> <input type="text" name="contacts[cs_mobile]" value="{{$detail.cs_mobile}}"  maxlength="20" pattern="[0][0-9]{9}" autofocus  title="Mobile must start with 0" oninput="this.value = this.value.replace(/[^0-9+]/g, '').replace(/(\..*?)\..*/g, '$1');" /> </td>-->
      <td> <input type="text" name="contacts[cs_mobile]" value="{{$detail.cs_mobile}}"  maxlength="20" oninput="this.value = this.value.replace(/[^0-9+]/g, '').replace(/(\..*?)\..*/g, '$1');" /> </td>
     
    </tr>
    
    <tr>
    <th>Emergency</th>
     <td> <input type="text" name="contacts[cs_emergency]" value="{{$detail.cs_emergency}}" maxlength="10" pattern="[0][0-9]{9}"  autofocus title="Phone must start with 0" oninput="this.value = this.value.replace(/[^0-9+]/g, '').replace(/(\..*?)\..*/g, '$1');" /> </td>

    
    
     <th>Primary Email</th>
     <td> <input type="email" name="contacts[cs_primary_email]" value="{{$detail.cs_primary_email}}" style="width:300px;"  /> </td>
    </tr>
    <tr>
    
    
     <th>Secondary Email</th>
     <td> <input type="email" name="contacts[cs_secondary_email]" value="{{$detail.cs_secondary_email}}" style="width:300px;"  /> </td>
    </tr>
     
     <tr>
     <th>Calendar Link</th>
     <td colspan="3"> <input type="text" name="contacts[cs_calendar_link]" value="{{$detail.cs_calendar_link}}" style="width:700px;"  /> </td>
    </tr>
    
     <tr>
     <th>Partner Traning</th>
     <td colspan="3"> 
     <select name="contacts[cs_partner_training]">
     	<option value="">Please Select</option>
     	<option value="Trained" {{if $detail.cs_partner_training eq 'Trained'}} selected="selected" {{/if}}>Trained</option>
        <option value="Not Trained" {{if $detail.cs_partner_training eq 'Not Trained'}} selected="selected" {{/if}}>Not Trained</option>
        <option value="Training In Progress" {{if $detail.cs_partner_training eq 'Training In Progress'}} selected="selected" {{/if}}>Training In Progress</option>
    </select> 
     
     </td>
    </tr>
    
    
     <tr>
     <th>Address</th>
     <td colspan="3"> <input type="text" name="contacts[cs_address]" value="{{$detail.cs_address}}" style="width:700px;"  /> </td>
    </tr> 
     
    <tr>
        <th>Notes:</th>
        <td colspan="3">
        <!--<textarea rows="8" name="contacts[co_notes]" id="editor1" class="ckeditor">{{$detail.co_notes|stripslashes}}-->
         <textarea rows="8" cols="150" name="contacts[cs_notes]" >{{$detail.cs_notes|stripslashes}}
        </textarea>    
       </td>
    </tr>
  

    <tr>
        <td colspan="4" style="text-align:center;">
        
            <input type="submit" name="subAddDetail" value="Save" class="vsml" />
           <!-- <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />-->
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
			frmvalidator.addValidation("contacts[cs_company]","req", "Please specify Company Name.");
			frmvalidator.addValidation("contacts[cs_first_name]","req", "Please specify First Name.");
			
    </script>
</div>

<script>
	initSample();
</script>
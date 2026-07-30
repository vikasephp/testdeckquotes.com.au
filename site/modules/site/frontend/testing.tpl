<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">Module Testing Form</h3>    
   
   
<form name="contact" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="90%" style="vertical-align:middle !important;">
    <input type="hidden" name="testing[f_id]" value="{{$detail.f_id}}" />
   {{if $opr}} <tr><th colspan="4" style="color:#0C6; font-size:14px;">Testing report has been sent successfully</th></tr>{{/if}}
   
    <tr>
     <th>Add New Contact</th>
     <td colspan="2"><input type="text" name="new_contact" style ="width:700px" value="{{$detail.te_email}}" required="required"  /></td>
     <td><input type="submit" name="add_contact" value="Add New Contact" />
    </tr>
 
 </form>
 <form name="detail" method="post" action=""  enctype="multipart/form-data">   
     <tr>
     <th>Select Contact</th>
     <td colspan="3">
     
     {{foreach from=$contact_list key="key" item="item"}}
     <input type="checkbox" value="{{$item.tc_email}}" name="contacts[{{$item.tc_id}}]"/>{{$item.tc_email}} <br />
     {{/foreach}}
     </td>
    </tr>
    
    <tr>
     <th>Subject</th>
     <td colspan="3"><input type="text" name="testing[te_subject]" style ="width:700px" value="{{$detail.te_subject}}" /></td>
    </tr>
    
    <tr>
     <th>Module Name</th>
     <td colspan="3"><input type="text" name="testing[te_module_name]" style ="width:700px" value="{{$detail.te_module_name}}" /></td>
    </tr>
   
   <tr>
     <th>Module Link</th>
     <td colspan="3"><input  type="text" name="testing[te_module_link]"  value="{{$detail.te_module_link}}" style="width:700px;" /> </td>
    </tr>
   
   
   <tr>
     <th>Tester Name</th>
     <td colspan="3"> <input  type="text" name="testing[te_tester_name]"  value="{{$detail.te_tester_name}}" style="width:700px;" /> </td>
    </tr>
    
    <tr>
     <th>Typing Mistake Tested</th> 
     <td style="width:15%">
     <input type="radio" name="testing[tm]" value="Yes" />Yes &nbsp; &nbsp;<input type="radio" name="testing[tm]"  value="No"/>No &nbsp; &nbsp; </td>
     <td><textarea name="testing[te_tm_comment]" cols="80" rows="3">{{$detail.te_tm_comment}} </textarea>&nbsp; &nbsp;</td>
     <td> Screen Shot :<input  type="file" name="tm_upload"/> </td>
    </tr>
 
  <tr>
     <th>Functionality Tested</th>
     <td><input type="radio" name="testing[fun]" value="Yes" />Yes &nbsp; &nbsp;<input type="radio" name="testing[fun]"  value="No"/>No &nbsp; &nbsp; </td>
        <td> <textarea name="testing[te_fun_comment]" cols="80" rows="3">{{$detail.te_fun_comment}} </textarea> </td>
     <td></td>
    </tr>
 
    <!--<tr>
     <th>Tester Comment</th>
     <td><textarea name="testing[te_tester_comment]" cols="128" rows="6"> {{$detail.te_tester_comment}} </textarea> </td>
    </tr>-->	
    
   <tr>
     <th>Testing On Different Devices </th>
     <td> <strong>MAC</strong> :<input type="radio" name="testing[mac_device]" value="Yes" />Yes &nbsp; &nbsp;
         <input type="radio" name="testing[mac_device]"  value="No"/>No &nbsp; &nbsp; </td>
         <td><textarea name="testing[te_mac_comment]" cols="80" rows="3">{{$detail.te_mac_comment}} </textarea> </td>
       <td>Screen Shot :<input  type="file" name="mac"/></td>
   </tr>
   
    <tr> <th></th>   
    <td> <strong>PC</strong> :<input type="radio" name="testing[pc_device]" value="Yes" />Yes &nbsp; &nbsp;
         <input type="radio" name="testing[pc_device]"  value="No"/>No &nbsp; &nbsp; </td>
      <td><textarea name="testing[te_pc_comment]" cols="80" rows="3">{{$detail.te_pc_comment}} </textarea></td>
      <td>Screen Shot :<input  type="file" name="pc"/></td>
     </tr> 
         
     <tr>
     <th></th>
      <td><strong>iPhone</strong> :<input type="radio" name="testing[iphone_device]" value="Yes" />Yes &nbsp; &nbsp;
          <input type="radio" name="testing[iphone_device]"  value="No"/>No &nbsp; &nbsp; </td>
       <td>  <textarea name="testing[te_iphone_comment]" cols="80" rows="3">{{$detail.te_iphone_comment}} </textarea></td>
       <td> Screen Shot :<input  type="file" name="iPhone"/> </td>
      </tr> 
      
      <tr>
      
        <th></th> 
         <td><strong>Android <br />Phone</strong> :<input type="radio" name="testing[android_device]" value="Yes" />Yes &nbsp; &nbsp;
         <input type="radio" name="testing[android_device]"  value="No"/>No &nbsp; &nbsp; </td>
        <td> <textarea name="testing[te_android_comment]" cols="80" rows="3">{{$detail.te_android_comment}} </textarea></td>
        <td> Screen Shot :<input  type="file" name="android"/> </td>
      </tr>
      <tr>

      <th></th>
         
       <td>  <strong>iPads</strong> :<input type="radio" name="testing[ipad_device]" value="Yes" />Yes &nbsp; &nbsp;
         <input type="radio" name="testing[ipad_device]"  value="No"/>No &nbsp; &nbsp; </td>
         <td><textarea name="testing[te_ipad_comment]" cols="80" rows="3">{{$detail.te_ipad_comment}} </textarea></td>
         <td> Screen Shot :<input  type="file" name="ipad"/> </td>
    </tr>  
    
    <!--<tr>
     <th>Upload File</th>
     <td><input  type="file" name="file_upload"/> </td>
    </tr>-->
    
     <tr>
        <td colspan="4" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Submit Form" class="vsml" />
      
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
			frmvalidator.addValidation("testing[ph_name]","req", "Please specify name.");
			//frmvalidator.addValidation("testing[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("testing[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>

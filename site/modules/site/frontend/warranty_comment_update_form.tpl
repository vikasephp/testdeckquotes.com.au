<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">


	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>
	<link rel="stylesheet" href="{{$BASE_URL}}ckeditor2/samples/css/samples.css">
	<link rel="stylesheet" href="{{$BASE_URL}}ckeditor2/samples/toolbarconfigurator/lib/codemirror/neo.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<style>
input[type="submit"] { background: #06C !important; font-size:18px; }
</style>


<div align="center" style="min-height:350px;">
    <h3 class="page-title">Warranty Update Form</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="contact['cs_id']" value="{{$detail.cs_id}}" />
   {{if $opr}} <tr><th colspan="2" style="color:#0C6; font-size:14px;">Comment has been added successfully</th></tr>{{/if}}
   
    <tr>
     <th>Record No</th>
     <td><input type="text"  name="warranty[wa_id]" style ="width:700px" value="{{$detail.wa_id}}" readonly="readonly" />
      </td>
    </tr>
   
   <tr>
     <th>Project</th>
     <td><input  type="text"   value="{{$detail.wa_project}}" style="width:700px;" readonly="readonly" /> </td>
    </tr>
   
   
     <tr>
     <th>Date</th>
     <td><input  type="text"  value="{{$detail.date_date}}" style="width:700px;" readonly="readonly" /> </td>
    </tr>
    
     <tr>
     <th>Alert</th>
     <td><input  type="text"  value="{{$detail.wa_problem}}" style="width:700px;" readonly="readonly" /> </td>
     </tr> 
    
     <tr>
     <th>Photos</th>
     <td>
     {{if $detail.wa_image_1}}
        <div> 
        Photo 1 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$detail.wa_image_1}}" target="_blank">Download</a>
        </div>
        {{/if}}
        
        
        
        {{if $detail.wa_image_2}}
        <div> 
        Photo 2 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$detail.wa_image_2}}" target="_blank">Download</a>
        </div>
        {{/if}}
        
        {{if $detail.wa_image_3}}
        <div> 
        Photo 3 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$detail.wa_image_3}}" target="_blank">Download</a>
        </div>
        {{/if}}
        
        {{if $detail.wa_image_4}}
        <div> 
        Photo 4 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$detail.wa_image_4}}" target="_blank">Download</a>
        </div>
        {{/if}}
        
        {{if $detail.wa_image_5}}
        <div> 
        Photo 5 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$detail.wa_image_5}}" target="_blank">Download</a>
        </div>
        {{/if}}
     </td>
     </tr> 
    
    <tr>
     <th>Select which supplier you are</th>
     <td><select name="warranty[warranty_which_suplier]" >
       <option value="">Please Select</option>
      {{foreach from=$contactdetail key="key" item="item"}}
      <option value="{{$item.se_supplier}} - {{$item.se_first_name}} {{$item.se_surname}}" >{{$item.se_supplier}} - {{$item.se_first_name}} {{$item.se_surname}}</option>
      {{/foreach}}
      </select></td>
     </tr>
    
     <tr>
     <th>Attachment Upload</th>
     <td><input type="file" name="supp_attach" />
        <input type="file" name="supp_attach_2" />
        <input type="file" name="supp_attach_3" />
        <input type="file" name="supp_attach_4" />
        <input type="file" name="supp_attach_5" />
        
     
      </td>
     </tr>
    
     <tr>
     <th>Commernt From Supplier</th>
     <td><textarea name="warranty[wa_comment]"  rows="10" id="editor" cols="100"/> </textarea> </td>
     </tr> 
    
    
     <tr>
     <th>Alert Resolved</th>
     <td><input type="radio" name="warranty[ws_alert_resolved]" value="1" /> Yes &nbsp; &nbsp; <input type="radio" name="warranty[ws_alert_resolved]" checked="checked" value="0" /> No </td>
     </tr>
    
     <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Submit  the  Update  Form"  />
         
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
			//frmvalidator.addValidation("car[wa_comment]","minlen=10", "Please specify comment (Minimum 15 Character required).");
			frmvalidator.addValidation("warranty[warranty_which_suplier]","req", "Please specify supplier name.");
			//frmvalidator.addValidation("contact[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>

<script>
	initSample();
</script>

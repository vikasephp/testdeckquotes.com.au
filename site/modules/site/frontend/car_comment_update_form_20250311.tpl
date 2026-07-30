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
    <h3 class="page-title">CAR Update Form</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="contact['cs_id']" value="{{$detail.cs_id}}" />
   {{if $opr}} <tr><th colspan="2" style="color:#0C6; font-size:14px;">Comment has been added successfully</th></tr>{{/if}}
   
    <tr>
     <th>Record No</th>
     <td><input type="text"  name="car[car_id]" style ="width:700px" value="{{$detail.car_id}}" readonly="readonly" />
      </td>
    </tr>
   
   <tr>
     <th>Project</th>
     <td><input  type="text"   value="{{$detail.car_project}}" style="width:700px;" readonly="readonly" /> </td>
    </tr>
   
   
     <tr>
     <th>Date</th>
     <td><input  type="text"  value="{{$detail.car_date}}" style="width:700px;" readonly="readonly" /> </td>
    </tr>
    
     <tr>
     <th>Alert</th>
     <td><input  type="text"  value="{{$detail.car_alert}}" style="width:700px;" readonly="readonly" /> </td>
     </tr> 
    
     <tr>
     <th>Photos</th>
     <td>
     {{if $detail.car_image1}}
        <div> 
        Photo 1 :  <a href="{{$BASE_URL}}files/uploads/{{$detail.car_image1}}" target="_blank">Download</a>
        </div>
        {{/if}}
        
        
        
        {{if $detail.car_image2}}
        <div> 
        Photo 2 :  <a href="{{$BASE_URL}}files/uploads/{{$detail.car_image2}}" target="_blank">Download</a>
        </div>
        {{/if}}
        
        {{if $detail.car_image3}}
        <div> 
        Photo 3 :  <a href="{{$BASE_URL}}files/uploads/{{$detail.car_image3}}" target="_blank">Download</a>
        </div>
        {{/if}}
        
        {{if $detail.car_image4}}
        <div> 
        Photo 4 :  <a href="{{$BASE_URL}}files/uploads/{{$detail.car_image4}}" target="_blank">Download</a>
        </div>
        {{/if}}
        
        {{if $detail.car_image5}}
        <div> 
        Photo 5 :  <a href="{{$BASE_URL}}files/uploads/{{$detail.car_image5}}" target="_blank">Download</a>
        </div>
        {{/if}}
     </td>
     </tr> 
    
    <tr>
     <th>Select which supplier you are</th>
     <td><select name="car[car_which_suplier]" >
       <option value="">Please Select</option>
      {{foreach from=$contactdetail key="key" item="item"}}
      <option value="{{$item.se_supplier}} - {{$item.se_first_name}} {{$item.se_surname}}" >{{$item.se_supplier}} - {{$item.se_first_name}} {{$item.se_surname}}</option>
      {{/foreach}}
      </select></td>
     </tr>
    
     <tr>
     <th>Attachment Upload</th>
     <td><input type="file" name="attach" /> </td>
     </tr>
    
     <tr>
     <th>Commernt From Supplier</th>
     <td><textarea name="car[car_comment]"  rows="10" id="editor" cols="100"/> </textarea> </td>
     </tr> 
    
     <tr>
     <th>Alert Resolved</th>
     <td><input type="radio" name="car[cu_alert_resolved]" value="1" /> Yes &nbsp; &nbsp; <input type="radio" name="car[cu_alert_resolved]" checked="checked" value="0" /> No </td>
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
			//frmvalidator.addValidation("car[car_comment]","minlen=10", "Please specify comment (Minimum 15 Character required).");
			frmvalidator.addValidation("car[car_which_suplier]","req", "Please specify supplier name.");
			//frmvalidator.addValidation("contact[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>

<script>
	initSample();
</script>

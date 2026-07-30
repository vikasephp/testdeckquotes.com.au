<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">


	<script src="{{$BASE_URL}}ckeditor/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor/samples/js/sample.js"></script>
	<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/css/samples.css">
	<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">Contact Update Form</h3>    
   
   
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
     <th>Commernt From Supplier</th>
     <td><textarea name="car[car_comment]"  rows="10" id="editor"/>{{$detail.car_comment}} </textarea> </td>
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
			frmvalidator.addValidation("contact[ph_name]","req", "Please specify name.");
			//frmvalidator.addValidation("contact[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("contact[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>

<script>
	initSample();
</script>

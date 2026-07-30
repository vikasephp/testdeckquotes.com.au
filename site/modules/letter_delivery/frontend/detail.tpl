<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>

<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />-->
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
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

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Suburb</th>
     <td><input type="text" name="{{$TABLE}}[ld_suburb]" style ="width:700px" value="{{$detail.ld_suburb}}" />
      </td>
    </tr>
   
   <tr>
     <th>Suburb Capacity</th>
     <td><input  type="text" name="{{$TABLE}}[ld_suburb_capacity]"  value="{{$detail.ld_suburb_capacity}}" style="width:700px;" /> </td>
    </tr>
   
    <tr>
     <th>Scheduled Date</th>
     <td><input  type="text" name="{{$TABLE}}[ld_schedule_date]"  value="{{$detail.ld_schedule_date}}" class="w16em dateformat-d-ds-m-ds-Y" /> </td>
    </tr>
    
    <tr>
     <th>Pickup Date</th>
     <td><input  type="text" name="{{$TABLE}}[ld_pickup_date]"  value="{{$detail.ld_pickup_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
   

     
     <tr>
     <th>Quantity Assigned</th>
     <td> <input  type="text" name="{{$TABLE}}[ld_quantity_assigned]"  value="{{$detail.ld_quantity_assigned}}" style="width:700px;" /> </td>
    </tr>
    
     <tr>
     <th>Delivered due date</th>
     <td> <input  type="text" name="{{$TABLE}}[ld_delivered_due_date]"  value="{{$detail.ld_delivered_due_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
   
   <tr>
     <th>Quantity Delivered</th>
     <td> <input  type="text" name="{{$TABLE}}[ld_quantiy_delivered]"  value="{{$detail.ld_quantiy_delivered}}" style="width:700px;" /> </td>
    </tr>

    <tr>
     <th>Brochure ID </th>
     <td><input  type="text" name="{{$TABLE}}[ld_brochure_id]"  value="{{$detail.ld_brochure_id}}" style="width:700px;" /> </td>
    </tr>  
  
     <tr>
     <th>Delivery Personnel</th>
     <td><input  type="text" name="{{$TABLE}}[ld_delivery_personnel]"  value="{{$detail.ld_delivery_personnel}}" style="width:700px;" /> </td>
    </tr> 
    
     <tr>
     <th>Street Map Upload</th>
     <td><input type="file" name="street_map" /></td>
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
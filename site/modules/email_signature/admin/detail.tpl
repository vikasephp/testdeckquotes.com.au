<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
  <script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
  <script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/admin/screen.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

<script type="text/javascript">
   CKEDITOR.replace( 'editor1' );
   CKEDITOR.add  
</script>
   

<div align="center">

<h3 class="page-title">{{$title}}</h3>

<form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
<input type="hidden" name="email_signature[es_id]" value="{{$detail.$ID}}" id="eml_id"/>
    <table id="product-table" cellpadding="0" cellspacing="0" style="width:98% !important; border:1px solid #CCC;">

{{if $message}} 
   <tr> <td colspan="4" style="text-align:center;"><span style="font-size:15px; color:#F00; text-align:center;">{{$message}}</span></td> </tr> 
 {{/if}}
   
        <tr>
            <th>Person Name:</th>
            <td colspan="3"><input type="text" name="email_signature[es_name]" value="{{$detail.es_name}}" style="width:750px;"/></td>
        </tr>
           
        <tr>
        <th>Signature:</th>
        <td  colspan="3">
        <textarea id="editor1" class="ckeditor" name="email_signature[es_signature]">{{$detail.es_signature}}</textarea>
        </td>
        </tr>
		  
        <tr>
                <th>Logo:</th>
                <td>
             <input type="file" name="logo" /> {{if $detail.es_logo}} <img src = "{{$BASE_URL}}files/email_library/{{$detail.es_logo}}"> {{/if}}
                </td>
        </tr>
          
          	
    	 <tr>
            <th>From and Reply To:</th>
            <td colspan="3"><input type="text" name="email_signature[es_reply_to]" value="{{$detail.es_reply_to}}" style="width:350px;"/></td>
        </tr>
        <tr> 
        <td colspan="2" style="text-align:center;">
     <input type="submit" name="subAddDetail" value="Save" class="vsml" />
    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}'" class="vsml" />

        </td>
        </tr>
 		</table>

      </form>
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[sftype_id]","dontselect=0", "Please select type.");
			frmvalidator.addValidation("{{$TABLE}}[sf_title]","req", "Please specify title.");
			frmvalidator.addValidation("{{$TABLE}}[sf_body]","req", "Please specify formula.");
        </script>
  
</div>

<script>
	initSample();
</script>
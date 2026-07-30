<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/admin/screen.css" />

	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>

<div align="center">

<h3 class="page-title">{{$title}}</h3>

<form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
<input type="hidden" name="agreed_text_inclusion[ag_id]" value="{{$detail.$ID}}" id="eml_id"/>
    <table id="product-table" cellpadding="0" cellspacing="0" style="width:98% !important; border:1px solid #CCC;">

{{if $message}} 
   <tr> <td colspan="4" style="text-align:center;"><span style="font-size:15px; color:#F00; text-align:center;">{{$message}}</span></td> </tr> 
 {{/if}}
            
        <tr>
        <th>Agreed Text: &nbsp; </th>
        <td >
        <textarea id="editor1" class="ckeditor" name="agreed_text_inclusion[ag_text]">{{$detail.ag_text}}</textarea>
        </td>
        </tr>
          	
    	 <tr>
            <th>Uid:&nbsp; </th>
            <td><input type="text" name="agreed_text_inclusion[ag_uid]" value="{{$detail.ag_uid}}" style="width:350px;"/></td>
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
        /*var frmvalidator  = new Validator("detail");
	frmvalidator.EnableMsgsTogether();
	frmvalidator.addValidation("{{$TABLE}}[sf_body]","req", "Please specify formula.");*/
        </script>
  
</div>

<script>
	initSample();
</script>
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />-->
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

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
        <th>Upload Image</th>
        <td> <input type="file" name="image1" /></td>
      </tr>
      <tr>
        <th>Label</th>
        <td> <input type="text" name="brief_builder[bb_label]" value="{{$detail.bb_label}}" style="width:300px;" /></td>
      </tr>
  <tr>
        <th>Catergory</th>
        <td>
        <select name="brief_builder[bb_catergory2]">
         {{foreach from=$catData key="keyc" item="itemc"}}
	<option value="{{$itemc.bbc_id}}" {{if $itemc.bbc_id  eq $detail.bb_catergory2}} selected="selected" {{/if}}> 
        {{$itemc.bbc_text}}</option>
	 {{/foreach}}
	</select>
</td>
      </tr>
  
     <tr>
        <th>Text</th>
        <td> <textarea rows="10"  name="brief_builder[bb_text]" id="editor1" class="ckeditor" />{{$detail.bb_text}}</textarea>
        </td>
      </tr>
     
      <tr>
        <th>Link To Ms Team</th>
        <td> <input type="text" name="brief_builder[bb_link_msteam]" value="{{$detail.bb_link_msteam}}" style="width:700px;" /></td>
      </tr>
      
      <tr>
        <th>Link To Website</th>
        <td> <input type="text" name="brief_builder[bb_link_website]" value="{{$detail.bb_link_website}}" style="width:700px;" /></td>
      </tr>
      
      <tr>
        <th>Reference Source</th>
        <td> <input type="text" name="brief_builder[bb_ref_source]" value="{{$detail.bb_ref_source}}" style="width:700px;" /></td>
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
			frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
			
    </script>
</div>

<script>
	initSample();
</script>
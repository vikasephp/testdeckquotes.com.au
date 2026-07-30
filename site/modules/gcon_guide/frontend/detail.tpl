<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />



{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>  <br /><br />  
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Gcon Section Name : </th>
     <td><input  type="text" name="{{$TABLE}}[gg_section]"  value="{{$detail.gg_section}}" style="width:700px;" /></td>
   </tr>	
   
    <tr>
     <th>Gcon Section Link </th>
     <td><input  type="text" name="{{$TABLE}}[gg_section_link]"  value="{{$detail.gg_section_link}}" style="width:700px;" /></td>
   </tr>
    
    <tr>
     <th>Process Street Link </th>
     <td><input  type="text" name="{{$TABLE}}[gg_ps_link]"  value="{{$detail.gg_ps_link}}" style="width:700px;" /></td>
   </tr>
    
   <tr>
     <th>Upload Guide</th>
     <td> <input type="file" name="document" /></td>
    </tr>  
    
    <tr>
     <th>Video Link</th>
     <td><input  type="text" name="{{$TABLE}}[gg_video_link]"  value="{{$detail.gg_video_link}}" style="width:700px;" /></td>
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
			frmvalidator.addValidation("{{$TABLE}}[gg_section]","req", "Please specify section name.");
		
    </script>
</div>

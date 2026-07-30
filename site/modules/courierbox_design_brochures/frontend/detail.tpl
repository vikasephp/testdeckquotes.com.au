<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
{{include file=$jdata}}
{{include file=$tiny_basic}}
{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
    {{if $opr}}
	<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}
      <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
           {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}

         
        
            <tr>
                <th width="20">Design Number:</th>
                <td>
                     <input type= "text" name="{{$TABLE}}[cb_design_number]" value="{{$detail.cb_design_number}}" class="xlrg" style="width:480px;" />   
                </td>
            </tr>
                <tr>
                <th width="20">Brochures Sent :</th>
                <td>
                     <input type= "text" name="{{$TABLE}}[cb_brochures_sent]" value="{{$detail.cb_brochures_sent}}" class="xlrg" style="width:480px;" />   
                </td>
            </tr>
          
              
                <tr>
                <th width="20">Brochures Remaining:</th>
                <td>
                     <input type= "text" name="{{$TABLE}}[cb_brochures_remaining]" value="{{$detail.cb_brochures_remaining}}" class="xlrg" style="width:480px;" />   
                </td>
            </tr>
          

            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
            </tr>
        </table>
    </form>
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[title]","req", "Please specify title.");
    </script>
   {{/if}} 
</div>
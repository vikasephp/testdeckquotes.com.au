<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
{{include file=$jdata}}
{{include file=$tiny_basic}}
{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

<div align="center" style="min-height:300px;">
    <h3 class="page-title">{{$title}}</h3>    
    {{if $opr}}
	<div align="center" style="min-height:300px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}
      <form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
           {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
            <tr>
                <th width="100">Overview:</th>
                  <td width="500">
                   <table  width="500" id="none-table22"><tr><td>
                <td><textarea cols="120"  rows ="4" name="{{$TABLE}}[cl_overview]" >{{$detail.cl_overview}} </textarea>
                </td></tr></table>
                 </td>
            </tr>        
            <tr>
                <th>Link:</th>
                <td>
                        <input type="text" name="{{$TABLE}}[cl_link]" value="{{$detail.cl_link}}" size="500" style="width:630px;" />
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
			frmvalidator.addValidation("{{$TABLE}}[cl_overview]","req", "Please specify Overview.");
			frmvalidator.addValidation("{{$TABLE}}[cl_link]","req", "Please specify Link.");
    </script>
   {{/if}} 
</div>
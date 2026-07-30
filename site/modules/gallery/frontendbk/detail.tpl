<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

</script>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<div align="center">
<h3 class="page-title">{{$title}}</h3>
   {{if !$opr}}
 <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
 <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}"/>
     <table id="viewdoc-table" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <th> Name:</th>
            <td> <input type="text" name="{{$TABLE}}[bg_title]" value="{{$detail.bg_title}}" style="width:300px;"/></td>
        </tr>       
        <tr>
            <th>Upload :</th>
            <td> <input type="file" name="docs" /></td>
        </tr> 
        <tr><th colspan="2"><div id="doc_list" style="height:auto; padding-bottom:10px; min-height:40px; color:#FF0000;"></div></th></tr>
         <tr><td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
            </td>
         </tr>
		</table>
      </form>
     {{else}}
     	<div style="font-size:24px; height:99px; padding-top:100px;">{{$opr}}</div> 
{{/if}}
</div>
   {{if !$opr}}
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[bg_title]","req", "Please specify title.");
</script>
{{/if}}
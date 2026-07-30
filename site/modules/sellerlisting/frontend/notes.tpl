<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center">
<h3 class="page-title">{{$title}}</h3>
   							
   
   {{if !$opr}}
   
 <form name="detail" method="post" action="{{$XFA.notes}}">
 <input type="hidden" name="seller_listing[mbsl_lfi_id]" value="{{$detail.$ID}}"/>
 <table id="viewcust-table" width="450" cellpadding="0" cellspacing="0">   
 <tr><th colspan="2"> <div align="center">Business Name: {{$detail.bsn_name}}</div></th></tr>
 <tr>
     <th width="200"> Feedback :</th>
     <td>{{$detail.mlbs_last_buyer_feedback}}</td>
  </tr>   
 
  <tr>
     <th width="200"> Notes :</th>
     <td><textarea rows="5" cols="45" name="seller_listing[mbsl_notes]"></textarea> </td>
  </tr> 
<tr> 
               <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.close_win();" class="vsml" />
                </td>
            </tr>
		</table>
      </form>
     {{else}}
     	<div style="font-size:24px; height:99px; padding-top:150px;">{{$opr}}</div> 
{{/if}}
</div>
   {{if !$opr}}
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("seller_listing[mbsl_notes]","req", "Please specify notes.");
</script>
{{/if}}
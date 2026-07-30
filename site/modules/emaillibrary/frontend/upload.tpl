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

   

 <form name="detail" method="post" action="{{$XFA.upload}}" enctype="multipart/form-data">

 <input type="hidden" name="upload[bip_id]" value="{{$detail.$ID}}"/>

 <table id="viewcust-table" width="450" cellpadding="0" cellspacing="0">   

 <tr><th >Name:</th><td> {{$detail.bip_buyer}}</div></td></tr>

  <tr>

     <th width="200"> File :</th>

     <td><input type="file" name="upload" /> </td>

  </tr> 

<tr> 

               <td colspan="2" style="text-align:center;">

                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />

                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />

                </td>

            </tr>

		</table>

      </form>

     {{else}}

     	<div style="font-size:14px; height:29px; padding-top:50px;">{{$opr}}</div> 

{{/if}}

</div>

   {{if !$opr}}

<script type="text/javascript" language="javascript" >

    var frmvalidator  = new Validator("detail");

    frmvalidator.EnableMsgsTogether();

    frmvalidator.addValidation("upload","req", "Please select file.");

</script>

{{/if}}
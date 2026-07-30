<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>
    

<!--{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);

</script>
{{/if}}-->

<div align="center">

<form name="detail" method="post" action="{{$XFA.alert}}" enctype="multipart/form-data" id="test">

 
<br /> <br />

 <table  id="viewdoc-table">
 <tr>
 <td> <h3 class="page-title">{{$title}}</h3><br /></td>
 </tr>
 <tr><td> To : {{$email_id}} </td></tr>
 <tr><td>Subject : {{$address}} </td></tr>
 <td>
        <input type="hidden" name="send[to]" value="{{$email_id}}" />
        <input type="hidden" name="send[name]" value="{{$fname}}" />
        <input type="hidden" name="send[subject]" value="{{$address}}" />
       
        <textarea cols="225" rows="10" name="send[message]" id="editor">Dear {{$fname}},</textarea></td></tr>
              
</td>
</tr>
</table>     

            
<table id="viewdoc-table" width="100%" cellpadding="0" cellspacing="0" style="border:1px solid #999;">
   <tr>
     
     <tr>    <td colspan="2" style="text-align:center;">
                    <input type="submit" name="sendemail" value="Send Email" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
      </tr>
    
    </table>  
      
     {{if $opr}} 
     	<div style="font-size:20px; color:#0C6;">{{$opr}}</div> 
      {{/if}}


  </form>

</div>
   {{if !$opr}}
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("poincc[po_invoice_number]","req", "Please enter invoice number.");
</script>
{{/if}}

<script>
	initSample();
</script>
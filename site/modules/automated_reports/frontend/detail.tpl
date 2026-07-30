<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}


<style>
#emllib {width:98%; padding:10px;  border-collapse:collapse;}

#emllib th { border:1px solid #CCC !important; border-collapse:collapse; font-size:14px; text-align:left;}
#emllib td { border:1px solid #CCC !important; border-collapse:collapse;}
</style>


<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:250px; margin-top:30px;">
    <h3 class="page-title" style="margin-bottom:30px;">{{$title}}</h3>    
    {{if $opr}}
	<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}

<form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
<input type="hidden" name="{{$TABLE}}[ar_id]" value="{{$detail.$ID}}" id="ar_id"/>


    <table id="emllib" cellpadding="0" cellspacing="0" style="width:98% !important; border:1px solid #CCC;">

        <tr>
            <th>Time :</th>
            <td><input type="time" name="{{$TABLE}}[ar_report_time]" value="{{$detail.ar_report_time}}"/></td>
        </tr>  
           
      <tr>
            <th>Receiving Emails:</th>
            <td colspan="3">{{$detail.ar_receving_email}}</td>
      </tr>     
            
	  <tr>
            <th>Add Email:</th>
            <td colspan="3"><input type="text" name="{{$TABLE}}[ar_email]" style="width:750px;" /></td>
      </tr>
   
   	  <tr>
            <th>Upload Rules Document:</th>
            <td colspan="3"><input type="file" name="rulesdoc" /></td>
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
			frmvalidator.addValidation("{{$TABLE}}[sftype_id]","dontselect=0", "Please select type.");
			frmvalidator.addValidation("{{$TABLE}}[sf_title]","req", "Please specify title.");
			frmvalidator.addValidation("{{$TABLE}}[sf_body]","req", "Please specify formula.");
    </script>
   {{/if}} 
</div>
<script>
	initSample();
</script>
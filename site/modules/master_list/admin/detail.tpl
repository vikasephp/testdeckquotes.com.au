	<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
   
  <script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
  <script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
  <link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<div align="center" class="newdiv">
    <h3 class="page-title" style="padding-bottom:40px; padding-top:10px;">{{$title}}</h3>
    
    <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
        <table id="product-table" width="99%">
        <input type="hidden" name="survey_data[sur_respondent_id]" value="{{$detail.sur_respondent_id}}" />
         <tr height="70"> 
          	<th align="right">Select CSV File </th>
			<td><input name="surveyresponse" type="file" maxlength="32" value="{{$detail.news_image}}"/></td>
		</tr>
            

            <tr height="70">   
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Import" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="history.go(-1);" class="vsml" />
                </td>
            </tr>
            
        </table>
    </form>
<br /><br /><br /><br />

</div>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
   // frmvalidator.addValidation("survey[survey_code]","req", "Please specify Survey Code");
</script>
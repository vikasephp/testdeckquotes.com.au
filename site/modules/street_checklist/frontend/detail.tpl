<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  

<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

 <script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
 <script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>
 
 <script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" href="{{$BASE_URL}}js/datalist/styledatalist.css"/>


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
<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
    {{if $opr}}
	<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}

<form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
<input type="hidden" name="street[sc_id]" value="{{$detail.$ID}}" id="sc_id"/>


    <table id="emllib" cellpadding="0" cellspacing="0" style="width:98% !important; border:1px solid #CCC;">

        <tr>
            <th>Position:</th>
            <td><!--<input type="text" name="street[sc_position]" value="{{$detail.sc_position}}" style="width:970px;"/>-->
            <select name="street[sc_position]" size="10" class="vlrg" >
            <option value="0">[Choose Position]</option>
              {{foreach from=$positions key="key" item="item"}}                           
            <option value="{{$item.p_name}}"  {{if  $item.p_name eq $detail.sc_position}} selected="selected" {{/if}}> {{$item.user_name}}
            {{$item.p_name}}</option>
              {{/foreach}}                                     
          </select>
            </td>
        </tr>  

		   <tr>
            <th>Checklist Name:</th>
            <td><input type="text" name="street[sc_checklistname]" value="{{$detail.sc_checklistname}}" style="width:970px;"/></td>
           </tr>  

       
		<tr>
                <th>Notes:</th>
                <td width="970px" colspan="3" >
                <table  width="970"  border="0" ><tr><td style="border:0px solid #CCC !important;">
                <textarea cols="200" id="editor"  name="street[sc_notes]" rows="40"  >{{$detail.sc_notes}}</textarea>    
                </td></tr></table>
                </td>
         </tr>
            
        <tr>
            <th>Link:</th>
            <td><input type="text" name="street[sc_link]" value="{{$detail.sc_link}}" style="width:970px;" /></td>
           </tr>     

	<tr>
            <th>Last Audited:</th>
            <td><input type="text" name="street[sc_last_audited]" value="{{$detail.sc_last_audited}}" class="w16em dateformat-d-ds-m-ds-Y" /></td>
           </tr> 

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
			frmvalidator.addValidation("street[sc_position]","req", "Please specity position.");
			frmvalidator.addValidation("street[sc_checklistname]","req", "Please specify checklist name.");
	
    </script>
   {{/if}} 
</div>
<script>
	initSample();
</script>
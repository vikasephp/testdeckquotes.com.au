<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:650px;">
    <h3 class="page-title">{{$title}}</h3>    
    {{if $opr}}
	<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}
      <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
        <table id="list-table" width="80%">
            <input type="hidden" name="edc[{{$ID}}]" value="{{$detail.$ID}}" />
           {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
            <tr>
                <th width="100">Select Employee</th>
                <td>
                    <select name="edc[edc_user_id]" class="xlrg" />
                    {{foreach from=$userData key="key" item="item"}}
                     <option value="{{$item.user_id}}" {{if $item.user_id ==  $detail.edc_user_id}}selected{{/if}}>{{$item.user_name}}</option>
                    {{/foreach}}
                    </select>    
                </td>
            </tr>
            
            <tr>
            <th>Document:</th>
            <td> <input type="file" name="docs_p" /></td>
            </tr> 
            
            <tr>
            <th> When:</th>
            <td> <input type="text" name="edc[edc_when]" value="{{$detail.edc_when}}"  class="w16em dateformat-d-ds-m-ds-Y" id="demo4" maxlength="25" readonly="readonly"/></td>
            </tr>

            
            <tr>
                <th>Who:</th>
                <td><select name="edc[edc_who]" class="xlrg" />
                    {{foreach from=$userData key="key" item="item"}}
                     <option value="{{$item.user_name}}" {{if $item.user_id == $detail.edc_who}}selected{{/if}}>{{$item.user_name}}</option>
                    {{/foreach}}
                    </select>  </td>
            </tr>
            
<!--
            <tr>
                <th width="20">Status:</th>
                <td>
                    <select name="{{$TABLE}}[ms_status]" class="input" />
                    <option value="Inactive" {{if $detail.ms_status == "Inactive"}} selected {{/if}}>Inactive</option> 
                    <option value="Active" {{if $detail.ms_status == "Active"}} selected {{/if}}>Active</option> 
                    </select>    
                </td>
            </tr>-->
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
    frmvalidator.addValidation("docs_p","req", "Please upload document.");
	frmvalidator.addValidation("edc[edc_when]","req", "Please specify when (date).");
	//frmvalidator.addValidation("{{$TABLE}}[sp_email]","req", "Please specify email.");
</script>
   {{/if}} 
</div>

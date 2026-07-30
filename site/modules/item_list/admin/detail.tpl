<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr }}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">{{$title}}</h3>
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="list-table" width="90%">
            {{if $error}}
			<tr>
				<th colspan="2" style="color:#FF0000;">{{$error}}</th>
			</tr>
			{{/if}}
            <tr>
                <th width="20%">Category:</th>
                <td width="80%">
                    <input type="hidden" name="data[{{$ID}}]" value="{{$detail.$ID}}">
                    <select name="data[il_ic_id]" class="lrg" required>
                        <option value="">-- Select Category --</option>
                        {{foreach from=$categories item=item key=key}}
                        <option value="{{$item.ic_id}}" {{if $detail.il_ic_id == $item.ic_id}}selected{{/if}}>
                            {{$item.ic_name}}
                        </option>
                        {{/foreach}}
                    </select>
                </td>
            </tr>
            <tr>
                <th>Name:</th>
                <td>
                    <input type="text" name="data[il_name]" value="{{$detail.il_name}}" class="xxlrg">
                </td>
            </tr>
            <tr>
                <th width="20%">Will It Come With a Manual:</th>
                <td width="80%">
                    <input type="radio" name="data[il_is_manual_available]" value="1" {{if $detail.il_is_manual_available == 1}}checked{{/if}}>
                    &nbsp;Yes
                    &nbsp;&nbsp;
                    <input type="radio" name="data[il_is_manual_available]" value="0" {{if $detail.il_is_manual_available == 0}}checked{{/if}}>
                    &nbsp;No
                </td>
            </tr>
            
            <tr>
                <th width="20%">For Inclusions:</th>
                <td width="80%">
                    <input type="radio" name="data[il_is_inclusions]" value="1" {{if $detail.il_is_inclusions == 1}}checked{{/if}}>
                    &nbsp;Yes
                    &nbsp;&nbsp;
                    <input type="radio" name="data[il_is_inclusions]" value="0" {{if $detail.il_is_inclusions == 0}}checked{{/if}}>
                    &nbsp;No
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="parent.close_win()" class="vsml" />
                </td>
            </tr>
        </table>
    </form>
</div>


<script type="text/javascript" language="javascript">
    var frmvalidator = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("data[bst_business_status_id]", "req", "Please Select Business Status");
    frmvalidator.addValidation("data[bst_task_name]", "req", "Please specify Task Name");	
</script>
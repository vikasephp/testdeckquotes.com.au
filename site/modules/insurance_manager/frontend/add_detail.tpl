<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
//window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.home";
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
<h3 class="page-title">{{$title}} Detail</h3>    
    
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[im_id]" value="{{$detail.im_id}}" />
	
	
	
    		<tr>
				<th>Type</th>
				<td>
					<select name="{{$TABLE}}[im_type]" />
					<option value="0" {{if $detail.im_type eq 0 }} selected="selected" {{/if}}>Please Select </option>
					{{foreach from = $typedata key="key2" item="item2"}}
					<option value="{{$item2.imt_id}}" {{if $item2.imt_id eq $detail.im_type }} selected="selected"
						{{/if}}>{{$item2.imt_type}}</option>
					{{/foreach}}
					</select>
				</td>
			</tr>
    
    
			<tr>
				<th>Status</th>
				<td>
					<select name="{{$TABLE}}[im_status]" />
					<option value="0" {{if $detail.im_status eq 0 }} selected="selected" {{/if}}>Please Select </option>
					{{foreach from = $statusdata key="key2" item="item2"}}
					<option value="{{$item2.ims_id}}" {{if $item2.ims_id eq $detail.im_status }} selected="selected"
						{{/if}}>{{$item2.ims_status}}</option>
					{{/foreach}}
					</select>
				</td>
			</tr>


	
    <tr>
    	 <th>Expiry Date</th>
    	 <td><input type="text" name="{{$TABLE}}[im_expiry_date]" value="{{$detail.im_expiry_date}}" id="demo" class="w16em dateformat-d-ds-m-ds-Y dtpic"/> </td>
    </tr>
    
	<tr>
		<th>Insurance Guide</th>
		<td><input type="text" name="{{$TABLE}}[im_insurance_guide]" style="width:700px" value="{{$detail.im_insurance_guide}}" /></td>
    </tr>
	
	<tr>
        <th>Responsible Person</th>
        <td>
            <select name="{{$TABLE}}[im_responsible_person]" />
            <option value="0" {{if $detail.im_responsible_person eq 0 }} selected="selected" {{/if}}>Please Select </option>
            {{foreach from = $contactdata key="key2" item="item2"}}
            <option value="{{$item2.cs_id}}" {{if $item2.cs_id eq $detail.im_responsible_person }} selected="selected"
                {{/if}}>{{$item2.cs_first_name}} {{$item2.cs_surname}}</option>
            {{/foreach}}
            </select>
        </td>
	</tr>

	
	<tr>
		<th>Responsible Broker</th>
		<td>
        <select name="{{$TABLE}}[im_responsible_broker]" />
            <option value="0" {{if $detail.im_responsible_broker eq 0 }} selected="selected" {{/if}}>Please Select </option>
            {{foreach from = $brokerdata key="key2" item="item2"}}
            <option value="{{$item2.cs_id}}" {{if $item2.cs_id eq $detail.im_responsible_broker }} selected="selected"
                {{/if}}>{{$item2.cs_first_name}} {{$item2.cs_surname}}</option>
            {{/foreach}}
            </select>
        
        </td>
    </tr>
	
	
   
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
<script type="text/javascript">
function closepop()
{
	window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.home";
}
</script>

<script type="text/javascript" language="javascript" >
	var frmvalidator  = new Validator("detail");
	frmvalidator.EnableMsgsTogether();
	frmvalidator.addValidation("type[bac_address]","req", "Please specify Address.");
</script>
</div>
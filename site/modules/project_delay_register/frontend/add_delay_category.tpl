<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

{{if $opr}}
<script type="text/javascript">
	setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;"><br />
	<h3 class="page-title">{{$title}}</h3><br />

{{if $error}}
	<div style="color:red; margin-bottom:10px;">{{$error}}</div>
{{/if}}

<form name="detail" method="post" action="">
<input type="hidden" name="pdc[pdc_id]" value="{{$pdc_id}}" />
<table id="list-table" width="90%">
	<tr>
		<th width="180">Category name</th>
		<td>
			<input type="text" name="pdc[pdc_category_name]" style="width:350px" value="{{$detail.pdc_category_name}}" />
		</td>
	</tr>
	<tr>
		<th>Letter code</th>
		<td>
			<select name="pdc[pdc_letter_code]" id="pdc_letter_code" class="input" style="width:350px">
				<option value="">Please Select</option>
				{{foreach from=$codedata key="key" item="item"}}
				<option value="{{$item.lc_letter_code}}"{{if $item.is_selected}} selected="selected"{{/if}}>{{$item.lc_letter_code}}</option>
				{{/foreach}}
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="padding-top:15px;">
			<input type="submit" name="subSave" value="Save" />
			&nbsp;
			<input type="button" name="Close" value="Close" onclick="javascript:closepop();" />
		</td>
	</tr>
</table>
</form>
</div>

<script type="text/javascript">
	function closepop()
	{
		setTimeout('parent.close_win();', 200);
	}

	// Fallback: force preselect on edit if option exists.
	(function() {
		var selected = {{$selected_letter_code_js}};
		if (!selected) {
			return;
		}
		var sel = document.getElementById('pdc_letter_code');
		if (!sel) {
			return;
		}
		sel.value = selected;
		if (sel.value !== selected) {
			for (var i = 0; i < sel.options.length; i++) {
				if (jQuery.trim(sel.options[i].value) === jQuery.trim(selected)) {
					sel.selectedIndex = i;
					break;
				}
			}
		}
	})();
</script>

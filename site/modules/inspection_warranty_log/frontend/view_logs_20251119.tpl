<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
{{if $opr}}
<script type="text/javascript">
	setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<script type="application/javascript">
	function add_new(url) {
		//var viewurl = "{{$BASE_URL}}designer_tracker.detail"+ "/random/" + Math.random();	
		var viewurl = url;
		$(document).ready(function () {
			$.fancybox({
				'width': '99%',
				'height': '99%',
				'autoScale': false,
				'transitionIn': 'elastic',
				'transitionOut': 'elastic',
				'speedIn': 300,
				'speedOut': 300,
				'overlayShow': true,
				'overlayColor': '#000',
				'hideOnOverlayClick': false,
				'hideOnContentClick': false,
				'type': 'iframe',
				'href': viewurl,
				'scrolling': 'yes'
			});
		});
	}
</script>
<div align="center" style="min-height:350px; z-index:9999999;">
	<h3 class="page-title" style="margin: 30px 0;">{{ $MODULE_PLURAL }}</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="99%">
			<tr>
				<th>Rec. No</th>
				<th>Problem</th>
				<th>Status</th>
				<th>Proposed Inspection Fee(s)</th>
				<th>Acknowledgement Statement</th>
            </tr>
            {{ assign var=status_option_id value=$ATTRIBUTES.status.id }}
            {{ assign var=status_foreign_id value=$ATTRIBUTES.status.foreign_id }}
            {{ assign var=status_option_col value=$ATTRIBUTES.status.option_col }}            
            {{foreach from=$list key="key" item="item"}}
			<tr>
				<td>{{$item.wa_id}}</td>
				<td>{{$item.wa_problem}}</td>
				<td>
                    <select id="{{$status_foreign_id}}_{{$item.wa_id}}" onchange="updateRecord('{{ $item.wa_id }}', '{{$status_foreign_id}}', this.value)">
                        <option value="">Select Status</option>
                        {{foreach from=$warranty_log_inspection_status key="index" item="row"}}
                            <option value="{{$row.$status_option_id}}" {{if $row.$status_option_id == $item.$status_foreign_id}}selected{{/if}}>
                                {{$row.$status_option_col}}
                            </option>
                        {{/foreach}}
                    </select>
                </td>
				<td>
					<div style="display: flex; align-items: baseline; gap: 4px;">
						<span style="font-size: 15px;">$</span>
						<input type="text" min="0" id="wa_inspection_proposed_fees_{{$item.wa_id}}" value="{{$item.wa_inspection_proposed_fees}}" style="width: 100px; margin: 0;" onkeypress="allowNumbersOnly(event)" onkeyup="allowNumbersOnly(event) ? updateRecord('{{ $item.wa_id }}', 'wa_inspection_proposed_fees', this.value) : false">
					</div>
				</td>
				<td>
					<div style="white-space: nowrap;">
						<input type="hidden" name="wa_id" value="{{$item.wa_id}}">
						<input type="file" name="wa_inspection_acknowledgement_statement" style="width: 175px;">
						<input type="submit" name="update_wa_inspection_acknowledgement_statement" title="Save" value="Upload" class="set2">
					</div>
					{{if $error_wa_inspection_acknowledgement_statement}}
					<div style="color: red; margin-top: 5px;">{{$error_wa_inspection_acknowledgement_statement}}</div>
					{{/if}}					
					{{if $item.wa_inspection_acknowledgement_statement}}
						<div id="wa_inspection_acknowledgement_statement_{{$item.wa_id}}" style=" margin-top: 5px;">
							<a href="/{{$BASEFOLDER}}.download_content?file_name={{$item.wa_inspection_acknowledgement_statement}}&module_name=inspection_warranty_log.acknowledgement_statement" target="_blank">Download</a>
							<a href="javascript:;" onclick="javascript:if(confirm('Are you sure want to delete?')) {updateRecord('{{ $item.wa_id }}', 'wa_inspection_acknowledgement_statement', '')} else {return false;}" title="Delete"><img src="/images/delete_icon.png" width="20"></a>
						</div>
					{{/if}}
				</td>
			</tr>
			{{/foreach}}
		</table>
        <br /><br />
		<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
	</form>
</div>
<script>
	function closepop() {
		setTimeout('parent.close_win();', 500);
	}
	function allowNumbersOnly(e) {
		const charCode = (e.which) ? e.which : e.keyCode;
		// Allow numbers (48-57), backspace (8), delete (46), tab (9), enter (13), arrow keys (37-40)
		if ((charCode >= 48 && charCode <= 57) || (charCode >= 96 && charCode <= 105) || charCode === 8 || charCode === 46 || charCode === 9 || charCode === 13 || (charCode >= 37 && charCode <= 40)) {
			return true;
		} else {
			e.preventDefault(); // Prevent non-numeric characters
			return false;
		}
	}
    function callAjax(formData)
    {
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}{{ $BASEFOLDER }}.ajax_handler",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success) {
					if(formData.column == 'wa_inspection_acknowledgement_statement') {
						const id = formData.column + '_' + formData.primaryID;
						$('#' + id).remove();
					}
                }
                else {
                    alert('Some problem in updating the record');
                }
            }
        })
    }

    function updateRecord(primaryID, column, value)
    {
		const formData = {
            primaryID: primaryID,
            column: column,
            value: value,
            action: "updateRecord"
        };
        callAjax(formData);
    }

    function updateRecords(primaryID, column, className)
    {
        i = 0;
        let value = [];
        $('.' + className + ':checked').each(function () {
            value[i++] = $(this).val();
        });
        const formData = {
            primaryID: primaryID,
            column: column,
            value: JSON.stringify(value),
            action: "updateRecord"
        };
        callAjax(formData);
    }

    function displayToggle(record_id, c, t) {
        let activeStatus = 0;
        if ($(t).is(":checked")) {
            activeStatus = 1;
        }
        const formData = {
            r_ID: record_id,
            column: c,
            activeStatus: activeStatus,
            action: "displayToggle"
        };
        callAjax(formData);
    }
</script>
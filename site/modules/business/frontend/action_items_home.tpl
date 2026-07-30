<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<style>
    .custom-table th {
        border: 1px solid #C1DAD7;
        border-collapse: collapse;
        text-align: center;
        font-weight: bold;
        font-size: 11px;
        height: 32px;
        font: "Trebuchet MS", Verdana, Arial, Helvetica;
        background-color: #CCCCCC;
    }

    .custom-table td {
        border: 1px solid #C1DAD7;
        border-collapse: collapse;
        font-weight: normal;
        font-size: 11px;
        text-align: left;
        font-family: Verdana, Arial, Helvetica, sans-serif;
        padding: 6px !important;
    }
</style>
<div>
    <form action="" method="POST">
        <input type="submit" name="add_action_item" value="Add New" class="vsml">
    </form>
</div>
<table cellpadding="0" cellspacing="0" width="100%" class="custom-table">
    <tbody>
        <tr>
            <th>S.N.</th>
            <th>What</th>
            <th>Status/Information</th>
            <th>Show On Portal</th>
            <th>Action</th>
        </tr>
        <!-- <tr>
            <td colspan="4" style="text-align: center; font-size: 20px;">TBD</td>
        </tr> -->
        {{ foreach from=$sales_action_items_data key="key" item="item" }}
        <tr>
            <td>{{ counter }}</td>
            <td>
                <textarea name="sai_what" placeholder="Enter data" onkeyup="updateRecord('{{ $item.sai_id }}', 'sai_what', this.value)" rows="3" style="width: 100%;">{{ $item.sai_what }}</textarea>
            </td>
            <td>
                <textarea name="sai_status" placeholder="Enter data" onkeyup="updateRecord('{{ $item.sai_id }}', 'sai_status', this.value)" rows="3" style="width: 100%;">{{ $item.sai_status }}</textarea>
            </td>
            <td style="text-align: center;">
                <label class="switch">
                    <input class="switch-input" type="checkbox"
                        onchange="updateShowOnPortal('{{ $item.sai_id }}', this)"
                        {{if $item.sai_show_on_portal eq 1}} checked="checked" {{/if}} />
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span>
                </label>
            </td>
            <td>
                <!-- <a href="{{$BASE_URL}}business.action_items_detail/bsn_id/{{ $item.sai_bsn_id }}/sai_id/{{ $item.sai_id }}"><img style="height: 20px; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"></a>
                &nbsp; -->
                <!-- <form action="" method="POST">
                    <input type="hidden" name="sai_bsn_id" value="{{ $item.sai_id }}">
                    <button type="submit" name="delete_action_item"><img style="height: 20px; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"></button>
                </form> -->
                <a href="{{$BASE_URL}}business.action_items_delete/bsn_id/{{ $item.sai_bsn_id }}/sai_id/{{ $item.sai_id }}"><img style="height: 20px; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"></a>
            </td>
        </tr>
        {{ /foreach }}
    </tbody>
</table><script>
	function updateRecord(primaryID, column, value, updateRecord = false) {
        const formData = {
            primaryID: primaryID,
            column: column,
            value: value,
            action: "updateSalesAction"
        };
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}business.action_items_ajax",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success == true) {
                    if(updateRecord){
                        $('#' + column + primaryID).text(value);
                    }
                }
                else {
                    alert('Some problem in updating the record');
                }
            }
        })
    }

    function updateShowOnPortal(saiId, checkbox) {
        const showOnPortal = checkbox.checked ? 1 : 0;
        const formData = {
            sai_id: saiId,
            sai_show_on_portal: showOnPortal,
            action: "updateShowOnPortal"
        };
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}business.action_items_ajax",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success != true) {
                    checkbox.checked = !checkbox.checked;
                    alert('Some problem in updating Show On Portal');
                }
            },
            error: function () {
                checkbox.checked = !checkbox.checked;
                alert('Some problem in updating Show On Portal');
            }
        });
    }
</script>
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<style>
    #client_overview_table {
        margin: auto;
        margin-top: 20px;
    }
    #client_overview_table th {
        text-align: left;
        font-size: 14px;
    }
    #client_overview_table input[type="text"], #client_overview_table textarea {
        width: 300px;
        font-size: 14px;
    }
</style>
<form method="post" style="text-align: center;">
    <h4 style="font-size: 1.2em; font-weight: bold;">{{ $res }}</h4>
    <table id="client_overview_table">
        <tr>
            <th>Client</th>
            <td>
                <input type="text" name="client_overview[co_client]" value="{{ $client_overview_data.co_client }}" readonly>
            </td>
        <!-- </tr>
        <tr> -->
            <th>Client Address</th>
            <td>
                <input type="text" name="client_overview[co_client_address]" value="{{ $client_overview_data.co_client_address }}">
            </td>
        </tr>
        <tr>
            <th>Project Address</th>
            <td>
                <input type="text" name="client_overview[co_project_address]" value="{{ $client_overview_data.co_project_address }}">
            </td>
        <!-- </tr>
        <tr> -->
            <th>Property Type</th>
            <td>
                <input type="text" name="client_overview[co_property_type]" value="{{ $client_overview_data.co_property_type }}">
            </td>
        </tr>
        <tr>
            <th>Block Number</th>
            <td>
                <input type="text" name="client_overview[co_block_number]" value="{{ $client_overview_data.co_block_number }}">
            </td>
        <!-- </tr>
        <tr> -->
            <th>Section Number</th>
            <td>
                <input type="text" name="client_overview[co_section_number]" value="{{ $client_overview_data.co_section_number }}">
            </td>
        </tr>
        <tr>
            <th>Suburb/Division</th>
            <td>
                <input type="text" name="client_overview[co_suburb]" value="{{ $client_overview_data.co_suburb }}">
            </td>
        <!-- </tr>
        <tr> -->
            <th>Land Use Zone</th>
            <td>
                <input type="text" name="client_overview[co_land_use_zone]" value="{{ $client_overview_data.co_land_use_zone }}">
            </td>
        </tr>
        <tr>
            <th>Housing Code</th>
            <td>
                <input type="text" name="client_overview[co_housing_code]" value="{{ $client_overview_data.co_housing_code }}" readonly>
            </td>
        <!-- </tr>
        <tr> -->
            <th>ACTMapi Link</th>
            <td>
                <textarea name="client_overview[co_actmapi_link]" readonly>{{ $client_overview_data.co_actmapi_link }}</textarea>
            </td>
        </tr>
        <tr>
            <th>Pricefinder Link</th>
            <td>
                <textarea name="client_overview[co_pricefinder_link]">{{ $client_overview_data.co_pricefinder_link }}</textarea>
            </td>
        <!-- </tr>
        <tr> -->
            <th>Block Size and Approval</th>
            <td>
                <input type="text" name="client_overview[co_block_approval]" value="{{ $client_overview_data.co_block_approval }}">
            </td>
        </tr>
        <tr>
            <th>When the block was approved</th>
            <td>
                <input type="text" name="client_overview[co_when_block_approved]" value="{{ $client_overview_data.co_when_block_approved }}" readonly>
            </td>
        <!-- </tr>
        <tr> -->
            <th>Block Type</th>
            <td>
                <input type="text" name="client_overview[co_block_type]" value="{{ $client_overview_data.co_block_type }}">
            </td>
        </tr>
        <tr>
            <th>Plot ratio for block type</th>
            <td>
                <input type="text" name="client_overview[co_block_type_plot_ratio]" value="{{ $client_overview_data.co_block_type_plot_ratio }}">
            </td>
        <!-- </tr>
        <tr> -->
            <th>Site Coverage rule for the block</th>
            <td>
                <input type="text" name="client_overview[co_site_coverage_rule]" value="{{ $client_overview_data.co_site_coverage_rule }}">
            </td>
        </tr>
        <tr>
            <th>Site Coverage Maximum</th>
            <td>
                <input type="text" name="client_overview[co_site_coverage_maximum]" value="{{ $client_overview_data.co_site_coverage_maximum }}">
            </td>
        <!-- </tr>
        <tr> -->
            <th>Easements</th>
            <td>
                <textarea name="client_overview[co_easements]">{{ $client_overview_data.co_easements }}</textarea>
            </td>
        </tr>
        <tr>
            <th>Heritage Status</th>
            <td>
                <input type="text" name="client_overview[co_heritage_status]" value="{{ $client_overview_data.co_heritage_status }}">
            </td>
        <!-- </tr>
        <tr> -->
            <th>Protected, registered or regulated trees</th>
            <td>
                <input id="co_is_protected_yes" type="radio" name="client_overview[co_is_protected]" value="1" {{ if $client_overview_data.co_is_protected == 1 }} checked="checked" {{ /if }}>
                <label for="co_is_protected_yes">YES</label>
                <input id="co_is_protected_no" type="radio" name="client_overview[co_is_protected]" value="0" {{ if $client_overview_data.co_is_protected == 0 }} checked="checked" {{ /if }}>
                <label for="co_is_protected_no">NO</label>
            </td>
        </tr>
        <tr>
            <th>Lease Purpose</th>
            <td>
                <input type="text" name="client_overview[co_lease_purpose]" value="{{ $client_overview_data.co_lease_purpose }}">
            </td>
        <!-- </tr>
        <tr> -->
            <th>Unimproved Value</th>
            <td>
                <input type="text" name="client_overview[co_unimproved_value]" value="{{ $client_overview_data.co_unimproved_value }}">
            </td>
        </tr>
        <tr>
            <th>Rates</th>
            <td>
                <input type="text" name="client_overview[co_rates]" value="{{ $client_overview_data.co_rates }}">
            </td>
        <!-- </tr>
        <tr> -->
            <th>Land Tax</th>
            <td>
                <input type="text" name="client_overview[co_land_tax]" value="{{ $client_overview_data.co_land_tax }}">
            </td>
        </tr>
        <tr>
            <th>Settlement date</th>
            <td>
                <input type="text" name="client_overview[co_settlement_date]" class="w16em dateformat-d-ds-m-ds-Y dtpic" value="{{ $client_overview_data.co_settlement_date }}">
            </td>
        <!-- </tr>
        <tr> -->
            <!-- <th>Who Created</th>
            <td>
                <input type="text" value="{{ $client_overview_data.co_created_by }}" readonly>
            </td> -->
        </tr>
        <tr>
            <td colspan="4" style="text-align: center; padding: 20px;">
                <input type="submit" name="client_overview_submit" value="Save" class="vsml" style="width: 100px;" />
            </td>
        </tr>
    </table>
</form>
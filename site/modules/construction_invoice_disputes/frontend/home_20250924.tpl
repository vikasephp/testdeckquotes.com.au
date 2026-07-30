<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}
<script>
    !window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<style>
    .input-group {
        position: relative;
        display: flex;
        flex-wrap: wrap;
        align-items: stretch;
        width: 100%;
    }
    .input-group-text {
        display: flex;
        align-items: center;
        padding: .375rem .75rem;
        font-weight: 500;
        color: #212529;
        text-align: center;
        white-space: nowrap;
        background-color: #f8f9fa;
        border: 1px solid #dee2e6;
        border-radius: 0.375rem;
    }
    .input-group > .form-control {
        position: relative;
        flex: 1 1 auto;
        width: 1%;
        min-width: 0;
        margin-bottom: 0;
    }
    .input-group:not(.has-validation) > :not(:last-child):not(.dropdown-toggle):not(.dropdown-menu):not(.form-floating) {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
    }
    .input-group > :not(:first-child):not(.dropdown-menu):not(.valid-tooltip):not(.valid-feedback):not(.invalid-tooltip):not(.invalid-feedback) {
        margin-left: calc(1px * -1);
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
    }
    .dtpic {
		width: 65px !important;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
	}
</style>
<script>

    function open_popup(type) {
        let viewurl = '';
        if (type == 'manage_procedure') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_procedure" + "/random/" + Math.random();
        }
        else if (type == 'manage_type') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.type.view_fle_name }}" + "/random/" + Math.random();
        }
        else if (type == 'manage_status') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.status.view_fle_name }}" + "/random/" + Math.random();
        }
        else if (type == 'manage_severity') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.severity.view_fle_name }}" + "/random/" + Math.random();
        }
        else if (type == 'manage_claim') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.claim.view_fle_name }}" + "/random/" + Math.random();
        }
        else if (type == 'manage_manager') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.manage.view_fle_name }}" + "/random/" + Math.random();
        }
        else if (type == 'add_new') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.add_new" + "/random/" + Math.random();
        }
        $(document).ready(function () {
            $.fancybox({
                'width': '90%',
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
<h3 class="page-title">{{$title}}</h3>
<br />
<form name="mlist" method="post" enctype="multipart/form-data">
    <div style="float:left; text-align:left;">
        <!-- <div>
            <strong>Search by Type : </strong>
            <select name="search_type" style="width: 175px;">
                <option value="">Please Select</option>
                {{ assign var=option_col value=$ATTRIBUTES.type.option_col }}
                {{ assign var=option_id value=$ATTRIBUTES.type.id }}
                {{ foreach from=$typedata key="index" item="row" }}
                    <option value="{{ $row.$option_id }}" {{ if $row.$option_id eq $search_type }} selected="selected" {{/if}}>{{ $row.$option_col }}</option>
                {{ /foreach }}
            </select>
            <input type="submit" value="Search" name="search">
            <input type="submit" name="reset" value="Clear Search">
        </div> -->
        <div>
            <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:open_popup('manage_procedure');" />
            <!-- <input type="button" name="Add New" value="Type Of Dispute" onclick="javascript:open_popup('manage_type');" /> -->
            <input type="button" name="Add New" value="Status" onclick="javascript:open_popup('manage_status');" />
            <input type="button" name="Add New" value="Severity" onclick="javascript:open_popup('manage_severity');" />
            <input type="button" name="Add New" value="Number Of Claims" onclick="javascript:open_popup('manage_claim');" />
            <input type="button" name="Add New" value="Who Is Managing" onclick="javascript:open_popup('manage_manager');" />
        </div>
    </div>
    <div style="float:right; text-align:right;">
        <input type="submit" name="reset" title="Reset" value="Reset">
        <input type="submit" value="Show Hidden" name="show_hidden" />
        <input type="button" name="Add New" value="Add New" onclick="javascript:open_popup('add_new');" />
    </div>
</form>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" data-col="sn">S.N.</th>
                <th class="topmenu" align="center" valign="middle" data-col="project">Project</th>
                <th class="topmenu" align="center" valign="middle" data-col="client">Client</th>
                <th class="topmenu" align="center" valign="middle" data-col="dispute_date">Dispute Date</th>
                <th class="topmenu" align="center" valign="middle" data-col="number_of_claims">Number of claims</th>
                <!-- <th class="topmenu" align="center" valign="middle" data-col="dispute_type">Type of Dispute</th> -->
                <th class="topmenu" align="center" valign="middle" data-col="quantum_of_claim">Quantum of claim</th>
                <th class="topmenu" align="center" valign="middle" data-col="third_party_costs">Third Party Costs</th>
                <th class="topmenu" align="center" valign="middle" data-col="evidence_brief">Evidence Brief</th>
                <th class="topmenu" align="center" valign="middle" data-col="msteam_folder">MSTEAM Folder</th>
                <th class="topmenu" align="center" valign="middle" data-col="where_are_at">Where are at</th>
                <th class="topmenu" align="center" valign="middle" data-col="who_is_managing">Who is managing</th>
                <th class="topmenu" align="center" valign="middle" data-col="severity">Severity</th>
                <th class="topmenu" align="center" valign="middle" data-col="status">Status</th>
				<th class="topmenu" align="center" valign="middle" data-col="note">Note</th>
                <th class="topmenu" align="center" valign="middle" data-col="hide">Hide</th>
                <th class="topmenu" align="center" valign="middle" data-col="action">Action</th>
            </tr>
        </thead>
        <tbody>
            {{ foreach from=$list key="key" item="item" }}
            <tr bgcolor="{{ cycle values=" #D3E8D6,WHITE" advance=true }}">
                <td data-col="sn">{{ counter }}</td>
                <td data-col="project">
                    <a href="{{ $item.link }}" target="_blank">{{ $projectArr[$item.ldd_bsn_id] }}</a>
                </td>
                <td data-col="client">
                    {{ $clientArr[$item.ldd_bsn_id] }}
                </td>
                <td data-col="dispute_date" style="width: 105px;">
                    <form name="mlist_o" method="post" action="">
                        <input type="text" name="ldd_dispute_date[{{$item.$ID}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{ $item.$ID }}" value="{{ $item.ldd_dispute_date|date_format:'%d-%m-%Y' }}" />
                        <input type="submit" value="Set" name="set_ldd_dispute_date" class="set" />
                    </form>
                </td>
                <td data-col="number_of_claims">
                    <select name="{{$TABLE}}[ldd_claim_id]" onchange="updateRecord('{{ $item.$ID }}', 'ldd_claim_id', this.value)">
                        <option value="0">Please Select</option>
                        {{ assign var=option_col value=$ATTRIBUTES.claim.option_col }}
                        {{ assign var=option_id value=$ATTRIBUTES.claim.id }}
                        {{ foreach from=$claimdata key="index" item="row" }}
                            <option value="{{ $row.$option_id }}" {{ if $row.$option_id eq $item.ldd_claim_id }} selected="selected" {{/if}}>{{ $row.$option_col }}</option>
                        {{ /foreach }}
                    </select>
                </td>
                <!-- <td data-col="dispute_type">
                    <div class="bsearch_scroll_div">
                        <ul style="margin: 0; padding: 0;">
                            {{ assign var=option_col value=$ATTRIBUTES.type.option_col }}
                            {{ assign var=option_id value=$ATTRIBUTES.type.id }}
                            {{ foreach from=$typedata key="index" item="row" }}
                                <li>
                                    <input type="checkbox" name="{{$TABLE}}[ldd_type_id][]" value="{{ $row.$option_id }}" class="ldd_type_id_{{ $item.$ID }}"
                                        {{ foreach from=$item.ldd_type_arr key="key1" item="item1" }}
                                            {{ if $item1 eq $row.$option_id }} checked="checked" {{ /if }}
                                        {{ /foreach }}
                                        onchange="updateRecords('{{ $item.$ID }}', 'ldd_type_id', 'ldd_type_id_{{ $item.$ID }}')"
                                    />
                                    {{ $row.$option_col }}
                                </li>
                           {{/foreach}}
                       </ul>
                   </div>
                </td> -->
                <td data-col="quantum_of_claim">
                    <div class="input-group" style="width: 100px;">
                        <span class="input-group-text">$</span>
                        <input type="text" class="form-control" onkeyup="updateRecord('{{ $item.$ID }}', 'ldd_quantum_of_claim', this.value)" value="{{ $item.ldd_quantum_of_claim }}">
                    </div>
                </td>
                <td data-col="third_party_costs">
                    <input type="text" class="form-control" onkeyup="updateRecord('{{ $item.$ID }}', 'ldd_third_party_costs', this.value)" value="{{ $item.ldd_third_party_costs }}">
                </td>
                <td data-col="evidence_brief">
                    {{ if $item.ldd_evidence_brief_link }}
                    <a href="{{ $item.ldd_evidence_brief_link }}" target="_blank">Link</a>
                    {{ /if }}
                </td>
                <td data-col="msteam_folder">
                    {{ if $item.ldd_msteam_folder_link }}
                    <a href="{{ $item.ldd_msteam_folder_link }}" target="_blank">Link</a>
                    {{ /if }}
                </td>
                <td data-col="where_are_at">
                    <a href="{{$BASE_URL}}{{ $BASEFOLDER }}.notes/{{ $ID }}/{{$item.$ID}}" class="various">Notes</a>
                </td>
                <td data-col="who_is_managing">
                    <select name="{{$TABLE}}[ldd_manage_id]" onchange="updateRecord('{{ $item.$ID }}', 'ldd_manage_id', this.value)">
                        <option value="0">Please Select</option>
                        {{ assign var=option_col value=$ATTRIBUTES.manage.option_col }}
                        {{ assign var=option_id value=$ATTRIBUTES.manage.id }}
                        {{ foreach from=$managedata key="index" item="row" }}
                            <option value="{{ $row.$option_id }}" {{ if $row.$option_id eq $item.ldd_manage_id }} selected="selected" {{/if}}>{{ $row.$option_col }}</option>
                        {{ /foreach }}
                    </select>
                </td>
                <td data-col="severity">
                    <select name="{{$TABLE}}[ldd_severity_id]" onchange="updateRecord('{{ $item.$ID }}', 'ldd_severity_id', this.value)">
                        <option value="0">Please Select</option>
                        {{ assign var=option_col value=$ATTRIBUTES.severity.option_col }}
                        {{ assign var=option_id value=$ATTRIBUTES.severity.id }}
                        {{ foreach from=$severitydata key="index" item="row" }}
                            <option value="{{ $row.$option_id }}" {{ if $row.$option_id eq $item.ldd_severity_id }} selected="selected" {{/if}}>{{ $row.$option_col }}</option>
                        {{ /foreach }}
                    </select>
                </td>
                <td data-col="status">
                    <select name="{{$TABLE}}[ldd_status_id]" onchange="updateRecord('{{ $item.$ID }}', 'ldd_status_id', this.value)">
                        <option value="0">Please Select</option>
                        {{ assign var=option_col value=$ATTRIBUTES.status.option_col }}
                        {{ assign var=option_id value=$ATTRIBUTES.status.id }}
                        {{ foreach from=$statusdata key="index" item="row" }}
                            <option value="{{ $row.$option_id }}" {{ if $row.$option_id eq $item.ldd_status_id }} selected="selected" {{/if}}>{{ $row.$option_col }}</option>
                        {{ /foreach }}
                    </select>
                </td>
				<td data-col="note">
					<a href="{{$BASE_URL}}{{ $BASEFOLDER }}.ldd_notes/{{ $ID }}/{{$item.$ID}}" class="various">Notes</a>
				</td>
                <td data-col="hide">
                    <label class="switch" for="ldd_hide{{ $item.$ID }}">
                        <input id="ldd_hide{{ $item.$ID }}" class="switch-input" {{ if $item.ldd_hide==1 }}checked{{ /if
                            }} onchange="displayToggle('{{ $item.$ID }}', 'ldd_hide', this)" type="checkbox" />
                        <span class="switch-label" data-on="Yes" data-off="No"></span>
                        <span class="switch-handle"></span> <br />
                    </label>
                </td>
                <td data-col="action">
                    <a href="{{$BASE_URL}}{{$XFA.add_new}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"><img
                            style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png" alt="" /></a>
                    <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}"
                        onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;"
                        title="Delete"><img style="height:20px; width:20px;"
                            src="{{$BASE_URL}}css/admin/images/delete.png" alt="" /></a>
                </td>
            </tr>
            {{ /foreach }}
        </tbody>
    </table>
    {{if $last > 1}}
    <table width="90%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            {{if $list}}
            <td align="center">
                <div class='pagination'>
                    {{if $pagenum == 1}}
                    <span class='disabled'>&#171; previous</span>
                    {{else}}
                        <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation=" x - y"
                            x=$pagenum y=1}}" title="Previous">&#171; previous</a>
                        {{/if}}
                        {{if $pagenum != 1}}
                        <span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1"
                                title="{{$page_num}} Page">1</a></span>
                        {{else}}<span class='current'>1</span>
                            {{/if}}{{if $pagenum != 2}}
                            <span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2"
                                    title="{{$page_num}} Page">2</a></span>
                            {{else}}<span class='current'>2</span>
                                {{/if}}
                                {{if $paginateprev.0 > 3}}
                                ...
                                {{/if}}
                                {{foreach from=$paginateprev key="page_key" item="page_num"}}
                                {{if $page_num == $pagenum OR $page_num <= 2}}
                                {{elseif $page_num == $lastone}}
                                {{else}} <span class="paginate"><a class="pagination"
                                            href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}"
                                            title="{{$page_num}} Page">{{$page_num}}</a></span>
                                    {{/if}}
                                    {{/foreach}}
                                    {{foreach from=$paginatenext key="page_key" item="page_num2"}}
                                    {{if $page_num2 < $last AND $page_num2 != $lastone}}
                                    {{if $page_num2 == 1}}
                                    {{elseif $page_num2 == 2}}
                                    {{else}}
                                        {{if $page_num2 == $pagenum OR $page_num2 <= 0}}
                                        <span class='current'> {{$page_num2}}</span>
                                        {{else}}
                                            <a class="pagination"
                                                href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}"
                                                title="{{$page_num2}} Page">{{$page_num2}}</a>
                                            {{/if}}
                                            {{/if}}
                                            {{/if}}
                                            {{/foreach}}
                                            {{if $page_num2 < $lasttow}}
                                            ...
                                            {{/if}}
                                            {{if $lastone == 1}}
                                            {{elseif $lastone == 2}}
                                            {{else}}
                                                {{if $pagenum == $lastone }}
                                                <span class='current'>{{$lastone}}</span>
                                                {{else}}
                                                    <a class="pagination"
                                                        href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}"
                                                        title="{{$lastone}} Page">{{$lastone}}</a>
                                                    {{/if}}
                                                    {{/if}}
                                                    {{if $last == 1}}
                                                    {{elseif $last == 2}}
                                                    {{else}}
                                                        {{if $pagenum == $last}}
                                                        <span class='current'>{{$last}}</span>
                                                        {{else}}
                                                            <a class="pagination"
                                                                href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}"
                                                                title="{{$last}} Page">{{$last}}</a>
                                                            {{/if}}
                                                            {{/if}}
                                                            {{if $pagenum == $last}}
                                                            <span class='disabled'>next &#187;</span>
                                                            {{else}}
                                                                <a class="pagination"
                                                                    href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="
                                                                    x + y" x=$pagenum y=1}}" title="Next">next
                                                                    &#187;</a>
                </div>
                {{/if}}
            </td>
            {{else}}
                <td align="center" height="300">Record Not found... </td>
                {{/if}}
        </tr>
    </table>
    {{/if}}
</div>

<script>
    function callAjax(formData)
    {
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}{{ $BASEFOLDER }}.ajax_handler",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success == true) {
                    // alert('You have successfully updated the record');
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
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
    .set3 {
        font-size: 12px !important;
        width: 50px !important;
        display: inline-block;
        padding: 3px !important;
        font-weight: bold;
        background: #0CF;
        color: #FFF;
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
    <div style="display: flex; justify-content: space-between; align-items: end;">
        <div style="margin-left: 10px; text-align: left;">
            <div>
                <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:open_popup('manage_procedure');" />
            </div>
            <div>
                <strong>Filter by Stage : </strong>
                <select name="filter_stage" style="width: 175px;">
                    <option value="">Select Stage</option>
                    {{ assign var=option_col value=$ATTRIBUTES.stage.option_col }}
                    {{ assign var=option_id value=$ATTRIBUTES.stage.id }}
                    {{foreach from=$stageData key="index" item="row"}}
                        <option value="{{ $row.$option_id }}" {{ if $row.$option_id == $filter_stage }}selected{{/if}}>{{ $row.$option_col }}</option>
                    {{/foreach}}
                </select>
                <input type="submit" value="Search" name="search_stage">
                <input type="submit" name="clear" value = "Clear Search">
            </div>
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
            </div>
            <div>
                <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:open_popup('manage_procedure');" />
                <input type="button" name="Add New" value="Type Of Dispute" onclick="javascript:open_popup('manage_type');" />
                <input type="button" name="Add New" value="Status" onclick="javascript:open_popup('manage_status');" />
                <input type="button" name="Add New" value="Severity" onclick="javascript:open_popup('manage_severity');" />
                <input type="button" name="Add New" value="Number Of Claims" onclick="javascript:open_popup('manage_claim');" />
                <input type="button" name="Add New" value="Who Is Managing" onclick="javascript:open_popup('manage_manager');" />
            </div> -->
        </div>
        <div style="margin-right: 10px; text-align: right;">
            <input type="submit" value="Show Hidden" name="show_all">
        </div>
    </div>
        
</form>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" data-col="sn">S.N.</th>
                <th class="topmenu" align="center" valign="middle" data-col="client_names">Client Names</th>
                <th class="topmenu" align="center" valign="middle" data-col="project_address">Project Address</th>
                <th class="topmenu" align="center" valign="middle" data-col="stage">Stage</th>
                <th class="topmenu" align="center" valign="middle" data-col="task_checklist">Task Checklist</th>
				<th class="topmenu" align="center" valign="middle" data-col="price_guarantee">Price Guarantee</th>
                <th class="topmenu" align="center" valign="middle" data-col="msteams_folder">MSTeams Folder</th>
                <th class="topmenu" align="center" valign="middle" data-col="action_plan">Action Plan</th>
                <th class="topmenu" align="center" valign="middle" data-col="time_line">Time Line</th>
                <th class="topmenu" align="center" valign="middle" data-col="agency_agreement">Agency Agreement</th>
                <th class="topmenu" align="center" valign="middle" data-col="auction_date">Auction Date</th>
                <th class="topmenu" align="center" valign="middle" data-col="all_homes_link">All homes Link</th>
                <th class="topmenu" align="center" valign="middle" data-col="rea_link">REA Link</th>
                <th class="topmenu" align="center" valign="middle" data-col="agent_box_link">Agent Box Link</th>
				<th class="topmenu" align="center" valign="middle" data-col="domains_link">Domains Link</th>
				<th class="topmenu" align="center" valign="middle" data-col="project_hide">Project Hide</th>
				<th class="topmenu" align="center" valign="middle" data-col="action">Action</th>
            </tr>
        </thead>
        <tbody>
            {{ foreach from=$list key="key" item="item" }}
            <tr bgcolor="{{ cycle values=" #D3E8D6,WHITE" advance=true }}">
                <td data-col="sn">{{ counter }}</td>
                <td data-col="client_names">{{$item.client_names}}</td>
                <td data-col="project_address">{{ $item.project_address }}</td>
                <td data-col="stage">
                    <select name="" id="ps_stage{{$item.$ID}}" onchange="updateRecord({{$item.$ID}}, 'ps_stage', this.value)">
                        <option value="0">Select Stage</option>
                        {{ assign var=option_col value=$ATTRIBUTES.stage.option_col }}
                        {{ assign var=option_id value=$ATTRIBUTES.stage.id }}
                        {{foreach from=$stageData key="index" item="row"}}
                            <option value="{{ $row.$option_id }}" {{ if $row.$option_id == $item.ps_stage }}selected{{/if}}>{{ $row.$option_col }}</option>
                        {{/foreach}}
                        <!-- {{foreach from=$stageData key="index" item="row"}}
                            <option value="{{$row.st_id}}" {{if $row.st_id == $item.ps_stage}}selected{{/if}}>{{$row.st_option}}</option>
                        {{/foreach}} -->
                    </select>
                </td>
                <td data-col="task_checklist">
                    <a href="/{{$BASEFOLDER}}.view_project/bsn_id/{{$item.ps_bsn_id}}" class="set3" style="color:#FFF;" target="_blank">View Project</a>
                </td>
				<td data-col="price_guarantee">
					<input type="text" id="name" name="ps_price_guarantee" placeholder="Enter Price Guarantee" />
				</td>
                <td data-col="msteams_folder">{{$item.ps_msteam_folder_link}}</td>
                <td data-col="action_plan">{{$item.ps_action_plan}}</td>
                <td data-col="time_line">{{$item.ps_time_line}}</td>
                <td data-col="agency_agreement">{{$item.ps_agency_agreement}}</td>
                <td data-col="auction_date" style="width: 100px;">
                    <input type="text" name="dt" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo452_{{$item.$ID}}" onfocus="updateRecord({{$item.$ID}}, 'ps_auction_date', this.value);" value="{{$item.ps_auction_date}}" />
                </td>
                <td data-col="all_homes_link">{{$item.ps_home_link}}</td>
                <td data-col="rea_link">{{$item.ps_rea_link}}</td>
                <td data-col="agent_box_link">{{$item.ps_agent_box_link}}</td>
                <td data-col="domains_link">{{$item.ps_domains_link}}</td>
                <td data-col="project_hide">
                    <form name ="recmet3" method="post" action="">
     	                <input type="hidden" name="hideRecord[{{$item.$ID}}]" value="0" />
  	                    <label class="switch">
                            <input class="switch-input" type="checkbox"  name="hideRecord[{{$item.$ID}}]" value="1"  onclick="this.form.submit();" {{if $item.ps_sales_hide eq 1 }} checked="checked" {{/if}}>
                            <span class="switch-label" data-on="Yes" data-off="No"></span> 
                            <span class="switch-handle"></span>
                        </label>
                    </form>  
                </td>
                <td data-col="action">
                    <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png" alt="" /></a>
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
</script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}
<h3 class="page-title">{{$title}}</h3><br />
<br />
<style>
    .set {
        font-size: 10px !important;
        width: 25px !important;
        display: inline-block;
        padding-top: 1px !important;
        padding-bottom: 1px !important;
        padding-left: 1px !important;
        height: 25px !important;
    }

    #fancybox-wrap {
        z-index: 9999999;
    }
</style>
<script language="javascript">
    function add_procedure() {
        var viewurl = "{{$BASE_URL}}design_phase_customer_report.view_procedure" + "/random/" + Math.random();
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
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
    <div style="float:left; text-align:left;">
        &nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel"
            onclick="javascript:add_procedure();" />
        <br />
        &nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
        <input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="" />
        <br />
        &nbsp;&nbsp;<strong>Filter by Designer Name:</strong>
        <input type="text" name="designerName" value="{{$designerName}}" style="width:200px;" placeholder="" />
        <br />
        &nbsp;&nbsp;<strong>Filter by Status:</strong>
        <select name="filterStatus" class="lrg">
            <option value="0" selected="selected"> -- select -- </option>
            {{foreach from = $business_status key="key3" item="status"}}
            <option value="{{$status.st_id}}" {{if $filterStatus==$status.st_id }} selected {{/if}}> {{$status.st_name}}
            </option>
            {{/foreach}}
        </select>
        <br />
        &nbsp;&nbsp;<input type="submit" value="Search" name="searchaddr" />
        <input type="submit" value="Clear Search" name="clearsearch" />
        <!-- 
        &nbsp; &nbsp; &nbsp; &nbsp;<strong> Filter By : </strong> 
        <select name="callinked"/>
        <option value="0">Show All</option>
        {{foreach from = $cal_linked key="key3" item="item3"}}
        <option value="{{$item3.cl_id}}" {{if $item3.cl_id eq $callinked}} selected="selected" {{/if}}>{{$item3.cl_option}}</option>
        {{/foreach}}
        </select> 
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />   
        &nbsp;<input type="submit" name="clear" value = "Clear Filter" />  -->
    </div>
    <div style="float:right; text-align: left;">
        <input type="submit" value="Show Hidden" name="unhide" /> 
    </div>
    <!--<div style="float:right;">
        <input type="submit" value="Show Hidden" name="hidden"  />
    </div>-->
</form>
<table id="list-table" class="nav-back" width="100%">
    <thead>
        <tr>
            <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
            <th class="topmenu" align="center" valign="middle" width="20%">Project Address</th>
            <th class="topmenu" align="center" valign="middle" width="4%">Users</th>
            <th class="topmenu" align="center" valign="middle" width="7%">Status</th>
            <th class="topmenu" align="center" valign="middle" width="20%">Project Type</th>
            <th class="topmenu" align="center" valign="middle" width="14%">User</th>
            <th class="topmenu" align="center" valign="middle" width="4%">Link</th>
            <th class="topmenu" align="center" valign="middle" width="8%">Mobile</th>
            <th class="topmenu" align="center" valign="middle" width="8%">Email</th>
            <th class="topmenu" align="center" valign="middle" width="10%">Text Logon</th>
            <th class="topmenu" align="center" valign="middle" width="10%">Block</th>
            <th class="topmenu" align="center" valign="middle" width="10%">Last Logged On</th>
            <th class="topmenu" align="center" valign="middle" width="10%">Proposal Checklist Control</th>
            <th class="topmenu" align="center" valign="middle" width="10%">Renovation Checklist Control</th>
            <th class="topmenu" align="center" valign="middle" width="10%">Hide/Unhide</th>
            <th class="topmenu" align="center" valign="middle" width="10%">Designer Name</th>
            <th class="topmenu" align="center" valign="middle" width="10%" data-title="control_button">Control Button</th>
            <th class="topmenu" align="center" valign="middle" width="10%">Audit</th>
        </tr>
    </thead>
    <tbody>
        {{foreach from=$list key="key" item="item"}}
        <tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}" id="row_{{ $item.bsn_id }}">
            <td>{{counter}}</td>
            <td><a id="bsn__name_{{$item.bsn_id}}_{{$item.bcust_id}}" href="{{$item.link}}"
                    target="_blank">{{$item.bsn_name}}</a></td>
            <td>{{$item.users}}</td>
            <td>{{$item.status}}</td>
            <td>
                <span id="bsn__id_{{$item.bsn_id}}_{{$item.bcust_id}}">{{$item.project_type}}</span>
                <div id="update_elemnt_date_block">
                    <button class="update_elemnt_date" data-id="" type="button">Update</button>
                    <input style="display:none;" onchange="update_date('{{$item.bsn_id}}',this,{{$item.bcust_id}})"
                        value="{{$item.project_type}}" type="text" />
                </div>
            </td>
            <td>{{$item.bcust_fname}} {{$item.bcust_lname}}</td>
            <td style="text-align: center;">
                <a id="bcust__name_{{$item.bsn_id}}_{{$item.bcust_id}}" href="{{ $item.customer_link }}"
                    target="_blank">Link</a>
            </td>
            <td>{{$item.bcust_misc_moble}}</td>
            <td>{{$item.bcust_misc_email1}}</td>
            <td>TBD</td>
            <td>
                <form name="recmet3" method="post" action="">
                    <input type="hidden" name="block[{{$item.bcust_id}}]" value="0" />
                    <label class="switch">
                        <input class="switch-input" type="checkbox" name="block[{{$item.bcust_id}}]" value="1"
                            onclick="this.form.submit();" {{if $item.bcust_pcr_block eq 1 }} checked="checked"
                            {{/if}} />
                        <span class="switch-label" data-on="Yes" data-off="No"></span>
                        <span class="switch-handle"></span> <br />
                    </label>
                </form>
				{{if $item.bcust_pcr_block eq 1}}
					{{$item.bcust_pcr_block_username}}<br/>{{$item.bcust_pcr_block_date|date_format:"%d-%m-%Y"}}
				{{/if}}
            </td>
            <td>{{$item.last_logged_on}}</td>
            <td>
                <form name="checklist_form" method="post" action="">
                    <table>
                        {{foreach from=$item.checklist key="key" item="item2"}}
                        <tr>
                            <td>{{$item2.dpn_unique_id}}</td>
                            <td>
                                <label class="switch">
                                    <input class="switch-input" {{if $item2.checklist_status==1}} checked {{/if}}
                                        onchange="update_checklist_on_off('{{$item2.dpn_id}}',this)" type="checkbox" />
                                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                                    <span class="switch-handle"></span> <br />
                                </label>
                            </td>
                        </tr>
                        {{if $item2.checklist_status==1 and $item2.dpn_uid_enabler_name != '' }}
                        <tr><td colspan="2">{{$item2.dpn_uid_enabler_name}}<br/>{{$item2.dpn_uid_enable_time|date_format:"%d-%m-%Y"}}</td></tr>
                        {{/if}}
                        {{/foreach}}
                    </table>
                </form>
            </td>
            <td>
                <form name="checklist_reno_form" method="post" action="">
                    <table>
                        {{foreach from=$item.checklist_reno key="key" item="item2"}}
                        <tr>
                            <td>{{$item2.dpn_unique_id}}</td>
                            <td>
                                <label class="switch">
                                    <input class="switch-input" {{if $item2.checklist_status==1}} checked {{/if}}
                                        onchange="update_checklist_reno_on_off('{{$item2.dpn_id}}',this)" type="checkbox" />
                                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                                    <span class="switch-handle"></span> <br />
                                </label>
                            </td>
                        </tr>
                        {{if $item2.checklist_status==1 and $item2.dpn_uid_enabler_name != '' }}
                        <tr><td colspan="2">{{$item2.dpn_uid_enabler_name}}<br/>{{$item2.dpn_uid_enable_time|date_format:"%d-%m-%Y"}}</td></tr>
                        {{/if}}
                        {{/foreach}}
                    </table>
                </form>
            </td>
            <td>
                <form name="recmet3" method="post" action="">
                    <label class="switch" for="bsn_dpcr_hide_{{ $item.bsn_id }}">
                        <input id="bsn_dpcr_hide_{{ $item.bsn_id }}" class="switch-input" {{ if $item.bsn_dpcr_hide==1
                            }} checked {{ /if }} onchange="projectDisplayToggle('{{$item.bsn_id}}',this)"
                            type="checkbox" />
                        <span class="switch-label" data-on="Yes" data-off="No"></span>
                        <span class="switch-handle"></span> <br />
                    </label>
                </form>
				{{if $item.bsn_dpcr_hide eq 1}}
				{{$item.bsn_dpcr_hide_username}}<br/>{{$item.bsn_dpcr_hide_date|date_format:"%d-%m-%Y"}}
				{{/if}}
            </td>
            <td>{{ $item.prd_name }}</td>
            <td data-title="control_button">
                <form name="recmet3" method="post" action="">
                    <table>
                        <!-- <tr>
                            <th>Sales</th>
                            <td>
                                <label class="switch" for="bsn_pa_sales_flag{{ $item.bsn_id }}">
                                    <input id="bsn_pa_sales_flag{{ $item.bsn_id }}" class="switch-input bsn_pa_sales_flag{{ $item.bsn_id }}" {{ if $item.bsn_pa_sales_flag == 1 }}checked{{ /if }} onchange="projectPhasesToggle('{{ $item.bsn_id }}', 'bsn_pa_sales_flag', this)" type="checkbox" />
                                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                                    <span class="switch-handle"></span> <br />
                                </label>
                            </td>
                        </tr> -->
                        <tr>
                            <th>Designs</th>
                            <td>
                                <label class="switch" for="bsn_pa_design_flag{{ $item.bsn_id }}">
                                    <input id="bsn_pa_design_flag{{ $item.bsn_id }}" class="switch-input bsn_pa_design_flag{{ $item.bsn_id }}" {{ if $item.bsn_pa_design_flag == 1 }}checked{{ /if }} onchange="projectPhasesToggle('{{ $item.bsn_id }}', 'bsn_pa_design_flag', this)" type="checkbox" />
                                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                                    <span class="switch-handle"></span> <br />
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th>Planning Approval</th>
                            <td>
                                <label class="switch" for="bsn_pa_planning_flag{{ $item.bsn_id }}">
                                    <input id="bsn_pa_planning_flag{{ $item.bsn_id }}" class="switch-input bsn_pa_planning_flag{{ $item.bsn_id }}" {{ if $item.bsn_pa_planning_flag == 1 }}checked{{ /if }} onchange="projectPhasesToggle('{{ $item.bsn_id }}', 'bsn_pa_planning_flag', this)" type="checkbox" />
                                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                                    <span class="switch-handle"></span> <br />
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th>Inclusions</th>
                            <td>
                                <label class="switch" for="bsn_pa_inclusion_flag{{ $item.bsn_id }}">
                                    <input id="bsn_pa_inclusion_flag{{ $item.bsn_id }}" class="switch-input bsn_pa_inclusion_flag{{ $item.bsn_id }}" {{ if $item.bsn_pa_inclusion_flag == 1 }}checked{{ /if }} onchange="projectPhasesToggle('{{ $item.bsn_id }}', 'bsn_pa_inclusion_flag', this)" type="checkbox" />
                                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                                    <span class="switch-handle"></span> <br />
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th>Construction</th>
                            <td>
                                <label class="switch" for="bsn_pa_construction_flag{{ $item.bsn_id }}">
                                    <input id="bsn_pa_construction_flag{{ $item.bsn_id }}" class="switch-input bsn_pa_construction_flag{{ $item.bsn_id }}" {{ if $item.bsn_pa_construction_flag == 1 }}checked{{ /if }} onchange="projectPhasesToggle('{{ $item.bsn_id }}', 'bsn_pa_construction_flag', this)" type="checkbox" />
                                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                                    <span class="switch-handle"></span> <br />
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th>Completion</th>
                            <td>
                                <label class="switch" for="bsn_pa_completion_flag{{ $item.bsn_id }}">
                                    <input id="bsn_pa_completion_flag{{ $item.bsn_id }}" class="switch-input bsn_pa_completion_flag{{ $item.bsn_id }}" {{ if $item.bsn_pa_completion_flag == 1 }}checked{{ /if }} onchange="projectPhasesToggle('{{ $item.bsn_id }}', 'bsn_pa_completion_flag', this)" type="checkbox" />
                                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                                    <span class="switch-handle"></span> <br />
                                </label>
                            </td>
                        </tr>
                    </table>
                </form>
            </td>
            <td>
                <form name="recmet3" method="post" action="">
                    <input type="hidden" name="audit[{{$item.bs_business_id}}]" value="0" />
                    <label class="switch">
                        <input class="switch-input" type="checkbox" name="audit[{{$item.bs_business_id}}]" value="1" onclick="this.form.submit();" {{if $item.bs_audit_block eq 1 }} checked="checked" {{/if}} />
                        <span class="switch-label" data-on="Yes" data-off="No"></span>
                        <span class="switch-handle"></span> <br />
                    </label>
                </form>
                {{if $item.bs_audit_block eq 1 }}
                {{ $item.audit_user_name }}</br>
                {{ $item.audit_date }}
                {{/if}}
            </td>
        </tr>
        {{/foreach}}
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
                    <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation=" x - y" x=$pagenum
                        y=1}}" title="Previous">&#171; previous</a>
                    {{/if}}
                    {{if $pagenum != 1}}
                    <span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1"
                            title="{{$pagenum}} Page">1</a></span>
                    {{else}}<span class='current'>1</span>
                        {{/if}}{{if $pagenum != 2}}
                        <span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2"
                                title="{{$pagenum}} Page">2</a></span>
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
                                        <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}"
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
                                                                x + y" x=$pagenum y=1}}" title="Next">next &#187;</a>
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
    function update_date(record_id, t, bcust_id) {
        var project_type = t.value;
        console.log("record_id ::" + record_id + " project_type ::" + project_type);
        var formData = {
            r_ID: record_id,
            project_type: project_type,
            action: "update_bsn_projecttype"
        };
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}design_phase_customer_report.ajax_handler",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success == true) {
                    $("#bsn__name_" + record_id + "_" + bcust_id).text(data.user_data[0].bsn_name);
                }
                $("#bsn__id_" + record_id + "_" + bcust_id).text(project_type);
                console.log('you are under success');
            }
        })
    }
    function update_checklist_on_off(record_id, t) {
        var project_type = t.value; var activeStatus = 0;
        console.log("record_id ::" + record_id);
        if ($(t).is(":checked")) { activeStatus = 1; }
        var formData = {
            r_ID: record_id,
            activeStatus: activeStatus,
            action: "update_checklist_on_off"
        };
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}design_phase_customer_report.ajax_handler",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success == true) {
                    console.log('you are under success');
                    window.location.reload(true);
                }
                else {
                    console.log('you are under failure');
                }
            }
        })
    }
    function update_checklist_reno_on_off(record_id, t) {
        var project_type = t.value; var activeStatus = 0;
        console.log("record_id ::" + record_id);
        if ($(t).is(":checked")) { activeStatus = 1; }
        var formData = {
            r_ID: record_id,
            activeStatus: activeStatus,
            action: "update_checklist_reno_on_off"
        };
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}design_phase_customer_report.ajax_handler",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success == true) {
                    console.log('you are under success');
                    window.location.reload(true);
                }
                else {
                    console.log('you are under failure');
                }
            }
        })
    }
    function projectDisplayToggle(record_id, t) {
        console.log(record_id, t);
        let activeStatus = 0;
        if ($(t).is(":checked")) {
            activeStatus = 1;
        }
        const formData = {
            r_ID: record_id,
            activeStatus: activeStatus,
            action: "project_display_toggle"
        };
        console.log(formData);
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}design_phase_customer_report.ajax_handler",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success == true) {
                    alert('You have successfully updated the hide/show status');
                    if (activeStatus == 1) {
                        $('#row_' + record_id).hide();
                    }
                }
                else {
                    alert('Some problem in updating the hide/show status');
                }
            }
        })
    }

    function projectPhasesToggle(record_id, c, t) {
        // console.log(record_id, c, t);
        const allCheckElements = $('.' + c + record_id);
        let activeStatus = 0;
        if ($(t).is(":checked")) {
            activeStatus = 1;
            allCheckElements.attr('checked', 'checked');
        }
        else {
            allCheckElements.removeAttr('checked');
        }
        const formData = {
            r_ID: record_id,
            column: c,
            flag: activeStatus,
            action: "project_phase_toggle"
        };
        // console.log(formData);
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}design_phase_customer_report.ajax_handler",
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

    $(".update_elemnt_date").click(function () {
        $(this).next().slideToggle();
    })
</script>
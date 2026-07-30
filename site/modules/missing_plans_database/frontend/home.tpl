<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}
<script>
    !window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script>

    function open_popup(type) {
        let viewurl = '';
        if (type == 'manage_procedure') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_procedure" + "/random/" + Math.random();
        }
        if (type == 'plan_type') {
           // viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_type" + "/random/" + Math.random();
           viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_type";
        }
        else if (type == 'manage_type') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.type.view_fle_name }}" + "/random/" + Math.random();
        }
        else if (type == 'manage_status') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.status.view_fle_name }}" + "/random/" + Math.random();
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
        &nbsp; &nbsp;
        <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:open_popup('manage_procedure');" />
        <input type="button" name="Type" value="Type" onclick="javascript:open_popup('plan_type');"> <br />
      &nbsp; &nbsp; <strong>Filter By Project : </strong>
      <input type="text" name="address"  style="width:300px;" placeholder="Filter for Address"/>
      <input type="submit" value="Search" name="search"  /> &nbsp;<input type="submit" name="clear_search" value = "Clear Search" /> <br />
      
       &nbsp; &nbsp; <strong>Filter By Architect: </strong>
       <input type="text" name="architect"  style="width:300px;" placeholder="Filter for Architect"/>
       <input type="submit" value="Search" name="search"  /> &nbsp;<input type="submit" name="clear_search" value = "Clear Search" />  <br />
       
       &nbsp; &nbsp; <strong>Filter By Status: </strong>
       <!--<input type="text" name="search_status"  style="width:300px;" placeholder="Filter for Status"/>-->
           <div class="bsearch_scroll_div" style="display:inline-block;">
            <ul style="margin: 0; padding: 0;">
        {{foreach from=$business_status key="key" item="item"}}
 			<li><input type="checkbox" name="search_status[]" value="{{$item.st_name}}" > {{$item.st_name}}
            </li>
        {{/foreach}}
        </ul>
        </div>
        <div style="display:inline-block">
         <input type="submit" value="Search" name="filter_status"  /> &nbsp;<input type="submit" name="clear_search" value = "Clear Search" /> 
       <input type="submit" name="clear_search" value = "Refresh Page" /> 
       </div>
       <br />
    </div>
    <div style="float:right; text-align:right;">
      <input type="submit" name="hidden" value ="Show Hidden" />  
    </div>
</form>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" data-col="sn">S.N.</th>
                <th class="topmenu" align="center" valign="middle" data-col="sn">Hide</th>
                <th class="topmenu" align="center" valign="middle" data-col="project">Project</th>
                <th class="topmenu" align="center" valign="middle" data-col="checklist">Checklist</th>
                <th class="topmenu" align="center" valign="middle" data-col="checklist">Status</th>
                <th class="topmenu" align="center" valign="middle" data-col="checklist">Hia</th>
                <th class="topmenu" align="center" valign="middle" data-col="missing_plan">Missing Plan</th>
                <th class="topmenu" align="center" valign="middle" data-col="type">Type</th>
                <th class="topmenu" align="center" valign="middle" data-col="type">Position</th>
                <th class="topmenu" align="center" valign="middle" data-col="date_added">Date Added</th>
                <th class="topmenu" align="center" valign="middle" data-col="day_count">Day Count</th>
                <th class="topmenu" align="center" valign="middle" data-col="total_plans_missing">Total Plans Missing</th>
                <th class="topmenu" align="center" valign="middle" data-col="lmp">LMP</th>
                <th class="topmenu" align="center" valign="middle" data-col="appointed_architect">Appointed Architect</th>
                <th class="topmenu" align="center" valign="middle" data-col="upload">Upload</th>
                <th class="topmenu" align="center" valign="middle" data-col="synce">Synce</th>
            </tr>
        </thead>
        <tbody>
            {{ foreach from=$list key="key" item="item" }}
            <tr bgcolor="{{ cycle values=" #D3E8D6,WHITE" advance=true }}">
                <td data-col="sn">{{ counter }}</td>
         <td>
         <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.pc_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.pc_id}}]" value="1"  onclick="this.form.submit();" {{if $item.pc_missing_plan_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>
       </td>
                <td data-col="project">
                <a href="{{ $item.link }}" target="_blank">{{ $projectArr[$item.pc_bsn_id] }}</a>
                </td>
                <td data-col="checklist">{{$item.checklist}}<br />
                 {{if $item.doc_file_name_20}}
                 <a href="/missing_plans_database.download_content?file_name={{$item.doc_file_name_20}}&module_name=missing_plans_database.home" >Download</a> 
               {{/if}}
                </td>
                <td data-col="checklist">{{$item.status}}</td>
                <td>
                 {{if $item.doc_file_name_64}}
                 <a href="/missing_plans_database.download_content?file_name={{$item.doc_file_name_64}}&module_name=missing_plans_database.home" >Download</a> 
               {{/if}}
                </td>
                
                <td data-col="missing_plan">{{ $item.pc_document }}</td>
                <td data-col="type">
                    {{foreach from=$mpddetail item=item_mpd key=key}}
                        {{ if $item_mpd.ppc_document eq $item.pc_document }}
                            {{$item_mpd.ppc_mpd_type}}
                        {{/if}}
                    {{/foreach}}
                </td>
                <td> 
                {{foreach from=$mpddetail item=item_mpd key=key}}
                        {{ if $item_mpd.ppc_document eq $item.pc_document }}
                            {{$item_mpd.ppc_mpd_position}}
                        {{/if}}
                    {{/foreach}}
                 </td>
                <td data-col="date_added">{{if $item.pc_design_plan_date}}{{$item.pc_design_plan_date|date_format:"%d/%m/%Y"}}{{else}}N/A{{/if}}</td>
                <td data-col="day_count" cur-date="{{$smarty.now|date_format:"%D"|@strtotime}}">
                    {{if $item.pc_design_plan_date != '' }} 
                    	{{assign var=num1 value=$item.pc_design_plan_date|@strtotime}}
                    	{{assign var=num2 value=$smarty.now|date_format:"%D"|@strtotime}}
                    	{{assign var=diff value=$num2-$num1}}
                    	{{assign var=final value=$diff/86400}}
                    	{{$final|string_format:"%d"}}
                    {{/if}}
                </td>
                <td data-col="total_plans_missing">{{ $totalPlansMissingArr[$item.pc_bsn_id] }}</td>
                <td data-col="lmp">
                    {{ if $lmpArr[$item.pc_bsn_id].doc_file_name }}
                    <a href="{{ $BASE_URL }}{{ $BASEFOLDER }}.download_content?file_name={{ $lmpArr[$item.pc_bsn_id].doc_file_name }}&module_name=lmp.home" target="_blank">Link</a>
                    <br/>
                    {{$lmpArr[$item.pc_bsn_id].doc_date_uploaded|date_format:"%d/%m/%Y"}}
                    {{ /if }}
                </td>
                <td data-col="appointed_architect">{{ $architectArr[$item.pc_bsn_id] }}</td>
                <td data-col="upload">
                    <form name="cal" method="post" enctype="multipart/form-data"> 
                        <input type="hidden" name="{{ $ID }}" value="{{ $item.$ID }}"  />
                        <input type="file" name="pc_missing_plans_upload" style="width: 175px;" />
                        <input type= "submit" name="save_pc_missing_plans_upload" title="Save" value="Upload" class="set2">
                    </form>
                    {{ if $item.pc_missing_plans_upload }}
                        <a href="/{{ $BASEFOLDER }}.download_content?file_name={{$item.pc_missing_plans_upload}}&module_name={{ $BASEFOLDER }}.home" target="_blank">Download</a>
                        <a href="/{{ $BASEFOLDER }}.delete_pc_missing_plans_upload/{{ $ID }}/{{ $item.$ID }}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
                    {{ /if }}
                </td>
                <td data-col="synce">TBD</td>
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
    function updateRecord(primaryID, column, value) {
        const formData = {
            primaryID: primaryID,
            column: column,
            value: value,
            action: "updateRecord"
        };
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
</script>
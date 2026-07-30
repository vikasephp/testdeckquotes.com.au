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
        if(type == 'manage_procedure'){
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_procedure" + "/random/" + Math.random();
        }
        else if(type == 'manage_type'){
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_type" + "/random/" + Math.random();
        }
        else if(type == 'manage_status'){
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_status" + "/random/" + Math.random();
        }
        else if(type == 'add_new'){
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
        <input type="button" name="Add New" value="Type Of Dispute" onclick="javascript:open_popup('manage_type');" />
        <input type="button" name="Add New" value="Status" onclick="javascript:open_popup('manage_status');" />
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
                <th class="topmenu" align="center" valign="middle" data-col="dispute_type">Type of Dispute</th>
                <th class="topmenu" align="center" valign="middle" data-col="msteam_folder">MSTEAM Folder</th>
                <th class="topmenu" align="center" valign="middle" data-col="where_are_at">Where are at</th>
                <th class="topmenu" align="center" valign="middle" data-col="status">Status</th>
                <th class="topmenu" align="center" valign="middle" data-col="hide">Hide</th>
                <th class="topmenu" align="center" valign="middle" data-col="action">Action</th>
            </tr>
        </thead>
        <tbody>
            {{ foreach from=$list key="key" item="item" }}
            <tr bgcolor="{{ cycle values="#D3E8D6,WHITE" advance=true }}">
                <td data-col="sn">{{ counter }}</td>
                <td data-col="project">
                    <a href="{{ $item.link }}" target="_blank">{{ $projectArr[$item.ldd_bsn_id] }}</a>
                </td>
                <td data-col="client">
                    {{ $clientArr[$item.ldd_bsn_id] }}
                </td>
                <td data-col="dispute_type">
                    <select name="{{$TABLE}}[ldd_type_id]" onchange="updateRecord('{{ $item.$ID }}', 'ldd_type_id', this.value)">
						<option value="0">Please Select</option>
                        {{ foreach from=$typedata key="key1" item="item1" }}
                        <option value="{{ $item1.lddt_id }}" {{if $item.ldd_type_id eq $item1.lddt_id}} selected="selected" {{/if}}>{{ $item1.lddt_option }}</option>
                        {{ /foreach }}
					</select>
                </td>
                <td data-col="msteam_folder">
                    {{ if $item.ldd_msteam_folder_link }}
					<a href="{{ $item.ldd_msteam_folder_link }}" target="_blank">Link</a>
					{{ /if }}
                </td>
                <td data-col="where_are_at">
                    <a href="{{$BASE_URL}}{{ $BASEFOLDER }}.notes/{{ $ID }}/{{$item.$ID}}" class="various">Notes</a>
                </td>
                <td data-col="status">
                    <select name="{{$TABLE}}[ldd_status_id]" onchange="updateRecord('{{ $item.$ID }}', 'ldd_status_id', this.value)">
						<option value="0">Please Select</option>
                        {{ foreach from=$statusdata key="key2" item="item2" }}
                        <option value="{{ $item2.ldds_id }}" {{if $item.ldd_status_id eq $item2.ldds_id}} selected="selected" {{/if}}>{{ $item2.ldds_option }}</option>
                        {{ /foreach }}
					</select>
                </td>
                <td data-col="hide">
                    <label class="switch" for="ldd_hide{{ $item.$ID }}">
						<input id="ldd_hide{{ $item.$ID }}" class="switch-input" {{ if $item.ldd_hide == 1 }}checked{{ /if }} onchange="displayToggle('{{ $item.$ID }}', 'ldd_hide', this)" type="checkbox" />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
                </td>
                <td data-col="action">
                    <a href="{{$BASE_URL}}{{$XFA.add_new}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png" alt="" /></a>
					<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png" alt="" /></a>
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
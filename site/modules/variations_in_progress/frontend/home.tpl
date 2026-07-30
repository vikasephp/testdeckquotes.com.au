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
        <div>
            <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:open_popup('manage_procedure');" />
        </div>
    </div>
    <div style="float:right; text-align:right;">
    </div>
</form>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle">S.N.</th>
                <th class="topmenu" align="center" valign="middle">Customer Name and Address</th>
                <th class="topmenu" align="center" valign="middle">Customer Contact Details</th>
                <th class="topmenu" align="center" valign="middle">Variation ID</th>
                <th class="topmenu" align="center" valign="middle">Person Responsible</th>
                <th class="topmenu" align="center" valign="middle">Active/Inactive</th>
                <th class="topmenu" align="center" valign="middle">Where We Are At Now</th>
                <th class="topmenu" align="center" valign="middle">Status</th>
                <th class="topmenu" align="center" valign="middle">Date Uploaded</th>
                <th class="topmenu" align="center" valign="middle">Notes</th>
                <th class="topmenu" align="center" valign="middle">Documents Links</th>
                <th class="topmenu" align="center" valign="middle">Inclusions Calculator</th>
            </tr>
        </thead>
        <tbody>
            {{ foreach from=$list key="key" item="item" }}
            <tr bgcolor='{{ cycle values=" #D3E8D6,WHITE" advance=true }}' id="row_{{ $item.$ID }}">
                <td data-col="sn">{{ counter }}</td>
				<td bsn_id="{{$item.va_bsn_id}}">
					{{$item.client_name}} <br/>
					<a href="{{$item.link}}" target="_blank">{{ $item.project_name }}</a>
				</td>
				<td>{{$item.contact_detail}}</td>
                <td>
					{{$item.va_id}}
					{{if $item.va_word}}
					<br/>Word: 
					<a href="{{$BASE_URL}}business.download_content_vd?file_name={{$item.va_word}}&module_name=business.home" title="{{$item.va_word}}" class="action_small" target="_blank">Link</a>
					{{/if}}
					
					{{if $item.va_pdf}}
					<br/>PDF: 
					<a href="{{$BASE_URL}}business.download_content_vd?file_name={{$item.va_pdf}}&module_name=business.home"
						title="{{$item.va_pdf}}" class="action_small"
						target="_blank">Link</a>
					{{/if}}
				</td>
				<td data-col="person_respon">
					<input type="text" name="vip_price_guarantee[{{$item.va_id}}]" placeholder="Enter Person Responsible" value="{{$item.va_person_resp}}" oninput="update_person_respon({{$item.va_id}}, this.value)">
					<script>
						function update_person_respon(id, value) {
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_person_respon/va_id/" + id + "/value/" + value,
								success: function (result) {
								}
							});
						}
					</script>
				</td>
				<td>
					<form name="recmet3" method="post" action="">
						<input type="hidden" name="data[{{$item.va_id}}]" value="0">
						<label class="switch">
							<input class="switch-input" type="checkbox" name="data[{{$item.va_id}}]" value="1" onchange="update_variation_in_progress({{$item.va_id}}, this.checked)" {{if $item.va_variation_in_progress eq 1 }} checked="checked" {{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
					<script>
						function update_variation_in_progress(id, value) {
							var val = 0;
							if (value == true) { val = 1; }
							if (value == false) { val = 0; }
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_variation_in_progress/va_id/" + id + "/value/" + value,
								success: function (result) {
								}
							});
						}
					</script>
				</td>
				<td data-col="where_we_now">
					<textarea rows="5" name="where_we_now[{{$item.va_id}}]" placeholder="Enter Where We Are At Now" oninput="update_where_we_now({{$item.va_id}}, this.value)">{{$item.va_where_we_now}}</textarea>
					<script>
						function update_where_we_now(id, value) {
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_where_we_now/va_id/" + id + "/value/" + value,
								success: function (result) {
								}
							});
						}
					</script>
				</td>
				<td data-col="status-{{$item.va_status}}">
					<select name="status[{{$item.va_id}}]" onChange="update_variation_status({{$item.va_id}}, this.value)" />
						<option value="0" {{if $item.va_status eq 0 or $item.va_status == '' or $item.va_status == null}}selected="selected"{{/if}}>Please Select</option>
						<option value="Signed" {{if $item.va_status == 'Signed' }}selected="selected"{{/if}}>Signed</option>
						<option value="Draft" {{if $item.va_status == 'Draft' }}selected="selected"{{/if}}>Draft</option>
						<option value="Sent" {{if $item.va_status == 'Sent' }}selected="selected"{{/if}}>Sent</option>
						<option value="Work Scheduled" {{if $item.va_status == 'Work Scheduled' }}selected="selected"{{/if}}>Work Scheduled</option>
						<option value="Work Completed" {{if $item.va_status == 'Work Completed' }}selected="selected"{{/if}}>Work Completed</option>
						<option value="Rejected" {{if $item.va_status == 'Rejected' }}selected="selected"{{/if}}>Rejected</option>
					</select>
					<script>
						function update_variation_status(id, value) {
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_variation_status/va_id/" + id + "/value/" + value,
								success: function (result) {
								}
							});
						}
					</script>
				</td>
				<td>{{$item.va_date|date_format:"%d-%m-%Y"}}</td>
				<td>
					{{$item.note}}<br/>{{$item.note_date|date_format:"%d-%m-%Y"}}
					<a href="{{$BASE_URL}}{{$BASEFOLDER}}.view_notes/vipn_va_id/{{$item.va_id}}" class="various">Notes</a>
				</td>
				<td data-col="documents_links">
					{{if $item.file_491}}
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$item.file_491}}&module_name=business.home"
							class="action_checklist" title="{{$item.file_491}}"
							target="_blank" style="display: block;">{{$item.doc_name_491|truncate:"70"}}</a>
					{{/if}}
					
					{{if $item.file_65}}
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$item.file_65}}&module_name=business.home"
							class="action_checklist" title="{{$item.file_65}}"
							target="_blank" style="display: block;">{{$item.doc_name_65|truncate:"70"}}</a>
					{{/if}}
					
					{{if $item.file_440}}
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$item.file_440}}&module_name=business.home"
							class="action_checklist" title="{{$item.file_440}}"
							target="_blank" style="display: block;">{{$item.doc_name_440|truncate:"70"}}</a>
					{{/if}}
					
					{{if $item.file_142}}
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$item.file_142}}&module_name=business.home"
							class="action_checklist" title="{{$item.file_142}}"
							target="_blank" style="display: block;">{{$item.doc_name_142|truncate:"70"}}</a>
					{{/if}}
					
					{{if $item.file_615}}
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$item.file_615}}&module_name=business.home"
							class="action_checklist" title="{{$item.file_615}}"
							target="_blank" style="display: block;">{{$item.doc_name_615|truncate:"70"}}</a>
					{{/if}}
					
					{{if $item.file_527}}
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$item.file_527}}&module_name=business.home"
							class="action_checklist" title="{{$item.file_527}}"
							target="_blank" style="display: block;">{{$item.doc_name_527|truncate:"70"}}</a>
					{{/if}}
				</td>
				
				<td>
					{{if $item.calculator_link}}
					<a href="{{$item.calculator_link}}" target="_blank">Link</a>
					{{/if}}
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
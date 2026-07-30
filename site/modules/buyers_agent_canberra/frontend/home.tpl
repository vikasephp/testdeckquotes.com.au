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
		else if (type == 'add_detail') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.add_detail" + "/random/" + Math.random();
		}
		else if (type == 'manage_status') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_status" + "/random/" + Math.random();
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
			&nbsp;&nbsp;
			<input type="button" name="status_admin" value="Status" onclick="javascript:open_popup('manage_status');" />
			&nbsp;&nbsp;
			<input type="submit" name="clear" value="Clear Filter">
        </div>
    </div>
    <div style="float:right; text-align:right;">
		<input type="submit" name="all" value="Show All"> &nbsp;&nbsp;
		<input type="submit" name="hidden" value="Show Hidden"> &nbsp;&nbsp;
		<input type="button" name="add_detail" value="Add New" onclick="javascript:open_popup('add_detail');" />
    </div>
</form>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle">Record</th>
                <th class="topmenu" align="center" valign="middle">Link</th>
                <th class="topmenu" align="center" valign="middle">Address</th>
                <th class="topmenu" align="center" valign="middle">Price</th>
                <th class="topmenu" align="center" valign="middle">Rent</th>
                <th class="topmenu" align="center" valign="middle">Design</th>
                <th class="topmenu" align="center" valign="middle">Rent</th>
                <th class="topmenu" align="center" valign="middle">Buyers Agent Link</th>
                <th class="topmenu" align="center" valign="middle">Status</th>
                <th class="topmenu" align="center" valign="middle">Hide</th>
                <th class="topmenu" align="center" valign="middle">Action</th>
            </tr>
        </thead>
        <tbody>
			{{assign var="bac_count" value=1}}
            {{ foreach from=$list key="key" item="item" }}
            <tr bgcolor='{{ cycle values=" #D3E8D6,WHITE" advance=true }}' id="row_{{ $item.$ID }}">
                <td data-col="sn">{{$bac_count}}</td>
				<td>
					{{if $item.bac_link}}
						<a href="{{$item.bac_link}}" target="_blank">Link</a>
					{{/if}}
				</td>
				<td>{{$item.bac_address}}</td>
				<td>{{$item.bac_price}}</td>
				<td>{{$item.bac_rent}}</td>
				<td>
					{{if $item.bac_design}}
					<a href="https://www.canberragrannyflatbuilders.com.au/design-pages/design-{{$item.bac_design}}" target="_blank">Link</a>
					{{/if}}
				</td>
				<td>{{$item.bac_rent2}}</td>
				<td>
					{{if $item.bac_agent_link}}
						<a href="{{$item.bac_agent_link}}" target="_blank">Link</a>
					{{/if}}
				</td>
				<td>
					<select name="status[{{$item.bac_id}}]" onChange="update_status({{$item.bac_id}}, this.value)" />
						<option value="-1">Please Select Status</option>
						{{foreach from=$status key="key_status" item="item_status"}}
						<option value="{{$item_status.bacs_id}}" {{if $item.bac_status eq $item_status.bacs_id}}selected="selected"{{/if}}>{{$item_status.bacs_option}}</option>
						{{/foreach}}
					</select>
					<div id="status_{{$item.bac_id}}">
						{{if $item.bac_status != '' and $item.bac_status neq -1 and $item.bac_status neq 0 }}
							<br/>{{$item.bac_status_updated_by}}
							<br/>{{$item.bac_status_updated_at}}
						{{/if}}
					</div>
					<script>
						function update_status(id, value) {
							var status = '#status_' + id;
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_status/bac_id/" + id + "/value/" + value,
								success: function (result) {
									$(status).html(result);
								}
							});
						}
					</script>
				</td>
				<td>
					<form name="recmet3" method="post" action="">
						<input type="hidden" name="hide[{{$item.bac_id}}]" value="0">
						<label class="switch">
							<input class="switch-input" type="checkbox" name="hide[{{$item.bac_id}}]" value="1" onclick="this.form.submit();" {{if $item.bac_hide eq 1 }} checked="checked" {{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
				</td>
				<td data-col="action">
                    <a href="{{$BASE_URL}}{{$BASEFOLDER}}.add_detail/bac_id/{{$item.bac_id}}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png" alt=""></a>
                    <a href="{{$BASE_URL}}{{$BASEFOLDER}}.delete_detail/bac_id/{{$item.bac_id}}" onclick="javascript:if(!confirm('Are you sure want to delete this detail with Record Number {{$bac_count}}?')) return false;" title="Delete"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png" alt=""></a>
                </td>
            </tr>
			{{assign var="bac_count" value=$bac_count+1}}
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
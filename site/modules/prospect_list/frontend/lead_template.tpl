<br/>
<div style="float:left; text-align:left;">
    <input type="button" name="Lead Procedure" value="Add Standard Procedure" onclick="javascript:open_url('lead_procedure');">
</div>
<div class="" style="float:right;display:none;">
	<input type="button" name="Add New Invoices" value="Add New Invoices" onclick="javascript:open_url('add_invoices_detail');" />
</div>
<div class="table-heading-content" style="display:none;">
	<div class="right">
		<input type="button" name="Add New Invoices" value="Add New Invoices" onclick="javascript:open_url('add_invoices_detail');" />
	</div>
</div>
<table id="list-table">
	<thead>
		<tr>
			<th class="topmenu" align="center" valign="middle">Sr. No.</th>
			<th class="topmenu" align="center" valign="middle">Document Sequence</th>
			<th class="topmenu" align="center" valign="middle">Document Link</th>
			<th class="topmenu" align="center" valign="middle">Document Description</th>
			<th class="topmenu" align="center" valign="middle">Person Responsible</th>
			<th class="topmenu" align="center" valign="middle">Complete</th>
		</tr>
	</thead>
	<tbody>
		{{if $lead}}
		{{assign var="inv_count" value=1}}
		{{foreach from=$lead key="key" item="item"}}
		<tr bgcolor='{{ cycle values=" #D3E8D6,WHITE" advance=true }}'>
			<td>{{$inv_count}}</td>
			<td>{{$item.lsp_doc_sequence}}</td>
			<td>
				{{if $item.lsp_doc_link}}
					<a href="{{$item.lsp_doc_link}}" target="_blank">Link</a>
				{{/if}}
			</td>
			<td>{{$item.lsp_description}}</td>
			<td>{{$item.lsp_person_responsible}}</td>
			
			<td>
				{{assign var="completed" value=0}}
				{{assign var="user" value=""}}
				{{assign var="dt" value=""}}

				{{foreach from=$lead_pl_complete item=item_lc}}
					{{if $item_lc.pltc_sp_id eq $item.lsp_id}}
						{{assign var="completed" value=$item_lc.pltc_completed}}
						{{assign var="user" value=$item_lc.pltc_completed_by}}
						{{assign var="dt" value=$item_lc.pltc_completed_date}}
					{{/if}}
				{{/foreach}}
				<form name="recmet3" method="post" action="">
					<input type="hidden" name="pl_complete[{{$item.lsp_id}}]" value="0">
					<input type="hidden" name="pl_complete[pltc_key]" value="lead">
					<input type="hidden" name="pl_complete[bsn_id]" value="{{$bsn_id}}">
					<label class="switch">
						<input class="switch-input" type="checkbox" name="pl_complete[{{$item.lsp_id}}]" value="1" onclick="this.form.submit();" {{if $completed eq 1}} checked="checked" {{/if}} />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
				{{if $completed eq 1}}
					{{$user}} - {{$dt|date_format:"%d-%m-%Y"}}
				{{/if}}
			</td>
		</tr>
		{{assign var="inv_count" value=$inv_count+1}}
		{{/foreach}}
		{{else}}
		<tr>
			<td colspan="6" style="text-align: center">No Data Available</td>
		</tr>
		{{/if}}
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
<div style="float:left; text-align:left;">
    <input type="button" name="Invoice Type" value="Invoice Type" onclick="javascript:open_url('invoice_type');">
</div>
<div class="" style="float:right;">
	<input type="button" name="Add New" value="Add New" onclick="javascript:open_url('detail_invoice');" />
</div>
<table id="list-table">
	<thead>
		<tr>
			<th class="topmenu" align="center" valign="middle">Sr. No.</th>
			<th class="topmenu" align="center" valign="middle">Invoice Number</th>
			<th class="topmenu" align="center" valign="middle">Invoice</th>
			<th class="topmenu" align="center" valign="middle">Invoice Amount</th>
			<th class="topmenu" align="center" valign="middle">Invoice Created Date</th>
			<th class="topmenu" align="center" valign="middle">Invoice Sent</th>
			<th class="topmenu" align="center" valign="middle">Invoice Paid</th>
			<th class="topmenu" align="center" valign="middle">Invoice Due</th>
			<th class="topmenu" align="center" valign="middle">Invoice Type</th>
			<th class="topmenu" align="center" valign="middle">Notes</th>
			<th class="topmenu" align="center" valign="middle">Action</th>
		</tr>
	</thead>
	<tbody>
		{{if $list}}
		{{foreach from=$list key="key" item="item"}}
		<tr bgcolor='{{ cycle values=" #D3E8D6,WHITE" advance=true }}'>
			<td>{{counter}}</td>
			<td>{{$item.psri_numb}}</td>
			<td>
				{{if $item.psri_link}}
					<a href="{{$item.psri_link}}" target="_blank">Link</a>
				{{/if}}
			</td>
			<td>
				<!--{{if $item.psri_invoice_amount|strlen}}

					{{assign var="price" value=$item.psri_invoice_amount|replace:'$':''}}

					{{if $price|regex_replace:'/^[0-9]+$/':'' == ''}}
						{{assign var="formatted" value=$price|number_format:0:'.':','}}
					{{else}}
						{{assign var="formatted" value=$price|number_format:2:'.':','}}
					{{/if}}

					${{$formatted}}

				{{/if}}-->
				{{if $item.psri_invoice_amount|strlen}}
					{{$item.psri_invoice_amount}}
				{{/if}}

			</td>
			<td>{{$item.psri_createddate}}</td>
			<td>
				<form name="recmet3" method="post" action="">
					<input type="hidden" name="inv_sent[{{$item.psri_id}}]" value="0">
					<label class="switch">
						<input class="switch-input" type="checkbox" name="inv_sent[{{$item.psri_id}}]" value="1" onclick="this.form.submit();" {{if $item.psri_sent eq 1 }} checked="checked" {{/if}} />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
				{{if $item.psri_sent eq 1}}
					{{$item.psri_sent_user}}<br/>{{$item.psri_sent_date}}
				{{/if}}
			</td>
			<td>
				<form name="recmet3" method="post" action="">
					<input type="hidden" name="inv_paid[{{$item.psri_id}}]" value="0">
					<label class="switch">
						<input class="switch-input" type="checkbox" name="inv_paid[{{$item.psri_id}}]" value="1" onclick="this.form.submit();" {{if $item.psri_paid eq 1 }} checked="checked" {{/if}} />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
				{{if $item.psri_paid eq 1}}
					{{$item.psri_paid_user}}<br/>{{$item.psri_paid_date}}
				{{/if}}
			</td>
			<td>{{$item.psri_duedate}}</td>
			<td>
				<select name="properties_sale_reports_invoices[psri_invoice_type]" onchange="updateInvoice('{{ $item.psri_id }}', 'psri_invoice_type', this.value)">
					<option value="-1">Please Select</option>
					{{ assign var=option_col value=$ATTRIBUTES.invoice_type.option_col }}
					{{ assign var=option_id value=$ATTRIBUTES.invoice_type.id }}
					{{ foreach from=$data_psri_invType key="index" item="row" }}
						<option value="{{ $row.$option_id }}" {{ if $row.$option_id eq $item.psri_invoice_type }} selected="selected" {{/if}}>{{ $row.$option_col }}</option>
					{{ /foreach }}
				</select>
			</td>
			<td>{{$item.psri_notes}}</td>
			<td> 
				<a href="{{$BASE_URL}}properties_sale_reports.add_detail_invoice/bsn_id/{{$bsn_id}}/psri_id/{{$item.psri_id}}" class="various" title="Edit"> 
				<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
				<a href="{{$BASE_URL}}properties_sale_reports.delete_detail_invoice/bsn_id/{{$bsn_id}}/psri_id/{{$item.psri_id}}" onclick="javascript:if(!confirm('Are you sure want to delete this Invoice?')) return false;" title="Delete"><img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
			</td>
		</tr>
		{{/foreach}}
		{{else}}
		<tr>
			<td colspan="9" style="text-align: center">No Data Available</td>
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
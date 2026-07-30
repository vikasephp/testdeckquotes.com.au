<div style="float:left; text-align:left;">
</div>
<div class="" style="float:right;">
	<input type="button" name="Exchange Task List" value="Add Detail" onclick="javascript:open_url('under_offer_detail');" />
</div>
<table id="list-table">
	<thead>
		<tr>
			<th class="topmenu" align="center" valign="middle">Sr. No.</th>
			<th class="topmenu" align="center" valign="middle">Buyer Name</th>
			<th class="topmenu" align="center" valign="middle">Offer Type</th>
			<th class="topmenu" align="center" valign="middle">Price</th>
			<th class="topmenu" align="center" valign="middle">Date</th>
			<th class="topmenu" align="center" valign="middle">Notes</th>
			<th class="topmenu" align="center" valign="middle">Offer Sent</th>
			<th class="topmenu" align="center" valign="middle">Offer Date</th>
			<th class="topmenu" align="center" valign="middle">Offer Letter Link</th>
			<th class="topmenu" align="center" valign="middle">Sales Advice Link</th>
			<th class="topmenu" align="center" valign="middle">Action</th>
		</tr>
	</thead>
	<tbody>
		{{if $data_underoffer_table}}
		{{assign var="uo" value=1}}
		{{foreach from=$data_underoffer_table key="key" item="item"}}
		<tr bgcolor='{{ cycle values=" #D3E8D6,WHITE" advance=true }}'>
			<td>{{$uo}}</td>
			<td>{{$item.psruo_buyer_name}}</td>
			<td>{{$item.psruo_offer_type}}</td>
			<td>{{$item.psruo_price}}</td>
			<td>{{$item.psruo_date}}</td>
			<td>{{$item.psruo_notes}}</td>
			<td>
				<form name="recmet3" method="post" action="">
					<input type="hidden" name="psruo_offer_sent[psruo_id]" value="{{$item.psruo_id}}">
					<label class="switch">
						<input class="switch-input" type="checkbox" name="psruo_offer_sent[psruo_offer_sent]" value="1" onclick="this.form.submit();" {{if $item.psruo_offer_sent eq 1}} checked="checked" {{/if}} />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
				{{if $item.psruo_offer_sent eq 1}}
					{{$item.psruo_offer_sent_user}} <br/> {{$item.psruo_offer_sent_date|date_format:"%d-%m-%Y"}}
				{{/if}}
			</td>
			<td>{{$item.psruo_offer_date}}</td>
			<td>
				{{if $item.psruo_offer_letter_link}}
					<a href="{{$item.psruo_offer_letter_link}}" target="_blank">Link</a>
				{{/if}}
			</td>
			<td>
				{{if $item.psruo_sales_advice_link}}
					<a href="{{$item.psruo_sales_advice_link}}" target="_blank">Link</a>
				{{/if}}
			</td>
			<td> 
				<a href="{{$BASE_URL}}properties_sale_reports.under_offer_detail/bsn_id/{{$bsn_id}}/psruo_id/{{$item.psruo_id}}" class="various" title="Edit"> 
				<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
				<a href="{{$BASE_URL}}properties_sale_reports.delete_under_offer_detail/bsn_id/{{$bsn_id}}/psruo_id/{{$item.psruo_id}}" onclick="javascript:if(!confirm('Are you sure want to delete this Offer?')) return false;" title="Delete"><img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
			</td>
		</tr>
		{{assign var="uo" value=$uo+1}}
		{{/foreach}}
		{{else}}
		<tr>
			<td colspan="11" style="text-align: center">No Data Available</td>
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
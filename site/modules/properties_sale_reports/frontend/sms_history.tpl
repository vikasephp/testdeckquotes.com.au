<style>
td {
	color: #000;
}
</style>

<div style="float:left; text-align:left;">

</div>
<div class="" style="float:right;">

</div>
<table id="list-table">
	<thead>
		<tr>
			<th class="topmenu" align="center" valign="middle">Sr. No.</th>
			<th class="topmenu" align="center" valign="middle">Date & Time</th>
			<th class="topmenu" align="center" valign="middle">Direction</th>
			<th class="topmenu" align="center" valign="middle">Message</th>
			<th class="topmenu" align="center" valign="middle">Sent By</th>
			<th class="topmenu" align="center" valign="middle">Reply</th>
			<th class="topmenu" align="center" valign="middle">Open</th>
		</tr>
	</thead>
	<tbody>
		{{if $data_sms_history}}
		{{assign var="sms_count" value=1}}
		{{foreach from=$data_sms_history key="key" item="item"}}
		<tr bgcolor='{{ cycle values=" #D3E8D6,WHITE" advance=true }}' id="status_{{$item.psre_id}}" style="background-color: {{$bgcolor}}">
			<td>{{$sms_count}}</td>
			<td>{{$item.psresh_sms_sent_on|date_format:"%d/%m/%Y %I:%M%P"}}</td>
			<td>Outgoing</td>
			<td>{{if $item.psrest_sms_template gt 0}}{{$smsTemp[$item.psrest_sms_template]}}{{/if}}</td>
			<td>{{$item.psresh_sms_sent_by}}</td>
			<td>TBD</td>
			<td>
				<a href="{{$BASE_URL}}{{$BASEFOLDER}}.view_sms/psresh_id/{{$item.psresh_id}}" class="various">View</a>
			</td>
		</tr>
		{{assign var="sms_count" value=$sms_count+1}}
		{{/foreach}}
		{{else}}
		<tr>
			<td colspan="7" style="text-align: center">No Data Available</td>
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
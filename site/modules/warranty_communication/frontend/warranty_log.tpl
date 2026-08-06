<table id="list-table">
	<thead>
		<tr>
            <th class="topmenu" align="center" valign="middle">S.N.</th>
            <th class="topmenu" align="center" valign="middle">Email Subject</th>
            <th class="topmenu" align="center" valign="middle">Email Content</th>
            <th class="topmenu" align="center" valign="middle">Customer reply</th>
            <th class="topmenu" align="center" valign="middle">Email Date Sent</th>
            <th class="topmenu" align="center" valign="middle">Reply Receive Date</th>
		</tr>
	</thead>
	<tbody>
        {{if count($list) > 0}}
            {{foreach from=$list key=index item=row}}
                <tr>
                    <td>{{$row.sn}}</td>
                </tr>
            {{/foreach}}
        {{else}}
            <tr>
                <th colspan="6">No Record</th>
            </tr>
        {{/if}}
    </tbody>
</table>
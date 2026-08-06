<table id="list-table">
	<thead>
		<tr>
            <th class="topmenu" align="center" valign="middle">S.N.</th>
            <th class="topmenu" align="center" valign="middle">Project</th>
            <th class="topmenu" align="center" valign="middle">Website Page</th>
            <th class="topmenu" align="center" valign="middle">Action</th>
            <th class="topmenu" align="center" valign="middle">Enquiries</th>
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
                <th colspan="5">No Record</th>
            </tr>
        {{/if}}
    </tbody>
</table>
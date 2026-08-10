<table id="list-table" style="width: 100%; margin: auto; margin-top: 20px;">
	<thead>
		<tr>
			<th class="topmenu" align="center" valign="middle">ID</th>
			<th class="topmenu" align="center" valign="middle">Communication type</th>
			<th class="topmenu" align="center" valign="middle">Date & time sent</th>
			<th class="topmenu" align="center" valign="middle">Client name</th>
			<th class="topmenu" align="center" valign="middle">Client contact</th>
			<th class="topmenu" align="center" valign="middle">Project Name</th>
			<th class="topmenu" align="center" valign="middle">Delivery status</th>
			<th class="topmenu" align="center" valign="middle">Message content</th>
		</tr>
	</thead>
	<tbody>
		{{if count($list) > 0}}
			{{foreach from=$list key=index item=row}}
				<tr>
					<td>{{$row.email_id}}</td>
					<td>{{$row.communication_type}}</td>
					<td>{{$row.sent_datetime}}</td>
					<td>{{$row.client_name}}</td>
					<td>{{$row.client_contact}}</td>
					<td>{{$row.project_name}}</td>
					<td>{{$row.delivery_status}}</td>
					<td>{{$row.message_content}}</td>
				</tr>
			{{/foreach}}
		{{else}}
			<tr>
				<th colspan="9">No Record</th>
			</tr>
		{{/if}}
	</tbody>
</table>
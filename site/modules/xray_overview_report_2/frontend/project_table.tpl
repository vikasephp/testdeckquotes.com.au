<table id="list-table">
	<thead>
		<tr>
			{{assign var=i value=0}}
            {{foreach from=$thead key=text item=row}}
                <th class="topmenu {{if $i < 3}}frozen-column{{/if}}" align="center" valign="middle" style="{{$row.style ?? ''}}">{{$row.text}}</th>
			{{assign var=i value=$i+1}}
            {{/foreach}}
		</tr>
	</thead>
	<tbody>
        {{if count($list) > 0}}
            {{foreach from=$list key=index item=row}}
                <tr>
                    <td class="frozen-column">{{$row.sn}}</td>
                    <td class="frozen-column" style="{{$thead.bsn_name.style ?? ''}}">
                        <a href="/business.detail/bsn_id/{{$row.bsn_id}}" target="_blank">{{$row.bsn_name}}</a>
                    </td>
					<td class="frozen-column" style="{{$thead.project_status.style ?? ''}}">{{$row.project_status}}</td>
                    <td style="{{$thead.proposal_delivery_date.style ?? ''}}">{{$row.proposal_delivery_date}}</td>
                    <td style="{{$thead.cda_date.style ?? ''}}">{{$row.cda_date}}</td>
                    <td style="{{$thead.cda_value.style ?? ''}}">{{$row.cda_value}}</td>
                    <td style="{{$thead.hia_signup_date.style ?? ''}}">{{$row.hia_signup_date}}</td>
                    <td style="{{$thead.hia_value.style ?? ''}}">{{$row.hia_value}}</td>
					<td style="{{$thead.inclusions_date.style ?? ''}}">{{$row.inclusions_date}}</td>
                    <td style="{{$thead.inclusions_value.style ?? ''}}">{{$row.inclusions_value}}</td>
                    <td style="{{$thead.total_project_value.style ?? ''}}">{{$row.total_project_value}}</td>
					<td style="{{$thead.receipt_of_finalised_stamped_plans_due_date.style ?? ''}}">
						{{$row.receipt_of_finalised_stamped_plans_due_date}}
					</td>
					<td style="{{$thead.receipt_of_finalised_stamped_plans_value.style ?? ''}}">
						{{$row.receipt_of_finalised_stamped_plans_value}}
					</td>
                    <td style="{{$thead.deposit_date.style ?? ''}}">{{$row.deposit_date}}</td>
                    <td style="{{$thead.deposit_value.style ?? ''}}{{if $row.deposit_invoiced == 1}} background-color: #0C6;{{/if}}">{{$row.deposit_value}}</td>
					<td style="{{$thead.deposit_paid.style ?? ''}}">{{$row.deposit_paid}}</td>
                    <td style="{{$thead.planning_submitted_date.style ?? ''}}">{{$row.planning_submitted_date}}</td>
                    <td style="{{$thead.planning_submitted_value.style ?? ''}}{{if $row.planning_invoiced == 1}} background-color: #0C6;{{/if}}">{{$row.planning_submitted_value}}</td>
					<td style="{{$thead.planning_submitted_paid.style ?? ''}}">{{$row.planning_submitted_paid}}</td>
                    <td style="{{$thead.onsite_date.style ?? ''}}">{{$row.onsite_date}}</td>
                    <td style="{{$thead.floor_system_complete_date.style ?? ''}}">{{$row.floor_system_complete_date}}</td>
                    <td style="{{$thead.floor_system_complete_value.style ?? ''}}{{if $row.floor_system_invoiced == 1}} background-color: #0C6;{{/if}}">{{$row.floor_system_complete_value}}</td>
					<td style="{{$thead.floor_system_complete_paid.style ?? ''}}">{{$row.floor_system_complete_paid}}</td>
                    <td style="{{$thead.wall_roof_frames_complete_date.style ?? ''}}">{{$row.wall_roof_frames_complete_date}}</td>
                    <td style="{{$thead.wall_roof_frames_complete_value.style ?? ''}}{{if $row.wall_frames_invoiced == 1}} background-color: #0C6;{{/if}}">{{$row.wall_roof_frames_complete_value}}</td>
					<td style="{{$thead.wall_roof_frames_complete_paid.style ?? ''}}">{{$row.wall_roof_frames_complete_paid}}</td>
                    <td style="{{$thead.close_up_complete_date.style ?? ''}}">{{$row.close_up_complete_date}}</td>
                    <td style="{{$thead.close_up_complete_value.style ?? ''}}{{if $row.close_up_invoiced == 1}} background-color: #0C6;{{/if}}">{{$row.close_up_complete_value}}</td>
					<td style="{{$thead.close_up_complete_paid.style ?? ''}}">{{$row.close_up_complete_paid}}</td>
                    <td style="{{$thead.fixings_complete_date.style ?? ''}}">{{$row.fixings_complete_date}}</td>
                    <td style="{{$thead.fixings_complete_value.style ?? ''}}{{if $row.fixing_invoiced == 1}} background-color: #0C6;{{/if}}">{{$row.fixings_complete_value}}</td>
					<td style="{{$thead.fixings_complete_paid.style ?? ''}}">{{$row.fixings_complete_paid}}</td>
                    <td style="{{$thead.painting_complete_date.style ?? ''}}">{{$row.painting_complete_date}}</td>
                    <td style="{{$thead.painting_complete_value.style ?? ''}}{{if $row.painting_invoiced == 1}} background-color: #0C6;{{/if}}">{{$row.painting_complete_value}}</td>
					<td style="{{$thead.painting_complete_paid.style ?? ''}}">{{$row.painting_complete_paid}}</td>
                    <td style="{{$thead.project_complete_date.style ?? ''}}">{{$row.project_complete_date}}</td>
                    <td style="{{$thead.project_complete_value.style ?? ''}}{{if $row.completion_invoiced == 1}} background-color: #0C6;{{/if}}">{{$row.project_complete_value}}</td>
					<td style="{{$thead.project_complete_paid.style ?? ''}}">{{$row.project_complete_paid}}</td>
                </tr>
            {{/foreach}}
        {{else}}
            <tr>
                <th colspan="{{$total_th}}">No Record Available</th>
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
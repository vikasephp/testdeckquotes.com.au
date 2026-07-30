<span class="table-title">Preparation Documents</span>
<table id="list-table">
	<thead>
		<tr>
			<th class="topmenu" align="center" valign="middle">Document</th>
			<th class="topmenu" align="center" valign="middle">Link</th>
			<th class="topmenu" align="center" valign="middle">Uploaded</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>PAR Report</td>
			<td>{{if $par_live_link}}<a href="{{$par_live_link}}" target="_blank">MSTeams Link</a>{{/if}}</td>
			<td>
				{{if $par_live_link}}
				{{$par_live_link_username}}<br/>{{$par_live_link_date}}
				{{/if}}
			</td>
		</tr>
		<tr>
			<td>FAQ Report</td>
			<td>{{if $faq_link}}<a href="{{$faq_link}}" target="_blank">MSTeams Link</a>{{/if}}</td>
			<td>
				{{if $faq_link}}
				{{$faq_link_username}}<br/>{{$faq_link_date}}
				{{/if}}
			</td>
		</tr>
		<tr>
			<td>Agency Agreement</td>
			<td>{{if $agency_agreement_link}}<a href="{{$agency_agreement_link}}" target="_blank">MSTeams Link</a>{{/if}}</td>
			<td>
				{{if $agency_agreement_link}}
				{{$agency_agreement_link_username}}<br/>{{$agency_agreement_link_date}}
				{{/if}}
			</td>
		</tr>
	</tbody>									
</table>
<span class="table-title">Public Document</span>
&nbsp;&nbsp;&nbsp;<input type="button" name="Add Public Doc" value="Additional Public Documents" title="Add/View Public Documents" onclick="javascript:open_url('public_doc_detail');"/>
<table id="list-table">
	<thead>
		<tr>
			<th class="topmenu" align="center" valign="middle">Document</th>
			<th class="topmenu" align="center" valign="middle">Link</th>
			<th class="topmenu" align="center" valign="middle">Uploaded</th>
			<th class="topmenu" align="center" valign="middle">Agent Box</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Auction Agreement</td>
			<td>{{if $contract_for_sale_link}}<a href="{{$contract_for_sale_link}}" target="_blank">MSTeams Link</a>{{/if}}</td>
			<td>
				{{if $contract_for_sale_link}}
				{{$contract_for_sale_link_username}}<br/>{{$contract_for_sale_link_date}}
				{{/if}}
			</td>
			<td>
				<form name="recmet3" method="post" action="">
					<label class="switch">
						<input class="switch-input" type="checkbox" name="report" />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
			</td>
		</tr>
		<tr>
			<td>Building and Compliance Report</td>
			<td>{{if $building_comp_link}}<a href="{{$building_comp_link}}" target="_blank">MSTeams Link</a>{{/if}}</td>
			<td>
				{{if $building_comp_link}}
				{{$building_comp_link_username}}<br/>{{$building_comp_link_date}}
				{{/if}}
			</td>
			<td>
				<form name="recmet3" method="post" action="">
					<label class="switch">
						<input class="switch-input" type="checkbox" name="report" />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
			</td>
		</tr>
		<tr>
			<td>Floor Plan</td>
			<td>{{if $floor_plan_link}}<a href="{{$floor_plan_link}}" target="_blank">MSTeams Link</a>{{/if}}</td>
			<td>
				{{if $floor_plan_link}}
				{{$floor_plan_link_username}}<br/>{{$floor_plan_link_date}}
				{{/if}}
			</td>
			<td>
				<form name="recmet3" method="post" action="">
					<label class="switch">
						<input class="switch-input" type="checkbox" name="report" />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
			</td>
		</tr>
		<tr>
			<td>Rental Appraisal Letter</td>
			<td>{{if $rental_valuation_link}}<a href="{{$rental_valuation_link}}" target="_blank">MSTeams Link</a>{{/if}}</td>
			<td>
				{{if $rental_valuation_link}}
				{{$rental_valuation_link_username}}<br/>{{$rental_valuation_link_date}}
				{{/if}}
			</td>
			<td>
				<form name="recmet3" method="post" action="">
					<label class="switch">
						<input class="switch-input" type="checkbox" name="report" />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
			</td>
		</tr>
		<tr>
			<td>Sales Appraisal Letter</td>
			<td>{{if $sales_valuation_link}}<a href="{{$sales_valuation_link}}" target="_blank">MSTeams Link</a>{{/if}}</td>
			<td>
				{{if $sales_valuation_link}}
				{{$sales_valuation_link_username}}<br/>{{$sales_valuation_link_date}}
				{{/if}}
			</td>
			<td>
				<form name="recmet3" method="post" action="">
					<label class="switch">
						<input class="switch-input" type="checkbox" name="report" />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
			</td>
		</tr>
		<tr>
			<td>Suburb Flyover Report</td>
			<td>{{if $suburb_flyover_link}}<a href="{{$suburb_flyover_link}}" target="_blank">MSTeams Link</a>{{/if}}</td>
			<td>
				{{if $suburb_flyover_link}}
				{{$suburb_flyover_link_username}}<br/>{{$suburb_flyover_link_date}}
				{{/if}}
			</td>
			<td>
				<form name="recmet3" method="post" action="">
					<label class="switch">
						<input class="switch-input" type="checkbox" name="report" />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
			</td>
		</tr>
		<tr>
			<td>AirDNA income report</td>
			<td>{{if $air_dna_link}}<a href="{{$air_dna_link}}" target="_blank">MSTeams Link</a>{{/if}}</td>
			<td>
				{{if $air_dna_link}}
				{{$air_dna_link_username}}<br/>{{$air_dna_link_date}}
				{{/if}}
			</td>
			<td>
				<form name="recmet3" method="post" action="">
					<label class="switch">
						<input class="switch-input" type="checkbox" name="report" />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
			</td>
		</tr>
		{{if $pd_data}}
		{{foreach from=$pd_data key="key" item="item"}}
		<tr>
			<td>{{$item.psrpd_doc_name}}</td>
			<td>
				{{if $item.psrpd_doc_link}}
				<a href="{{$item.psrpd_doc_link}}" target="_blank">MSTeams Link</a>
				{{/if}}
			</td>
			<td>
				{{$item.psrpd_updated_by}}
				<br/>{{$item.psrpd_updated_date}}
			</td>
			<td>
				<form name="recmet3" method="post" action="">
					<label class="switch">
						<input class="switch-input" type="checkbox" name="report" />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
			</td>
		</tr>
		{{/foreach}}
		{{/if}}
	</tbody>									
</table>
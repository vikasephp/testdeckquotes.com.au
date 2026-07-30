{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>

<script>
 function add_procedure()
{
	var viewurl = "{{$BASE_URL}}critical_numbers.view_procedure"+ "/random/" + Math.random();	

 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '99%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
        });
      });
}

</script>
<style>
#fancybox-wrap {z-index:9999999;} 
h2 {
	font-size: 14px;
    font-weight: bold;
}
.link-center {
	text-align: center !important;
}
select.select {
	width: 100%;
}
</style>

<form name="cn" method="post" action="">
<div style="float:left; text-align:left;">
 &nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
<br />
</div>
<input type="submit" name="savecn" value="Save/Update Data" />
<div style="margin-left:8px;margin-right: 8px;">
	<br/><br/>
	<div class="leads_table">
		<div class="">
			<h2 style="text-align: left;">7 Day Period</h2>
		</div>
		<div class="">
			<h2 style="text-align: left;">Leads:</h2>
		</div>
		<table id="list-table" class="nav-back" width="100%">
			<thead>
				<tr>
					<th class="topmenu" align="center" valign="middle" width="15%"></th>
					{{math assign="six_days_ago" equation="now - (6 * 86400)" now=$smarty.now}}
					<th class="topmenu" align="center" valign="middle" width="10%">Weekly Actual ({{$six_days_ago|date_format:"%B %e"}} – {{$smarty.now|date_format:"%B %e"}})</th>
					<th class="topmenu" align="center" valign="middle" width="5%">Weekly Goal</th>
					<th class="topmenu" align="center" valign="middle" width="5%">Weekly Diff</th>
					
					{{assign var="current_month" value=$smarty.now|date_format:"%m"}}
					{{assign var="current_year" value=$smarty.now|date_format:"%Y"}}

					{{if $current_month >= 7}}
						{{assign var="fy_start_year" value=$current_year}}
						{{math assign="fy_end_year" equation="x + 1" x=$current_year}}
					{{else}}
						{{math assign="fy_start_year" equation="x - 1" x=$current_year}}
						{{assign var="fy_end_year" value=$current_year}}
					{{/if}}
					<th class="topmenu" align="center" valign="middle" width="10%">YTD Actual (1 July {{$fy_start_year}} – 30 June {{$fy_end_year}})</th>
					<th class="topmenu" align="center" valign="middle" width="5%">YTD Goal</th>
					<th class="topmenu" align="center" valign="middle" width="5%">YTD Diff</th>
					<th class="topmenu" align="center" valign="middle" width="5%">Year Goal</th>
					<th class="topmenu" align="center" valign="middle" width="5%">Year Diff</th>
					
					<th class="topmenu" align="center" valign="middle" width="10%">Type</th>
					<th class="topmenu" align="center" valign="middle" width="10%">Accuracy</th>
					<th class="topmenu" align="center" valign="middle" width="10%">Where data comes from</th>
					<th class="topmenu" align="center" valign="middle" width="5%">Action</th>  
				</tr>
			</thead>
			<tbody>
				{{foreach from=$list key="key" item="item"}}
					{{if $item.cn_id eq 24}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>-->
							{{if $lead_data_weekly}}{{$lead_data_weekly.weekly_total}}{{/if}}
						</td>
						<td data-col="weeklyGoal">
							{{if $item.cn_weekly_goal gte 0}}{{$item.cn_weekly_goal|regex_replace:"/\.0+$/":""}}{{/if}}
						</td>
						<td data-col="weeklyDiff">
							{{if $item.cn_weekly_goal gt 0 and $lead_data_weekly.weekly_total|@strlen > 0}}
								{{math equation="lead_weekly - goal_weekly" lead_weekly=$lead_data_weekly.weekly_total goal_weekly=$item.cn_weekly_goal assign="diff"}}
								{{assign var="diffFormatted" value=$diff|regex_replace:"/\.0+$/":""}}
								{{if $diff gt 0}}
									+{{$diffFormatted}}
								{{elseif $diff lt 0}}
									{{math equation="-x" x=$diff assign="diffAbs"}}
									-{{$diffAbs}}
								{{else}}
									0
								{{/if}}
							{{/if}}
						</td>
						<td>
							<!--<input name ='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>-->
							{{if $lead_data_ytd}}{{$lead_data_ytd.ytd_total}}{{/if}}
						</td>
						<td data-col="ytdGoal">
							<!--{{if $item.cn_ytd_goal gte 0}}{{$item.cn_ytd_goal|regex_replace:"/\.0+$/":""}}{{/if}}-->
							
							{{if $item.cn_weekly_goal gte 0}}
								{{assign var="goal" value=$item.cn_weekly_goal}}
								{{assign var="weeks" value=$weeks_since_financial_year}}
								{{math equation="goal * weeks" goal=$item.cn_weekly_goal weeks=$weeks_since_financial_year assign="raw_total"}}
								{{math equation="round(z)" z=$raw_total assign="total"}}
								{{$total}}
							{{/if}}
						</td>
						<td data-col="ytdDiff">
							{{if $item.cn_ytd_goal gt 0 and $lead_data_ytd.ytd_total|@strlen > 0}}
								{{math equation="lead_weekly - goal_weekly" lead_weekly=$lead_data_ytd.ytd_total goal_weekly=$item.cn_ytd_goal assign="diff"}}
								{{assign var="diffFormatted" value=$diff|regex_replace:"/\.0+$/":""}}
								{{if $diff gt 0}}
									+{{$diffFormatted}}
								{{elseif $diff lt 0}}
									{{math equation="-x" x=$diff assign="diffAbs"}}
									-{{$diffAbs}}
								{{else}}
									0
								{{/if}}
							{{/if}}
						</td>
						<td data-col="yearGoal">
							{{if $item.cn_weekly_goal gt 0}}
								{{math equation="x * 52" x=$item.cn_weekly_goal assign="yearly_goal"}}
								{{$yearly_goal|regex_replace:"/\.0+$/":""}}
							{{/if}}
						</td>
						<td data-col="yearDiff">
							{{if $item.cn_weekly_goal gt 0 and $lead_data_ytd.ytd_total != ''}}
								{{math equation="x * 52" x=$item.cn_weekly_goal assign="yearly_goal"}}
								{{math equation="x - y" x=$lead_data_ytd.ytd_total y=$yearly_goal assign="remaining_goal"}}
								{{assign var="formatted_goal" value=$remaining_goal|regex_replace:"/\.0+$/":""}}

								{{if $remaining_goal gt 0}}
									+{{$formatted_goal}}
								{{elseif $remaining_goal lt 0}}
									{{math equation="-x" x=$remaining_goal assign="abs_goal"}}
									-{{$abs_goal|regex_replace:"/\.0+$/":""}}
								{{else}}
									0
								{{/if}}
	
							{{/if}}
						</td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
					{{if $item.cn_id eq 25}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>-->
							{{if $parbooked_data_weekly}}{{$parbooked_data_weekly.weekly_total}}{{/if}}
						</td>
						<td data-col="weeklyGoal">
							{{if $item.cn_weekly_goal gte 0}}{{$item.cn_weekly_goal|regex_replace:"/\.0+$/":""}}{{/if}}
						</td>
						<td data-col="weeklyDiff">
							{{if $item.cn_weekly_goal gt 0 and $parbooked_data_weekly.weekly_total|@strlen > 0}}
								{{math equation="lead_weekly - goal_weekly" lead_weekly=$parbooked_data_weekly.weekly_total goal_weekly=$item.cn_weekly_goal assign="diff"}}
								{{assign var="diffFormatted" value=$diff|regex_replace:"/\.0+$/":""}}
								{{if $diff gt 0}}
									+{{$diffFormatted}}
								{{elseif $diff lt 0}}
									{{math equation="-x" x=$diff assign="diffAbs"}}
									-{{$diffAbs}}
								{{else}}
									0
								{{/if}}
							{{/if}}
						</td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>-->
							{{if $parbooked_data_ytd}}{{$parbooked_data_ytd.ytd_total}}{{/if}}
						</td>
						<td data-col="ytdGoal">
							<!--{{if $item.cn_ytd_goal gte 0}}{{$item.cn_ytd_goal|regex_replace:"/\.0+$/":""}}{{/if}}-->
							
							{{if $item.cn_weekly_goal gte 0}}
								{{assign var="goal" value=$item.cn_weekly_goal}}
								{{assign var="weeks" value=$weeks_since_financial_year}}
								{{math equation="goal * weeks" goal=$item.cn_weekly_goal weeks=$weeks_since_financial_year assign="raw_total"}}
								{{math equation="round(z)" z=$raw_total assign="total"}}
								{{$total}}
							{{/if}}
						</td>
						<td data-col="ytdDiff">
							{{if $item.cn_ytd_goal gt 0 and $parbooked_data_ytd.ytd_total|@strlen > 0}}
								{{math equation="lead_weekly - goal_weekly" lead_weekly=$parbooked_data_ytd.ytd_total goal_weekly=$item.cn_ytd_goal assign="diff"}}
								{{assign var="diffFormatted" value=$diff|regex_replace:"/\.0+$/":""}}
								{{if $diff gt 0}}
									+{{$diffFormatted}}
								{{elseif $diff lt 0}}
									{{math equation="-x" x=$diff assign="diffAbs"}}
									-{{$diffAbs}}
								{{else}}
									0
								{{/if}}
							{{/if}}
						</td>
						<td data-col="yearGoal">
							{{if $item.cn_weekly_goal gt 0}}
								{{math equation="x * 52" x=$item.cn_weekly_goal assign="yearly_goal"}}
								{{$yearly_goal|regex_replace:"/\.0+$/":""}}
							{{/if}}
						</td>
						<td data-col="yearDiff">
							{{if $item.cn_weekly_goal gt 0 and $parbooked_data_ytd.ytd_total != ''}}
								{{math equation="x * 52" x=$item.cn_weekly_goal assign="yearly_goal"}}
								{{math equation="x - y" x=$parbooked_data_ytd.ytd_total y=$yearly_goal assign="remaining_goal"}}
								{{assign var="formatted_goal" value=$remaining_goal|regex_replace:"/\.0+$/":""}}

								{{if $remaining_goal gt 0}}
									+{{$formatted_goal}}
								{{elseif $remaining_goal lt 0}}
									{{math equation="-x" x=$remaining_goal assign="abs_goal"}}
									-{{$abs_goal|regex_replace:"/\.0+$/":""}}
								{{else}}
									0
								{{/if}}

							{{/if}}
						</td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
					{{if $item.cn_id eq 26}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>-->
							{{if $followup_data_weekly}}{{$followup_data_weekly.weekly_total}}{{/if}}
						</td>
						<td data-col="weeklyGoal">
							{{if $item.cn_weekly_goal gte 0}}{{$item.cn_weekly_goal|regex_replace:"/\.0+$/":""}}{{/if}}
						</td>
						<td data-col="weeklyDiff">
							{{if $item.cn_weekly_goal gt 0 and $followup_data_weekly.weekly_total|@strlen > 0}}
								{{math equation="lead_weekly - goal_weekly" lead_weekly=$followup_data_weekly.weekly_total goal_weekly=$item.cn_weekly_goal assign="diff"}}
								{{assign var="diffFormatted" value=$diff|regex_replace:"/\.0+$/":""}}
								{{if $diff gt 0}}
									+{{$diffFormatted}}
								{{elseif $diff lt 0}}
									{{math equation="-x" x=$diff assign="diffAbs"}}
									-{{$diffAbs}}
								{{else}}
									0
								{{/if}}
							{{/if}}
						</td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>-->
							{{if $followup_data_ytd}}{{$followup_data_ytd.ytd_total}}{{/if}}
						</td>
						<td data-col="ytdGoal">
							<!--{{if $item.cn_ytd_goal gte 0}}{{$item.cn_ytd_goal|regex_replace:"/\.0+$/":""}}{{/if}}-->
							
							{{if $item.cn_weekly_goal gte 0}}
								{{assign var="goal" value=$item.cn_weekly_goal}}
								{{assign var="weeks" value=$weeks_since_financial_year}}
								{{math equation="goal * weeks" goal=$item.cn_weekly_goal weeks=$weeks_since_financial_year assign="raw_total"}}
								{{math equation="round(z)" z=$raw_total assign="total"}}
								{{$total}}
							{{/if}}
						</td>
						<td data-col="ytdDiff">
							{{if $item.cn_ytd_goal gt 0 and $followup_data_ytd.ytd_total|@strlen > 0}}
								{{math equation="lead_weekly - goal_weekly" lead_weekly=$followup_data_ytd.ytd_total goal_weekly=$item.cn_ytd_goal assign="diff"}}
								{{assign var="diffFormatted" value=$diff|regex_replace:"/\.0+$/":""}}
								{{if $diff gt 0}}
									+{{$diffFormatted}}
								{{elseif $diff lt 0}}
									{{math equation="-x" x=$diff assign="diffAbs"}}
									-{{$diffAbs}}
								{{else}}
									0
								{{/if}}
							{{/if}}
						</td>
						<td data-col="yearGoal">
							{{if $item.cn_weekly_goal gt 0}}
								{{math equation="x * 52" x=$item.cn_weekly_goal assign="yearly_goal"}}
								{{$yearly_goal|regex_replace:"/\.0+$/":""}}
							{{/if}}
						</td>
						<td data-col="yearDiff">
							{{if $item.cn_weekly_goal gt 0 and $item.cn_ytd_goal != ''}}
								{{math equation="x * 52" x=$item.cn_weekly_goal assign="yearly_goal"}}
								{{math equation="x - y" x=$item.cn_ytd_goal y=$yearly_goal assign="remaining_goal"}}
								{{assign var="formatted_goal" value=$remaining_goal|regex_replace:"/\.0+$/":""}}

								{{if $remaining_goal gt 0}}
									+{{$formatted_goal}}
								{{elseif $remaining_goal lt 0}}
									{{math equation="-x" x=$remaining_goal assign="abs_goal"}}
									-{{$abs_goal|regex_replace:"/\.0+$/":""}}
								{{else}}
									0
								{{/if}}

							{{/if}}
						</td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
					{{if $item.cn_id eq 27}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>-->
							{{if $designagreement_data_weekly}}{{$designagreement_data_weekly.weekly_total}}{{/if}}
						</td>
						<td data-col="weeklyGoal">
							{{if $item.cn_weekly_goal gte 0}}{{$item.cn_weekly_goal|regex_replace:"/\.0+$/":""}}{{/if}}
						</td>
						<td data-col="weeklyDiff">
							{{if $item.cn_weekly_goal gt 0 and $designagreement_data_weekly.weekly_total|@strlen > 0}}
								{{math equation="lead_weekly - goal_weekly" lead_weekly=$designagreement_data_weekly.weekly_total goal_weekly=$item.cn_weekly_goal assign="diff"}}
								{{assign var="diffFormatted" value=$diff|regex_replace:"/\.0+$/":""}}
								{{if $diff gt 0}}
									+{{$diffFormatted}}
								{{elseif $diff lt 0}}
									{{math equation="-x" x=$diff assign="diffAbs"}}
									-{{$diffAbs}}
								{{else}}
									0
								{{/if}}
							{{/if}}
						</td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>-->
							{{if $designagreement_data_ytd}}{{$designagreement_data_ytd.ytd_total}}{{/if}}
						</td>
						<td data-col="ytdGoal">
							<!--{{if $item.cn_ytd_goal gte 0}}{{$item.cn_ytd_goal|regex_replace:"/\.0+$/":""}}{{/if}} -->
							
							{{if $item.cn_weekly_goal gte 0}}
								{{assign var="goal" value=$item.cn_weekly_goal}}
								{{assign var="weeks" value=$weeks_since_financial_year}}
								{{math equation="goal * weeks" goal=$item.cn_weekly_goal weeks=$weeks_since_financial_year assign="raw_total"}}
								{{math equation="round(z)" z=$raw_total assign="total"}}
								{{$total}}
							{{/if}}
						</td>
						<td data-col="ytdDiff">
							{{if $item.cn_ytd_goal gt 0 and $designagreement_data_ytd.ytd_total|@strlen > 0}}
								{{math equation="lead_weekly - goal_weekly" lead_weekly=$designagreement_data_ytd.ytd_total goal_weekly=$item.cn_ytd_goal assign="diff"}}
								{{assign var="diffFormatted" value=$diff|regex_replace:"/\.0+$/":""}}
								{{if $diff gt 0}}
									+{{$diffFormatted}}
								{{elseif $diff lt 0}}
									{{math equation="-x" x=$diff assign="diffAbs"}}
									-{{$diffAbs}}
								{{else}}
									0
								{{/if}}
							{{/if}}
						</td>
						<td data-col="yearGoal">
							{{if $item.cn_weekly_goal gt 0}}
								{{math equation="x * 52" x=$item.cn_weekly_goal assign="yearly_goal"}}
								{{$yearly_goal|regex_replace:"/\.0+$/":""}}
							{{/if}}
						</td>
						<td data-col="yearDiff">
							{{if $item.cn_weekly_goal gt 0 and $designagreement_data_ytd.ytd_total != ''}}
								{{math equation="x * 52" x=$item.cn_weekly_goal assign="yearly_goal"}}
								{{math equation="x - y" x=$designagreement_data_ytd.ytd_total y=$yearly_goal assign="remaining_goal"}}
								{{assign var="formatted_goal" value=$remaining_goal|regex_replace:"/\.0+$/":""}}

								{{if $remaining_goal gt 0}}
									+{{$formatted_goal}}
								{{elseif $remaining_goal lt 0}}
									{{math equation="-x" x=$remaining_goal assign="abs_goal"}}
									-{{$abs_goal|regex_replace:"/\.0+$/":""}}
								{{else}}
									0
								{{/if}}

							{{/if}}
						</td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
				{{/foreach}}
			</tbody>
		</table>
	</div>
	<br />
	<div class="customer_satisfaction_table">
		<div class="">
			<h2 style="text-align: left;">Customer Satisfaction:</h2>
		</div>
		<table id="list-table" class="nav-back" width="100%">
			<thead>
				<tr>
					<th class="topmenu" align="center" valign="middle" width="15%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
				</tr>
			</thead>
			<tbody>
				{{foreach from=$list key="key" item="item"}}
					{{if $item.cn_id eq 28}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>-->
							{{if $surveys_data_weekly}}{{$surveys_data_weekly.weekly_total}}{{/if}}
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>-->
							{{if $surveys_data_ytd}}{{$surveys_data_ytd.ytd_total}}{{/if}}
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
					{{if $item.cn_id eq 29}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>-->
							{{if $surveys_data_weekly}}{{$surveys_data_weekly.net_rating}}{{/if}}
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>-->
							{{if $surveys_data_ytd}}{{$surveys_data_ytd.net_rating}}{{/if}}
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
				{{/foreach}}
			</tbody>
		</table>
	</div>
	<br />
	<div class="marketing_table">
		<div class="">
			<h2 style="text-align: left;">Marketing:</h2>
		</div>
		<table id="list-table" class="nav-back" width="100%">
			<thead>
				<tr>
					<th class="topmenu" align="center" valign="middle" width="15%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
				</tr>
			</thead>
			<tbody>
				{{foreach from=$list key="key" item="item"}}
					{{if $item.cn_id eq 30}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>-->
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
					{{if $item.cn_id eq 31}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>-->
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
					{{if $item.cn_id eq 32}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>-->
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
					{{if $item.cn_id eq 33}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>-->
							{{if $designnumbers_data_weekly}}{{$designnumbers_data_weekly.weekly_total}}{{/if}}
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>-->
							{{if $designnumbers_data_ytd}}{{$designnumbers_data_ytd.ytd_total}}{{/if}}
							{{if $dno_data}}&nbsp;&nbsp;&nbsp;&nbsp;(Total Designs Online - {{$dno_data.design_online_total}}){{/if}}
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
				{{/foreach}}
			</tbody>
		</table>
	</div>
	<br />
	<div class="sales_table">
		<div class="">
			<h2 style="text-align: left;">Sales:</h2>
		</div>
		<table id="list-table" class="nav-back" width="100%">
			<thead>
				<tr>
					<th class="topmenu" align="center" valign="middle" width="15%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
				</tr>
			</thead>
			<tbody>
				{{foreach from=$list key="key" item="item"}}
					{{if $item.cn_id eq 34}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>-->
							{{if $proposaldelivered_data_weekly}}{{$proposaldelivered_data_weekly.weekly_total}}{{/if}}
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>-->
							{{if $proposaldelivered_data_ytd}}{{$proposaldelivered_data_ytd.ytd_total}}{{/if}}
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
					{{if $item.cn_id eq 35}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>-->
							{{if $hiaSigned_data_weekly}}{{$hiaSigned_data_weekly.weekly_total}}{{/if}}
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>-->
							{{if $hiaSigned_data_ytd}}{{$hiaSigned_data_ytd.ytd_total}}{{/if}}
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
				{{/foreach}}
			</tbody>
		</table>
	</div>
	<br/>
	<div class="leads_table">
		<div class="">
			<h2 style="text-align: left;">Designs:</h2>
		</div>
		<table id="list-table" class="nav-back" width="100%">
			<thead>
				<tr>
					<th class="topmenu" align="center" valign="middle" width="15%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
				</tr>
			</thead>
			<tbody>
				{{foreach from=$list key="key" item="item"}}
					{{if $item.cn_id eq 36}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>-->
							{{if $activeDesigns_data_weekly}}{{$activeDesigns_data_weekly.weekly_total}}{{/if}}
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>-->
							{{if $activeDesigns_data_ytd}}{{$activeDesigns_data_ytd.ytd_total}}{{/if}} 
							{{if $activeDesigns_total_data}}&nbsp;&nbsp;&nbsp;&nbsp; (Total Active Designs -  {{$activeDesigns_total_data.activeDesigns_total}} ) {{/if}}
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
					{{if $item.cn_id eq 37}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>-->
							{{if $designsSignedOff_data_weekly}}{{$designsSignedOff_data_weekly.weekly_total}}{{/if}}
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>-->
							{{if $designsSignedOff_data_ytd}}{{$designsSignedOff_data_ytd.ytd_total}}{{/if}}
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
				{{/foreach}}
			</tbody>
		</table>
	</div>
	<br />
	<div class="leads_table">
		<div class="">
			<h2 style="text-align: left;">Construction:</h2>
		</div>
		<table id="list-table" class="nav-back" width="100%">
			<thead>
				<tr>
					<th class="topmenu" align="center" valign="middle" width="15%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
				</tr>
			</thead>
			<tbody>
				{{foreach from=$list key="key" item="item"}}
					{{if $item.cn_id eq 43}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
					{{if $item.cn_id eq 44}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
				{{/foreach}}
			</tbody>
		</table>
	</div>
	<br />
	<div class="financial_table">
		<div class="">
			<h2 style="text-align: left;">Financial</h2>
		</div>
		<div class="">
			<h2 style="text-align: left;">Profit and Loss:</h2>
		</div>
		<table id="list-table" class="nav-back" width="100%">
			<thead>
				<tr>
					<th class="topmenu" align="center" valign="middle" width="15%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="10%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
				</tr>
			</thead>
			<tbody>
				{{foreach from=$list key="key" item="item"}}
					{{if $item.cn_id eq 38}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
					{{if $item.cn_id eq 39}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
					{{if $item.cn_id eq 40}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
					{{if $item.cn_id eq 41}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
					{{if $item.cn_id eq 42}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][weekly]' type="text" value="{{$item.cn_weekly}}"/>-->
							{{if $netsales_data_weekly.netsales_weekly}}{{$netsales_data_weekly.netsales_weekly|replace:',':''|number_format:2:'.':','}}{{/if}}
						</td>
						<td data-col="weeklyGoal"></td>
						<td data-col="weeklyDiff"></td>
						<td>
							<!--<input name='measurment[{{$item.cn_id}}][ytd]' type="text" value="{{$item.cn_ytd}}"/>-->
							{{if $netsales_data_ytd.netsales_ytd}}{{$netsales_data_ytd.netsales_ytd|replace:',':''|number_format:2:'.':','}}{{/if}}
						</td>
						<td data-col="ytdGoal"></td>
						<td data-col="ytdDiff"></td>
						<td data-col="yearGoal"></td>
						<td data-col="yearDiff"></td>
						<td>
							<select class="select" name="measurment[{{$item.cn_id}}][cn_type]" onchange="updateRecord('{{$item.cn_id}}', 'cn_type', this.value)">
								<option value="">Select Type</option>
								<option value="Manual" {{if $item.cn_type eq 'Manual'}}selected{{/if}}>Manual</option>
								<option value="Automatic" {{if $item.cn_type eq 'Automatic'}}selected{{/if}}>Automatic</option>
							</select>
						</td>
						<td></td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
				{{/foreach}}
			</tbody>
		</table>
	</div>
	<br />
	<div class="open_positions_table">
		<div class="">
			<h2 style="text-align: left;">Open Positions:</h2>
		</div>
		<table id="list-table" class="nav-back" width="100%">
			<thead>
				<tr>
					<th class="topmenu" align="center" valign="middle" width="15%"></th>
					<th class="topmenu" align="center" valign="middle" width="71%"></th>
					<th class="topmenu" align="center" valign="middle" width="9%"></th>
					<th class="topmenu" align="center" valign="middle" width="5%"></th>
				</tr>
			</thead>
			<tbody>
				{{foreach from=$list key="key" item="item"}}
				{{if $item.cn_id eq 45}}
					<tr bgcolor="#FFFFFF">
						<td>{{$item.cn_kpi}}</td>
						<td>{{if $open_positions_data.open_position}}{{$open_positions_data.open_position}}{{/if}}</td>
						<td class="link-center">{{if $item.cn_datacome}}<a target="_blank" href="{{$item.cn_datacome}}">Link</a>{{/if}}</td>
						<td data-col="action">
							<a class="various" href="{{$BASE_URL}}{{$BASEFOLDER}}.edit_datacome/cn_id/{{$item.cn_id}}" title="Edit">
								<img style="height: 20px; width:20px;" src="/css/admin/images/edit.png">
							</a>
						</td>
					</tr>
					{{/if}}
				{{/foreach}}
			</tbody>
		</table>
	</div>
	<br />
	<div class="balance_sheet_table">
		<div class="">
			<h2 style="text-align: left;">Balance Sheet</h2>
		</div>
		<div class="">
			<h2 style="text-align: left;">Debt Recovery:</h2>
		</div>
		<br />
	</div>
  </div> 
</form>

<script>
    function updateRecord(primaryID, column, value, updateRecord = false) {
        const formData = {
            primaryID: primaryID,
            column: column,
            value: value,
            action: "updateRecord"
        };
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}{{ $BASEFOLDER }}.ajax_handler",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success == true) {
                    if(updateRecord){
                        //$('#' + column + primaryID).text(value);
                    }
                }
                else {
                    alert('Some problem in updating the record');
                }
            },
			error: function (xhr, status, error) {
				//console.log(formData);
				//console.log("AJAX Error Status:", status);
				//console.log("AJAX Error Detail:", error);
				//console.log("Full response:", xhr.responseText);

				//alert("AJAX Error: " + error); // this is where "undefined" came from
			}
        })
    }
</script>
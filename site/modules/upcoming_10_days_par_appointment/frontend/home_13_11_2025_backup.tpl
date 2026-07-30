<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}
<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<h3 class="page-title">{{$title}}</h3>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<style>
	.dtpic {
		width: 65px !important;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
		margin-bottom: 10px !important;
	}
	.dt {
		border: 1px solid #CCC;
		padding: 8px;
		margin-top: 15px !important;
	}
	#fancybox-wrap {
		z-index: 9999999;
	}
	.updpa_wrap {
	  display: flex;
	  flex-wrap: wrap;
	  gap: 10px;
	}

	.updpa_wrap > div {
	  flex: 1 1 calc(50% - 20px);
	  box-sizing: border-box;
	}
</style>
<script type="text/javascript">
	$(document).ready(function () {
		/*
		*   Examples - images
		*/
		$(".various").fancybox({
			'width': '95%',
			'height': '95%',
			'autoScale': false,
			'transitionIn': 'elastic',
			'transitionOut': 'elastic',
			'speedIn': 300,
			'speedOut': 300,
			'overlayShow': true,
			'hideOnOverlayClick': false,
			'hideOnContentClick': false,
			'type': 'iframe',
			'scrolling': 'yes'
		});
	});
	function add_procedure() {
		var viewurl = "{{$BASE_URL}}upcoming_10_days_par_appointment.view_procedure" + "/random/" + Math.random();
		$(document).ready(function () {
			$.fancybox({
				'width': '90%',
				'height': '99%',
				'autoScale': false,
				'transitionIn': 'elastic',
				'transitionOut': 'elastic',
				'speedIn': 300,
				'speedOut': 300,
				'overlayShow': true,
				'overlayColor': '#000',
				'hideOnOverlayClick': false,
				'hideOnContentClick': false,
				'type': 'iframe',
				'href': viewurl,
				'scrolling': 'yes'
			});
		});
	}
</script>
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
	<div style="float:left;">
		&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
	</div>
	<div style="float:right;">
		<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" />
	</div>
</form>
<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" >Date and Time</th>
				<th class="topmenu" align="center" valign="middle" >Customer Name - Project Address</th>
				<th class="topmenu" align="center" valign="middle" >Appointment Type</th>
				<th class="topmenu" align="center" valign="middle" >Where</th>
				<th class="topmenu" align="center" valign="middle" >Documents</th>
				<th class="topmenu" align="center" valign="middle" >PAR Couriered</th>
				<th class="topmenu" align="center" valign="middle" >Intro Box Sent</th>
			</tr>
		</thead>
		<tbody>
			{{assign var=countn value= $total}}
			{{foreach from=$list key="key" item="item"}}
			<tr bgcolor='{{cycle values="#D3E8D6,WHITE" advance=true}}'>
				<td>
					{{if $item.bsn_sales_next_meeting_date }}
					{{$item.bsn_sales_next_meeting_date|date_format:"%A"}} <br/> {{$item.bsn_sales_next_meeting_date|date_format:"%d/%m/%Y"}}
					{{/if}}
					{{if $item.bsn_sales_next_meeting_time}} <br/> {{$item.bsn_sales_next_meeting_time}}{{/if}}
				</td>
				<td>
					{{$item.bcust_fname}}&nbsp;{{$item.bcust_lname}}
					{{if $item.bsn_address}}
						<br/> <a href="{{$BASE_URL}}business.detail/bsn_id/{{$item.bs_business_id}}">{{$item.bsn_address}}</a>
					{{/if}}
				</td>
				<td>
					{{foreach from=$appointmentType key="keyap" item="itemap"}}
						{{if $itemap.splat_id eq $item.bsn_splat_id}}{{$itemap.splat_option}}{{/if}}
					{{/foreach}}
				</td>
				<td>
					{{$item.bsn_sales_next_meeting_where}}
				</td>
				<td>
					<div class="updpa_wrap">
						<div>
							<b>PAR Report:</b> {{if $item.par_report}}<br/><a href="/upcoming_10_days_par_appointment.download_content?file_name={{$item.par_report}}&module_name=business.home" target="_blank">Download</a>{{else}}<br/>N/A{{/if}}<br/>
						</div>
						<div>
							<b>Design Agreement:</b> {{if $item.design_agreement}}<br/><a href="/upcoming_10_days_par_appointment.download_content?file_name={{$item.design_agreement}}&module_name=business.home" target="_blank">Download</a>{{else}}<br/>N/A{{/if}}<br/>
						</div>
						<div>
							<b>PAR Proposal:</b> {{if $item.par_proposal}}<br/><a href="/upcoming_10_days_par_appointment.download_content?file_name={{$item.par_proposal}}&module_name=business.home" target="_blank">Download</a>{{else}}<br/>N/A{{/if}}<br/>
						</div>
						<div>
							<b>Meeting Agenda:</b> {{if $item.meeting_agenda}}<br/><a href="/upcoming_10_days_par_appointment.download_content?file_name={{$item.meeting_agenda}}&module_name=business.home" target="_blank">Download</a>{{else}}<br/>N/A{{/if}}<br/>
						</div>
						<div>
							<b>UTPAR Report:</b> {{if $item.utpar_report}}<br/><a href="/upcoming_10_days_par_appointment.download_content?file_name={{$item.utpar_report}}&module_name=business.home" target="_blank">Download</a>{{else}}<br/>N/A{{/if}}
						</div>
					</div>
				</td>
				<td {{if $item.bs_paqr_alertoption neq 6}}style="background:#F00;"{{else}}style="background:#0F0;"{{/if}}>
					{{if $item.bs_paqr_alertoption neq 6}}
					No
					{{else}}
					{{foreach from=$alertdata key="keya" item="itema"}}
						{{if $itema.pa_id eq $item.bs_paqr_alertoption}}{{$itema.pa_alert}}{{/if}}
					{{/foreach}}
					{{/if}}
					{{if $item.bs_paqr_alertoption neq 0}}
					<br/>{{$item.bs_paqr_alertoption_at|date_format:"%d/%m/%Y"}}<br/>
					{{$item.alert_option_user}}
					{{/if}}
				</td>
				<td {{if $item.boxsent}}style="background:#0F0;text-align:center;"{{else}}style="background:#F00;text-align:center;"{{/if}}>
					{{if $item.boxsent}}{{$item.boxsent|date_format:"%d-%m-%Y %H:%M:%S"}}{{else}}No{{/if}}
				</td>
			</tr>
			{{assign var=countn value=$countn-1}}
			{{/foreach}}
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
</div>
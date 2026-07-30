<script>
	function close_win() {
		$.fancybox.close();
		var conf = confirm('Are you sure want to Reload The Page?');
		if (conf == true) {
			//window.location.href = window.location.href;
			window.location.reload(true);
		}
	}
</script>
<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<script type="text/javascript">
	$(document).ready(function () {
		/*
		*   Examples - images
		*/
		$(".various").fancybox({
			'width': '90%',
			'height': '85%',
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
</script>
<h3 class="page-title">{{$title}}</h3>
<style>
	.set2 {
		font-size: 10px !important;
		width: 60px !important;
		display: inline-block;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
		padding-left: 1px !important;
		height: 25px !important;
		margin-top: 7px;
	}

	.set3 {
		font-size: 10px !important;
		width: 120px !important;
		display: inline-block;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
		padding-left: 1px !important;
		height: 25px !important;
		margin-top: 7px;
	}

	.dtpic {
		width: 65px !important;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
	}

	#fancybox-wrap {
		z-index: 9999999;
	}

	.myselect {
		width: 100px;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	.myselect option {
		white-space: nowrap;
		width: 100% border-bottom: 1px #ccc solid;
		/* This doesn't work. */
	}
	#list-table td a.custom_logview {
		color: #fff;
		padding: 2px 10px;
		display: flex;
		border-radius: 5px;
		align-items: anchor-center;
		justify-content: center;
		width: 70px;
		height: 25px;
		font-family: inherit;
		font-weight: 500;
		text-transform: uppercase;
		text-decoration: auto;
		background: url(/css/default/images/button1_bg.gif) top repeat-x;
	}
	.escalation_data table {
		border-collapse: collapse;
	}
	.escalation_data table th, .escalation_data table td {
		border: 1px solid #000;
		padding: 5px;
	}
</style>

<script language="javascript">
	function open_popup(type) {
        let viewurl = '';
        if (type == 'manage_procedure') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_procedure" + "/random/" + Math.random();
        }
		else if (type == 'view_action_type') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.action_type_view" + "/random/" + Math.random();
        }
		else if (type == 'send_email') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.send_email";
		}
		
        $(document).ready(function () {
            $.fancybox({
                'width': '90%',
                'height': '99%',
                'autoScale': false,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'speedIn': 400,
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

<table width="100%">
	<tr>
		<td>
			<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post" style="margin: 0; display: flex; flex-direction: row; align-items: end; justify-content: space-between;">
				<div style="display: flex; flex-direction: row; gap: 8px;">
					<div>
						<div>
							<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:open_popup('manage_procedure');" />
							<input type="button" name="proc_panel" value="Action Type" onclick="javascript:open_popup('view_action_type');"/>
						</div>
						<div>
							<strong> Project : </strong>
							<datalist id='project'>
								{{foreach from=$project_data key="key" item="item"}}
								<option value="{{$item.wa_project}}">
									{{$item.wa_project}}
								</option>
								{{/foreach}}
							</datalist>
							<input type="text" list='project' name="project_name" style="width:300px" placeholder="Enter Address" value="{{$search_project}}" />
						</div>
						<div>
							<strong>Type : </strong>
							<select name="warranty_type">
								<option value="">Select Type </option>
								{{foreach from = $typedetail key="key4" item="item4"}}
								<option value="{{$item4.wt_type_option}}" {{if $item4.wt_type_option eq $item.wa_type}}
									selected="selected" {{/if}}>{{$item4.wt_type_option}}</option>
								{{/foreach}}
							</select>
						</div>
						<div>
							<strong> Rec. Number : </strong>
							<input type="text" name="recno" placeholder="Enter Rec.No" value="{{$recno}}" />
						</div>
						<div>
							<strong> CGFB Responsible : </strong>
							<select name="search_by_cgfb_responsible">
								<option value=""></option>
								<option value="NIL" {{if $cgfb_responsible eq 'NIL'}} selected="selected" {{/if}}>Please Select </option>
								{{foreach from =$cgfbdetail key="key6" item="item6"}}
									<option value="{{$item6.wc_id}}" {{if $cgfb_responsible eq $item6.wc_id}} selected="selected" {{/if}}>{{$item6.wc_cgfb_option}}</option>
								{{/foreach}}
							</select>
							<input type="submit" name="search" value="Search" title="Search for any record or apply filters" />
							<input type="submit" name="clear" value="Clear All Search" title="Clears all search results and applied filters" />
						</div>
					</div>
					<div class="escalation_data">
						<table style="font-size: 12px;">
							<tbody>
								<tr><th colspan="2" style="font-size: 14px;">Escalation Data</th></tr>
								{{foreach from=$escalation_data_table key="column1" item="column2"}}
								<tr>
									<td>{{$column1}}</td><td>{{$column2}}</td>
								</tr>
								{{/foreach}}
							</tbody>
						</table>
					</div>
				</div>
				<div style="display: flex; flex-direction: row; gap: 8px; justify-content: flex-end;">
					<div>
						<input type="button" name="proc_panel" value="Send Email" onclick="javascript:open_popup('send_email');" />
						<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" />
					</div>
				</div>
			</form>
		</td>
	</tr>
</table>

<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="10%" data-col="rec_no">Rec. No.</th>
				<th class="topmenu" align="center" valign="middle" width="05%" data-col="log_view">Log View</th>
				<th class="topmenu" align="center" valign="middle" width="05%" data-col="total_open">Total Open</th>
				<th class="topmenu" align="center" valign="middle" width="10%" data-col="www">WWW</th>
				<th class="topmenu" align="center" valign="middle" width="10%" data-col="problem">Problem</th>
				<th class="topmenu" align="center" valign="middle" width="15%" data-col="project">Project</th>
				<th class="topmenu" align="center" valign="middle" width="10%" data-col="type">Type</th>
				<th class="topmenu" align="center" valign="middle" width="10%" data-col="cgfb_responsible">CGFB Responsible</th>
				<th class="topmenu" align="center" valign="middle" width="10%" data-col="days_count">Days Count</th>
				<th class="topmenu" align="center" valign="middle" width="10%" data-col="escalation_days_count">Escalation<br>Days Count</th>
				<th class="topmenu" align="center" valign="middle" width="10%" data-col="signed_warranty_agreement">Signed Warranty Agreement</th>
				<!--<th class="topmenu" align="center" valign="middle" width="20%" data-col="notes">Notes</th>-->
				<th class="topmenu" align="center" valign="middle" width="20%" data-col="notes">Escalation Notes<br/>(Not Visible to Client)</th>
				<th class="topmenu" align="center" valign="middle" width="10%" data-col="action">Action</th>
			</tr>
		</thead>
		<tbody>

			{{foreach from=$list key="key" item="item"}}

			<tr {{if $item.wa_include_supplier eq '' }}bgcolor="#F00" {{elseif $item.wa_include_supplier neq '' and $item.wa_selected eq 1 }} bgcolor="#ababab" {{else}} bgcolor='{{cycle values="#D3E8D6,WHITE" advance=true}}' {{/if}}>
				<td data-col="rec_no">{{$item.wa_id}}</td>
				<td data-col="log_view">
					<a class="custom_logview" href="{{$BASE_URL}}warranty_log2.view_log_detail/wa_id/{{$item.wa_id}}" target="_blank">Log View</a>
				</td>
				<td data-col="total_open">{{$item.total_open_logs}}</td>
				<td data-col="www">
					{{$item.www_link}}
				</td>
				<td data-col="problem" style="min-width: 400px; max-width: 400px;">{{$item.wa_problem|stripslashes}}</td>
				<td data-col="project" style="white-space: nowrap;">
					{{$item.project_link}}
				</td>				
				<td data-col="type">
					<select name="{{$TABLE}}[wa_type]" Onchange="update_type({{$item.wa_id}},this.value)">
						<option value='NA' {{if $item.wa_type eq 'NA' }} selected="selected" {{/if}}>Please Select
						</option>
						{{foreach from = $typedetail key="key4" item="item4"}}
						<option value="{{$item4.wt_type_option}}" {{if $item4.wt_type_option eq $item.wa_type}}
							selected="selected" {{/if}}>{{$item4.wt_type_option}}
						</option>
						{{/foreach}}
					</select>

					<script>

						function update_type(id, value) {

							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}warranty_log.update_type/wa_id/" + id + "/value/" + value,
								success: function (result) {
								}
							});
						}
					</script>
				</td>				
				<td data-col="cgfb_responsible">
					<select name="{{$TABLE}}[wa_cgfb_resp]" Onchange="update_cgfb({{$item.wa_id}},this.value)">
						<option value="-1" {{if $item.wa_cgfb_resp eq -1}} selected="selected" {{/if}}>Please Select
						</option>
						{{foreach from = $cgfbdetail key="key6" item="item6"}}
						<option value="{{$item6.wc_id}}" {{if $item6.wc_id eq $item.wa_cgfb_resp}} selected="selected"
							{{/if}}>{{$item6.wc_cgfb_option}}
						</option>
						{{/foreach}}
					</select>
					<div id="cond{{$item.wa_id}}">{{$item.wa_cgfb_user}}<br />{{$item.wa_cgfb_date}} </div>
					<script>
						function update_cgfb(id, value) {
							var cond = '#cond' + id;
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}warranty_log.update_cgfb/wa_id/" + id + "/value/" + value,
								success: function (result) {
									$(cond).html(result);
								}
							});
						}
					</script>
					<a href="{{$BASE_URL}}warranty_log.cgfb_notes/wa_id/{{$item.wa_id}}" class="various">Notes</a>
				</td>
				<td data-col="days_count">{{$item.dayscount}}</td>
				<td data-col="escalation_days_count">{{$item.escalation_days_count}}</td>
				<td data-col="signed_warranty_agreement" style="white-space: nowrap;">{{$item.signed_warranty_agreement}}</td>
				<!--<td data-col="notes" style="min-width: 400px; max-width: 400px;" class="notesContent" {{if $item.cell_red eq 1}} style="background:#F00;" {{/if}}>
					<div style="width: 100%; overflow: auto;">
						{{$item.notes_text}}
						<br>
						<a href="{{$BASE_URL}}warranty_log.view_notes/wa_id/{{$item.wa_id}}" class="various">Notes</a>
						{{$item.notes_date}}
					</div>
				</td>-->
				<td data-col="escalation_notes" style="min-width: 400px; max-width: 400px;" class="notesContent" >
					<div style="width: 100%; overflow: auto;">
						{{$item.esc_notes_text}}
						<br>
						<a href="{{$BASE_URL}}warranty_escalation_report.view_esc_notes/wa_id/{{$item.wa_id}}" class="various">Notes</a>
						{{$item.esc_notes_date|date_format:"%d-%m-%Y"}}
					</div>
				</td>
				<td data-col="action">
					<form name="single" method="post" action="">
						<select name="wa_wlea_id" onchange="update_action({{$item.wa_id}}, this.value)">
							<option value="">Select</option>
							{{foreach from=$escalationActions key="key" item="row"}}
								<option value="{{$row.wlea_id}}" {{if $row.wlea_id == $item.wa_wlea_id}} selected="selected" {{/if}}>
									{{$row.wlea_option}}
								</option>
							{{/foreach}}
						</select>
					</form>
				</td>
			</tr>
			{{/foreach}}
		</tbody>
	</table>

	{{if $notfound}}
	<div style="font-size:18px; color:#F00; padding-top:10px;"><strong>{{$notfound}}</strong></div>{{/if}}

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

<script>
	function update_action(id, value) {
		$.ajax({
			type: "GET",
			url: "{{$BASE_URL}}{{$BASEFOLDER}}.action_type_update/wa_id/" + id + "/wa_wlea_id/" + value,
			success: function (result) {
				window.location.reload();
			}
		});
	}
</script>
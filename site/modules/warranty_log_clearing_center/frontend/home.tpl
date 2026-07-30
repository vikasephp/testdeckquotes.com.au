{{include file=$jdata}}
{{include file=$tiny_basic}}
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

	#fancybox-wrap {
		z-index: 9999999;
	}
</style>

{{if $opr}}
<script type="text/javascript">
	setTimeout('parent.close_win();', 500);

	//window.location.href = "{{$BASE_URL}}warranty_log.view_procedure";
</script>
{{/if}}

<script language="javascript">


	function add_procedure() {
		var viewurl = "{{$BASE_URL}}warranty_log_clearing_center.view_procedure" + "/random/" + Math.random();

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

<div style="float:left;">
	<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
</div>

<div style="float:right; text-align:right;">
	<form name="sh" method="post" action="">
		<input type="submit" name="show_hidden" value="Show Hidden" />
	</form>
</div>

<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="20%">Property Address</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Is the property tenanted?</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Is your project completed or in construction phase?</th>
				<th class="topmenu" align="center" valign="middle" width="30%">What is the problem that you are experiencing?</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Photo</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Video</th>
				<!--<th class="topmenu" align="center" valign="middle" width="8%">Does your issue happen inside the property or outside?</th> -->
				<th class="topmenu" align="center" valign="middle" width="8%">Status</th>
			</tr>
		</thead>
		<tbody>
			{{foreach from=$list key="key" item="item"}}
			<tr bgcolor="#FFFFFF">
				<td>{{$item.wf_property_address}}</td>
				<td>
					{{if $item.wf_is_tented eq 1}}
					<p>Yes</p>
					<p>{{$item.wf_tenant_name}}</p>
					<p>{{$item.wf_tenant_number}}</p>
					{{else}}
					No
					{{/if}}
				</td>
				<td>{{if $item.wf_is_completed eq 1}}In Construction
					{{else if $item.wf_is_completed eq 2}} Completed {{/if}}
				</td>
				<!--<td>{{$item.wa_problem|stripslashes}}</td>-->

				<td> {{$item.wf_problem}}</td>
				<td>
					<div style="display: flex; flex-direction: column;">
						{{assign var=id value=$item.wf_id}}
						{{assign var=sn value=1}}
						{{assign var=files value=$photos.$id}}
						{{foreach from=$files key="index" item="row"}}
							<div>
								Photo {{$sn}} : <a href="{{$row.url}}" target="_blank">Download</a>
							</div>
							{{assign var=sn value=$sn+1}}
						{{/foreach}}
					</div>
				</td>
				<td>
					<div style="display: flex; flex-direction: column;">
						{{assign var=id value=$item.wf_id}}
						{{assign var=sn value=1}}
						{{assign var=files value=$videos.$id}}
						{{foreach from=$files key="index" item="row"}}
							<div>
								Video {{$sn}} : <a href="{{$row.url}}" target="_blank">Download</a>
							</div>
							{{assign var=sn value=$sn+1}}
						{{/foreach}}
					</div>
				</td>
				<td>
					{{if $item.wf_status eq 'Pending'}}
					<a href="{{$BASE_URL}}warranty_log_clearing_center.status_approve/wf_id/{{$item.wf_id}}"
						class="various">{{$item.wf_status}}</a>
					{{else}}
						{{$item.wf_status}}
						{{/if}}
				</td>
			</tr>
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
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
</style>

<script language="javascript">

	function add_new(url) {

		$(document).ready(function () {

			$.fancybox({

				'width': '90%',
				'height': '85%',
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
				'href': url,
				'scrolling': 'yes'
			});
		});
	}


	function add_task() {
		var viewurl = "{{$BASE_URL}}warranty_log.viewtask" + "/random/" + Math.random();

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


	function add_checklist() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_checklist" + "/random/" + Math.random();

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

	function add_priority() {
		var viewurl = "{{$BASE_URL}}warranty_log.viewpriority" + "/random/" + Math.random();

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


	function proj_management() {
		var viewurl = "{{$BASE_URL}}warranty_log.proj_management" + "/random/" + Math.random();

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
	function add_procedure() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_procedure" + "/random/" + Math.random();

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

	function add_type() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_type" + "/random/" + Math.random();

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

	function add_liability() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_liability" + "/random/" + Math.random();

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



	function edit_tr(wa_id) {
		var viewurl = "{{$BASE_URL}}trade_responsibility.detail" + "/wa_id/" + wa_id;

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

	function trade_report() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_tr" + "/random/" + Math.random();

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

	function staff_included() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_staff_included" + "/random/" + Math.random();

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
	function hot_button(bsn_id, bcust_id, wa_id) {


		var viewurl = "{{$BASE_URL}}warranty_log.hot_button" + "/bcust_id/" + bcust_id + "/bsn_id/" + bsn_id + "/wa_id/" + wa_id;

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

	function add_area() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_area" + "/random/" + Math.random();

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

	function add_cgfb() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_cgfb_resp" + "/random/" + Math.random();

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

	function add_why_not() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_why_not" + "/random/" + Math.random();

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


<table width="100%">
	<tr>
		<td>

			<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">

				<div style="float:left; margin-left:8px;">
					<input type="button" name="proc_panel" value="Procedure Panel"
						onclick="javascript:add_procedure();" />

					<br />
					<strong> Project : </strong>
					<datalist id='project'>
						{{foreach from=$project_data key="key" item="item"}}
						<option value="{{$item.wa_project}}">
							{{$item.wa_project}}
						</option>
						{{/foreach}}
					</datalist>

					<input type="text" list='project' name="project_name" style="width:300px"
						value="{{$search_project}}" />
					<br />

					<strong> Type : </strong>
					<select name="warranty_type">
						<option value="">Please Select </option>
						{{foreach from = $typedetail key="key4" item="item4"}}
						<option value="{{$item4.wt_type_option}}" {{if $item4.wt_type_option eq $item.wa_type}}
							selected="selected" {{/if}}>{{$item4.wt_type_option}}</option>
						{{/foreach}}
					</select>
					<br />
					<strong> Rec. Number : </strong> <input type="text" name="recno" />
					<br />
					<strong> Status : </strong>
					<select name="warranty_status">
						<option value="">Please Select</option>
						<option value="Open" {{if $warranty_status eq "Open" }} selected="selected" {{/if}}>Open
						</option>
						<option value="Closed" {{if $warranty_status eq "Closed" }} selected="selected" {{/if}}>Closed
						</option>
						<option value="Pending" {{if $warranty_status eq "Pending" }} selected="selected" {{/if}}>
							Pending</option>

					</select>
					<br />
					
					<strong> CGFB Responsible :</strong>
					<select name="search_by_cgfb_responsible">
						<option value="NIL">Please Select </option>
						{{foreach from =$cgfbdetail key="key6" item="item6"}}
						<option value="{{$item6.wc_id}}" {{if $cgfb_responsible eq $item6.wc_id}} selected="selected" {{/if}}>{{$item6.wc_cgfb_option}}</option>
						{{/foreach}}
					</select>

					<input type="submit" name="search" value="Search" />
					<input type="submit" name="clear" value="Clear All Search" /> <br />

					<div style="border:1px solid #F00;  padding:10px; background: #CCC; width:30%; margin-bottom:10px;">
						<input type="radio" value="1" name="oc" checked="checked" /> Open &nbsp; &nbsp
						<input type="radio" value="2" name="oc" {{if $oc eq 2}} checked="checked" {{/if}}> Closed
						&nbsp; &nbsp
						<input type="submit" name="sevenday" value="7 Day Report" /><br />
					</div>
					<input type="submit" name="print" value="Print Merge – All" />
					&nbsp;&nbsp;
					<input type="submit" name="printallimgthumb" value="Print Merge – All - Photos" />
					&nbsp;&nbsp;
					<span style="border:1px solid #0CF; padding:3px;"> Open Logs : {{$tot_open.open}}</span>
					&nbsp;&nbsp;
					<span style="border:1px solid #0CF; padding:3px;">7 Day Logs : {{$tot_seven.seven}}</span>
					&nbsp;&nbsp;
					<span style="border:1px solid #0CF; padding:3px;">90 Day + Logs : {{$tot_ninety.ninety}}</span>
					&nbsp;&nbsp;
					<span style="border:1px solid #0CF; padding:3px;">Pending Logs : {{$tot_pending.pending}}</span>
					&nbsp;&nbsp;
					<span style="border:1px solid #0CF; padding:3px;">Unallocated Logs : {{$tot_unallocated.total_unallocated}}</span>
					&nbsp;&nbsp;
					<span style="border:1px solid #0CF; padding:3px;">Post Walkthrough Logs : {{$post_walkthrough_count}}</span>
					&nbsp;&nbsp;
					<span style="border:1px solid #0CF; padding:3px;">Walkthrough Logs : {{$walkthrough_log_count}}</span>
					<br />
					<!--<strong> Supplier Search  : </strong> <input type="text" name="supp_name" width="100" /> <input type="submit" name="supplier_o" value = "Search" />-->
					<input type="submit" name="printOP" value="Print Merge – Open and Pending" style="background:#00CC33;" />
					&nbsp;&nbsp;
					<input type="submit" name="printOPimgthumb" value="Print Merge – Open and Pending - Photos" style="background:#00CC33;" />
					<br />

					{{if $filepath}}
					{{foreach from=$filepath key="keyP" item="itemP"}}

					<strong>Download &nbsp; &nbsp;</strong><a href="{{$itemP}}" target="_blank">{{$itemP}}</a> <br />
					{{/foreach}}
					{{/if}}

				</div>


				<div style="float:right; text-align:right;">

					<input type="submit" name="clear" value="Clear Filter" />
					<input type="submit" name="filter_unallocated_logs" value="Unallocated Logs" />
					<input type="submit" name="closedonly" value="Closed Logs Only" />
					<input type="button" name="Add New" value="Task List" onclick="javascript:add_task();" />
					<br />

					<input type="submit" name="sortNotesDueDate" value="Sort By Notes due Date" />
					<input type="submit" name="sort_proj" value="Sort By Project" />
					<input type="submit" name="sort_date" value="Sort By Date" />
					<input type="submit" name="openclose" value="Open and Closed Logs" />
					<input type="button" name="Add New " value="Add New"
						onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
				</div>
			</form>
		</td>
	</tr>
</table>

<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="10%">Rec. No.</th>
				<th class="topmenu" align="center" valign="middle" width="05%">Log View</th>
				<th class="topmenu" align="center" valign="middle" width="10%">WWW</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Problem</th>
				<th class="topmenu" align="center" valign="middle" width="15%">Project</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Type</th>
				<th class="topmenu" align="center" valign="middle" width="10%">CGFB Responsible</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Days Count</th>
				<th class="topmenu" align="center" valign="middle" width="10%" data-col="signed_warranty_agreement">Signed Warranty Agreement</th>
				<th class="topmenu" align="center" valign="middle" width="20%">Notes</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Action</th>
			</tr>
		</thead>
		<tbody>

			{{foreach from=$list key="key" item="item"}}

			<tr {{if $item.wa_status eq 'Pending' }} bgcolor="#f7b900" {{elseif $item.wa_include_supplier eq '' }}bgcolor="#F00" {{else}} bgcolor="#FFFFFF" {{/if}}>
				<td>{{$item.wa_id}}</td>
				<td>
					<a class="custom_logview" href="{{$BASE_URL}}warranty_log.view_log_detail/wa_id/{{$item.wa_id}}" target="_blank">Log View</a>
				</td>
				<td>
					{{$item.www_link}}
				</td>
				<td>{{$item.wa_problem|stripslashes}}</td>
				<td>
					{{$item.project_link}}
				</td>				
				<td>
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
				<td>
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
				<td>{{$item.dayscount}}</td>
				<td data-col="signed_warranty_agreement"></td>
				<td class="notesContent" {{if $item.cell_red eq 1}} style="background:#F00;" {{/if}}> {{$item.notes_text}}<br>
					<a href="{{$BASE_URL}}warranty_log.view_notes/wa_id/{{$item.wa_id}}" class="various">Notes</a>
					{{$item.notes_date}}
				</td>

				<td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
						<img style="height:20px; width:20px;"
							src="{{$BASE_URL}}css/admin/images/edit.png" /></a>&nbsp;&nbsp;
					<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}"
						onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;"
						title="Delete">
						<img style="height:20px; width:20px;"
							src="{{$BASE_URL}}css/admin/images/delete.png" /></a>&nbsp;&nbsp
					<a href="{{$BASE_URL}}{{$XFA.replay}}/{{$ID}}/{{$item.$ID}}" class="various" title="Replay">
						<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/sub.png" /></a>
					<form name="single" method="post" action="">
						<input type="hidden" name="wa_id" value="{{$item.wa_id}}" />

						<input type="submit" name="single_log"
							style="background-image:url({{$BASE_URL}}css/admin/images/print.png); width:20px; height:20px;"
							value=" ">
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
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript">
	$(document).ready(function () {
		/*
		*   Examples - images
		*/
		$(".various").fancybox({
			'width': '95%',
			'height': '90%',
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
		var viewurl = "{{$BASE_URL}}design_estimates_report.view_procedure" + "/random/" + Math.random();

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

	function close_win() {
		$.fancybox.close();
		window.location.reload();
	}

	function close_win2() {
		$.fancybox.close();
		//window.location.reload();
	}

</script>


<script type="text/javascript">
	function addfeedback(bsn_id) {
		var viewurl = "{{$BASE_URL}}design_estimates_report.addfeedback" + "/bsn_id/" + bsn_id;

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

<script type="text/javascript">
	function viewfeedback(bsn_id) {
		var viewurl = "{{$BASE_URL}}design_estimates_report.viewfeedback" + "/bsn_id/" + bsn_id;

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

<script type="text/javascript">
	$(function () {
		$(".wrapper1").scroll(function () {
			$(".wrapper2")
				.scrollLeft($(".wrapper1").scrollLeft());
		});
		$(".wrapper2").scroll(function () {
			$(".wrapper1")
				.scrollLeft($(".wrapper2").scrollLeft());
		});
	});
</script>
<style>
	body {
		style="border:1px solid #F00;"
	}

	.tooltip:hover .tooltiptext {
		visibility: visible;
	}

	.dtpic {
		width: 65px !important;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
	}

	.set {
		font-size: 10px !important;
		width: 31px !important;
		display: inline-block;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
		padding-left: 1px !important;
		height: 25px !important;
	}

	.wrapper1, .wrapper2 {
		width: 100%;
		border: none 0px RED;
		overflow-x: scroll;
		overflow-y: hidden;
		scrollbar-color: yellow blue;
	}

	.wrapper1 {
		height: 20px;
	}

	.div1 {
		//width: 5490px;
		width: 2400px;
		height: 20px;
	}

	.div2 {
		//width: 5790px;
		width: 2400px;
		overflow: auto;
	}

	.tableFixHead {
		overflow-y: auto;
		height: 1200px;
	}

	.tableFixHead thead th {
		position: sticky;
		top: 0;
		text-align: left;
	}

	table {
		border-collapse: collapse;
		width: 100%;
	}

	th {
		z-index: 9999;
	}

	#fancybox-wrap {
		z-index: 9999999;
	}
	#doclist-table th {
		z-index: 1 !important;
	}
	.email_htbtn {
		font-size: 12px !important;
		line-height: 1 !important;
		padding: 7px 8px !important;
		border-top: 1px solid #5C5C5C;
		border-left: 1px solid #5C5C5C;
		border-bottom: 1px solid rgba(0, 0, 0, 0.1);
		border-right: 1px solid rgba(0, 0, 0, 0.1);
		-moz-border-radius: 4px;
		-khtml-border-radius: 4px;
		-webkit-border-radius: 4px;
		margin-bottom: 5px;
		background: url(css/default/images/button1_bg.gif) top repeat-x;
		color: #fff !important;
		text-decoration: none;
		text-transform: uppercase;
		position: relative;
		cursor: pointer;
		font-style: italic;
		display: block;
		width: 80px;
	}
</style>

<h3 class="page-title">{{$MODULE_SINGULAR}}</h3>
<br />

<form name="sort" method="post">
	<div style="float:left; text-align: left; margin-left:10px; text-align:left">

		&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel"
			onclick="javascript:add_procedure();" />
		<br />

		<div style="float:left;"> &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
			<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;"
				placeholder="Search By Checklist Number" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="Search" name="searchaddr" />
			<input type="submit" value="Clear Search" name="clear" />

			<span style="color:#0C9; font-weight:bold; border:2px solid #0C9; padding:4px; margin-left:20px;"> ACTIVE :
				{{$active}} </span>

		</div>
		<br />

		<div style="float:left;padding-left:10px;">
			<strong>Sort Order</strong>
			<select name="sortorder">
				<option value="1" {{if $ascdsc eq 1 }} selected="selected" {{/if}}> Ascending </option>
				<option value="2" {{if $ascdsc eq 2 }} selected="selected" {{/if}}> Descending </option>
			</select>
			<strong>Sort By :</strong>
			<input type="submit" value="Sort By Designer" name="sortbydesigner" />
            <input type="submit" value="Sort By % Completed" name="sortbypercomp" />
            <input type="submit" value="Sort By Last Audit - Designer" name="sortbyladesigner" />
            <input type="submit" value="Sort By Last Audit – Calculator" name="sortbylacalculator" />
            
		</div>
		<br />
		<div style="float:left;padding-left:10px;">

			<input type="submit" value="Show Reno Only" name="reno_only" />
			<input type="submit" value="Clear Search" name="clear" />

			<span style="padding-left:40px;">
				<!--Design Report for : &nbsp;<a href="{{$BASE_URL}}design_estimates_report.yana">Yana</a>
				&nbsp;<a href="{{$BASE_URL}}design_estimates_report.jamie">Jamie</a>
				&nbsp;<a href="{{$BASE_URL}}design_estimates_report.clare">Clare</a>-->
				<input type="submit" value="Red Light Filter" name="red_light" style="background:#F00;" />
			</span>
			<span style="display:inline-flex; font-weight:bold; vertical-align:middle;"> &nbsp; &nbsp; &nbsp; &nbsp;
				Last Audit : &nbsp;
				<form name="law" method="post" action="">
					<input type="hidden" name="audit_whole[{{$wlaData.la_id}}]" value="0" />
					<label class="switch">
						<input class="switch-input" type="checkbox" name="audit_whole[{{$wlaData.la_id}}]" value="1"
							onclick="this.form.submit();" {{if $wlaData.la_last_audit eq 1 }} checked="checked"
							{{/if}}>
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
				{{if $wlaData.la_last_audit  eq 1 }} Date : &nbsp;{{ $wlaData.la_last_audit_date}} &nbsp; &nbsp;&nbsp;
				Who : {{ $wlaData.la_last_audit_user}} {{/if}}
			</span>
		</div>
	</div>
</form>

<form name="mlist" method="post">
	<div style="float:right;">
		<!--<input type= "submit" name="savepercent" title="Save" value="Update % Completed"> &nbsp; &nbsp;-->
		<input type="button" value="Export To XLS"
			onclick="document.location.href='{{$BASE_URL}}design_estimates_report.home/export/1'" /> &nbsp;
		<!--<input type="submit" value="Show Hidden" name="unhide"  />-->
		<!--<input type="submit" value="Save Move to Inactive" name="hideupdate"  />-->
		<br />

	</div> &nbsp; &nbsp;

	<br />
	<div class="wrapper1">
		<div class="div1">
		</div>
	</div>
	<div style="border:1px solid black;width:auto;height:auto;overflow-y:hidden;overflow-x:scroll;">
		<!--<div class="wrapper2">-->
		<div class="div2 tableFixHead">
			<table id="doclist-table" class="nav-back" width="100%">
				<thead>
					<tr>
						<th class="topmenu" align="center" valign="middle" width="3%">Relevant Checklist Numbers</th>
						<th class="topmenu" align="center" valign="middle" width="10%">Customer Details</th>
						<th class="topmenu" align="center" valign="middle" width="5%">Designer</th>
						<th class="topmenu" align="center" valign="middle" width="5%">Customer Budget</th>
						<th class="topmenu" align="center" valign="middle" width="5%">Latest Mrged Plans</th>
                        <th class="topmenu" align="center" valign="middle" width="5%">% Completed</th>
						<th class="topmenu" align="center" valign="middle" width="5%">Plan Rev No.</th>
						<th class="topmenu" align="center" valign="middle" width="5%">Estimate Build Cost</th>
						<th class="topmenu" align="center" valign="middle" width="5%">Build Est Rev No.</th>
                        <th class="topmenu" align="center" valign="middle" width="5%">Build Cal Rev No.</th>
						<th class="topmenu" align="center" valign="middle" width="5%">Likely site scope value</th>
						<th class="topmenu" align="center" valign="middle" width="5%">Site Est Rev No.</th>
						<th class="topmenu" align="center" valign="middle" width="5%">Estimated Renovation Cost</th>
						<th class="topmenu" align="center" valign="middle" width="5%">Reno Est Rev No.</th>
                        <th class="topmenu" align="center" valign="middle" width="5%">Reno Cal Rev No.</th>
						<th class="topmenu" align="center" valign="middle" width="5%">Unit Title Costs</th>
						<th class="topmenu" align="center" valign="middle" width="5%">Unit Title Rev No.</th>
						<th class="topmenu" align="center" valign="middle" width="4%">Last Audit - Designer</th>
						<th class="topmenu" align="center" valign="middle" width="4%">Last Audit – Calculator specialist</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Send Estimate Review Email</th>
						<th class="topmenu" align="center" valign="middle" width="4%">Action</th>
					</tr>
				</thead>
				{{if $list}}
				<tbody>

					<!--{{assign var=countn value= $numstartvounter}}-->
					{{assign var=countn value= $total}}

					{{foreach from=$list key="key" item="item"}}


					<tr {{if $item.dpn_dr_per_complete eq 100}} bgcolor="#99CC99" {{else}} bgcolor="{{cycle values='
						#dceff5,WHITE' advance=true}} {{/if}}">
						<td> {{$item.chknoData}} </td>
						<td>
							<strong>{{$item.bcust_fname}}&nbsp;{{$item.bcust_lname}}</strong><br/>
							<a href="{{$item.link}}">
								{{$item.bsn_address}}
							</a>
						</td>
						
						<td> {{$item.dpn_customer_designer}}</td>
						
						<td>
							<form name="esti" method="post" action="">
								<input type="text" name="cust_budget[{{$item.chknoData}}]"
									value="{{$item.dpn_dr_cust_budget}}" style="width:80px" />
								<input type="submit" value="Save" name="savebudget" class="set" />
								{{ if $item.dpn_dr_cust_budget}}
								{{$item.dpn_dr_budg_user}}<br />{{$item.dpn_dr_budg_date}} {{/if}}
							</form>
						</td>
						
						<td>
							{{$item.lmp_date}}
							{{if $item.lmp_date}}<br />
							<a href="/design_estimates_report.download_content?file_name={{$item.lmp_doc_file_name}}&module_name=design_estimates_report.home"
								target="_blank">Download</a>
							{{/if}}
						</td>
                        
                        <td>        

                      <form name ="perc" method="post" action="">   
                            <input type ="text" name ="percentage[{{$item.chknoData}}]" value="{{$item.dpn_dr_per_complete}}" Onchange = "update2({{$item.chknoData|ltrim:'0'}},this.value)" style="width:50px;" />              
                     
                      </form>
                    
                     <script>
                        
                            function update2(id,value)
                            {
                                
                             $.ajax({
                                           type: "GET",
                                           url: "{{$BASE_URL}}design_report.update_per2/dpn_unique_id/"+id+"/value/"+value,
                                               success: function(result){
                                           }
                                         });
                            
                            }
                        
                    </script>
                              
       
       						</td>
    
						<td>
							<input type="text" name="total_hours[{{$item.chknoData}}]"
								id="th{{$item.chknoData|ltrim:'0'}}" value="{{$item.dpn_dr_plan_revno}}"
								onchange="update_plan({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width:40px" />

							<script>
								function update_plan(id, value) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_plan/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}
							</script>
						</td>
						
						<td data-col="estimate_build_cost" style="background-color: {{$item.ebcColor}}">
							<!--<a href="{{$BASE_URL}}design_estimates_report.txtmsg_ec/dpn_unique_id/{{$item.chknoData|ltrim:'0'}}"
								class="various">
								{{if $item.dpn_dr_ebc_comm}}<img src="{{$BASE_URL}}images/textmsgyellow.png" />
								{{else}}<img src="{{$BASE_URL}}images/textmsgblue.png" />{{/if}}

							</a>-->
							<input type="text" name="estimate[{{$item.chknoData}}]"
								value="{{$item.dpn_dr_estimate_cost|urldecode}}"
								onkeyup="update_estimate_cost2({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width:150px" />
							<select name="est_cname" onchange="update_cname({{$item.chknoData}}, 'dpn_dr_est_cname', this.value)">
								<option value="">Please Select Name</option>
								{{foreach from=$data_cname key="key_cname" item="item_cname"}}
								<option value="{{$item_cname.de_id}}" {{if $item.dpn_dr_est_cname eq $item_cname.de_id}}selected="selected"{{/if}}>{{$item_cname.de_name}}</option>
								{{/foreach}}
							</select>
							<br>
							<!--{{$item.dpn_dr_ec_date}}-->
							<input type="text" name="ebc[{{$item.chknoData}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic"
								id="ebc_{{$item.chknoData}}" value="{{$item.dpn_dr_ec_date}}"
								onchange="update_ebc_date({{$item.chknoData|ltrim:'0'}}, 'dpn_dr_ec_date', this.value);"
								onblur="update_ebc_date({{$item.chknoData|ltrim:'0'}}, 'dpn_dr_ec_date', this.value);" />

							<script>

								function update_estimate_cost2(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_estimate_cost2/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

								function update_ebc_date(id, column, value) {
									value = encodeURIComponent(value);
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_ebc_date/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
										}
									});
								}
								
								function update_cname(id, column, value) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_cname/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
										}
									});
								}

							</script>

						</td>
						
						{{assign var="ebc_rev" value=$item.dpn_dr_ec_cmt|regex_replace:'/[^0-9.]/':''}}
						{{assign var="ebc_reno" value=$item.dpn_dr_plan_revno|regex_replace:'/[^0-9.]/':''}}
						<td {{if $ebc_rev neq $ebc_reno}}style="background: yellow;"{{/if}}>
							<span title="planningapprovalcanberra">REV</span>
							<input type="text" name="estimate_cmt[{{$item.chknoData}}]"
								value="{{$item.dpn_dr_ec_cmt|urldecode}}"
								onkeyup="update_estimate_cmt({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width: 120px;" /> 
							
							<br/>Cur: {{if $item.dpn_est_build_link_current}} <a href="{{$item.dpn_est_build_link_current}}" target="_blank">Link</a>{{/if}}
							<br/> His: {{if $item.dpn_est_build_link_historical}} <a href="{{$item.dpn_est_build_link_historical}}" target="_blank">Link</a>{{/if}}
							
							<script>
								function update_estimate_cmt(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_estimate_cost2/dpn_unique_id_cmt/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}
							</script>
						</td>
                        
                      {{assign var="ebc_build" value=$item.dpn_build_cal_cmt|regex_replace:'/[^0-9.]/':''}}
						{{assign var="ebc_reno" value=$item.dpn_dr_plan_revno|regex_replace:'/[^0-9.]/':''}}
						<td {{if $ebc_build neq $ebc_reno}} style="background: yellow;"{{/if}}> 
							<span title="planningapprovalcanberra">REV</span>
							<input type="text" name="build_cal[{{$item.chknoData}}]"
								value="{{$item.dpn_build_cal_cmt|urldecode}}"
								onkeyup="build_cal({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width: 120px;" /> 
							
							<br/>Cur: {{if $item.dpn_build_cal_current}}    <a href="{{$item.dpn_build_cal_current}}" target="_blank">Link</a>{{/if}}
							<br/>His: {{if $item.dpn_build_cal_historical}} <a href="{{$item.dpn_build_cal_historical}}" target="_blank">Link</a>{{/if}}
							
							<script>
								function build_cal(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_estimate_cost2/dpn_unique_id_build/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}
							</script>
						</td>

						<td data-col="likely_site_scope_value" style="background-color: {{$item.lssColor}}">
							<!--<a href="{{$BASE_URL}}design_estimates_report.txtmsg_lsv/dpn_unique_id/{{$item.chknoData|ltrim:'0'}}"
								class="various">
								{{if $item.dpn_dr_likey_comm}}<img src="{{$BASE_URL}}images/textmsgyellow.png" />
								{{else}}<img src="{{$BASE_URL}}images/textmsgblue.png" />{{/if}}
							</a>-->
							<input type="text" name="likelyvalue[{{$item.chknoData}}]"
								value="{{$item.dpn_dr_likely_value|urldecode}}"
								onkeyup="update_likely_value2({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width:150px !important;" />
							<select name="likely_cname" onchange="update_cname({{$item.chknoData}}, 'dpn_dr_likely_cname', this.value)">
								<option value="">Please Select Name</option>
								{{foreach from=$data_cname key="key_cname" item="item_cname"}}
								<option value="{{$item_cname.de_id}}" {{if $item.dpn_dr_likely_cname eq $item_cname.de_id}}selected="selected"{{/if}}>{{$item_cname.de_name}}</option>
								{{/foreach}}
							</select>
							<br />
							<!--{{$item.dpn_dr_likely_date}}-->
							<input type="text" name="likely[{{$item.chknoData}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic"
								id="likely_{{$item.chknoData}}" value="{{$item.dpn_dr_likely_date}}"
								onchange="update_ebc_date({{$item.chknoData|ltrim:'0'}}, 'dpn_dr_likely_date', this.value);"
								onblur="update_ebc_date({{$item.chknoData|ltrim:'0'}}, 'dpn_dr_likely_date', this.value);" />

							<script>
								function update_likely_value2(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_likely_value2/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

								function update_ebc_date(id, column, value) {
									value = encodeURIComponent(value);
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_ebc_date/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
										}
									});
								}
								
								function update_cname(id, column, value) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_cname/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
										}
									});
								}

							</script>

						</td>
						
						{{assign var="lss_rev" value=$item.dpn_dr_likely_cmt|regex_replace:'/[^0-9.]/':''}}
						{{assign var="lss_reno" value=$item.dpn_dr_plan_revno|regex_replace:'/[^0-9.]/':''}}
						<td {{if $lss_rev neq $lss_reno}}style="background: yellow;"{{/if}}> 
							<span title="planningapprovalcanberra">REV </span><input type="text"
								name="likely_com[{{$item.chknoData}}]" value="{{$item.dpn_dr_likely_cmt|urldecode}}"
								onkeyup="update_likely_cmt({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width: 120px;" /> 
							
							<br/>Cur: {{if $item.dpn_likely_scope_link_current}} <a href="{{$item.dpn_likely_scope_link_current}}" target="_blank">Link</a>{{/if}}
							<br/> His: {{if $item.dpn_likely_scope_link_historical}} <a href="{{$item.dpn_likely_scope_link_historical}}" target="_blank">Link</a>{{/if}}
							
							<script>
								function update_likely_cmt(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_likely_value2/dpn_unique_id_cmt/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}
							</script>
						</td>

						<td data-col="estimated_renovation_cost" style="background-color: {{$item.ercColor}}">
							<!--<a href="{{$BASE_URL}}design_estimates_report.txtmsg_erc/dpn_unique_id/{{$item.chknoData|ltrim:'0'}}"
								class="various">
								{{if $item.dpn_dr_erc_comm}}<img src="{{$BASE_URL}}images/textmsgyellow.png" />
								{{else}}<img src="{{$BASE_URL}}images/textmsgblue.png" />{{/if}}
							</a>-->
							<input type="text" name="reno_cost[{{$item.chknoData}}]"
								value="{{$item.dpn_dr_erc|urldecode}}"
								onkeyup="update_reno_cost({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width:150px;" />
							<select name="likely_cname" onchange="update_cname({{$item.chknoData}}, 'dpn_dr_reno_cname', this.value)">
								<option value="">Please Select Name</option>
								{{foreach from=$data_cname key="key_cname" item="item_cname"}}
								<option value="{{$item_cname.de_id}}" {{if $item.dpn_dr_reno_cname eq $item_cname.de_id}}selected="selected"{{/if}}>{{$item_cname.de_name}}</option>
								{{/foreach}}
							</select>
							<br />
								
							<!--{{$item.dpn_dr_erc_date}}-->
							<input type="text" name="reno[{{$item.chknoData}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic"
								id="reno_{{$item.chknoData}}" value="{{$item.dpn_dr_erc_date}}"
								onchange="update_reno_date({{$item.chknoData|ltrim:'0'}}, 'dpn_dr_erc_date', this.value);"
								onblur="update_reno_date({{$item.chknoData|ltrim:'0'}}, 'dpn_dr_erc_date', this.value);" />
								
							<script>

								function update_reno_cost(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_renovation_cost/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

								function update_reno_date(id, column, value) {
									value = encodeURIComponent(value);
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_ebc_date/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
										}
									});
								}
								
								function update_cname(id, column, value) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_cname/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
										}
									});
								}

							</script>

						</td>
						
						{{assign var="erc_rev" value=$item.dpn_dr_erc_cmt|regex_replace:'/[^0-9.]/':''}}
						{{assign var="erc_reno" value=$item.dpn_dr_plan_revno|regex_replace:'/[^0-9.]/':''}}
						<td {{if $erc_rev neq $erc_reno}}style="background: yellow;"{{/if}}> 
							<span title="planningapprovalcanberra">REV </span><input type="text"
								name="reno_com[{{$item.chknoData}}]" value="{{$item.dpn_dr_erc_cmt|urldecode}}"
								onkeyup="update_reno_cmt({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width: 120px;" /> 
							
							<br/>Cur: {{if $item.dpn_reno_link_current}} <a href="{{$item.dpn_reno_link_current}}" target="_blank">Link</a>{{/if}}
							<br/> His: {{if $item.dpn_reno_link_historical}} <a href="{{$item.dpn_reno_link_historical}}" target="_blank">Link</a>{{/if}}
							
							<script>
								function update_reno_cmt(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_renovation_cost/dpn_unique_id_cmt/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}
							</script>
						</td>
                        
                       {{assign var="erc_rev" value=$item.dpn_reno_cal_cmt|regex_replace:'/[^0-9.]/':''}}
						{{assign var="erc_reno" value=$item.dpn_dr_plan_revno|regex_replace:'/[^0-9.]/':''}}
						<td {{if $erc_rev neq $erc_reno}}style="background: yellow;"{{/if}}> 
							<span title="planningapprovalcanberra">REV </span><input type="text"
								name="reno_com2[{{$item.chknoData}}]" value="{{$item.dpn_reno_cal_cmt|urldecode}}"
								onkeyup="update_reno_cal_cmt({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width: 120px;" /> 
							
							<br/>Cur: {{if $item.dpn_reno_cal_current }} <a href="{{$item.dpn_reno_cal_current }}" target="_blank">Link</a>{{/if}}
							<br/>His: {{if $item.dpn_reno_cal_historical}} <a href="{{$item.dpn_reno_cal_historical}}" target="_blank">Link</a>{{/if}}
							
							<script>
								function update_reno_cal_cmt(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_estimate_cost2/dpn_unique_id_renocal_cmt/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}
							</script>
						</td>

						<td data-col="unit_title_costs" style="background-color: {{$item.utColor}}">
							<input type="text" name="ut_cost[{{$item.chknoData}}]"
								value="{{$item.dpn_dr_r_plus_e|urldecode}}"
								onkeyup="update_ut_cost({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width:150px;" />
							<select name="ut_cname" onchange="update_cname({{$item.chknoData}}, 'dpn_dr_ut_cname', this.value)">
								<option value="">Please Select Name</option>
								{{foreach from=$data_cname key="key_cname" item="item_cname"}}
								<option value="{{$item_cname.de_id}}" {{if $item.dpn_dr_ut_cname eq $item_cname.de_id}}selected="selected"{{/if}}>{{$item_cname.de_name}}</option>
								{{/foreach}}
							</select>
							<br />
							<input type="text" name="ut[{{$item.chknoData}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic"
								id="ut_{{$item.chknoData}}" value="{{$item.dpn_dr_ut_date}}"
								onchange="update_ut_date({{$item.chknoData|ltrim:'0'}}, 'dpn_dr_ut_date', this.value);"
								onblur="update_ut_date({{$item.chknoData|ltrim:'0'}}, 'dpn_dr_ut_date', this.value);" />

							<script>
								function update_ut_cost(id, value) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_reno_extn/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

								function update_ut_date(id, column, value) {
									value = encodeURIComponent(value);
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_ebc_date/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
										}
									});
								}

								function update_cname(id, column, value) {
									if (value === '' || value === null || value === undefined) {
										value = 0;
									}
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_cname/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
										}
									});
								}
							</script>
						</td>

						{{assign var="ut_rev" value=$item.dpn_dr_ut_cmt|regex_replace:'/[^0-9.]/':''}}
						{{assign var="ut_reno" value=$item.dpn_dr_plan_revno|regex_replace:'/[^0-9.]/':''}}
						<td {{if $ut_rev neq $ut_reno}}style="background: yellow;"{{/if}}>
							<span title="planningapprovalcanberra">REV </span><input type="text"
								name="ut_com[{{$item.chknoData}}]" value="{{$item.dpn_dr_ut_cmt|urldecode}}"
								onkeyup="update_ut_cmt({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width: 120px;" />

							<br/>Cur: {{if $item.dpn_ut_link_current}} <a href="{{$item.dpn_ut_link_current}}" target="_blank">Link</a>{{/if}}
							<br/> His: {{if $item.dpn_ut_link_historical}} <a href="{{$item.dpn_ut_link_historical}}" target="_blank">Link</a>{{/if}}

							<script>
								function update_ut_cmt(id, value) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_reno_extn/dpn_unique_id_cmt/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}
							</script>
						</td>
						
						{{if strtotime($item.lmp_date) > strtotime($item.dpn_last_audit_update_at) && $item.dpn_last_audit_by > 0}}
						{{assign var="laBgColor" value="yellow"}}
						{{/if}}
						<td style="background-color: {{$laBgColor}}">
							<select name="last_audit_by" onchange="update_last_audit_by({{$item.chknoData}}, 'dpn_last_audit_by', this.value)">
								<option value="">Please Select Name</option>
								{{foreach from=$data_cname key="key_audit" item="item_audit"}}
								<option value="{{$item_audit.de_id}}" {{if $item.dpn_last_audit_by eq $item_audit.de_id}}selected="selected"{{/if}}>{{$item_audit.de_name}}</option>
								{{/foreach}}
							</select>
							<div id="la_id_{{$item.chknoData}}">{{$item.dpn_last_audit_update_at}}</div>
							<script>
								function update_last_audit_by(id, column, value) {
									const la_id = "#la_id_"+id;
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_last_audit_by/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
											$(la_id).html(result);
										}
									});
								}
							</script>
							
						</td>
						
						{{if strtotime($item.lmp_date) > strtotime($item.dpn_last_audit_cs_updated_at) && $item.dpn_last_audit_cs_by > 0}}
						{{assign var="csBgColor" value="yellow"}}
						{{/if}}
						<td style="background-color: {{$csBgColor}}">
							<select name="last_audit_by_cs" onchange="update_last_audit_by_cs({{$item.chknoData}}, 'dpn_last_audit_cs_by', this.value)">
								<option value="">Please Select Name</option>
								{{foreach from=$data_cname key="key_audit" item="item_audit"}}
								<option value="{{$item_audit.de_id}}" {{if $item.dpn_last_audit_cs_by eq $item_audit.de_id}}selected="selected"{{/if}}>{{$item_audit.de_name}}</option>
								{{/foreach}}
							</select>
							<div id="lacs_id_{{$item.chknoData}}">{{$item.dpn_last_audit_cs_updated_at}}</div>
							<script>
								function update_last_audit_by_cs(id, column, value) {
									const lacs_id = "#lacs_id_"+id;
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_estimates_report.update_last_audit_by_cs/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
											$(lacs_id).html(result);
										}
									});
								}
							</script>
							
						</td>
						
						<td>
							<a href="{{$BASE_URL}}design_estimates_report.email_preview/dpn_unique_id/{{$item.chknoData}}" class="email_htbtn various" title="Preview Email">Hot Button</a>
						</td>
						
						<td>
							<a href="{{$BASE_URL}}design_estimates_report.edit_link/dpn_unique_id/{{$item.chknoData}}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
						</td>
					</tr>
					{{assign var=countn value=$countn-1}}
					{{/foreach}}
				</tbody>
				{{/if}}
			</table>
		</div>
	</div>
</form>

{{if $last > 1}}
<table width="90%" border="0" cellpadding="0" cellspacing="0">
	<tr> {{if $list}}
		<td align="center">
			<div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>
					<< previous</span>
						{{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="
								x - y" x=$pagenum y=1}}" title="Previous">
								<< previous</a> {{/if}}

									{{if $pagenum != 1}} <span class="paginate"><a class="pagination"
											href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1"
											title="{{$page_num}} Page">1</a></span>
									{{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span
											class="paginate"><a class="pagination"
												href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2"
												title="{{$page_num}} Page">2</a></span>
										{{else}}<span class='current'>2</span> {{/if}}
											{{if $paginateprev.0 > 3}}
											...
											{{/if}}
											{{foreach from=$paginateprev key="page_key" item="page_num"}}
											{{if $page_num == $pagenum OR $page_num <= 2}}
											{{elseif $page_num == $lastone}}

											{{else}} <span class="paginate"><a class="pagination"
														href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}"
														title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
												{{/foreach}}

												{{foreach from=$paginatenext key="page_key" item="page_num2"}}
												{{if $page_num2 < $last AND $page_num2 != $lastone}}
												{{if $page_num2 == 1}}
												{{elseif $page_num2 == 2}}
												{{else}}
													{{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span
														class='current'> {{$page_num2}}</span>
													{{else}} <a class="pagination"
															href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}"
															title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
														{{/if}}
														{{/if}}
														{{/foreach}}
														{{if $page_num2 < $lasttow}}
														...
														{{/if}}
														{{if $lastone == 1}}
														{{elseif $lastone == 2}}
														{{else}}
															{{if $pagenum == $lastone }} <span
																class='current'>{{$lastone}}</span>
															{{else}} <a class="pagination"
																	href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}"
																	title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
																{{/if}}
																{{if $last == 1}}
																{{elseif $last == 2}}
																{{else}}
																	{{if $pagenum == $last}} <span
																		class='current'>{{$last}}</span>
																	{{else}} <a class="pagination"
																			href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}"
																			title="{{$last}} Page">{{$last}}</a> {{/if}}
																		{{/if}}
																		{{if $pagenum == $last}} <span
																			class='disabled'>next >></span>
																		{{else}} <a class="pagination"
																				href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="
																				x + y" x=$pagenum y=1}}"
																				title="Next">next >></a></div>
			{{/if}}
		</td>
		{{else}}
			<td align="center" height="300">Record Not found... </td>
			{{/if}}
	</tr>
</table>
{{/if}}

</div>
</div>

<script>
	function updateRecord(primaryID, column, value, updateRecord = false) {
        const formData = {
            primaryID: primaryID,
            column: column,
            value: value,
            action: "updateNextMeeting"
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
                        $('#' + column + primaryID).text(value);
                    }
                }
                else {
                    alert('Some problem in updating the record');
                }
            }
        })
    }
	function update_next_date(id, value) {
		$.ajax({
			type: "GET",
			url: "{{$BASE_URL}}design_estimates_report.update_next/dpn_unique_id_nd/" + id + "/value/" + value,
			success: function (result) {
			}
		});
	}

	function update_next_time(id, value) {
		$.ajax({
			type: "GET",
			url: "{{$BASE_URL}}design_estimates_report.update_next/dpn_unique_id_nt/" + id + "/value/" + value,
			success: function (result) {
			}
		});
	}

	function update_next_location(id, value) {
		$.ajax({
			type: "GET",
			url: "{{$BASE_URL}}design_estimates_report.update_next/dpn_unique_id_nl/" + id + "/value/" + value,
			success: function (result) {
			}
		});
	}
</script>
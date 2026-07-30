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
		var viewurl = "{{$BASE_URL}}designs_information_repository.view_procedure" + "/random/" + Math.random();

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
		width: 25px !important;
		display: inline-block;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
		padding-left: 1px !important;
		height: 25px !important;
	}

	.wrapper1,
	.wrapper2 {
		width: 100%;
		border: none 0px RED;
		overflow-x: scroll;
		overflow-y: hidden;
		scrollbar-color: yellow blue;
	}


	.wrapper1 {
		height: 20px;
	}

	.wrapper2 {}

	.div1 {
		width: 1490px;
		height: 20px;
	}

	.div2 {
		width: 1790px;
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
</style>

<h3 class="page-title">Designs Information Repository</h3>
<br />

<form name="sort" method="post">
	<div style="float:left; text-align: left; margin-left:10px; text-align:left">

	&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />

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
			<input type="submit" value="Design Agreement Date" name="dasd" />
			<input type="submit" value="Sort By Designer" name="sortbydesigner" />
		
		</div>
		<br />
		<div style="float:left;padding-left:10px;">

			<strong>Select Designer</strong>
			<select name="design">
				{{foreach from=$des_data key="keyd" item="itemd"}}
				<option value="{{$itemd.prd_name}}" {{if $ascdsc eq 1 }} selected="selected" {{/if}}>
					{{$itemd.prd_name}} </option>
				{{/foreach}}
			</select>
			<input type="submit" value="Search" name="searchdesigner" />
			&nbsp;
<!--			<strong>Select Type</strong>
			<select name="type">
				{{foreach from=$typeData key="key9" item="item9"}}
				<option value="{{$item9.dr_id}}" {{if $ascdsc eq 1 }} selected="selected" {{/if}}> {{$item9.dr_type}}
				</option>
				{{/foreach}}
			</select>-->

			<input type="submit" value="Clear Search" name="clear" />


		</div>

</form>

<form name="mlist" method="post">
	
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
					
						<th class="topmenu" align="center" valign="middle" width="3%">Checklist Numbers</th>
						<th class="topmenu" align="center" valign="middle" width="11%">Project Details</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Design Agreement Date</th>
             			<th class="topmenu" align="center" valign="middle" width="3%">BFS Requested </th>
                      	<th class="topmenu" align="center" valign="middle" width="4%">BFS</th>
                   .	<th class="topmenu" align="center" valign="middle" width="3%">Drainage </th>
                    	<th class="topmenu" align="center" valign="middle" width="3%">Survey Requested</th>
                    	<th class="topmenu" align="center" valign="middle" width="3%">Contour Survey </th>
                    	<th class="topmenu" align="center" valign="middle" width="3%">Survey Satisfactory</th>
                     	<th class="topmenu" align="center" valign="middle" width="3%">Site Visit Complete </th>
                        <th class="topmenu" align="center" valign="middle" width="3%">Commencement Plans Completed</th>
                     	<th class="topmenu" align="center" valign="middle" width="3%">Driveway Application  </th>
                    	<th class="topmenu" align="center" valign="middle" width="3%">Driveway Approval</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Tree Survey Booked </th>
                		<th class="topmenu" align="center" valign="middle" width="3%">Tree Damaging Lodged </th>
						<th class="topmenu" align="center" valign="middle" width="4%">Trees Species Implemented </th>
						<th class="topmenu" align="center" valign="middle" width="4%">Icon Survey Request </th>
						<th class="topmenu" align="center" valign="middle" width="5%">Referrals Triggered  </th>
                      	<th class="topmenu" align="center" valign="middle" width="5%">Referrals Lodged </th>
 
					</tr>
				</thead>
				{{if $list}}
				<tbody>

					<!--{{assign var=countn value= $numstartvounter}}-->
					{{assign var=countn value= $total}}

					{{foreach from=$list key="key" item="item"}}


					<tr {{if $item.dpn_dr_per_complete eq 100}} bgcolor="#99CC99" {{else}} bgcolor="{{cycle values="
						#dceff5,WHITE" advance=true}} {{/if}}">
			

						<td> {{$item.chknoData}} </td>
			
						<td>
							<strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong>
							<br />
						   <a href="{{$item.link}}" target="_blank">{{$item.bsn_address}}</a>
						</td>
                        

					  <td>{{$item.checklist45}}</td>
                      <td>{{$item.tasklist535}} </td>
				

						<td>
                        {{if $item.doc_file_name_287}}
<a href="/designs_information_repository.download_content?file_name={{$item.doc_file_name_287}}&module_name=designs_information_repository.home" >Link</a>
					 {{/if}}
						</td>
                        
						<td>{{if $item.doc_file_name_725}}
<a href="/designs_information_repository.download_content?file_name={{$item.doc_file_name_725}}&module_name=designs_information_repository.home" >Link</a>
					 {{/if}}
						</td>

		
						<td>{{$item.tasklist666}}</td>
		
						<td>{{if $item.doc_file_name_72}}
<a href="/designs_information_repository.download_content?file_name={{$item.doc_file_name_72}}&module_name=designs_information_repository.home" >Link</a>
					 {{/if}}
                      </td>
						

						<td> {{$item.tasklist799}}</td>
                       
						<td>{{$item.tasklist303}} </td>
                        
                        <td>{{if $item.doc_file_name_482}}
<a href="/designs_information_repository.download_content?file_name={{$item.doc_file_name_482}}&module_name=designs_information_repository.home" >Link</a>
					 {{/if}}<br />{{$item.doc_date_uploaded_482}} </td>
		
						<td> 
                        {{if $item.doc_file_name_430}}
<a href="/designs_information_repository.download_content?file_name={{$item.doc_file_name_430}}&module_name=designs_information_repository.home" >Link</a>
					 <br />{{$item.doc_date_uploaded_430}}
                     {{/if}}
                     </td>
                     
						<td>
                        {{if $item.doc_file_name_272}}
<a href="/designs_information_repository.download_content?file_name={{$item.doc_file_name_272}}&module_name=designs_information_repository.home" >Link</a>
					 <br />{{$item.doc_date_uploaded_272}}
                     {{/if}}
                     </td>

						<td>{{$item.tasklistP132}} </td>
		
                       
                       <td>{{$item.tasklist381}} </td>

					   <td>{{$item.tasklist148}}</td>
						
					   <td>{{$item.tasklistP123}}</td>
				
					   <td>{{$item.tasklistP29}}</td>
                            
					   <td>{{$item.tasklistP109 </td>

	
					</tr>


					{{assign var=countn value=$countn-1}}
					{{/foreach}}
				</tbody>


				{{/if}}
			</table>
</form>

{{if $last > 1}}
<table width="90%" border="0" cellpadding="0" cellspacing="0">
	<tr> {{if $list}}
		<td align="center">
			<div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>
					<< previous</span>
						{{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home_active}}/pagenum/{{math equation="
								x - y" x=$pagenum y=1}}" title="Previous">
								<< previous</a> {{/if}}

									{{if $pagenum != 1}} <span class="paginate"><a class="pagination"
											href="{{$BASE_URL}}{{$XFA.home_active}}/pagenum/1"
											title="{{$page_num}} Page">1</a></span>
									{{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span
											class="paginate"><a class="pagination"
												href="{{$BASE_URL}}{{$XFA.home_active}}/pagenum/2"
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
															href="{{$BASE_URL}}{{$XFA.home_active}}/pagenum/{{$page_num2}}"
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
																	href="{{$BASE_URL}}{{$XFA.home_active}}/pagenum/{{$lastone}}"
																	title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
																{{/if}}
																{{if $last == 1}}
																{{elseif $last == 2}}
																{{else}}
																	{{if $pagenum == $last}} <span
																		class='current'>{{$last}}</span>
																	{{else}} <a class="pagination"
																			href="{{$BASE_URL}}{{$XFA.home_active}}/pagenum/{{$last}}"
																			title="{{$last}} Page">{{$last}}</a> {{/if}}
																		{{/if}}
																		{{if $pagenum == $last}} <span
																			class='disabled'>next >></span>
																		{{else}} <a class="pagination"
																				href="{{$BASE_URL}}{{$XFA.home_active}}/pagenum/{{math equation="
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
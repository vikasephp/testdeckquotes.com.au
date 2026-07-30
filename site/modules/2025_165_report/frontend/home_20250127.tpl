{{include file=$jdata}}
{{include file=$tiny_basic}}

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<h3 class="page-title">{{$title}}</h3>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3manoj.css" />

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
		z-index: 999999 !important;
	}


	.tableFixHead {
		overflow-y: auto;
		height: 100px;
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

	function add_change_needed() {
		var viewurl = "{{$BASE_URL}}2025_165_report.view_change_needed" + "/random/" + Math.random();

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
		var viewurl = "{{$BASE_URL}}2025_165_report.view_procedure" + "/random/" + Math.random();

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
	
		function add_stage() {
		var viewurl = "{{$BASE_URL}}2025_165_report.view_stage" + "/random/" + Math.random();

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
	<div style="float:left; margin-left:5px; text-align:left;">
		&nbsp;&nbsp;
		<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
        &nbsp; &nbsp;<input type="button" name="stage_options" value="Stage Admin" onclick="javascript:add_stage();" /> <br />
        &nbsp; &nbsp; <strong>Search : </strong>
		<input type="text" name="address" value="{{$keyword}}" style="width:300px;" placeholder="Search for Address"/>
        <input type="submit" value="Search" name="search"  /> &nbsp;<input type="submit" name="clear_search" value = "Clear Search" /> 
	</div>
	<div style="float:right;">
		<input type="button" name="Add New " value="Add New"
			onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
		&nbsp;&nbsp;
	</div>
</form>

<div id="">
	<!--<table id="list-table" class="nav-back" width="100%">-->
	<table id="doclist-table" class="nav-back tableFixHead" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="3%">Action</th>
				<th class="topmenu" align="center" valign="middle" width="3%">UID</th>
				<th class="topmenu" align="center" valign="middle" width="15%">Project Addreess</th>
				<th class="topmenu" align="center" valign="middle" width="6%">DA Number</th>
				<th class="topmenu" align="center" valign="middle" width="6%">Stage</th>
                <th class="topmenu" align="center" valign="middle" width="6%">Relevant Document or Plan</th>
				<th class="topmenu" align="center" valign="middle" width="3%">How Many</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Supporting Document</th>
                <th class="topmenu" align="center" valign="middle" width="10%">Solution</th>
                <th class="topmenu" align="center" valign="middle" width="7%">Solution Implemented</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Snapshot</th>
			</tr>
		</thead>
		<tbody>
			{{assign var=countn value= $total}}
			{{foreach from=$list key="key" item="item"}}
			<tr bgcolor="#FFFFFF">
				<td>
					<a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit" style="text-decoration: none;"> 
						<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/>
					</a>
					&nbsp;&nbsp;
					<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete" style="text-decoration: none;">
						<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/>
					</a>
				</td>
				<td>{{ counter }}</td>
				<td>{{ $item.os2_project }}</td>
				<td>{{ $item.os2_da_number }}</td>
				<td>
                
                 <form name ="recmet2" method="post" action="">
                <select name="stage[{{$item.os2_id}}]" onChange="update_stage({{$item.os2_id}}, this.value)"/>
        			
                <option value="0" {{if $item.sp_www eq -1}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $stage key="key2" item="item2"}}
                <option value="{{$item2.st_id}}" {{if $item2.st_id eq $item.os2_stage}} selected="selected" {{/if}}>{{$item2.st_option}}</option>
                {{/foreach}}
                     
                </select>
                </form>
          
          <script>
			function update_stage(id,value)
			{
					 
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}2025_165_report.update_stage/os2_id/"+id+"/value/"+value,
						   success: function(result){
							
						}
						
					});
			}
	    </script>
                
                
                </td>
                
                
                <td>  
                <form name ="recmet2" method="post" action="">
                <select name="plan[{{$item.os2_id}}]" onChange="update_plan({{$item.os2_id}}, this.value)" style="width:80%"/>
        			
                <option value="0" {{if $item.os2_doc_plan eq 0}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $docplan key="key3" item="item3"}}
                <option value="{{$item3.ppc_id}}" {{if $item3.ppc_id eq $item.os2_doc_plan }} selected="selected" {{/if}}>{{$item3.ppc_document}}</option>
                {{/foreach}}
                     
                </select>
                </form>
                
                 <script>
				function update_plan(id,value)
				{
						 
						 $.ajax({
						   type: "GET",
						   url: "{{$BASE_URL}}2025_165_report.update_plan/os2_id/"+id+"/value/"+value,
							   success: function(result){
								
							}
							
						});
				}
			  </script>
                </td>
				
                <td>{{ $item.os2_how_many }}</td>
				<td>{{ $item.os2_supporting_document }}</td>
                <td>
                <form name ="recmet4" method="post" action="">
                <input type="text" name="solution" style="width:250px" value="{{$item.os2_solution}}" onkeyup="update_solution({{$item.os2_id}},this.value)"
                </form>
                 <script>
				function update_solution(id,value)
				{
						 
						 $.ajax({
						   type: "GET",
						   url: "{{$BASE_URL}}2025_165_report.update_solution/os2_id/"+id+"/value/"+value,
							   success: function(result){
								
							}
							
						});
				}
			  </script>
                </td>
                
                <td>
                <form name ="recmet3" method="post" action="">
                    <input type="hidden" name="implemented[{{$item.os2_id}}]" value="0" />
                <label class="switch">
            <input class="switch-input" type="checkbox"  name="implemented[{{$item.os2_id}}]" value="1"  onclick="this.form.submit();" {{if $item.os2_solution_imple  eq 1 }} checked="checked" {{/if}} />
                    <span class="switch-label" data-on="Yes" data-off="No"></span> 
                    <span class="switch-handle"></span> <br />
                   </label> 
                   </form>  
                </td>
                
				<td>
					{{ if $item.os2_snapshot }}
					<img data-img-name="{{ $item.os2_snapshot }}"
						data-img-id="{{ $item.os2_snapshot }}-{{ $item.os2_id }}"
						src="/2025_165_report.download_content?file_name={{ $item.os2_snapshot }}&module_name=2025_165_report.home"
						style="width:70%;cursor:pointer; padding:2px;" onclick="onClick(this)"
						class="w3-hover-opacity" />
					{{ /if }}
				</td>
			</tr>
			{{assign var=countn value=$countn-1}}
			{{/foreach}}
		</tbody>
	</table>

	<div id="modal01" class="w3-modal" onclick="this.style.display='none'" style="z-index:2222229; background-color: rgba(0, 0, 0, 0.9);">
		<span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
		<div class="w3-modal-content w3-animate-zoom">
			<img id="img01" style="max-width: 100%;">
		</div>
	</div>

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
	function onClick(element) {
		document.getElementById("img01").src = element.src;
		document.getElementById("modal01").style.display = "block";
	}
	function get_img_raw_data(myKeyVals) {
		$.ajax({
			type: 'POST',
			url: '/email_response_tracker.get_image_raw_data',
			data: myKeyVals,
			dataType: "json",
			success: function (resultData) {
				if (resultData.status == 'true') {
					var img_raw_data = resultData.data.rawImgData;
					var file_name = resultData.data.fileName;
					var file_id = resultData.data.id;
					$('#doclist-table img[data-img-id="' + file_id + '"]').attr("src", img_raw_data);
				}
			}
		});
	}
	$(document).ready(function () {
		$("#doclist-table tr img.w3-hover-opacity").each(function () {
			var file_name = $.trim($(this).attr("data-img-name"))
			var id = $.trim($(this).attr("data-img-id"));
			var myKeyVals = { "file_name": file_name, "id": id };
			get_img_raw_data(myKeyVals);
		})
	})
</script>
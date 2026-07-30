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
	#fancybox-wrap {z-index:9999999;} 
</style>
{{include file=$jdata}}
{{include file=$tiny_basic}}
<script>
    !window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script>
    function onClick(element) {
		document.getElementById("img01").src = element.src;
		document.getElementById("modal01").style.display = "block";
	}
    function open_popup(type) {
        let viewurl = '';
        if(type == 'manage_procedure'){
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_procedure" + "/random/" + Math.random();
        }
        else if(type == 'manage_type'){
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES[0].view_fle_name }}" + "/random/" + Math.random();
			
        }
		else if(type == 'manage_plan'){
           viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_plans" + "/random/" + Math.random();
        }
        else if(type == 'add_new'){
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.detail" + "/random/" + Math.random();
        }
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
    function open_type() {
		$('#record_type').show();
	}
	function close_type() {
		$('#record_type').hide();
	}
</script>
<h3 class="page-title">{{$title}}</h3>
<br />
<form name="mlist" method="post" enctype="multipart/form-data">
    <div style="float:left; text-align:left;">
        &nbsp; &nbsp;
        <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:open_popup('manage_procedure');" />
        <input type="button" name="Add New" value="Add Type" onclick="javascript:open_popup('manage_type');" />
        <input type="button" name="Add Plan" value="Add Plan" onclick="javascript:open_popup('manage_plan');" />
        <input type="button" name="View All" value="Type" onclick="javascript:open_type();" />
        <br />
		&nbsp; &nbsp;
		<strong>Search by Designer: </strong>
		<input type="text" name="search_designer" value="{{$search_designer}}" style="width:300px;" placeholder="Search for Designer" />
		<input type="submit" value="Search" name="search" />
        &nbsp;
        <input type="submit" name="reset" value="Clear Search" />
        <br />
		&nbsp; &nbsp;
		<strong>Search by Architect: </strong>
		<input type="text" name="search_architect" value="{{$search_architect}}" style="width:300px;" placeholder="Search for Architect" />
		<input type="submit" value="Search" name="search" />
        &nbsp;
        <input type="submit" name="reset" value="Clear Search" />
		<br>
		&nbsp; &nbsp;
		<strong>Search by Project : </strong>
        <input type="text" name="search_project" value="{{$search_project}}" style="width:243px;" list="search_project" />
        <datalist id="search_project">
            {{ foreach from=$projdetail key="index" item="row" }}
            <option value="{{ $row.bsn_name }}" {{ if $row.bsn_name eq $search_project }}selected{{ /if }}>{{ $row.bsn_name }}</option>
            {{ /foreach }}
        </datalist>
        <input type="submit" value="Search" name="search" />
        &nbsp;
        <input type="submit" name="reset" value="Clear Search" />
        <br>
		&nbsp; &nbsp;
		<strong>Search by Type : </strong>
		<select name="search_type" style="width: 243px;">
            <option value="">Please Select</option>
            {{ assign var=option_col value=$ATTRIBUTES[0].option_col }}
            {{ assign var=option_id value=$ATTRIBUTES[0].id }}
            {{ foreach from=$typedata key="index" item="row" }}
            <option value="{{ $row.$option_id }}" {{ if $row.$option_id eq $search_type }}selected{{ /if }}>{{ $row.$option_col }}</option>
            {{ /foreach }}
		</select>
        <input type="submit" value="Search" name="search" />
        <br />
        <strong>Search by Plans : </strong>
		 <select name="search_plans"/>
                    <option value="0" >Please Select </option>
                    {{foreach from = $plansData key="key5" item="item5"}}
                    <option value="{{$item5.dp_id}}" >{{$item5.dp_option}}</option>
                    {{/foreach}}
         </select>
        <input type="submit" value="Search" name="search" />
        
        &nbsp;
        <input type="submit" name="reset" value="Clear Search" />
    </div>
    <div style="float:right; text-align:right;">
        <input type="submit" name="reset" title="Reset" value="Reset">
        <input type="submit" value="Show Hidden" name="show_hidden" />
        <input type="button" name="Add New" value="Add New" onclick="javascript:open_popup('add_new');" />
    </div>
</form>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" data-col="sn" width="3%">S.N.</th>
                <th class="topmenu" align="center" valign="middle" data-col="project" width="15%">Project</th>
                <th class="topmenu" align="center" valign="middle" data-col="title">Plan</th>
                <th class="topmenu" align="center" valign="middle" data-col="date_logged">Date Logged</th>
                <th class="topmenu" align="center" valign="middle" data-col="mistake">Mistake</th>
                <th class="topmenu" align="center" valign="middle" data-col="type">Type</th>
                <th class="topmenu" align="center" valign="middle" data-col="snapshot" width="5%">Snaphshot</th>
                <th class="topmenu" align="center" valign="middle" data-col="architect_responsible">Architect Responsible</th>
                <th class="topmenu" align="center" valign="middle" data-col="designer">Designer</th>
                <th class="topmenu" align="center" valign="middle" data-col="who_picked_up">Who Picked up</th>
                <th class="topmenu" align="center" valign="middle" data-col="bonus_approved">Bonus Approved</th>
                <th class="topmenu" align="center" valign="middle" data-col="example_evidence">Example/Evidence</th>
                <th class="topmenu" align="center" valign="middle" data-col="solution">Solution</th>
                <th class="topmenu" align="center" valign="middle" data-col="solution_implemented">Solution Implemented</th>
                <th class="topmenu" align="center" valign="middle" data-col="hide">Hide</th>
                <th class="topmenu" align="center" valign="middle" data-col="action">Action</th>
            </tr>
        </thead>
        <tbody>
            {{ foreach from=$list key="key" item="item" }}
            <tr bgcolor="{{ cycle values="#D3E8D6,WHITE" advance=true }}">
                <td data-col="sn">{{ counter }}</td>
                <td data-col="project" style="width: 236px;">{{ $projectArr[$item.dpml_bsn_id] }}</td>
                <td data-col="title">
              
           <form name ="recmet4" method="post" action="">
              <select name="plans[{{$item.dpml_id}}]" onChange="update_plans({{$item.dpml_id}}, this.value)"/>
                    <option value="0" {{if $item.dpml_plan eq "0"}} selected="selected" {{/if}}>Please Select </option>
                    {{foreach from = $plansData key="key5" item="item5"}}
                    <option value="{{$item5.dp_id}}" {{if $item5.dp_id eq $item.dpml_plan}} selected="selected" {{/if}}>{{$item5.dp_option}}</option>
                    {{/foreach}}
                         
              </select>
   		 </form>
       
          <script>
			function update_plans(id,value)
			{
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}design_plans_mistake_log.update_plans/dpml_id/"+id+"/value/"+value,
						     success: function(result){
								 
						}
					});
			}
	    </script>
                
                </td>
                <td data-col="date_logged">{{ $item.dpml_logged_date|date_format:'%d-%m-%Y' }}</td>
                <td data-col="mistake">{{ $item.dpml_mistake }}</td>
                <td data-col="type">
                    <select name="{{$TABLE}}[dpml_type_id]" style="width: auto;" onchange="updateRecord('{{ $item.$ID }}', 'dpml_type_id', this.value)">
                        <option value="0">Please Select</option>
                        {{ assign var=option_col value=$ATTRIBUTES[0].option_col }}
                        {{ assign var=option_id value=$ATTRIBUTES[0].id }}
                        {{ foreach from=$typedata key="index" item="row" }}
                        <option value="{{ $row.$option_id }}" {{ if $row.$option_id eq $item.dpml_type_id }}selected{{ /if }}>{{ $row.$option_col }}</option>
                        {{ /foreach }}
                    </select>
               
                </td>
                <td data-col="snapshot">
                    {{ if $item.dpml_snapshot }}
                        <img data-img-name="{{ $item.dpml_snapshot }}"
                            data-img-id="{{ $item.dpml_snapshot }}-{{ $item.dpml_id }}"
                            src="/{{ $BASEFOLDER }}.download_content?file_name={{ $item.dpml_snapshot }}&module_name={{ $BASEFOLDER }}.home"
                            style="width:99%;cursor:pointer; padding:2px;" onclick="onClick(this)"
                            class="w3-hover-opacity" />
                        <!-- <a href="/{{ $BASEFOLDER }}.download_content?file_name={{$item.dpml_snapshot}}&module_name={{ $BASEFOLDER }}.home" target="_blank">Download</a> -->
                    {{ /if }}
                </td>
                <td data-col="architect_responsible">
                    <select name="{{$TABLE}}[dpml_architect_responsible]" style="width: 165px;" onchange="updateRecord('{{ $item.$ID }}', 'dpml_architect_responsible', this.value)">
                        <option value="0">Please Select</option>
                        {{ foreach from=$userData key="index" item="row" }}
                        <option value="{{ $row.user_name }}" {{ if $row.user_name eq $item.dpml_architect_responsible }}selected{{ /if }}>{{ $row.user_name }}</option>
                        {{ /foreach }}
                    </select>
                </td>
                <td data-col="designer">
                    <select name="{{$TABLE}}[dpml_designer]" style="width: 165px;" onchange="updateRecord('{{ $item.$ID }}', 'dpml_designer', this.value)">
                        <option value="0">Please Select</option>
                        {{ foreach from=$userData key="index" item="row" }}
                        <option value="{{ $row.user_name }}" {{ if $row.user_name eq $item.dpml_designer }}selected{{ /if }}>{{ $row.user_name }}</option>
                        {{ /foreach }}
                    </select>
                </td>
                <td data-col="who_picked_up">
                    <select name="{{$TABLE}}[dpml_who_picked_up]" style="width: 165px;" onchange="updateRecord('{{ $item.$ID }}', 'dpml_who_picked_up', this.value)">
                        <option value="0">Please Select</option>
                        {{ foreach from=$userData key="index" item="row" }}
                        <option value="{{ $row.user_name }}" {{ if $row.user_name eq $item.dpml_who_picked_up }}selected{{ /if }}>{{ $row.user_name }}</option>
                        {{ /foreach }}
                    </select>
                </td>
                <td data-col="bonus_approved">
                    <label class="switch" for="bonus_approved[{{ $item.$ID }}]">
						<input id="bonus_approved[{{ $item.$ID }}]" class="switch-input" {{ if $item.dpml_bonus_approved == 1 }}checked{{ /if }} onchange="displayToggle('{{ $item.$ID }}', 'dpml_bonus_approved', this)" type="checkbox" />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
                </td>
                <td data-col="example_evidence" style="white-space: nowrap;">
                {{if $item.dpml_example_evidence}}
                <a href="{{$item.dpml_example_evidence}}" target="_blank">Link</a>
                {{/if}}
                   <!-- <form name="cal" method="post" enctype="multipart/form-data"> 
                        <input type="hidden" name="{{ $ID }}" value="{{ $item.$ID }}"  />
                        <input type="file" name="dpml_example_evidence" style="width: 175px;" />
                        <input type= "submit" name="save_dpml_example_evidence" title="Save" value="Upload" class="set2">
                    </form>
                    {{ if $item.dpml_example_evidence }}
                        <a href="/{{ $BASEFOLDER }}.download_content?file_name={{$item.dpml_example_evidence}}&module_name={{ $BASEFOLDER }}.home" target="_blank">Download</a>
                        <a href="/{{ $BASEFOLDER }}.delete_dpml_example_evidence/{{ $ID }}/{{ $item.$ID }}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
                    {{ /if }}-->
                 
                </td>
                <td data-col="solution">{{ $item.dpml_solution }}</td>
                <td data-col="solution_implemented">
                    <label class="switch" for="solution_implemented[{{ $item.$ID }}]">
						<input id="solution_implemented[{{ $item.$ID }}]" class="switch-input" {{ if $item.dpml_solution_implemented == 1 }}checked{{ /if }} onchange="displayToggle('{{ $item.$ID }}', 'dpml_solution_implemented', this)" type="checkbox" />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
                </td>
                <td data-col="hide">
                    <label class="switch" for="hide[{{ $item.$ID }}]">
						<input id="hide[{{ $item.$ID }}]" class="switch-input" {{ if $item.$HIDE_COL == 1 }}checked{{ /if }} onchange="displayToggle('{{ $item.$ID }}', '{{ $HIDE_COL }}', this)" type="checkbox" />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
                </td>
                <td data-col="action">
                    <a href="/{{ $BASEFOLDER }}.detail/{{ $ID }}/{{  $item.$ID }}" class="various" title="Edit"><img style="height:20px; width:20px;" src="https://www.deckquotes.com.au/css/admin/images/edit.png" alt=""></a>
					<a href="/{{ $BASEFOLDER }}.delete/{{ $ID }}/{{  $item.$ID }}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img style="height:20px; width:20px;" src="https://www.deckquotes.com.au/css/admin/images/delete.png" alt=""></a>
                </td>
            </tr>
            {{ /foreach }}
        </tbody>
    </table>
    <div id="modal01" class="w3-modal" onclick="this.style.display='none'"
		style="z-index:2222229; background-color: rgba(0, 0, 0, 0.9);">
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
<div style="display: none; position: fixed; min-height:350px; z-index:9999999; width: 90%; height: 90%; top: 30px; left: 5%; background: white;" id="record_type">
	<h3 class="page-title">
		<br />
		Type
	</h3>
	<a id="fancybox-close" style="display: inline;" onclick="javascript:close_type();"></a>
	<table border="1" style="font-weight: bold; width: 70%;" cellpadding="3">
		{{ foreach from = $record_type key="key" item="item" }}
		<tr>
			<th style="width: 80%">{{ $item.dpmlt_option }}</th>
			<td style="text-align: center;">
				<form name="recmet2" method="post" action="{{ $BASE_URL }}{{ $XFA.home }}" style="margin: 0;">
					<input type="hidden" name="search_type" value="{{ $item.dpml_type_id }}">
					<input type="submit" name="filter_plan_breach" title="View {{ $item.dpmlt_option }}"
						value="{{ $item.total }}" style="margin: 0; width: 40px; text-align: center;">
				</form>
			</td>
		</tr>
		{{ /foreach }}
		<tr>
			<th>Please Select</th>
			<td style="text-align: center;">
				<form name="recmet2" method="post" action="{{ $BASE_URL }}{{ $XFA.home }}" style="margin: 0;">
					<input type="hidden" name="search_type" value="0">
					<input type="submit" name="filter_plan_breach" title="View Please Select"
						value="{{ $no_type_total }}" style="margin: 0; width: 40px; text-align: center;">
				</form>
			</td>
		</tr>
		<tr>
			<th colspan="2" style="padding-right: 7%; text-align: right;">
				Total: {{ $total_records }}
			</th>
		</tr>
	</table>
	<div style="text-align: center; margin: 20px 0;">
		<input type="button" value="Close" onclick="javascript:close_type();" class="vsml" />
	</div>
</div>
<script>
    function updateRecord(primaryID, column, value) {
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
                    // alert('You have successfully updated the record');
                }
                else {
                    alert('Some problem in updating the record');
                }
            }
        })
    }

    function displayToggle(record_id, c, t) {
        let activeStatus = 0;
        if ($(t).is(":checked")) {
            activeStatus = 1;
        }
        const formData = {
            r_ID: record_id,
            column: c,
            activeStatus: activeStatus,
            action: "displayToggle"
        };
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}{{ $BASEFOLDER }}.ajax_handler",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success == true) {
                    const url = window.location;
                    window.location = url;
                    // alert('You have successfully updated the record');
                }
                else {
                    alert('Some problem in updating the record');
                }
            }
        })
    }
</script>
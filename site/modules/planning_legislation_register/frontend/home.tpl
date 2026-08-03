<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}
<script>
    !window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<style>
    .input-group {
        position: relative;
        display: flex;
        flex-wrap: wrap;
        align-items: stretch;
        width: 100%;
    }
    .input-group-text {
        display: flex;
        align-items: center;
        padding: .375rem .75rem;
        font-weight: 500;
        color: #212529;
        text-align: center;
        white-space: nowrap;
        background-color: #f8f9fa;
        border: 1px solid #dee2e6;
        border-radius: 0.375rem;
    }
    .input-group > .form-control {
        position: relative;
        flex: 1 1 auto;
        width: 1%;
        min-width: 0;
        margin-bottom: 0;
    }
    .input-group:not(.has-validation) > :not(:last-child):not(.dropdown-toggle):not(.dropdown-menu):not(.form-floating) {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
    }
    .input-group > :not(:first-child):not(.dropdown-menu):not(.valid-tooltip):not(.valid-feedback):not(.invalid-tooltip):not(.invalid-feedback) {
        margin-left: calc(1px * -1);
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
    }
    .dtpic {
		width: 65px !important;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
	}
</style>
<script>

    function open_popup(type) {
        let viewurl = '';
        if (type == 'manage_procedure') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_procedure" + "/random/" + Math.random();
        }
		else if (type == 'add_detail') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.add_detail" + "/random/" + Math.random();
		}
		else if (type == 'manage_type') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_type" + "/random/" + Math.random();
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
</script>
<h3 class="page-title">{{$title}}</h3>
<br />
<form name="mlist" method="post" enctype="multipart/form-data">
    <div style="float:left; text-align:left;">
        <div>
            <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:open_popup('manage_procedure');" />
            <input type="button" name="type_admin" value="Document Type Admin" onclick="javascript:open_popup('manage_type');" />
        </div>
    </div>
    <div style="float:right; text-align:right;">
		<input type="button" name="add_detail" value="Add New" onclick="javascript:open_popup('add_detail');" />
    </div>
</form>
<form method="post" enctype="multipart/form-data">
    <label>Select PDF file:</label>
    <input type="file" name="pdf_file" accept="application/pdf" required>
    <button type="submit">
        Convert to HTML
    </button>
</form>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="7%">Source Document Id</th>
                <th class="topmenu" align="center" valign="middle">Document Name</th>
                <th class="topmenu" align="center" valign="middle">Document Type</th>
                <th class="topmenu" align="center" valign="middle">Original Format</th>
                <th class="topmenu" align="center" valign="middle">Source</th>
                <th class="topmenu" align="center" valign="middle">PDF</th>
                <th class="topmenu" align="center" valign="middle">Public HTML URL</th>
                <th class="topmenu" align="center" valign="middle">Public HTML Status</th>
                <th class="topmenu" align="center" valign="middle">Code/Instrument</th>
                <th class="topmenu" align="center" valign="middle">Effective Date</th>
                <th class="topmenu" align="center" valign="middle">Subject</th>
                <th class="topmenu" align="center" valign="middle">QA</th>

                <th class="topmenu" align="center" valign="middle">Action</th>
            </tr>
        </thead>
        <tbody>
			{{assign var="bac_count" value=1}}
            {{ foreach from=$list key="key" item="item" }}
            <tr bgcolor='{{ cycle values=" #D3E8D6,WHITE" advance=true }}' id="row_{{ $item.$ID }}">
                <td data-col="sn">{{$item.plr_id}}</td>
                
                <td data-col="sn">{{$item.plr_doc_name}}</td>
                
                <td>
					
                    <form id="myForm" method="post" >
                        <select name="type[{{$item.plr_id}}]" onchange="this.form.submit()">
                            <option value="-1">Please Select Status</option>
                            {{foreach from=$typedata key="key2" item="item2"}}
                                <option value="{{$item2.pd_id}}|{{$item2.pd_hierarchy}}" {{if $item.plr_doc_type eq $item2.pd_id}}selected="selected"{{/if}}>
                                    {{$item2.pd_doc_type}}
                                </option>
                            {{/foreach}}
                        </select>
                    </form>
                                                                     
					<script>
						function update_type(id, value) {
						
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_type/plr_id/" + id + "/value/" + value,
								success: function (result) {
									
								}
							});
						}
					</script>
				</td>
                
                 <td>
					
                    <form id="myForm2" method="post" >
                        <select name="of[{{$item.plr_id}}]" onchange="update_of({{$item.plr_id}},this.value)">
                            <option value="0" {{if  $item.plr_original_format eq 0 }} selected="selected" {{/if}}>Please Select </option>
                            <option value="1" {{if  $item.plr_original_format eq 1 }} selected="selected" {{/if}}>HTML</option>
                            <option value="2" {{if  $item.plr_original_format eq 2 }} selected="selected" {{/if}}>PDF</option>
                            <option value="3" {{if  $item.plr_original_format eq 3 }} selected="selected" {{/if}}>HTML + PDF</option>     
                        </select>
                    </form>
                                                                     
					<script>
						function update_of(id, value) {
							
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_of/plr_id/" + id + "/value/" + value,
								success: function (result) {
									
								}
							});
						}
					</script>
				</td>
                
                <td>
					{{if $item.plr_original_source}}
						<a href="{{$item.plr_original_source}}" target="_blank">Link</a><br />
                        {{$item.plr_osource_date}}
					{{/if}}
				</td>
                
                
                 <td>
					{{if $item.plr_original_pdf}}
						<a href="{{$item.plr_original_pdf}}" target="_blank">Link</a><br />
                        {{$item.plr_opdf_date}}
					{{/if}}
				</td>
                
                
                 
                 <td>
					<!--{{if $item.plr_int_html_url}}
						<a href="{{$item.plr_int_html_url}}" target="_blank">Link</a><br />
                        {{$item.plr_int_html_url_date}}
					{{/if}}-->
					{{ if $item.plr_int_html_url }}
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$item.plr_int_html_url}}&module_name={{$BASEFOLDER}}.home" target="_blank">Link</a>
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.delete_form_files/plr_id/{{$item.plr_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
					{{/if}}
				</td>
                
                <td>
					
                    <form id="myForm3" method="post" >
                        <select name="internal[{{$item.plr_id}}]" onchange="update_internal({{$item.plr_id}},this.value)">
                          	<option value="0" {{if  $item.plr_int_html_status eq 0 }} selected="selected" {{/if}}>Please Select </option>
							<option value="1" {{if  $item.plr_int_html_status eq 1 }} selected="selected" {{/if}}>Not Started</option>
							<option value="2" {{if  $item.plr_int_html_status eq 2 }} selected="selected" {{/if}}>In Progress</option>
                    		<option value="3" {{if  $item.plr_int_html_status eq 3 }} selected="selected" {{/if}}>Complete</option>  
                        </select>
                    </form>
                                                                     
					<script>
						function update_internal(id, value) {
							
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_internal/plr_id/" + id + "/value/" + value,
								success: function (result) {
									
								}
							});
						}
					</script>
				</td>
                
			
			    <td> {{$item.plr_code}} </td>
                <td> {{$item.plr_edate}} </td>
				<td>{{$item.plr_subject}}</td>
		
			                
                <td>
                		<input name="same" type="checkbox" {{if $item.plr_qa eq 1}} checked="checked" {{/if}} onclick="update_qa({{$item.plr_id}},this.checked)">
							<script>
								function update_qa(id, value) {
									var tana10 = "#temp" + id;
									
									var val = 0;
									if (value == true) {
										val = 1;
									}
									if (value == false) {
										val = 2;
									}
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}planning_legislation_register.update_qa/plr_id/" + id + "/value/" + val,
										success: function (result) {
											$(tana10).html(result);
										}
									});
								}
							</script>
                            
                  <div id="temp{{$item.plr_id}}"> {{if $item.plr_qa == 1}} {{$item.plr_qa_user}}<br />{{$item.plr_qa_date}} {{/if}}</div>          
                 </td>
                
				
				
				<td data-col="action">
                    <a href="{{$BASE_URL}}{{$BASEFOLDER}}.add_detail/plr_id/{{$item.plr_id}}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png" alt=""></a>
                    <a href="{{$BASE_URL}}{{$BASEFOLDER}}.delete_detail/plr_id/{{$item.plr_id}}" onclick="javascript:if(!confirm('Are you sure want to delete this detail with Record Number {{$bac_count}}?')) return false;" title="Delete"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png" alt=""></a>
                </td>
            </tr>
			{{assign var="bac_count" value=$bac_count+1}}
            {{ /foreach }}
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
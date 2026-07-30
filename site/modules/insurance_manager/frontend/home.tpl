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
		} else if (type == 'manage_status') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_status" + "/random/" + Math.random();
		}  else if (type == 'manage_template_email') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_email_template" + "/random/" + Math.random();
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
            <input type="button" name="type_admin" value="Type Admin" onclick="javascript:open_popup('manage_type');" />
			&nbsp;&nbsp;
			<input type="button" name="status_admin" value="Status Admin" onclick="javascript:open_popup('manage_status');" />
			&nbsp;&nbsp;
            <input type="button" name="template_email_admin" value="Template Email Admin" onclick="javascript:open_popup('manage_template_email');" />
			&nbsp;&nbsp;
            
            <br />
			&nbsp;<strong>Filter By Type :</strong>
			<select name="type">
                <option value="0">Please Select </option>
                {{foreach from=$typeData key="key1" item="item1"}}
                    <option value="{{$item1.imt_id}}" >{{$item1.imt_type}}</option>
                {{/foreach}}
			</select>
            
             <br />
			&nbsp;<strong>Filter By Status :</strong>
			<select name="status">
                <option value="0">Please Select </option>
                {{foreach from=$statusData key="key11" item="item11"}}
                    <option value="{{$item11.ims_id}}" >{{$item11.ims_status}}</option>
                {{/foreach}}
			</select>
            
              <br />
			&nbsp;<strong>Filter By Responsible Person :</strong>
			<select name="person">
                <option value="0">Please Select </option>
                {{foreach from=$contactdata key="key22" item="item22"}}
                    <option value="{{$item22.cs_id}}" >{{$item22.cs_first_name}} {{$item22.cs_surname}}</option>
                {{/foreach}}
			</select>
            
            <br />
            &nbsp;<strong>Filter By Responsible Broker :</strong>
			<select name="broker">
                <option value="0">Please Select </option>
                {{foreach from=$brokerdata key="key22" item="item22"}}
                    <option value="{{$item22.cs_id}}" >{{$item22.cs_first_name}} {{$item22.cs_surname}}</option>
                {{/foreach}}
			</select>
             
            
             <br />
			&nbsp;<strong>Search By Expiry Date :</strong>
			<input type="text" name="exp_date"  style="width:150px;" class="w16em dateformat-d-ds-m-ds-Y" />

			<input type="submit" value="Search" name="sub_type_search" />
			<input type="submit" name="clear" value="Clear Filter">
        </div>
    </div>
    <div style="float:right; text-align:right;">

		<input type="button" name="add_detail" value="Add New" onclick="javascript:open_popup('add_detail');" />
    </div>
</form>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle">ID</th>
                <th class="topmenu" align="center" valign="middle">Types</th>
                <th class="topmenu" align="center" valign="middle">Status</th>
                <th class="topmenu" align="center" valign="middle">Forms</th>
                <th class="topmenu" align="center" valign="middle">Expiry Date</th>
                <th class="topmenu" align="center" valign="middle">Insurance Guide</th>
                <th class="topmenu" align="center" valign="middle">Template Email</th>
                <th class="topmenu" align="center" valign="middle">Responsible Person </th>
                <th class="topmenu" align="center" valign="middle">Responsible Broker</th>
                <th class="topmenu" align="center" valign="middle">Supporting Documents</th>
                <th class="topmenu" align="center" valign="middle">Action</th>
            </tr>
        </thead>
        <tbody>
			{{assign var="bac_count" value=1}}
            {{ foreach from=$list key="key" item="item" }}
            <tr bgcolor='{{ cycle values=" #D3E8D6,WHITE" advance=true }}' id="row_{{ $item.$ID }}">
                <td data-col="sn">{{$item.im_id}}</td>
                <td>
					<select name="type[{{$item.im_id}}]" onChange="update_type({{$item.im_id}}, this.value)" />
						<option value="-1">Please Select Status</option>
						{{foreach from=$typeData key="key2" item="item2"}}
						<option value="{{$item2.imt_id}}" {{if $item.im_type eq $item2.imt_id}}selected="selected"{{/if}}>{{$item2.imt_type}}</option>
						{{/foreach}}
					</select>
			
					<script>
						function update_type(id, value) {
						
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_type/im_id/" + id + "/value/" + value,
								success: function (result) {
									
								}
							});
						}
					</script>
				</td>
                
                <td>
					<select name="status[{{$item.im_id}}]" onChange="update_status({{$item.im_id}}, this.value)" />
						<option value="-1">Please Select Status</option>
						{{foreach from=$statusData key="key2" item="item2"}}
						<option value="{{$item2.ims_id}}" {{if $item.im_status eq $item2.ims_id}}selected="selected"{{/if}}>{{$item2.ims_status}}</option>
						{{/foreach}}
					</select>
			
					<script>
						function update_status(id, value) {
						
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_status/im_id/" + id + "/value/" + value,
								success: function (result) {
									
								}
							});
						}
					</script>
				</td>
                
              	<td data-col="additinal_file">
                    <form name="cal" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="{{ $ID }}" value="{{ $item.$ID }}" />
                        <input type="file" name="form_files[]" multiple style="width: 175px;" />
                        <input type="submit" name="save_form_files" title="Save" value="Upload" class="set2">
                    </form>
                    
                    {{ assign var=primary_id value=$item.$ID }}
                    {{ if !empty($additionalFilesArr.$primary_id) }}
                    {{ foreach from=$additionalFilesArr.$primary_id key="index" item="file" }}
                    <a href="{{$BASE_URL}}{{ $BASEFOLDER }}.download_content?file_name={{$file}}&module_name={{ $BASEFOLDER }}.home" target="_blank">Download</a>
                    <a href="{{$BASE_URL}}/insurance_manager.delete_form_files/imf_id/{{ $index }}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
                    <br>
                    {{ /foreach }}
                    {{ /if }}
                </td>
                
                
                <td>{{$item.im_expiry_date}}</td>
                
				<td>
					{{if $item.im_insurance_guide}}
						<a href="{{$item.im_insurance_guide}}" target="_blank">Link</a>
					{{/if}}
				</td>
			
			    <td>
                <select name="type[{{$item.im_id}}]" onChange="update_template({{$item.im_id}}, this.value)" />
						<option value="-1">Please Select Status</option>
						{{foreach from=$emailData key="key5" item="item5"}}
						<option value="{{$item5.ime_id}}" {{if $item.im_template_email  eq $item5.ime_id}}selected="selected"{{/if}}>{{$item5.ime_email_template}}</option>
						{{/foreach}}
				</select>
			
					<script>
						function update_template(id, value) {
							var tana10 = "#temp" + id;
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_template/im_id/" + id + "/value/" + value,
								success: function (result) {
										$(tana10).html(result);
								}
							});
						}
					</script>
                     
                      <div id="temp{{$item.im_id}}">{{$item.im_temp_email_user}}<br />{{$item.im_temp_email_date}} </div>
                    
                    {{if $item.im_template_email}}
                    	<br /><a href="{{$BASE_URL}}/emaillibrary.compose/eml_id/{{$item.eml_id}}" target="_blank">Send Email</a>
                    {{/if}}    
                </td>
			
				<td>
					<select name="person[{{$item.im_id}}]" onChange="update_person({{$item.im_id}}, this.value)" />
						<option value="-1">Please Select</option>
						{{foreach from=$contactdata key="key3" item="item3"}}
						<option value="{{$item3.cs_id}}" {{if $item.im_responsible_person eq $item3.cs_id}}selected="selected"{{/if}}>{{$item3.cs_first_name}} {{$item3.cs_surname}}</option>
						{{/foreach}}
					</select>
			
					<script>
						function update_person(id, value) {
							var tana20 = "#person" + id;
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_person/im_id/" + id + "/value/" + value,
								success: function (result) {
									$(tana20).html(result);
								}
							});
						}
					</script>
                    
                   
                       <div id="person{{$item.im_id}}">{{$item.im_resp_person_user}}<br />{{$item.im_resp_person_date}} </div>
				</td>
		
			                
                <td>
					<select name="person[{{$item.im_id}}]" onChange="update_broker({{$item.im_id}}, this.value)" />
						<option value="-1">Please Select</option>
						{{foreach from=$brokerdata key="key3" item="item3"}}
						<option value="{{$item3.cs_id}}" {{if $item.im_responsible_broker eq $item3.cs_id}}selected="selected"{{/if}}>{{$item3.cs_first_name}} {{$item3.cs_surname}}</option>
						{{/foreach}}
					</select>
			
					<script>
						function update_broker(id, value) {
							var tana30 = "#broker" + id;
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_broker/im_id/" + id + "/value/" + value,
								success: function (result) {
									$(tana30).html(result);
								}
							});
						}
					</script>
                    
                    
                       <div id="broker{{$item.im_id}}">{{$item.im_resp_broker_user}}<br />{{$item.im_resp_broker_date}} </div>
				</td>
                
				
				<td data-col="additinal_file">
                    <form name="cal" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="{{ $ID }}" value="{{ $item.$ID }}" />
                        <input type="file" name="supporting_docs[]" multiple style="width: 175px;" />
                        <input type="submit" name="save_supporting_docs" title="Save" value="Upload" class="set2">
                    </form>
                    
                    {{ assign var=primary_id value=$item.$ID }}
                    {{ if !empty($additionalFilesArrSD.$primary_id) }}
                    {{ foreach from=$additionalFilesArrSD.$primary_id key="index" item="file" }}
                    <a href="{{$BASE_URL}}{{ $BASEFOLDER }}.download_content?file_name={{$file}}&module_name={{ $BASEFOLDER }}.home" target="_blank">Download</a>
                    <a href="{{$BASE_URL}}/insurance_manager.delete_supporting_docs/imd_id/{{ $index }}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
                    <br>
                    {{ /foreach }}
                    {{ /if }}
                </td>
				<td data-col="action">
                    <a href="{{$BASE_URL}}{{$BASEFOLDER}}.add_detail/im_id/{{$item.im_id}}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png" alt=""></a>
                    <a href="{{$BASE_URL}}{{$BASEFOLDER}}.delete_detail/im_id/{{$item.im_id}}" onclick="javascript:if(!confirm('Are you sure want to delete this detail with Record Number {{$bac_count}}?')) return false;" title="Delete"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png" alt=""></a>
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
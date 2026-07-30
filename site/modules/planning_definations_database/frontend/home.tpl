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
	.total_records {
		margin-right: 10px;
	}
	.total_records, .records_sync {
		display: inline-block;
		font-size: 16px;
		font-weight: bold;
		border: 2px solid gray;
		border-radius: 10px;
		padding: 12px 22px;
		background: #fbf3f3;
	}
	.rec_num {
		color: #8484f9;
		display: block;
		font-size: 25px;
	}
	.pdd_appr form label {
		margin: 0;
	}
	.pdd_appr form {
		margin-bottom: 2px;
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

			&nbsp;&nbsp;
            
            <br />
			&nbsp;<strong>Search By Defination :</strong>
			<input type="text" name="defination"  style="width:200px;" />
            
             <br />
             &nbsp;<strong>Search By :</strong>
			 <input type="text" name="term"  style="width:300px;"  placeholder="Search by Source OR Legal Meaning OR Plain English"/>
			
			<input type="submit" value="Search" name="sub_type_search" />
			<input type="submit" name="clear" value="Clear Filter">
        </div>
    </div>
	
	<div class="" style="text-align: center;">
		<div class="total_records">
			<span class="rec_num">{{$total_records}}</span>
			<span>Total Records</span>
		</div>
		<div class="records_sync">
			<span class="rec_num">{{$synced_records}}</span>
			<span>Records Synced</span>
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
            
                <th class="topmenu" align="center" valign="middle">Defination</th>
                <th class="topmenu" align="center" valign="middle">Source</th>
                <th class="topmenu" align="center" valign="middle">Legal Meaning</th>
                <th class="topmenu" align="center" valign="middle">Planing English</th>
				<th class="topmenu" align="center" valign="middle">Icon</th>
				<th class="topmenu" align="center" valign="middle">Image</th>
				<th class="topmenu" align="center" valign="middle">Image Description</th>
				<th class="topmenu" align="center" valign="middle">Image Note</th>
				<th class="topmenu" align="center" valign="middle">QAED</th> 
                <th class="topmenu" align="center" valign="middle">Synced</th>
                <th class="topmenu" align="center" valign="middle">Last Updated</th>
                <th class="topmenu" align="center" valign="middle">Action</th>
            </tr>
        </thead>
        <tbody>
			{{assign var="bac_count" value=1}}
            {{ foreach from=$list key="key" item="item" }}
            <tr bgcolor='{{ cycle values=" #D3E8D6,WHITE" advance=true }}' id="row_{{ $item.$ID }}">
                
                <td>{{$item.pdd_defination}}</td>
                      
                <td>{{$item.pdd_source}}</td>
                
				<td>{{$item.pdd_meaning}}</td>
			
			    <td>{{$item.pdd_plain_english}}</td>
				
				<td>
					{{if $item.pdd_icon}}
				<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$item.pdd_icon}}&module_name={{$BASEFOLDER}}.home" target="_blank" title="{{$item.pdd_icon}}">Link</a>
				{{/if}}
				</td>
				
				<td>
					{{if $item.pdd_image}}
					<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$item.pdd_image}}&module_name={{$BASEFOLDER}}.home" target="_blank" title="{{$item.pdd_image}}">Link</a>
					{{/if}}
				</td>
				
				<td>{{$item.pdd_image_description}}</td>
				<td>{{$item.pdd_image_note}}</td>
				
				<td class="pdd_appr" {{if $item.pdd_qaed_approval_1 neq 1 || $item.pdd_qaed_approval_2 neq 1 }}style="background-color:red;"{{/if}}>
					<form name="recmet3" method="post" action="">
						<input type="hidden" name="qaed_approval_1[{{$item.pdd_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="qaed_approval_1[{{$item.pdd_id}}]" value="1" {{if $item.pdd_qaed_approval_1 eq 1 }} checked="checked" {{/if}} 
							onclick="{{if $item.pdd_qaed_approval_2 eq 1 && $item.pdd_qaed_approval_2_by == $smarty.session.user.user_id}} if (this.checked) {alert('You cannot perform Approval 1 because you performed Approval 2.'); return false;} {{/if}} this.form.submit();"
							/>
							<span class="switch-label" data-on="Yes" data-off="No" {{if $item.pdd_qaed_approval_2 eq 1 && $item.pdd_qaed_approval_2_by == $smarty.session.user.user_id }}title="You cannot perform Approval 1 because you performed Approval 2"{{else}}title="QAED Approval 1"{{/if}} ></span> 
							<span class="switch-handle"></span> <br />
						</label> 
					</form>  
					{{if $item.pdd_qaed_approval_1 eq 1}} 
						{{$item.pdd_qaed_approval_1_by_name}} - {{$item.pdd_qaed_approval_1_at|date_format:"%d-%m-%Y"}} 
					{{else}}
						Not Reviewed
					{{/if}}	
					
					<form name="recmet3" method="post" action="" style="margin-top: 5px;">
						<input type="hidden" name="qaed_approval_2[{{$item.pdd_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="qaed_approval_2[{{$item.pdd_id}}]" value="1" {{if $item.pdd_qaed_approval_2 eq 1 }} checked="checked" {{/if}}
							onclick="{{if $item.pdd_qaed_approval_1 eq 1 && $item.pdd_qaed_approval_1_by == $smarty.session.user.user_id}} if (this.checked) {alert('You cannot perform Approval 2 because you performed Approval 1.'); return false;} {{/if}} this.form.submit();"
							/>
							<span class="switch-label" data-on="Yes" data-off="No" {{if $item.pdd_qaed_approval_1 eq 1 && $item.pdd_qaed_approval_1_by == $smarty.session.user.user_id }}title="You cannot perform Approval 2 because you performed Approval 1"{{else}}title="QAED Approval 2"{{/if}} ></span> 
							<span class="switch-handle"></span> <br />
						</label> 
					</form>  
					{{if $item.pdd_qaed_approval_2 eq 1}} 
						{{$item.pdd_qaed_approval_2_by_name}} - {{$item.pdd_qaed_approval_2_at|date_format:"%d-%m-%Y"}} 
					{{else}}
						Not Reviewed
					{{/if}}	
				</td>
			
				<td>
                 <form name ="recmet3" method="post" action="">
                    <input type="hidden" name="sync[{{$item.pdd_id}}]" value="0" />
					<label class="switch">
					<input class="switch-input" type="checkbox"  name="sync[{{$item.pdd_id}}]" value="1"  onclick="this.form.submit();" {{if $item.pdd_sync eq 1 }} checked="checked" {{/if}} />
                    <span class="switch-label" data-on="Yes" data-off="No"></span> 
                    <span class="switch-handle"></span> <br />
                   </label> 
                   </form>  
				{{if $item.pdd_sync eq 1}} {{$item.pdd_sync_date}}<br />{{$item.pdd_sync_user}} {{/if}}	
				</td>
				
                <td> {{$item.pdd_last_updated}}</td>

				<td data-col="action">
                    <a href="{{$BASE_URL}}{{$BASEFOLDER}}.add_detail/pdd_id/{{$item.pdd_id}}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png" alt=""></a>
					{{if $item.pdd_sync eq 1}}
					<a href="javascript:void(0);" onclick="alert('Please Unsync First to Delete this Record'); return false;" title="Please Unsync First to Delete this Record">
					<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
					{{else}}
					<a href="{{$BASE_URL}}{{$BASEFOLDER}}.delete_detail/pdd_id/{{$item.pdd_id}}" onclick="javascript:if(!confirm('Are you sure want to delete this detail with Record Number {{$bac_count}}?')) return false;" title="Delete"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png" alt=""></a>
					{{/if}}
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
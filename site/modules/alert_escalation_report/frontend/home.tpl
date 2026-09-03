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
            <input type="button" name="proc_panel" value="Send Email" onclick="javascript:open_popup('send_email');" />
        </div>
    </div>
   
</form>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle">Alert Number</th>
                <th class="topmenu" align="center" valign="middle">Project Address</th>
                <th class="topmenu" align="center" valign="middle">Problem</th>
                <th class="topmenu" align="center" valign="middle">Photos</th>
                <th class="topmenu" align="center" valign="middle">Escalation Notes</th>
                <th class="topmenu" align="center" valign="middle">Escalation Date</th>
                <th class="topmenu" align="center" valign="middle">Escalation Reason</th>
                <th class="topmenu" align="center" valign="middle">Escalation Photos</th>
                <th class="topmenu" align="center" valign="middle">De-escalate</th>
            </tr>
        </thead>
        
        <tbody>
			{{assign var="bac_count" value=1}}
            {{ foreach from=$list key="key" item="item" }}
            <tr bgcolor='{{ cycle values=" #D3E8D6,WHITE" advance=true }}' id="row_{{ $item.$ID }}">
            
            <td data-col="sn">{{$item.car_id}}</td>

            <td>{{$item.car_project|stripslashes}}</td>
                
			<td>{{$item.car_alert}}</td>
			
			<td>
                
                {{if $item.car_image1}}
						<div style="text-align:center;">
							{{ if $item.car_image1_newdesign }}
								  <a href="{{$BASE_URL}}{{ $BASEFOLDER2 }}.download_content?file_name={{$item.car_image1}}&module_name={{ $BASEFOLDER2 }}.home" target="_blank">
                          
                               Photo 1</a>
							{{ else }}
								  <a href="{{$BASE_URL}}files/uploads/{{$item.car_image1}}" target="_blank"><img data-src="{{$BASE_URL}}files/uploads/{{$item.car_image1}}" class="lazy">Photo 1</a>
							{{ /if }}
						</div>
					{{/if}}
					{{if $item.car_image2}}
						<div style="text-align:center;">
							{{ if $item.car_image2_newdesign }}
								  <a href="{{$BASE_URL}}{{ $BASEFOLDER2 }}.download_content?file_name={{$item.car_image2}}&module_name={{ $BASEFOLDER2 }}.home" target="_blank">
                              
                               Photo 2 </a>
							{{ else }}
								  <a href="{{$BASE_URL}}files/uploads/{{$item.car_image2}}" target="_blank"><img data-src="{{$BASE_URL}}files/uploads/{{$item.car_image2}}" class="lazy">Photo 2</a>
							{{ /if }}
						</div>
					{{/if}}
					{{if $item.car_image3}}
						<div style="text-align:center;">
							{{ if $item.car_image3_newdesign }}
								  <a href="{{$BASE_URL}}{{ $BASEFOLDER2 }}.download_content?file_name={{$item.car_image3}}&module_name={{ $BASEFOLDER2 }}.home" target="_blank">
                            
                               Photo 3</a>
							{{ else }}
								 <a href="{{$BASE_URL}}files/uploads/{{$item.car_image3}}" target="_blank"><img data-src="{{$BASE_URL}}files/uploads/{{$item.car_image3}}" class="lazy">Photo 3</a>
							{{ /if }}
						</div>
					{{/if}}
					{{if $item.car_image4}}
						<div style="text-align:center;">
							{{ if $item.car_image4_newdesign }}
								  <a href="{{$BASE_URL}}{{ $BASEFOLDER2 }}.download_content?file_name={{$item.car_image4}}&module_name={{ $BASEFOLDER2 }}.home" target="_blank">
                         
                               Photo 4 </a>
							{{ else }}
								 <a href="{{$BASE_URL}}files/uploads/{{$item.car_image4}}" target="_blank"><img data-src="{{$BASE_URL}}files/uploads/{{$item.car_image4}}" class="lazy">Photo 4</a>
							{{ /if }}
						</div>
					{{/if}}
					{{if $item.car_image5}}
						<div style="text-align:center;">
							{{ if $item.car_image5_newdesign }}
								  <a href="{{$BASE_URL}}{{ $BASEFOLDER2 }}.download_content?file_name={{$item.car_image5}}&module_name={{ $BASEFOLDER2 }}.home" target="_blank">
                         
                              Photo 5</a>
							{{ else }}
								 <a href="{{$BASE_URL}}files/uploads/{{$item.car_image5}}" target="_blank"><img data-src="{{$BASE_URL}}files/uploads/{{$item.car_image5}}" class="lazy">Photo 5</a>
							{{ /if }}
						</div>
					{{/if}}
					
				</td>
		
			                
                <td>
                <a href="{{$BASE_URL}}alert_escalation_report.view_notes/car_id/{{$item.car_id}}" class="various">Notes</a><br />
                {{$item.latest_notes}} - {{$item.cn_date}}
					
				</td>

				<td align="center">{{$item.car_escalation_date}}</td>
                <td align="center">{{$item.car_esc_reason}}</td>
               <td>
               
                 {{foreach from=$item.photo_data key="key1" item="item1"}}
                  {{if $item1.aep_photo}}
                    <a href="/alert_escalation_report.download_content?file_name={{$item1.aep_photo}}&module_name=alert_escalation_report.home" target="_blank" /> Download</a>
                   	 
                     <a href="{{$BASE_URL}}alert_escalation_report.delete_photo/aep_id/{{$item1.aep_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" />
                     </a>
                     <br />
                     {{/if}}
                    
                {{/foreach}}
					<form name="ps" method="post" enctype="multipart/form-data">
						<input type="hidden" name="car_id" value="{{$item.car_id}}" />
						<input type="file" name="esc_photo" />
						<br />
						<input type="submit" name="save_photo" title="Save" value="Upload" class="but">
						&nbsp;
					</form>
                </td>
                         
				<td>
					<form name="recmet3" method="post" action="">
						<input type="hidden" name="deescalate[{{$item.car_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="deescalate[{{$item.car_id}}]" value="0"
								onclick="this.form.submit();" {{if $item.car_add_to_ae eq 1 }} checked="checked"
								{{/if}}>
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
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
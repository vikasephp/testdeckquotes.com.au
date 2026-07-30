<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery-1.7.2.js"></script>
<script> 
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" >  
	$(document).ready(function() {
		$(".various").fancybox({
			'width': '90%',
			'height': '90%',
			'autoScale': false,
			 'transitionIn' : 'elastic',
			 'transitionOut' : 'elastic',
			 'speedIn' : 300,
			 'speedOut' : 300,
			 'overlayShow' : true,
			 'hideOnOverlayClick':false,
			 'hideOnContentClick':false,
			 'type': 'iframe',
			 'scrolling': 'yes' 
		});
		
		$(".variousSlug").fancybox({
			'width': '50%',
			'height': '50%',
			'autoScale': false,
			 'transitionIn' : 'elastic',
			 'transitionOut' : 'elastic',
			 'speedIn' : 300,
			 'speedOut' : 300,
			 'overlayShow' : true,
			 'hideOnOverlayClick':false,
			 'hideOnContentClick':false,
			 'type': 'iframe',
			 'scrolling': 'yes' 
		});
		
		
		$(".view").fancybox({
			'autoScale': true,
			 'transitionIn' : 'elastic',
			 'transitionOut' : 'elastic',
			 'speedIn' : 300,
			 'speedOut' : 300,
			 'overlayShow' : true,
			 'hideOnOverlayClick':false,
			 'hideOnContentClick':false,
			 'scrolling': 'yes' 
		});			
	});
	$(document).ready(function() {
		$(".fancybox").fancybox();
	});
	
function add_new(URL)
 {
var viewurl = URL+ "/random/" + Math.random();	
 $(document).ready(function () {
	$.fancybox({
			'width': '90%',
			'height': '90%',
			'autoScale': false,
			'transitionIn' : 'elastic',
			'transitionOut' : 'elastic',
			'speedIn' : 300,
			'speedOut' : 300,
			'overlayShow' : true,
			'overlayColor' : '#000',
			'hideOnOverlayClick':false,
			'hideOnContentClick':false,
			'type': 'iframe',
			'href': viewurl,
			'scrolling': 'yes' 
	});
});
}


function open_popup(type) {
	let viewurl = '';
	if (type == 'add_procedure') {
		viewurl = "{{$BASE_URL}}{{$BASEFOLDER}}.view_procedure" + "/random/" + Math.random();
	}
	else if (type == 'view_topic') {
		viewurl = "{{$BASE_URL}}{{$BASEFOLDER}}.view_topic" + "/random/" + Math.random();
	}
	else if (type == 'view_approvalworkflow') {
		viewurl = "{{$BASE_URL}}{{$BASEFOLDER}}.view_aw" + "/random/" + Math.random();
	}
	else if (type == 'view_public_ranking_data') {
		viewurl = "{{$BASE_URL}}{{$BASEFOLDER}}.view_prd" + "/random/" + Math.random();
	}
	
	$(document).ready(function () {
		$.fancybox({
			'width': '90%',
			'height': '99%',
			'autoScale': false,
			'transitionIn': 'elastic',
			'transitionOut': 'elastic',
			'speedIn': 400,
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

function close_win()
	{
	$.fancybox.close();
	window.location.href = window.location.href;
	}
</script>

<style>
#fancybox-inner{
	 overflow:scroll;
	-webkit-overflow-scrolling: touch;
}

 #TheFancybox {
     overflow:auto;
     -webkit-overflow-scrolling:touch;
     width: 100%;
     height: 100%;  
    }
#fancybox-content {
 	overflow:auto;
     -webkit-overflow-scrolling:touch;
     width: 100%;
     height: 100%; 
 }
 #fancybox-wrap {z-index:9999999;} 
.quick_filters {
	display: inline-block;
	text-align: left;
	width: 97%;
	margin-left: 18px;
	border: 1px solid #c3b4b4;
	padding: 10px 10px 5px;
	margin-bottom: 15px;
	border-radius: 4px;
}
.quick_filters .qf_title {
	text-transform: uppercase;
    font-weight: bold;
    font-size: 14px;
    margin-right: 15px;
}
.qf_active {
	background: #8b8beb !important;
}
</style>


<script type="text/javascript" >  

$(document).ready(function(){
	var maxLength = 100;
	$(".show-read-more").each(function(){
		var myStr = $(this).text();
		if($.trim(myStr).length > maxLength){
			var newStr = myStr.substring(0, maxLength);
			var removedStr = myStr.substring(maxLength, $.trim(myStr).length);
			$(this).empty().html(newStr);
			$(this).append( ' &nbsp; &nbsp;<a href="javascript:void(0);" class="read-more">Read More...</a>');
			$(this).append('<span class="more-text">' + removedStr + '</span>');
		}
	});
	$(".read-more").click(function(){
		$(this).siblings(".more-text").contents().unwrap();
		$(this).remove();
	});
});
</script>

{{if $showPopup}}
<script>
$(document).ready(function(){
	
	view_prd = "{{$BASE_URL}}{{$BASEFOLDER}}.view_prd" + "/random/" + Math.random();
	$.fancybox({
		'width': '90%',
		'height': '99%',
		'autoScale': false,
		'transitionIn': 'elastic',
		'transitionOut': 'elastic',
		'speedIn': 400,
		'speedOut': 300,
		'overlayShow': true,
		'overlayColor': '#000',
		'hideOnOverlayClick': false,
		'hideOnContentClick': false,
		'type': 'iframe',
		'href': view_prd,
		'scrolling': 'yes'
	});
});
</script>
{{/if}}

<style>
    .show-read-more .more-text{
        display: none;	
    }
	.read-more {
		font-weight:bold;
	}
</style>

<h3 class="page-title">{{$title}} - Testing the Push via github</h3>


 <div style="float:left; text-align:left;">
 <form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post" style="display: inline-block;width: 100%;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:open_popup('add_procedure');" />
	<!--&nbsp;&nbsp;<input type="button" name="topic" value="Topic Admin" onclick="javascript:open_popup('view_topic');" />
	&nbsp;&nbsp;<input type="button" name="topic" value="Approval Workflow Admin" onclick="javascript:open_popup('view_approvalworkflow');" />--><br />
    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search By Q/A:</strong>&nbsp;&nbsp;</span>
    <input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:330px;" placeholder="Enter Question Or Answer Text"/>
    &nbsp;&nbsp;
    <input type="submit" value="Search" name="search"  />
    <br />
    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search By Factsheet:</strong>&nbsp;&nbsp;</span>
    <select name="{{$TABLE}}[fs]" style="width:310px;">
    <option value="">Please Select</option>
    {{foreach from = $document_list key="key" item="item"}}
    <option value="{{$item.doc_id}}"> {{$item.doc_name}}</option>
    {{/foreach}}
    </select>&nbsp;&nbsp;
    <input type="submit" value="Search" name="search"  />
    <br />
    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search By QAID:</strong>&nbsp;&nbsp;</span>
    <input type="text" name="{{$TABLE}}[qaid]" value="{{$keywordqaid}}" style="width:80px;" placeholder="Enter QAID"/>
    &nbsp;&nbsp;
    <input type="submit" value="Search" name="search"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" value="Reset Search" name="showall"  />
    </form>
 </div>

<div style="float:right;">
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post" style="display: inline-block;width: 100%;">
	<input type="button" value="Download Public Ranking File" onclick="document.location.href='{{$BASE_URL}}{{$BASEFOLDER}}.home/export/1'" />
	<!--<input type="submit" name="hidden" value="Show Hidden">-->
    <input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
    <input type="submit" value="Print" name="print"  />
	</form>
	<br/>
	<div style="border: 2px dotted green; border-radius: 10px; padding: 6px; display: inline-block;">
			<form method="post" enctype="multipart/form-data">
				<input type="file" name="pr_excel_file" accept=".xls,.xlsx,.csv">
				<input type="submit" name="uploadPRFile" value="Upload Public Ranking File">
			</form>
		</div>
 </div>
 
<br/><br/>
<div class="quick_filters">
<span class="qf_title">Quick Filters:</span>
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post" style="display: inline-block;">
	<input type="submit" name="all" value="Show All ({{$filter_counts.total}})" {{if $all eq 1}}class="qf_active" {{/if}}>
	<input type="submit" name="public" value="Public ({{$filter_counts.public_count}})" {{if $public eq 1}}class="qf_active" {{/if}}>
	<input type="submit" name="internal" value="Internal ({{$filter_counts.internal_count}})" {{if $internal eq 1}}class="qf_active" {{/if}}>
	<input type="submit" name="synced" value="Synced ({{$filter_counts.synced_count}})" {{if $synced eq 1}}class="qf_active" {{/if}}>
	<input type="submit" name="not_synced" value="Not Synced ({{$filter_counts.not_synced_count}})" {{if $not_synced eq 1}}class="qf_active" {{/if}}>
	<input type="submit" name="hidden" value="Hidden ({{$filter_hidden_count}})" {{if $hidden eq 1}}class="qf_active" {{/if}}
	<input type="submit" name="ranked" value="Ranked ({{$filter_counts.ranked_count}})" {{if $ranked eq 1}}class="qf_active" {{/if}}>
	<input type="submit" name="unranked" value="Unranked ({{$filter_counts.unranked_count}})" {{if $unranked eq 1}}class="qf_active" {{/if}}>
	<input type="submit" name="incomplete" value="Incomplete ({{$filter_counts.incomplete_count}})" {{if $incomplete eq 1}}class="qf_active" {{/if}}>
</form>
</div>


<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="2%">QAIDDO</th> 
				<th class="topmenu" align="center" valign="middle" width="5%">Public Rank</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Audience</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Slug</th>
                <th class="topmenu" align="center" valign="middle" width="30%">Question</th> 
                <th class="topmenu" align="center" valign="middle" width="30%">Answer</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Short Answer</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Key Points</th>
				<th class="topmenu" align="center" valign="middle" width="20%">Detailed Explanation</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Graphic</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Attachment</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Sync</th>
				<!--<th class="topmenu" align="center" valign="middle" width="5%">Notes</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Topic</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Approval Workflow</th>-->
				<th class="topmenu" align="center" valign="middle" width="5%">Hide</th>
                <th class="topmenu" align="center" valign="middle" width="10%">Action</th>   
            </tr>
        </thead>
<tbody>
 {{foreach from=$list key="key" item="item"}}
  
 	 <tr {{if $item.docqa_qed eq 1 }} bgcolor='{{cycle values="#D3E8D6,WHITE" advance=true}}' {{else}} bgcolor="#FF0000" {{/if}}>
		<td style="color:#000;">QAIDDO{{$item.docqa_id}}</td>
		<td>
			<form method="post" action="">
				<input type="number" name="docqa_public_rank[{{$item.docqa_id}}]" value="{{if $item.docqa_public_rank gt 0}}{{$item.docqa_public_rank}}{{/if}}" min="1" step="1" oninput="this.value=this.value.replace(/[^0-9]/g,''); if(this.value && parseInt(this.value)<1) this.value=1;">
				<input type="submit" value="Update" class="vsml">
			</form>
		</td>
		<td>
			<select name="audience[{{$item.docqa_id}}]" onchange="update_audience({{$item.docqa_id}}, this.value)">
				<option value="Internal" {{if  $item.docqa_audience eq 'Internal' }} selected="selected" {{/if}}>Internal</option>
				<option value="Public" {{if  $item.docqa_audience eq 'Public' }} selected="selected" {{/if}}>Public</option>
			</select>
			<div id="audi_{{$item.docqa_id}}">
				{{if $item.docqa_audience_updated_by }}
					{{$item.docqa_audience_updated_by}}<br/>
					{{$item.docqa_audience_updated_at|date_format:"%d-%m-%Y"}}
				{{/if}}
			</div>
			<script>
				function update_audience(id, value) {
					var audi_id = '#audi_' + id;
					$.ajax({
						type: "GET",
						url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_audience/docqa_id/" + id + "/value/" + encodeURIComponent(value),
						success: function (result) {
							$(audi_id).html(result);
						}
					});
				}
			</script>
		</td>
		<td>
			{{if $item.docqa_slug}}
				<a href="{{$BASE_URL}}{{$BASEFOLDER}}.view_slug/docqa_id/{{$item.docqa_id}}" title="View Slug" class="variousSlug">View Slug</a>
			{{/if}}
		</td>
		<td style="color:#000;">
			<div class="show-read-more"></div>
			{{$item.docqa_question}}
			{{if $item.docqa_question}}
			<a href="{{$BASE_URL}}{{$BASEFOLDER}}.view_question_history/docqa_id/{{$item.docqa_id}}" title="Question History" class="various">View Question History</a><br/>
			{{/if}}
			{{if $item.docqa_question_updated_by and $item.docqa_question }}
				{{$item.docqa_question_updated_by}}<br/>
				{{$item.docqa_question_updated_at|date_format:"%d-%m-%Y"}}
			{{/if}}
		</td>
		<td style="color:#000;">
			<div class="show-read-more"></div>
			<div title="{{$item.docqa_answer|strip_tags}}">{{$item.docqa_answer}}</div>
			{{if $item.docqa_answer}}
			<a href="{{$BASE_URL}}{{$BASEFOLDER}}.view_answer_history/docqa_id/{{$item.docqa_id}}" title="Answer History" class="various">View Answer History</a><br/>
			{{/if}}
			{{if $item.docqa_answer_updated_by and $item.docqa_answer }}
				{{$item.docqa_answer_updated_by}}<br/>
				{{$item.docqa_answer_updated_at|date_format:"%d-%m-%Y"}}
			{{/if}}
		</td>
		<td>{{$item.docqa_short_answer}}</td>
		<td>{{$item.docqa_key_points}}</td>
		<td style="min-width: 150px; max-width: 150px;">{{$item.docqa_detail_explanation}}</td>
		<td>
			{{if $item.docqa_graphic}}
			<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$item.docqa_graphic}}&module_name=dual_occupancy_qa.graphic" target="_blank" title="{{$item.docqa_graphic}}">Link</a>
			{{/if}}
		</td>
		<td style="color:#000;">
			{{if $item.docqa_attachment}}
			<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$item.docqa_attachment}}&module_name=dual_occupancy_qa.home" target="_blank">
			{{ $item.docqa_attachment}}</a>{{/if}}
		</td>
		<td>
			<form name="recmet3" method="post" action="">
				<input type="hidden" name="approved[{{$item.docqa_id}}]" value="0">
				<label class="switch">
					<input class="switch-input" type="checkbox" name="approved[{{$item.docqa_id}}]" value="1" onclick="this.form.submit();" {{if $item.docqa_approved eq 1 }} checked="checked" {{/if}} />
					<span class="switch-label" data-on="Yes" data-off="No" {{if $item.docqa_approved eq 1 }} title="Approved"{{else}}title="Not Approved"{{/if}}></span>
					<span class="switch-handle"></span> <br />
				</label>
			</form>
			{{if $item.docqa_approved eq 1 }}
				{{$item.docqa_approved_by}}<br/>
				{{$item.docqa_approved_at|date_format:"%d-%m-%Y"}}
			{{/if}}
		</td>
		<!--<td>
			<a href="{{$BASE_URL}}{{$BASEFOLDER}}.view_notes/docqa_id/{{$item.docqa_id}}" class="various">Notes</a>
			{{if $item.note_date}}
				<br/>
				{{$item.note_date|date_format:"%d-%m-%Y"}}
			{{/if}}
		</td>
		<td data-col="topic">
			<select name="doc_topic[{{$item.docqa_id}}]" onchange="update_topic({{$item.docqa_id}}, this.value)">
				<option value="">Please Select</option>
				{{foreach from=$data_topic key="key_topic" item="item_topic"}}
				<option value="{{$item_topic.docqat_id}}" {{if $item_topic.docqat_id == $item.docqa_topic_id}} selected="selected" {{/if}}>
					{{$item_topic.docqat_option}}
				</option>
				{{/foreach}}
			</select>
			<div id="topic_{{$item.docqa_id}}">
			{{if $item.docqa_topic_id gt 0}}
				{{$item.docqa_updated_by}}<br/>
				{{$item.docqa_updated_at|date_format:"%d-%m-%Y"}}
			{{/if}}
			</div>
			<script>
				function update_topic(id, value) {
					var tid = '#topic_' + id;
					$.ajax({
						type: "GET",
						url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_topic/docqa_id/" + id + "/value/" + value,
						success: function (result) {
							$(tid).html(result);
						}
					});
				}
			</script>
		</td>
		<td data-col="aw">
			<select name="doc_aw[{{$item.docqa_id}}]" onchange="update_aw({{$item.docqa_id}}, this.value)">
				<option value="">Please Select</option>
				{{foreach from=$data_aw key="key_aw" item="item_aw"}}
				<option value="{{$item_aw.docqaw_id}}" {{if $item_aw.docqaw_id == $item.docqa_docqaw_id}} selected="selected" {{/if}}>
					{{$item_aw.docqaw_option}}
				</option>
				{{/foreach}}
			</select>
			<div id="aw_{{$item.docqa_id}}">
			{{if $item.docqa_docqaw_id gt 0}}
				{{$item.docqa_docqaw_update_by}}<br/>
				{{$item.docqa_docqaw_updated_at|date_format:"%d-%m-%Y"}}
			{{/if}}
			</div>
			<script>
				function update_aw(id, value) {
					var awid = '#aw_' + id;
					$.ajax({
						type: "GET",
						url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_aw/docqa_id/" + id + "/value/" + value,
						success: function (result) {
							$(awid).html(result);
						}
					});
				}
			</script>
		</td>-->
		<td>
			<form name="recmet3" method="post" action="">
				<input type="hidden" name="hide[{{$item.docqa_id}}]" value="0">
				<label class="switch">
					<input class="switch-input" type="checkbox" name="hide[{{$item.docqa_id}}]" value="1" onclick="this.form.submit();" {{if $item.docqa_hide eq 1 }} checked="checked" {{/if}} />
					<span class="switch-label" data-on="Yes" data-off="No"></span>
					<span class="switch-handle"></span> <br />
				</label>
			</form>
			{{if $item.docqa_hide eq 1 }}
				{{$item.docqa_hide_updated_by}}<br/>
				{{$item.docqa_hide_updated_at|date_format:"%d-%m-%Y"}}
			{{/if}}
		</td>
		<td style="color:#000;">
			<a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="" target="_blank" title="Edit">
			<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
			{{if $item.docqa_approved eq 1 }}
			<a href="javascript:void(0);" onclick="alert('Please Unsync First to Delete this Record'); return false;" title="Please Unsync First to Delete this Record">
			<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
			{{else}}
			<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
			<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
			{{/if}}
			&nbsp;&nbsp
			<a href="{{$BASE_URL}}{{$BASEFOLDER}}.viewqa/{{$ID}}/{{$item.$ID}}" class="various" title="View">
			<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/viewqa.png"/></a>
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
<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">&#171; previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next &#187;</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next &#187;</a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>
{{/if}}
 </tr>
</table> 
{{/if}}
</div>
</form>
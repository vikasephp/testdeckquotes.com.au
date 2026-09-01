<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		


<style>
.set2 { font-size:10px !important; 
       width:60px !important; display:inline-block; 
	  padding-top:1px !important;
	  padding-bottom: 1px !important;
	  padding-left:1px !important;
	  height:25px !important; 
	  margin-top:7px;}
	  
.set3 { font-size:10px !important; 
       width:120px !important; display:inline-block; 
	  padding-top:1px !important;
	  padding-bottom: 1px !important;
	  padding-left:1px !important;
	  height:25px !important; 
	  margin-top:7px;}	  
	  
#fancybox-wrap {z-index:9999999;} 

.dtpic {
	width:65px !important;
	padding-top:1px !important;
	padding-bottom:1px !important;	
}
</style>

<script language="javascript">
function add_procedure()
{
	var viewurl = "{{$BASE_URL}}certifier_structural_engineer.view_procedure"+ "/random/" + Math.random();	
        $(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '99%',
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

function cseRefreshSummary(bsnId)
{
	if (!bsnId || !window.jQuery) {
		return;
	}
	var stage = '{{$show}}';
	$.ajax({
		url: '{{$BASE_URL}}certifier_structural_engineer.home/ajax_pending/1/bsn_id/' + bsnId + '/stage/' + stage + '/random/' + Math.random(),
		dataType: 'text',
		success: function(raw) {
			var data = null;
			try {
				var start = raw.indexOf('{');
				var end = raw.lastIndexOf('}');
				if (start >= 0 && end > start) {
					data = $.parseJSON(raw.substring(start, end + 1));
				}
			} catch (e) {}
			if (!data) {
				return;
			}
			var pending = data.pending;
			var needle = 'bsn_id/' + bsnId;
			var $row = $('a[href*="' + needle + '"]').closest('tr');
			if (!$row.length) {
				$row = $('tr').filter(function() {
					return (($(this).html() || '').indexOf(needle) !== -1);
				}).first();
			}
			if (!$row.length) {
				return;
			}
			$row.find('td').each(function() {
				var html = $(this).html() || '';
				if (/Pending Documents/i.test(html)) {
					$(this).html(html.replace(/(Pending Documents[^0-9]*)(\d+)/i, '$1' + pending));
				} else if (/Pending/i.test(html)) {
					$(this).html(html.replace(/(Pending[^0-9]*)(\d+)/i, '$1' + pending));
				}
			});
		}
	});
}
window.cseRefreshSummary = cseRefreshSummary;

function close_win()
{
	if (window.jQuery && jQuery.fancybox) {
		jQuery.fancybox.close();
	}
	window.location.href = window.location.href;
}

</script>
<h3 class="page-title">{{$title}}</h3><br />
<h3 class="page-title">{{$report}}</h3><br />


<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">

<div style="float:left; text-align:left; margin-left:5px;">
<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
<input type="Submit" name="floorsystem" value="Floor System" /> 
<input type="submit" name="presheet" value="Pre Sheet"  /> 
<input type="submit" name="final" value="Final"  /> 


 <br/>
<strong>Project search :</strong> 
<datalist id='project'>
	{{foreach from=$project_data key="keyp" item="itemp"}}
	<option value="{{$itemp.cs_project}}">
		{{$itemp.cs_project}}
	</option>
	{{/foreach}}
</datalist>
<input type="text"  list='project' name="search_proj" value="{{$search_proj}}" style="width:350px;" /><br />
<strong>Location search :</strong> 
<!--<input type="text"  name="search_location" value="{{$search_location}}" style="width:150px;" />-->
<select name="search_location" style="width:150px;">
<option value="">Select Location</option>
<option value="North" {{if $search_location eq 'North'}} selected="selected"{{/if}}>North</option>
<option value="South" {{if $search_location eq 'South'}} selected="selected"{{/if}}>South</option>
</select>
<input type="submit" value="Search Location" name="location_search" />
<strong>QA :</strong>
<select name="search_qa" style="width:80px;">
<option value="">All</option>
<option value="yes" {{if $search_qa eq 'yes'}} selected="selected"{{/if}}>Yes</option>
<option value="no" {{if $search_qa eq 'no'}} selected="selected"{{/if}}>No</option>
</select>
<input type="submit" value="Search QA" name="qa_search" />
<input type="submit" name="clear" value="Clear All Filter">
<input type="submit" name="update_color" value="Update Color" style="background:#C6C"  /> 
</div>

<div style="float:right; text-align:right;"> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>

<div id="">
   
   <!------ $construction_handover, $calendar is  defined in frontend.php ------->
   
  {{if $show eq 1 }}  
 	{{include file=$floorsystem}} 
  {{elseif $show eq 2}}
  	{{include file=$pre_sheet}}
  {{elseif $show eq 3}}
  	{{include file=$final}}  
                
  {{/if}}      
  
    
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
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
{{if $list}}
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript">
function target_popup(form) {

//				valid = false;
//		//var check_id =document.getElementById('include_id').value; 
//		  var check_ids = document.print_qa.include_id;
//					for(var i=0; i< check_ids.length; i++)
//						{
//						check_ids[i].checked?chk++:null;
//						}
//		alert(chk);			
	
    window.open('', 'formpopup', 'width=850,height=600,resizeable,scrollbars');
    form.target = 'formpopup';
	
}
</script>

<form name="print_qa" action="{{$BASE_URL}}{{$XFA.buyer_qa_email}}" method="post" onsubmit="target_popup(this);"> 

 <div style="position: static; bottom:8px; padding-top:7px; margin-bottom:2px; width:100%; " align="left">
     &nbsp;&nbsp;&nbsp;&nbsp;<strong>List Type:</strong> &nbsp;
     <select name="qa_list_type" style="width:120px;" class="iframe_element">
        <option value="selected">Selected</option>
        <option value="answered">Answered</option>
        <option value="unanswered">Unanswered</option>
     </select>
    &nbsp;&nbsp;<input type="submit" name="print_QA" value="Print" class="iframe_button">
    &nbsp;<!--<input type="submit" name="print_QA_email" value="Print & Email" class="iframe_button" />-->
    &nbsp;<input type="submit" name="print_QA_edit_email" value="Print & Edit Email" class="iframe_button" />
    </div>

	<input type="hidden" name="qa_print[bus_id]" value="{{$bus_id}}" />
    <input type="hidden" name="qa_print[bus_name]" value="{{$bus_name}}"  />   
<table cellpadding="0" cellspacing="0" width="100%" id="list-table">

<tr bgcolor="#CCCCCC"><th>Action</th><th>Customer</th><th>Question</th><th>Que. Date</th>
<th>Answer</th><th>Business Stream</th><th> Source</th><th> Que User</th>    <th>Include in&nbsp;Report <button type="button" id="selectAll" class="main"> Select All</button> </th>
<!--<th>Include in Auto Q/A Report</th>-->
</tr>
         {{foreach from=$list key="key" item="item"}}
         <tr>
      <th width="5%">
<div align="left" style="padding:0; margin:0px; display:inline;">
    <a href="javascript:parent.iframeqa({{$item.bqa_id}},{{$bus_id}});" title="Edit">
  <!--  <a href="javascript:parent.iframeqa({{$bus_id}});" title="Edit">-->
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
      {{if $USER_GROUP == 'Administrators'}}
    <a href="javascript:parent.requestqaDelete({{$item.bqa_id}});" onclick="javascript:if(!confirm('Are you sure you want to delete?')) return false;" title="Delete">
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
    {{/if}}
</div></th>
         <td width="8%">{{$item.bcust_fname}} {{$item.bcust_lname}}</td>
         <td width="23%">{{$item.bqa_que|strip_tags}}</td>
         <td width="7%">{{$item.bqa_created_date|date_format:"%d/%m/%Y"}}</td>
         <td width="28%">{{$item.bqa_ans}}</td>
         <!--<td width="5%">{{if $item.bqa_ans == ''}}INCOMPLETE{{else}}COMPLETE{{/if}}</td>-->
         <td width="5%">{{$item.bqa_business_stream}}</td>
         <td width="15%">{{$item.bqa_source}}</td>
         <td width="15%">{{$item.user_name}}</td>
         <td width="9%" class ="example">
         <input type="checkbox" value="{{$item.bqa_id}}" name="qa_print[include_id][]" id="include_id" /></td>
         <!-- <td width="15%">
         <input type="checkbox" {{if $item.bqa_status == 1}} checked="checked" 	{{/if}} readonly="readonly" disabled="disabled"/></td>-->
         </tr>
         {{/foreach}}	
	</table>
</form>
 
 <script>
$(document).ready(function () {
  $('body').on('click', '#selectAll', function () {
    if ($(this).hasClass('allChecked')) {
        $('input[type="checkbox"]', '.example').prop('checked', false);
    } else {
        $('input[type="checkbox"]', '.example').prop('checked', true);
    }
    $(this).toggleClass('allChecked');
  })
});
</script>
 
{{if $last > 1}} 
    <table width="90%" border="0" cellpadding="0" cellspacing="0">   
    <tr>  
  {{if $list}}   
<td align="center">

<div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'>&laquo; previous</span>
 {{else}}
<a class="pagination" href="javascript:requestquestionInfo({{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="javascript:requestquestionInfo(1)" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="javascript:requestquestionInfo(2)" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="javascript:requestquestionInfo({{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="javascript:requestquestionInfo({{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="javascript:requestquestionInfo({{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="javascript:requestquestionInfo({{$last}})" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next &raquo;</span>
 {{else}}
<a class="pagination" href="javascript:requestquestionInfo({{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>

{{/if}}
 </tr>
</table> 
{{/if}}
{{else}}
<table cellpadding="0" cellspacing="0" width="100%" id="list-table"><tr>
<th align="center" >Record Not found... </th>
</tr></table>
{{/if}}
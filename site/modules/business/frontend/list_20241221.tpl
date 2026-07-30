<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<!--<script type="text/javascript" src="{{$BASE_URL}}js/animatedcollapse.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>-->
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />

<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
	
	<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<script type="text/javascript" >  
		$(document).ready(function() {
			/*
			*   Examples - images
			*/
			$(".various").fancybox({
				'width': '78%',
				'height': '77%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'scrolling': 'no' 
			});

		
		});
		
function openedit(url)
	{
	
	window.location.href =url;
	}		
		
</script> 
<script type="text/javascript">

function show_hide()
{
animatedcollapse.toggle('adsearch');
//alert(document.search.as.value);
if(document.search.as.value=="Show advanced search")
     {
	 document.search.as.value="Hide advanced search";
	 }
    else
	{
	document.search.as.value="Show advanced search";
	}
}
animatedcollapse.addDiv('adsearch', 'fade=1,height=180px')

animatedcollapse.ontoggle=function($, divobj, state){ //fires each time a DIV is expanded/contracted
}

animatedcollapse.init()

</script>
<h3 class="page-title">{{$title}}</h3>
<div>
<table id="search-table" width="90%">
<form name="search" action="{{$XFA.list}}" method="post">
        <thead>
            <tr>	<th align="center" valign="middle" width="15%">Customer Name:&nbsp;</th><td colspan="2">
            <input type="text" style="width:400px;" name="{{$TABLE}}[seller_name]" value="{{$detail.seller_name}}" /> </td>    
 <th style="text-align:left; padding-left:5px;"> Proposal Checklist #: <input type="text" style="width:100px;" name="{{$TABLE}}[dpn_unique_id]" value="{{$detail.dpn_unique_id}}" /></th>  
            </tr>
           
            <tr>	<th valign="middle" width="15%">Status:&nbsp;</th><td width="20%">
       
       <div class="bsearch_scroll_div">
            <ul style="margin: 0; padding: 0;">
               {{foreach from=$business_status key="key" item="item"}}
 <li><input type="checkbox" name="{{$TABLE}}[bsn_status][]" value="{{$item.st_id}}" {{if $bsn_status}} {{foreach from=$bsn_status key="key" item="item1"}} {{if $item.st_id == $item1}} checked="checked"  {{/if}}{{/foreach}}{{/if}}/> {{$item.st_name}}</li>
               {{/foreach}}
           </ul>
       </div> 
		 </td>    
         <td align="center" valign="middle" width="18%"> &nbsp;<input type="checkbox" name="{{$TABLE}}[outstanding_task]" {{if $detail.outstanding_task}} checked="checked" {{/if}}/><strong>Outstanding Tasks</strong>&nbsp;<br /> 
&nbsp;<input type="checkbox" name="{{$TABLE}}[outstanding_doc_chcklist]" {{if $detail.outstanding_doc_chcklist}} checked="checked" {{/if}}/><strong>Outstanding Doc. Check List</strong>
</td>  
         <td>
         <div style="float:left; padding-top:30px; padding-right:20px;"><strong>Project Type:</strong></div>
         <div class="bsearch_scroll_div" style="width:300px;">
            <ul style="margin: 0; padding: 0;">
               {{foreach from=$projecttypes key="key" item="item2"}}
 					<li><input type="checkbox" name="{{$TABLE}}[bsn_types][]" value="{{$item2.pt_id}}" {{if $bsn_types}} {{foreach from=$bsn_types key="key" item="item11"}} {{if $item11 == $item2.pt_id}} checked="checked"  {{/if}}{{/foreach}}{{/if}}/> {{$item2.pt_name}}</li>
               {{/foreach}}
           </ul>
       </div> 
             </td>
             
              </tr>
            <tr>
            <th valign="middle" width="15%">Project Name:&nbsp;</th><td colspan="2"><input type="text" name="{{$TABLE}}[bsn_name]"  value="{{$detail.bsn_name}}" class="xxlrg" style="width:400px;" /></td><td  rowspan="2">         <div style="float:left; padding-top:30px; padding-right:10px;"><strong>Project Status:</strong></div>
         <div class="bsearch_scroll_div" style="width:300px;">
           <ul style="margin: 0; padding: 0;">
            <li><input type="checkbox" name="{{$TABLE}}[bsn_sub_status3]" {{if $detail.bsn_sub_status3}} checked="checked" {{/if}}/>Open</li> 
            <li><input type="checkbox" name="{{$TABLE}}[bsn_sub_status1]" {{if $detail.bsn_sub_status1}} checked="checked" {{/if}}/>Lost</li>
		    <li><input type="checkbox" name="{{$TABLE}}[bsn_sub_status2]" {{if $detail.bsn_sub_status2}} checked="checked" {{/if}}/>On Hold</li>
           </ul>
       	</div>
       	</td></tr>
            <tr><th valign="middle" width="15%">Description:&nbsp;</th><td colspan="2"><input type="text" name="{{$TABLE}}[bsn_description]"  value="{{$detail.bsn_description}}" class="xxlrg" style="width:400px;" /></td>
            
            
            </tr> 
            
            
            
            
            <tr>	<th align="center" valign="middle" width="10%">Order By:&nbsp;</th><td>
            <select name="{{$TABLE}}[orderBy]" class="lrg" >
        	<option value="0" selected="selected"> -- select --</option>
			<option value="1" {{if $ord_id == 1}} selected="selected" {{/if}}>ProjectName</option>
            <option value="2" {{if $ord_id == 2}} selected="selected" {{/if}}>Type, ProjectName</option>
            <option value="3" {{if $ord_id == 3}} selected="selected" {{/if}}>Suburb, ProjectName</option>
            <option value="5" {{if $ord_id == 5}} selected="selected" {{/if}}>StatusCount Desc, ProjectName</option>
            <option value="6" {{if $ord_id == 6}} selected="selected" {{/if}}>DayCount Desc, ProjectName</option>
		</select> </td>    
            		<th align="center" valign="middle" width="10%" colspan="2"></th>  
            </tr>
             <tr>	<th align="center" valign="middle" width="10%">Price From:&nbsp;</th><td><input type="text" class="sml" name="{{$TABLE}}[bsn_cd_ask_price_from]" value="{{$detail.bsn_cd_ask_price_from}}" /> </td>    
            		<th align="center" valign="middle" width="10%"> Price To:&nbsp;</th><td><input type="text" class="sml" name="{{$TABLE}}[bsn_cd_ask_price_to]" value="{{$detail.bsn_cd_ask_price_to}}"/> </td>  
            </tr>
            <tr> <td colspan="4">
            <input type="button" value="Show advanced search" name="as" onclick="javascript:show_hide()";/>
            <div id="adsearch" style="display:none;">
         <table border="0" height="130" id="adsearch-table"> 
         <tr> <td valign="top"> <b style="font-size:14px; padding-bottom:10px;">States</b><br />
                <div class="bsearch_scroll_div1">
                <ul style="margin: 0; padding: 0;">
                       {{foreach from=$states key="key" item="item"}}
                        <li><input type="checkbox" name="{{$TABLE}}[bsn_states][]" value="{{$item.s_shortcodes}}" /> {{$item.s_shortcodes}}</li>
                       {{/foreach}}
                </ul>
                </div> 
                </td> <td width="150"></td> 
                <td valign="top" width="400"> </td></tr> 
           </table></div></td></tr> 
             <tr> <td colspan="4">
             <input type="submit" name="search" value="Search" />
            &nbsp;<input type="button" value="Add New" onclick="document.location.href='{{$BASE_URL}}{{$XFA.detail}}'" />
            {{if !empty($list)}}
             &nbsp;<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}/export/1'" />
            &nbsp;<input type="button" value="Print" onclick="window.open('{{$BASE_URL}}{{$XFA.list}}/print/basic')" />
            &nbsp;<input type="button" value="Outstanding Print" onclick="window.open('{{$BASE_URL}}{{$XFA.list}}/print/outstanding')" />
            
            {{else}}
            &nbsp;<input type="button" value="Export To XLS" onclick="alert('Please search listing first then try to export report.')" /> 
            &nbsp;<input type="button" value="Print" onclick="alert('Please search listing first then try to print report.');" />
            &nbsp;<input type="button" value="Outstanding Print" onclick="alert('Please search listing first then try to print report.');" />
             
            {{/if}}
            </td>   
            		  
            </tr>
        </thead>
        </form>    
</table>
 {{if !empty($list)}} 
 
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
            		<th class="topmenu" align="center" valign="middle" width="5%" >Action</th> 
               		
            		<th class="topmenu" align="center" valign="middle" width="4%">Task Cnt</th>
                    <th class="topmenu" align="center" valign="middle" width="6%">Doc Check Cnt</th>    
                    <th class="topmenu" align="center" valign="middle" width="10%">Partners</th>
                    <th class="topmenu" align="center" valign="middle" width="13%">Project Name</th> 
                    <th class="topmenu" align="center" valign="middle" width="13%">Description</th> 
                    <th class="topmenu" align="center" valign="middle" width="10%">Suburb</th> 
                    <th class="topmenu" align="center" valign="middle" width="8%">Type</th> 
                    <th class="topmenu" align="center" valign="middle" width="5%">Days at Status</th> 
                    <th class="topmenu" align="center" valign="middle" width="5%">Days in System	</th> 
       <!--             <th class="topmenu" align="center" valign="middle" width="5%">From</th>   
                    <th class="topmenu" align="center" valign="middle" width="5%">To</th> -->  
                    <th class="topmenu" align="center" valign="middle" width="10%">Sub Status</th>
                    <th class="topmenu" align="center" valign="middle" width="15%">Status</th>            
            </tr>
        </thead>       
        <tbody>
        {{assign var="foo" value=""}}
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" title="Edit"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;
          <a class="various" href="{{$BASE_URL}}{{$XFA.view}}/{{$ID}}/{{$item.$ID}}" title="View" ><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/view.png"/></a>
                </td>
            
                <td>{{$item.task_cnt}}</td>
                <td>{{$item.doc_cnt}}</td>
                <td>{{$item.sellers}}</td>
                <td>{{$item.bsn_name}}</td>
                <td>{{$item.bsn_description|truncate:55}}</td>
                <td>{{$item.bsn_suburb}}</td>
                <td>{{$item.pt_name}}</td>
                <td>{{$item.statusdays}}</td>
                <td>{{$item.systemdays}}</td>
               <!-- <td>${{$item.bsn_cd_ask_price_from|string_format:"%.2f"}}</td>
                <td>${{$item.bsn_cd_ask_price_to|string_format:"%.2f"}}</td>-->
                <td>{{$item.bsn_sub_status}}</td>
                <td>{{$item.st_name}}</td>
      
            </tr>
  {{assign var="foo" value=$item.cat_id}}   
        {{/foreach}}
        </tbody>
    </table>
    {{/if}}
        {{if $search_msg}}
    <table id="list-table" class="nav-back" width="90%">
        <thead>
            <tr>
    			<th colspan="10">{{$search_msg}}</th>        
            </tr>
        </thead>
    </table>
    
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
<a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">&#171; previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/2" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next &#187;</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next &#187;</a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>

{{/if}}
 </tr>
</table> 
{{/if}}
</div>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>
<style>
.set { font-size:10px !important; 
       width:25px !important; display:inline-block; 
       padding-top:1px !important;
       padding-bottom: 1px !important;
       padding-left:1px !important;
       height:25px !important; }
       
       
#fancybox-wrap {z-index:9999999;} 
</style>

<script language="javascript">

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}design_pricing_update_report.view_procedure"+ "/random/" + Math.random();	

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

</script>


<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">

     <div style="float:left; text-align:left;">
    &nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
    <input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:300px;"/>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" value="Search" name="search"  />&nbsp;
    <input type="submit" value="Clear Search" name="clear"  />&nbsp;
    </div>
    
 </form>


    <table id="list-table" class="nav-back" width="100%" >
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="2%">Id</th>   
                <th class="topmenu" align="center" valign="middle" width="4%">Design Number</th> 
                <th class="topmenu" align="center" valign="middle" width="3%">Web Link</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Master Calculator Date</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Link To Master Calc</th>
                <th class="topmenu" align="center" valign="middle" width="2%"></th>   
            </tr>
        </thead>
<tbody>
 {{foreach from=$list key="key" item="item"}}
 <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">

    <td>{{counter}}</td>
    <td>{{$item.di_design_number}}</td> 
    <td>{{if $item.di_cgfb_design_link}}<a href = '{{$item.di_cgfb_design_link}}' target="_blank">Link</a>{{/if}} </td>
    <td>{{$item.di_master_project_calculator_date}}</td>
    <td> {{if $item.di_master_project_calculator}}
    <a href="/repricing_database.download_content?file_name={{$item.di_master_project_calculator}}&module_name=repricing_database.home" >Link</a>
   <!-- <a href="https://deckquote.s3.amazonaws.com/files/design_interface/{{$item.di_master_project_calculator}}" target="_blank">Link</a> -->
    {{/if}}    
    </td>
    <td></td>
 
    
  
     
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
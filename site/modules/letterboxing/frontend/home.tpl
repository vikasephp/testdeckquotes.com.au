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
	var viewurl = "{{$BASE_URL}}letterboxing.view_procedure"+ "/random/" + Math.random();	

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
    <!--<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
    <input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:300px;"/>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" value="Search" name="search"  />&nbsp;
    <input type="submit" value="Clear Search" name="clear"  />&nbsp;-->
    </div>
    
 </form>


    <table id="list-table" class="nav-back" width="100%" >
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="3%">Id</th>   
                <th class="topmenu" align="center" valign="middle" width="6%">Date</th> 
                <th class="topmenu" align="center" valign="middle" width="6%">Date Delivered</th>
                <th class="topmenu" align="center" valign="middle" width="14%">What</th>
                <th class="topmenu" align="center" valign="middle" width="13%">Text</th>
                <th class="topmenu" align="center" valign="middle" width="13%">Text</th>
                
                <th class="topmenu" align="center" valign="middle" width="10%">Suburbs</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Hours</th> 
                
                <th class="topmenu" align="center" valign="middle" width="5%">Hours Delivered</th>  
                <th class="topmenu" align="center" valign="middle" width="10%">Who</th> 
                <th class="topmenu" align="center" valign="middle" width="8%">Map</th>
                <th class="topmenu" align="center" valign="middle" width="7%">Approved</th>   
            </tr>
        </thead>
<tbody>
 {{foreach from=$list key="key" item="item"}}
 <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">

    <td>{{$item.lb_id}}</td>
    <td>{{$item.lb_date}}</td> 
    <td>{{$item.lb_date_delivered}}</td>
    <td>{{$item.lb_what}}</td>
    <td><input type = "text" name="text1" value="{{$item.lb_text1}}" onkeyup = "update_text({{$item.lb_id}},this.value, 1)" /></td>
    <td><input type = "text" name="text1" value="{{$item.lb_text2}}" onkeyup = "update_text({{$item.lb_id}},this.value, 2)" /></td>
    
     <script>
	   
		function update_text(id,value,t)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}letterboxing.update_text/lb_id/"+id+"/value/"+value+"/txt/"+t,
					   success: function(result){
					}
				});
		}
		</script>
    
    <td>{{$item.lb_suburb}}</td>
 <!--   <td> {{if $item.di_master_project_calculator}}
    <a href="https://deckquote.s3.amazonaws.com/files/design_interface/{{$item.di_master_project_calculator}}" target="_blank">Link</a>
    {{/if}}    
    </td>-->
    <td>{{$item.lb_hours}}</td>
    <td>{{$item.lb_hours_delivered}}</td>
    <td>{{$item.lb_who}}</td>
    <td><form name="cal" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="lb_id" value="{{$item.lb_id}}"  />
        <input type="file" name="map" /><br />
        {{if $item.lb_map}}
        <div style="text-align:center;"> 
        <!--<a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.lb_map}}" target="_blank">Download</a>-->
       <a href="/letterboxing.download_content?file_name={{$item.lb_map}}&module_name=letterboxing.home" target="_blank">Download</a> 
        
        <a href="{{$BASE_URL}}letterboxing.delete_map/lb_id/{{$item.lb_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
       </div> {{/if}}
       <input type= "submit" name="upload_map" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
        </td>
    
    <td>
    <form name ="recmet22" method="post" action="">
     	<input type="hidden" name="approve[{{$item.lb_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="approve[{{$item.lb_id}}]" value="1"  onclick="this.form.submit();" {{if $item.lb_approved eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
      {{if $item.lb_approved eq 1}} {{$item.lb_approved_user}} {{/if}}
      </form>  
    
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
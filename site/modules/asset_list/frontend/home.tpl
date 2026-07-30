
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>

<style>
#fancybox-wrap {z-index:9999999;} 	  
</style>

<table  width="100%"><tr><td>
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:right;"> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>
</td></tr></table>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">Unique Id.</th>  
                   <th class="topmenu" align="center" valign="middle" width="25%">Item</th>   
            	   <th class="topmenu" align="center" valign="middle" width="10%">Purchase Date</th>
                   <th class="topmenu" align="center" valign="middle" width="20%">Purchase Value</th> 
                   <th class="topmenu" align="center" valign="middle" width="20%">Deprication Type </th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Market Value </th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Photo</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.al_id}}</td>
        <td>{{$item.al_item}}</td> 
        <td>{{$item.al_purchase_date }}</td>
        <td>{{$item.al_purchase_value}}</td>
        <td>{{$item.al_deprication_type}}</td>
        <td>{{$item.al_market_value}} </td>
        <td>{{if $item.al_photo}}
    
    <img  data-img-name="{{$item.al_photo}}" data-img-id="{{$item.al_photo}}-{{ $item.al_id }}" src="/asset_list.download_content?file_name={{$item.al_photo}}&module_name=asset_list.home" style="width:100%;cursor:pointer; padding:2px;" 
    onclick="onClick(this)" class="w3-hover-opacity" />
     
    {{/if}} </td>
    
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
        </td>
    </tr>  
  {{/foreach}}
  </tbody>
  </table>
    
    
    <div id="modal01" class="w3-modal" onclick="this.style.display='none'">
  <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
  <div class="w3-modal-content w3-animate-zoom">
    <img id="img01" style="width:100%;">
  </div>
</div>

<script>
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
}
</script>
    
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



<script type="text/javascript">

   function get_img_raw_data(myKeyVals){
      $.ajax({
              type: 'POST',
              url: '/asset_list.get_image_raw_data',
              data: myKeyVals,
              dataType: "json",
              success: function(resultData) 
              {
              	if(resultData.status == 'true')
              	{ 
              	    var img_raw_data = resultData.data.rawImgData;
              	    var file_name = resultData.data.fileName;
              	    var file_id = resultData.data.id;
              	    $('#doclist-table img[data-img-id="'+file_id+'"]').attr("src",img_raw_data);
              	}
              }
        });
    }
    $(document).ready(function(){
        $("#doclist-table tr img.w3-hover-opacity").each(function(){
            var file_name = $.trim( $(this).attr("data-img-name") )
            var id = $.trim( $(this).attr("data-img-id") );
            var myKeyVals = { "file_name":file_name ,"id":id } ;
            get_img_raw_data(myKeyVals);
        })
    })
</script> 
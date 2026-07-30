    <link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>

<style>
#fancybox-wrap {z-index:9999999;} 	  
</style>

<table  width="100%"><tr><td></td><td>
<form name="mshort" action="{{$BASE_URL}}{{$XFA.listimage}}" method="post">
<div style="float:left;">
</td><td>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
<input type="text" name="keyword" value="{{$keyword}}" style="width:400px;"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />
 </div>
</form>
<div style="float:right;"> <input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.add_image}}');" /> </div>
</td></tr></table>
<div id="">
   <!-- <table id="list-table" class="nav-back" width="100%">-->
    <table id="doclist-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="2%">Id</th>   
                <th class="topmenu" align="center" valign="middle" width="3%">UID</th>
                <th class="topmenu" align="center" valign="middle" width="20%">Image</th>  
                <th class="topmenu" align="center" valign="middle" width="30%">Title</th> 
                <th class="topmenu" align="center" valign="middle" width="25%">Tags</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Status</th>           
                <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
<tbody>
 {{foreach from=$list key="key" item="item"}}
 <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
    <td>{{counter}}</td>
    <td>{{$item.uid}}</td>
    <td>
    <div align="center">
    {{if $item.file}}
    
<!--    <a href="https://deckquote.s3.amazonaws.com/files/galleries/{{$item.file}}" class="various2">
    <img src="https://deckquote.s3.amazonaws.com/files/galleries/{{$item.file}}" width="150" border="2" /></a>-->
    
     <img  data-img-name="{{$item.file}}" data-img-id="{{$item.file}}-{{$item.uid}}" src="https://deckquote.s3.amazonaws.com/files/galleries/{{$item.file}}" style="width:100%;cursor:pointer; padding:2px;" onclick="onClick(this)" class="w3-hover-opacity" />
    
    
    {{/if}}</td>
    <td>{{$item.title}}</td> 
    <td> {{$item.tags}} 
    
    <!--<ul>{{foreach from=$item.tags item="item1" key="key1"}}
    		<li>{{$item1.sft_title}}</li>        
        {{/foreach}}</ul>
        <div style="float:right; vertical-align:top;">-->
       
    </td>
    <td>{{$item.status}}</td>
    <td><a href="{{$BASE_URL}}{{$XFA.add_image}}/ig_id/{{$item.ig_id}}" class="various" title="Edit"><img style="height: 20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete_image}}/ig_id/{{$item.ig_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></td>
 </tr>  
      {{/foreach}}
</tbody>
    </table>
    
    
    <div id="modal01" class="w3-modal" onclick="this.style.display='none'" style="z-index:999999">
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
<a class="pagination" href="{{$BASE_URL}}{{$XFA.listimage}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">&#171; previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.listimage}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.listimage}}/pagenum/2" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.listimage}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="{{$BASE_URL}}{{$XFA.listimage}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="{{$BASE_URL}}{{$XFA.listimage}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="{{$BASE_URL}}{{$XFA.listimage}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next &#187;</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.listimage}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next &#187;</a></div>
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
              url: '/styleformula_fpl.get_image_raw_data',
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
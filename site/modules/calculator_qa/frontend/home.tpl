<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery-1.7.2.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3.css" />
<script> 

		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
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

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}calculator_qa.view_procedure"+ "/random/" + Math.random();	

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
 
 #fancybox-wrap {z-index:99999999;} 
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

<style>
    .show-read-more .more-text { display: none; }
    .read-more { font-weight:bold; }
</style>

<h3 class="page-title">{{$title}}</h3>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">

 <div style="float:left; text-align: left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
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
    <input type="submit" value="Reset Search and Show All" name="showall"  />
    
 </div>

<div style="float:right;">
    <input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
    <input type="submit" value="Print" name="print"  />
 </div>

</form>

<div id="">
    <!--<table id="list-table" class="nav-back" width="100%">-->
    <table id="doclist-table" class="nav-back tableFixHead" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="2%">QAID</th>   
                <th class="topmenu" align="center" valign="middle" width="15%">Category</th> 
                <th class="topmenu" align="center" valign="middle" width="25%">Question</th> 
                <th class="topmenu" align="center" valign="middle" width="30%">Answer</th>
                <th class="topmenu" align="center" valign="middle" width="10%">Image</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Attachment</th>           
                <th class="topmenu" align="center" valign="middle" width="8%">Action</th>   
            </tr>
        </thead>
<tbody>
 {{foreach from=$list key="key" item="item"}}
 {{if $item.qa_qed eq 1 }}  
 	 <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
 {{else}}
     <tr bgcolor="#FF0000">
 {{/if}}    

    <td style="color:#000;">{{$item.qa_id}}</td>
    <td style="color:#000;">{{$item.category}}</td> 
    
    <td style="color:#000;"><div class="show-read-more">{{$item.qa_question}}</div> </td>
    <td style="color:#000;"><div class="show-read-more">{{$item.qa_answer}}</div> </td>
     <td style="color:#000;">
     {{if $item.qa_image}}

    
    
    <img  data-img-name="{{$item.qa_image}}" data-img-id="{{$item.qa_image}}-{{ $item.qa_id }}" src="/calculator_qa.download_content?file_name={{$item.qa_image}}&module_name=calculator_qa.home" style="width:100%;cursor:pointer; padding:2px;" 
    onclick="onClick(this)" class="w3-hover-opacity" />
    {{/if}}
    {{if $item.qa_image}}
           <a href="/calculator_qa.download_content?file_name={{$item.qa_image}}&module_name=calculator_qa.home" >Download</a>
     
        {{/if}}
    
    </td>
     
     
    <td style="color:#000;">
        {{if $item.qa_attachment}}
           <a href="/calculator_qa.download_content?file_name={{$item.qa_attachment}}&module_name=calculator_qa.home" >{{ $item.qa_attachment}}</a>
     
        {{/if}}
    </td>
    <td style="color:#000;"><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
    <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
    <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
    <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
    <a href="{{$BASE_URL}}calculator_qa..viewqa/{{$ID}}/{{$item.$ID}}" class="various" title="View">
    <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/viewqa.png"/></a>
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
</form>


<script type="text/javascript">

   function get_img_raw_data(myKeyVals){
      $.ajax({
              type: 'POST',
              url: '/calculator_qa.get_image_raw_data',
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

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		

<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<h3 class="page-title">{{$bus_data.bsn_name}}</h3>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<style>
.dtpic {
	width:65px !important;
	padding-top:1px !important;
	padding-bottom:1px !important;
	margin-bottom:10px !important;	
}
.dt {border:1px solid #CCC; padding:8px; margin-top:15px !important; }	
#fancybox-wrap {z-index:9999999;}

</style>

<script type="text/javascript" >  
		$(document).ready(function() {
			/*
			*   Examples - images
			*/
			$(".various").fancybox({
				'width': '95%',
				'height': '95%',
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

});


function add_procedure()
{
	var viewurl = "{{$BASE_URL}}sub_pages.view_procedure"+ "/random/" + Math.random();	

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
<div style="float:left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
</div>

<div style="float:right;"> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$bsn_id}}');" />
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
         
                   <th class="topmenu" align="center" valign="middle" width="5%">Event Id</th> 
                   <th class="topmenu" align="center" valign="middle" width="20%">Event Name</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Start Date</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">End Date</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Duration</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Predecessors and Lags </th>
                   <th class="topmenu" align="center" valign="middle" width="15%">Assign To</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Action</th>   
            </tr>
        </thead>
    <tbody>

  {{assign var=countn value= $total}}
 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">


        <td>{{$item.cs_id}}</td>
        <td>{{$item.cs_event_name}}</td> 
 
        <td>
     <input type="text" name="start[{{$item.cs_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.cs_id}}" value="{{$item.cs_start_date}}" onfocus ="update_start({{$item.cs_id}}, this.value);"  />
       
       <script>
	   
				
		function update_start(id,value)
		{
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_schedular.update_date/cs_id_1/"+id+"/value_1/"+value,
					   success: function(result){
					}
				});
					
		}
		
	  </script>
      </td>
      
  <td>
  <input type="text" name="end[{{$item.cs_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.cs_id}}" value="{{$item.cs_end_date}}" onfocus ="update_end({{$item.cs_id}}, this.value);"  />
       
       <script>
				
		function update_end(id,value)
		{
			
			var tana10 = "#diff"+id;
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_schedular.update_date/cs_id_2/"+id+"/value_2/"+value,
					   success: function(result){
						   $(tana10).html(result); 
					}
				});
		}
	   </script>
       
      </td>
        
      <td id="diff{{$item.cs_id}}">{{$item.diff}}</td>
      
      <td> </td> 
        
      <td id="list-table2{{$item.cs_id}}">
      
      <table>
            {{foreach from = $detail key = key item = item}}
                 <tr id="pre{{$item.cs_id}}">
                 <th> <input type="text" value="{{$item.dik_keyfeature}}" onkeyup="update_feature_pre(this.value,{{$item.cs_id}})"  /> </th>
                 
                 <th width="10%"> <a href="javascript:delete_feature_pre({{$item.cs_id}});" value="Delete Fearure" title="Delete" >
					<img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a> </th>
                </tr>
                
                {{/foreach}}
              
               
                <div style="text-align:left; margin-top:5px;">
                              
               <input type="button" onclick="appendRowLp({{$item.cs_id}})" value="Add New"  /> <br />
               <p id="myElem" style="display:none; color:#F00; font-style:italic; margin:5px;">Enter the Key Feature Please.... </p>
                </div>
                
                <script type="text/javascript">
				var x=0;
				var v=1;
				function appendRowLp(id)
				{
				
					//id=1;
					var e = "#em" + x;
					v = $(e).val();
				
					if( v !== "" || x==0)
					{
						$(e).attr("disabled", "disabled"); 
						x=x+1;
						var row = '<tr id="r'+x+'">';
						row =  row + '<td> <input type="text" id="em'+x+'" size="40" onkeyup=savefeature(this.value,'+id+','+x+'); /></td>';
						row =  row + '<td>';
						row =  row + '<a href="javascript:delete_feature('+x+');" value="Delete Fearure" title="Delete" >';
						row =  row + '<img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a></td>';
						row =  row + '</tr>';
						 
						 $("#list-table2"+id).append(row);
						 
						 var insert="true";
						  $.ajax({
							   type: "GET",
							   url: "{{$BASE_URL}}construction_schedular.save_assignto/insert/"+insert+"/id/"+id,
								   success: function(result){
							   }
							 });
					  }
						else { 
								$("#myElem").show();
								setTimeout(function() { $("#myElem").hide(); }, 2000);
					  }
					}
					
			  function savefeature(value,id,x)
				{
				
				var kf = '#kf'+x;
				
				var value = value.replace(/\\/g,'=');
				var value = value.replace(/\//g,'!');
						
				  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}construction_schedular.save_assignto/value/"+value+"/id/"+id,
						   success: function(result){
					   }
					 });
				}
				
				function update_feature_pre(fvalue,id)
				{
				
				var fvalue = fvalue.replace(/\\/g,'=');
				var fvalue = fvalue.replace(/\//g,'!');
				
				  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}construction_schedular.save_assignto/fvalue/"+fvalue+"/id/"+id,
						   success: function(result){
					   }
					 });
				}
				
				
				function delete_feature(row)
				{
					var v = '#em'+row;
					
					value = $(v).val();
					dr = '#r'+row;
					$(dr).remove();
				
					$.ajax({
				    type: "GET",
				 			  
				    url: "{{$BASE_URL}}construction_schedular.delete_feature/value/"+value,
				   // data: "bsn_id =" + id,
				   success: function(result){
					// $("#somewhere").html(result);
				   }
				 });
			
				}
				
			function delete_feature_pre(id)
				{
					dr = '#pre'+id;
					$(dr).remove();
				
					$.ajax({
				    type: "GET",
				 			  
				    url: "{{$BASE_URL}}construction_schedular.delete_feature/id/"+id,
				   // data: "bsn_id =" + id,
				   success: function(result){
					// $("#somewhere").html(result);
				   }
				 });
			
				}
				
								
				</script>
      </table>
      </td>
        
     
        
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
             
        </td>
    </tr>  
    {{assign var=countn value=$countn-1}}
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
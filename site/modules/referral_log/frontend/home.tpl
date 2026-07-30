<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>

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
	var viewurl = "{{$BASE_URL}}referral_log.view_procedure"+ "/random/" + Math.random();	

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


<style>
.set2 { font-size:10px !important; 
       width:60px !important; display:inline-block; 
	  padding-top:1px !important;
	  padding-bottom: 1px !important;
	  padding-left:1px !important;
	  height:25px !important; 
	  margin-top:7px;}
	  
#fancybox-wrap {z-index:9999999;}	  
</style>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
</div>

<div style="float:right;"> 
<input type="submit" name="showall" value = "Show Hidden" />
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>


<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">Sr. No.</th>  
                   <th class="topmenu" align="center" valign="middle" width="5%">Date</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Customer Referred Name</th>
                   <th class="topmenu" align="center" valign="middle" width="18%">Customer Referred Address</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Needs Analysis Survey Linked</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Referring Customer Name</th> 
                   <th class="topmenu" align="center" valign="middle" width="18%">Referring Customer Address</th> 
                   
            	   <th class="topmenu" align="center" valign="middle" width="10%">Referring Customer Email</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Referring Customer Phone</th>
                    <th class="topmenu" align="center" valign="middle" width="7%">Called Referring Customer</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Email to Referral website sent to referring customer</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Gift selected </th>
                   
                   <th class="topmenu" align="center" valign="middle" width="5%">Referral Gift Sent</th> 
                  <!-- <th class="topmenu" align="center" valign="middle" width="8%">Referral Gift Cost</th>-->
                  <th class="topmenu" align="center" valign="middle" width="5%">Hide From Report</th>  
                  <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.rl_id}}</td>
        <td>{{$item.rl_date}}</td> 
        <td>{{$item.rl_reffered_customer}}</td>
        <td><a href="{{$BASE_URL}}business.detail/bsn_id/{{$item.rl_reffered_bsn_id}}" target="_blank">{{$item.rl_reffered_address}}</a></td>
        <td>{{if $item.rl_need_analysis_link}}<a href="{{$item.rl_need_analysis_link}}" target="_blank">Link</a>{{/if}}</td>
        <td>{{$item.rl_reffering_customer}}</td> 
        
        <td><a href="{{$BASE_URL}}business.detail/bsn_id/{{$item.rl_reffering_bsn_id}}" target="_blank">{{$item.rl_reffering_address}}</a></td>
        
        <td>{{$item.rl_referring_cust_email}}</td>
        <td>{{$item.rl_referring_cust_phone}}</td>
        <td>
        <select name="called" onchange="update_called({{$item.rl_id}},this.value)">
         <option value="">Please Select</option>
        <option value="Yes" {{if $item.rl_called_rc eq 'Yes'}} selected="selected"{{/if}}>Yes</option>
        <option value="No" {{if $item.rl_called_rc eq 'No'}} selected="selected"{{/if}}>No</option>
        </select><br />
        <input type="text" name="called_text" value="{{$item.rl_called_rc_text}}" onkeyup="update_text({{$item.rl_id}},this.value)" />
        
        <script>
	   
		function update_called(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}referral_log.update_called/rl_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
		
		
		function update_text(id,value)
		{
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}referral_log.update_called_text/rl_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});	
		}
		
	    </script>
        
        <td>
        <select name="email_to" onchange="update_email_to({{$item.rl_id}},this.value)">
        <option value="">Please Select</option>
        <option value="Yes" {{if $item.rl_email_to  eq 'Yes'}} selected="selected"{{/if}}>Yes</option>
        <option value="No"  {{if $item.rl_email_to  eq 'No'}}  selected="selected"{{/if}}>No</option>
        </select><br />
       
        
         <script>
	   
		function update_email_to(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}referral_log.update_email_to/rl_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
		</script>
        
        </td>
        
        <td>
        <input type="text" name="gift_select" value="{{$item.rl_gift_selected}}" onkeyup="update_gift_selected({{$item.rl_id}},this.value)" />
        
        <script>
	   
		function update_gift_selected(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}referral_log.update_gift_selected/rl_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
		</script>
        
        </td>
        
        <td style="text-align:center;"><input type="checkbox"  {{if $item.rl_ref_gift_sent eq 1}} checked="checked" {{/if}} onclick="update_gift_sent({{$item.rl_id}},this.checked)"  />
        
        <script>
	   
		function update_gift_sent(id,value)
		{
		
		var val = 0;
		if(value==true) { val = 1; } 
		if(value==false) { val = 2; } 
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}referral_log.update_gift_sent/rl_id/"+id+"/value/"+val,
				   success: function(result){
			   }
			 });
		}
	</script>
        
        </td>
      
        
        <td><form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.rl_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.rl_id}}]" value="1"  onclick="this.form.submit();" {{if $item.rl_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  </td>
        
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
             
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
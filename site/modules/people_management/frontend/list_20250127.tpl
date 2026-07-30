<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
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
				'height': '97%',
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

		
			$(".addnotes").fancybox({
				'width': '48%',
				'height': '57%',
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

function add_new(viewurl)
 {
var viewurl = viewurl + "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '78%',
				'height': '97%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes'
				
			
        });
		
		
		
});
}


function view()
 {
var viewurl = "{{$BASE_URL}}sellerlisting.detail"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '78%',
				'height': '97%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
			
        });
});
}

 function add_type()
{
	var viewurl = "{{$BASE_URL}}people_management.view_type"+ "/random/" + Math.random();	

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
	window.location.reload();
	}
</script>
<div class="page-title" style="height:50px;">{{$title}}</div>
<div style="float:left; width:100%; text-align:left; margin-left:5px;"> 



<input type="button" name="People_Panel" value="People Management Panel" onclick="document.location.href='{{$BASE_URL}}people_management.list'" />
  &nbsp;
  <input type="button" name="Add_People" value="Add People" onclick="javascript:add_new('{{$BASE_URL}}people_management.detail');" />
  &nbsp; &nbsp;<input type="button" name="type_options" value="Type Admin" onclick="javascript:add_type();" /> 
  
<form name="mshort" method="post" action="">
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="Search by Name"/>
<input type="submit" value="Search" name="searchaddr"  />
<input type="submit" value="Clear Search" name="clearall"  />
<br />
<strong> Filter By Payment Status: </strong> 

        <select name="type"/>
        <option value="0" >Please Select </option>
                {{foreach from = $typedetail key="key4" item="item4"}}
                <option value="{{$item4.et_id}}">{{$item4.et_option}}</option>
                {{/foreach}}
        </select> 
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" /> 
        <input type="submit" value="Clear Filter" name="clearall" /> 
        
<br />
<strong> Filter Active: </strong> 

        <select name="active_filter"/>
          <option value="" >Please Select </option>      
          <option value="1">Yes</option>
          <option value="2">No</option>      
        </select> 
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" /> 
        <input type="submit" value="Clear Filter" name="clearall" /> 
        
         
</form>
</div>

<div style="float:right;">
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}people_management.list/export/1'" /> &nbsp;
<input type="button" name="People_Panel" value="Position Management Panel" onclick="document.location.href='{{$BASE_URL}}position.list'" />
</div>

  <table id="list-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="2%">No.</th>
        <th class="topmenu" align="left" valign="middle" width="20%"><div align="left">Person:</div></th>
        <th class="topmenu" align="left" valign="middle" width="5%"><div align="left">Active:</div></th>
        <th class="topmenu" align="left" valign="middle" width="6%"><div align="left">Type</div></th>
        <th class="topmenu" align="left" valign="middle" width="6%"><div align="left">Latest Letter of Offer</div></th>
        <th class="topmenu" align="left" valign="middle" width="30%"><div align="left">Quick Details:</div></th>
        <th class="topmenu" align="left" valign="middle"><div align="left">Positions:</div></th>
        <th class="topmenu" align="left" valign="middle"><div align="left">Type:</div></th>
        <th class="topmenu" align="left" valign="middle"><div align="left">Status:</div></th>
        <th class="topmenu" align="left" valign="middle" width="8%"><div align="left">Access:</div></th>
      </tr>
    <tbody>
    {{if $notfound}} <tr><th colspan="10" s><strong>{{$notfound}}</strong>{{/if}}</th>
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td>{{counter}}.</td>
        <td><p><b>Name:&nbsp;</b>{{$item.user_name}}</p>
          <p><b>Company:&nbsp;</b>{{$item.customer_company}}</p></td>
          
        <td>
         <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="active[{{$item.user_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="active[{{$item.user_id}}]" value="1"  onclick="update_active({{$item.user_id}},this.checked);" {{if $item.user_pm_active eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
        <div id="cond{{$item.user_id}}">
        {{if $item.user_pm_active eq 1}}{{$item.user_pm_active_user}}<br />{{$item.user_pm_active_date}}{{/if}} </div> 
	    <script>
		
        function update_active(id,value)
		{
		 var val;
		 if(value == true) { val = 1; } else { val = 0; }
		 var cond = '#cond'+id;
		
		 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}people_management.update_active/user_id/"+id+"/value/"+val,
						   success: function(result){
							$(cond).html(result);   
					   }
					 });
		
		}
	   </script>
        </td>
        <td>
           <select name="{{$TABLE}}[user_pm_type]"  onChange="update_type({{$item.user_id}}, this.value)">
            <option value="0">Please Select</option>
            {{foreach from=$typedetail key="key3" item="item3"}}
            <option value="{{$item3.et_id}}"  {{if $item.user_pm_type eq $item3.et_id}} selected="selected" {{/if}} >{{$item3.et_option}}</option>
            {{/foreach}}
            </select>
            <script>
			function update_type(id,value)
			{
					   $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}people_management.update_type/user_id/"+id+"/value/"+value,
						     success: function(result){
							
						}
						
					});
			}
	        </script>
        
        </td>
        
        <td>{{if $item.customer_latest_letter}}<a href="{{$item.customer_latest_letter}}" target="_blank">Link</a>{{/if}}</td>
        
        <td><p><b>Mobile Phone:&nbsp;</b>{{$item.customer_phone}}</p>
          <p><b>Personal Email:&nbsp;</b>{{$item.user_email}}</p>
          <p><b>Business Phone:&nbsp;</b>{{$item.customer_phone_business}}</p>
          <p><b>Tax Number:&nbsp;</b>{{if $item.customer_tax_num}}{{$item.customer_tax_num}}{{else}}NA{{/if}}</p>
          <p><b>Date of birth:&nbsp;</b>{{if $item.customer_dob !== '0000-00-00'}} {{$item.customer_dob|date_format:"%d/%m/%Y"}} {{else}} NA{{/if}}</p>
          <p><b>Health:&nbsp;</b>{{if $item.customer_health}}{{$item.customer_health}}{{else}}NA{{/if}}</p>
          </td>
        <td>{{if $item.p_name}}
          {{foreach from=$item.p_name key="key1" item="item1"}}
          <p>{{$item1.p_name}}</p>
          {{/foreach}}	
          {{/if}}</td>
        <td>{{$item.group_name}}</td>
        <td>{{if $item.customer_status == 0}}Current {{else}}Previously{{/if}}</td>
        <td><div align="center">       
        {{if $USER_GROUP == 'Administrators' OR $item.user_id == $cur_user}}
   <a href="{{$BASE_URL}}{{$XFA.detail}}/user_id/{{$item.user_id}}" class="various" title="Edit"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>				        {{/if}}
   &nbsp;<a href="{{$BASE_URL}}{{$XFA.view}}/user_id/{{$item.user_id}}" class="various" title="View"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/view.png"/></a> 
        {{if $USER_GROUP == 'Administrators'}}
   &nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/user_id/{{$item.user_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete.? It will loss all related data.')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a> 
        {{/if}}        
        </div></td>
      </tr>
      {{/foreach}}
      </tbody>
  </table>

  
  {{if $last > 1}}
  <table width="90%" border="0" cellpadding="0" cellspacing="0">
    <tr> {{if $list}}
      <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>« previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">« previous</a> {{/if}}
          
          {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/1" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/2" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
          {{if $paginateprev.0 > 3}}
          ...
          {{/if}}
          {{foreach from=$paginateprev key="page_key" item="page_num"}}
          {{if $page_num == $pagenum OR $page_num <= 2}}
          {{elseif $page_num == $lastone}}
          
          {{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
          {{/foreach}}
          
          {{foreach from=$paginatenext key="page_key" item="page_num2"}}
          {{if $page_num2 < $last AND $page_num2 != $lastone}}
          {{if $page_num2 == 1}}
          {{elseif $page_num2 == 2}}
          {{else}}
          {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
          {{/if}}     
          {{/if}}
          {{/foreach}}
          {{if $page_num2 < $lasttow}}
          ...
          {{/if}}
          {{if $lastone == 1}}
          {{elseif $lastone == 2}}
          {{else}}
          {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
          {{/if}}
          {{if $last == 1}}
          {{elseif $last == 2}}
          {{else}}
          {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a> {{/if}}
          {{/if}}
          {{if $pagenum == $last}} <span class='disabled'>next »</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next »</a></div>
        {{/if}} </td>
      {{else}}
      <td align="center" height="300">Record Not found... </td>
      {{/if}} </tr>
  </table>
  {{/if}} </div>

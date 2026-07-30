<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
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
				'width': '75%',
				'height': '75%',
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
	var viewurl = "{{$BASE_URL}}project_audit_report.view_procedure"+ "/random/" + Math.random();	

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

function add_audit()
{
	var viewurl = "{{$BASE_URL}}project_audit_report.view_audit"+ "/random/" + Math.random();	

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

<style>

.dtpic {
	width:65px !important;
	padding-top:1px !important;
	padding-bottom:1px !important;	
}
.set { font-size:10px !important; 
       width:25px !important; display:inline-block; 
	   padding-top:1px !important;
	   padding-bottom: 1px !important;
	   padding-left:1px !important;
	   height:25px !important; }
	   
#fancybox-wrap {z-index:9999999;} 	   
</style>

<h3 class="page-title">{{$title}}</h3>
<br />
<form name="mlist" method="post" enctype="multipart/form-data">

<div style="float:left; text-align:left;">
&nbsp; &nbsp; <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
<input type="submit" value="Update Difference" name="diff" />
&nbsp; &nbsp; <input type="button" name="audit_admin" value="Audit Admin" onclick="javascript:add_audit();" />
 <br />
&nbsp; &nbsp; <input type="text" name="keyword" value="{{$keyword}}" style="width:300px;" placeholder="Search for Address"/>
<input type="submit" value="Search" name="search"  /> &nbsp;<input type="submit" name="clear_search" value = "Clear Search" />


<br />
&nbsp; &nbsp;<strong> Filter By Status: </strong> 

        <select name="status_search"/>
        <option value="">Show All</option>
        <option value="2">Planning Approvals</option>
        <option value="5">Inclusions</option>
        <option value="6">Pre Construction</option>
        <option value="3">Construction</option>
        <option value="4">Complete</option>
        </select> 
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" /> 
        <input type="submit" value="Clear Filter" name="clear" /> 
       &nbsp; &nbsp;&nbsp; &nbsp; <input type="submit" value="Show Hidden" name="show_hidden" /> 
        
       
</div>
<div style="float:right;"> 
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}project_audit_report.home/export/1'" /> &nbsp;
</div>

</div>
<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="4%">Hide</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Project</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="10%">MYOB Payments</th>
        <th class="topmenu" align="center" valign="middle" width="10%">MYOB MS Teams Link</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Project Paid Payments</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Difference</th>
        
        <th class="topmenu" align="center" valign="middle" width="10%">HIA Value</th>
        <th class="topmenu" align="center" valign="middle" width="10%">HIA Difference</th>
        <th class="topmenu" align="center" valign="middle" width="10%">PaidVHia</th>
        
        <th class="topmenu" align="center" valign="middle" width="12%">Audit</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Action</th>
                   
      </tr>
    {{if $list}}
    <tbody>

      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
       {{foreach from=$list key="key" item="item"}}
        <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> 
         <form name ="recmet5" method="post" action="">
     	<input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bsn_par_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form> 
        
        </td>
        <td><strong>{{$item.bcust_fname}} {{$item.bcust_lname}}</strong><br />{{$item.bsn_address}}</td>
        <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
        <td>{{$item.status}}</td>
        <td>
        <input type="text" name="myob_payment"  value="{{$item.bsn_par_myob_pay}}" style="width:200px;" onkeyup="update_payment({{$item.bsn_id}},this.value)"  />
         <div id="cond{{$item.bsn_id}}">{{$item.bsn_par_myob_user}}<br /> {{$item.bsn_par_myob_date}}</div>
         
         <script>
			function update_payment(id,value)
			{
					var cond = '#cond'+id;
					
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}project_audit_report.update_myob_pay/bsn_id/"+id+"/value/"+value,
						     success: function(result){
								 $(cond).html(result);
								}
						
					});
			}
	    </script>
        
        </td>
        
        <td>{{if $item.bsn_par_myob_link}}<a href="{{$item.bsn_par_myob_link}}" target="_blank">Link</a><br />
        {{$item.bsn_par_myob_link_date}}
        {{/if}}</td> 
        
        <td> ${{$item.total_value}} 
        <!--<form name ="recmet4" method="post" action="">
     	<input type="hidden" name="last_audit[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="last_audit[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bs_xry_last_audit eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form> 
       {{if $item.bs_xry_last_audit eq 1}} {{$item.bs_xry_last_audit_user}} {{$item.bs_xry_last_audit_date}} {{/if}}-->
       
        </td>
        
        <td> ${{$item.difference}}</td>
        
        <td>${{$item.hia_value}}</td>
        <td>${{$item.hia_difference}} </td>
        <td>${{ $item.PaidVHia }}</td>

        <td>
         <form name ="recmet4" method="post" action="">
          <select name="audit[{{$item.bsn_id}}]" onChange="update_audit({{$item.bsn_id}}, this.value)"/>
                <option value="0" {{if $item.bsn_par_audit eq 0}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $auditData key="key4" item="item4"}}
                <option value="{{$item4.aa_id}}" {{if $item4.aa_id eq $item.bsn_par_audit}} selected="selected" {{/if}}>{{$item4.aa_option}}</option>
                {{/foreach}}
                     
          </select>
        </form>

       
          <script>
			function update_audit(id,value)
			{
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}project_audit_report.update_audit/bsn_id/"+id+"/value/"+value,
						     success: function(result){
						}
					});
			}
	     </script>
        
        
         </td>
        
         <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$item.bsn_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a></td>
        
      </tr>
      {{assign var=countn value=$countn-1}}
      {{/foreach}}
      </tbody>
      
    </form>
    {{/if}}
  </table>
  
  {{if $last > 1}}
  <table width="90%" border="0" cellpadding="0" cellspacing="0">
    <tr> {{if $list}}
      <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>� previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">� previous</a> {{/if}}
          
          {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
          {{if $paginateprev.0 > 3}}
          ...
          {{/if}}
          {{foreach from=$paginateprev key="page_key" item="page_num"}}
          {{if $page_num == $pagenum OR $page_num <= 2}}
          {{elseif $page_num == $lastone}}
          
          {{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
          {{/foreach}}
          
          {{foreach from=$paginatenext key="page_key" item="page_num2"}}
          {{if $page_num2 < $last AND $page_num2 != $lastone}}
          {{if $page_num2 == 1}}
          {{elseif $page_num2 == 2}}
          {{else}}
          {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
          {{/if}}     
          {{/if}}
          {{/foreach}}
          {{if $page_num2 < $lasttow}}
          ...
          {{/if}}
          {{if $lastone == 1}}
          {{elseif $lastone == 2}}
          {{else}}
          {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
          {{/if}}
          {{if $last == 1}}
          {{elseif $last == 2}}
          {{else}}
          {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a> {{/if}}
          {{/if}}
          {{if $pagenum == $last}} <span class='disabled'>next �</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next �</a></div>
        {{/if}} </td>
      {{else}}
      <td align="center" height="300">Record Not found... </td>
      {{/if}} </tr>
  </table>
  {{/if}} <br />
  <br />
  <table id="doclist-table"  width="100%" bgcolor="#d3e8d6">
    <thead>
  
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
    </thead>
  </table>
</div>
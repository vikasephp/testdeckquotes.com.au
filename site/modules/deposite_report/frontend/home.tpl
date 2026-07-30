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

 function add_sent()
{
	var viewurl = "{{$BASE_URL}}deposite_report.view_sent"+ "/random/" + Math.random();	

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

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}deposite_report.view_procedure"+ "/random/" + Math.random();	

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
.set { font-size:12px !important; 
       width:36px !important; display:inline-block; 
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
&nbsp; &nbsp; <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> &nbsp; &nbsp;&nbsp; &nbsp;
<strong> Total Balance : &nbsp; $ {{$totbalance1|number_format:2:".":","}}</strong> <br /> 

&nbsp; &nbsp;<strong> Filter By : </strong> 

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
        
        &nbsp; &nbsp;&nbsp; &nbsp;<input type="submit" value="Last Audited" name="last_audited" /> &nbsp; &nbsp; {{$last_audited}}
        &nbsp; &nbsp;<input type="button" name="sent_options" value="Sent Admin" onclick="javascript:add_sent();" /> 
</div>
<div style="float:right;"> 
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}deposite_report.home/export/1'" /> &nbsp; &nbsp;
<input type="submit" name="showall" value="Show Hidden" /> 
</div>

</div>
<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Project Address</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Status's</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Deposit HIA Value</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Planning HIA Value</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Combined Deposit and Planning</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Paid Total</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Balance</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Special Conditions</th>
        <th class="topmenu" align="center" valign="middle" width="22%">Letter</th>
        <th class="topmenu" align="center" valign="middle" width="22%">Sent</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Hide</th>
                   
      </tr>
    {{if $list}}
    <tbody>

      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
       {{foreach from=$list key="key" item="item"}}
        <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{counter}} </td>
        <td>{{$item.bsn_address}}</td>
        <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
        <td>{{$item.status}}</td>
        <td>{{$item.depo_hia_value}}</td>
        <td>{{$item.planning_hia_value}}</td> 
        <td>$ {{$item.com_dep|number_format:2:".":","}}</td>
        <td>$ {{$item.paid_total|number_format:2:".":","}}</td> 
        <td>$ {{$item.balance|number_format:2:".":","}}</td>
        <td>TBD</td>
        <td>  <form name ="recmet8" method="post" action="">
        <input type="text" name="letter[{{$item.bsn_id}}]" value="{{$item.bs_dr_letter}}" style="width:350px" /> 
        <input type="submit" value="save" name="lettersave" class="set" />
        </form>
        {{if $item.bs_dr_letter}} {{$item.bs_dr_letter_user}}<br />{{$item.bs_dr_letter_date}} {{/if}}
        
        </td>
         
        <td>
        <form name ="recmet2" method="post" action="">
          <select name="sent[{{$item.bsn_id}}]" onChange="update_sent({{$item.bsn_id}}, this.value)"/>
                <option value="0" {{if $item.bsn_dep_repo_sent eq 0}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $sentdata key="key3" item="item3"}}
                <option value="{{$item3.ds_id}}" {{if $item3.ds_id eq $item.bsn_dep_repo_sent}} selected="selected" {{/if}}>{{$item3.ds_option}}</option>
                {{/foreach}}
          </select>
        </form>
         
          <div id="cond{{$item.bsn_id}}">{{$item.bsn_dep_repo_sent_user}} </div> 
       
          <script>
			function update_sent(id,value)
			{
					var cond = '#cond'+id;
					
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}deposite_report.update_sent/bsn_id/"+id+"/value/"+value,
						     success: function(result){
								 $(cond).html(result);
								}
						
					});
			}
	    </script>
        </td>
        
        <td> 
        <form name ="recmet4" method="post" action="">
     	<input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bs_depo_report_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form> 
              
        </td>
        
               
        
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
      <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>« previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">« previous</a> {{/if}}
          
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
          {{if $pagenum == $last}} <span class='disabled'>next »</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next »</a></div>
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
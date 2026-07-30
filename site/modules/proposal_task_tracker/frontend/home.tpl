<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
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
	var viewurl = "{{$BASE_URL}}proposal_task_tracker.view_procedure"+ "/random/" + Math.random();	

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



<script type="text/javascript">
$(function(){
    $(".wrapper1").scroll(function(){
        $(".wrapper2")
            .scrollLeft($(".wrapper1").scrollLeft());
    });
    $(".wrapper2").scroll(function(){
        $(".wrapper1")
            .scrollLeft($(".wrapper2").scrollLeft());
    });
});
</script>
<style>

body{style="border:1px solid #F00;"}
 
.tooltip:hover .tooltiptext {
    visibility: visible;
}

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
	   
.wrapper1, .wrapper2{width: 100%; border: none 0px RED; overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue; }	   

.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:11000px; height: 20px; }
.div2 {width:11000px; overflow: auto;}   
.tableFixHead          { overflow-y: auto; height: 1200px; overflow-x:hidden }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }
table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }
 #fancybox-wrap {z-index:9999999;}   
 
 
}

tr:nth-child(even){background-color: #f2f2f2}
</style>

<h3 class="page-title">Proposal Task Tracker</h3>
<br />

<form name="sort" method="post">
<div style="float:left; text-align: left; margin-left:10px; text-align:left">
&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
<br />

&nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:300px;" placeholder="Search By Checklist Number"/>
&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />
<input type="submit" value="Clear Search" name="clear"  /> 

<span style="color:#0C9; font-weight:bold; border:2px solid #0C9; padding:4px; margin-left:20px;"> ACTIVE : {{$active}} </span> <br />
<input type="submit" value="Sort By Designer" name="sortbydesigner"  />
&nbsp;<strong>Select Designer</strong>
<select name="design">
     {{foreach from=$des_data key="keyd" item="itemd"}}
         <option value="{{$itemd.prd_name}}" {{if $ascdsc eq 1 }} selected="selected" {{/if}} > {{$itemd.prd_name}} </option>
    {{/foreach}}
</select>
<input type="submit" value="Search" name="searchdesigner"  />
<input type="submit" value="Clear Search" name="clear"  />
</div>
</form>

<div style="float:right; text-align: left;">
</div>

<form name="mlist" method="post">

<br />
<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<!--<div class="wrapper2">
    <div class="div2 tableFixHead" >-->
    
    <div style="border:1px solid black;width:auto;height:auto;overflow-y:hidden;overflow-x:scroll;">
    
    <p style="width:300%;">
    
    <div class="div2 tableFixHead" >
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" style="width:15px;">Relevant Checklist Numbers</th>
        <th class="topmenu" align="center" valign="middle" style="width:250px;">Customer Details</th>
   	<th class="topmenu" align="center" valign="middle" style="width:80px;">Link</th>
        <th class="topmenu" align="center" valign="middle" style="width:150px;">Designer</th>
        <th class="topmenu" align="center" valign="middle" style="width:50px;">Days At Status</th>
        <th class="topmenu" align="center" valign="middle" style="width:100px;">Print Project Task Button</th>
        {{foreach from=$colhead key="keyh" item="itemh"}}
        <th class="topmenu" align="center" valign="middle" style="width:80px;" >{{$itemh.bst_task_id}}</th>
        {{/foreach}}
         <th class="topmenu" align="center" valign="middle" style="width:15px;">Relevant Checklist Numbers</th>
         <th class="topmenu" align="center" valign="middle" style="width:180px;">Customer Details </th>  
 
       </tr>
    </thead>
    {{if $list}}

     <tr>
     <td colspan="6"></td> 
    {{foreach from=$colhead key="keyp" item="itemp"}}
     <td><input type="text" name="{{$itemp.bst_task_id}}" value="{{$itemp.bst_ptt_summary}}" style="width:100px;"  onkeyup = "update_ts({{$itemp.bst_task_id}},this.value)"/>
     {{/foreach}}
      <script>
	   
		function update_ts(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}proposal_task_tracker.update_ts/bst_task_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        </td>  
    <td colspan="2"></td>    
    </tr>
        <tbody>
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
     
      <tr {{if $item.dpn_dr_per_complete eq 100}} bgcolor="#99CC99" {{else}} bgcolor="{{cycle values="#dceff5,WHITE" advance=true}} {{/if}}">
        
      <td> {{$item.chknoData}} </td>
      <td> <strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />{{$item.bsn_address}}</td>
      <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
      <td> {{$item.designer}}</td> 
      <td> {{$item.dayscount}}</td> 
      <td> <input type="button" value="Print" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/print/{{$item.bsn_id}}'" /></td> 
      
      
      {{foreach from=$item.task key="keyh" item="itemh"}}
        {{if $itemh}}
     		
        <th valign="middle" width="100px;" style="background:#0C0;">
        <a href="{{$BASE_URL}}business.taskdetailproposal/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}/tsn/{{$item.dpn_proposal_number}}" target="_blank">{{$itemh}}</a> </th>
                
        {{else}}
       <th  align="center" valign="middle" style="width:100px;" >
      <a href="{{$BASE_URL}}business.taskdetailproposal/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}/tsn/{{$item.dpn_proposal_number}}" target="_blank">View<br />Task</a></th>
     {{/if}}
     
     {{/foreach}}   
     <td> {{$item.chknoData}} </td>
     <td> <strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />{{$item.bsn_address}}</td>
         
      </tr>
       
      {{assign var=countn value=$countn-1}}
      {{/foreach}}
      </tbody>
   
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
  {{/if}}
  </div>
  </p>
</div>

 </form>
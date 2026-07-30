<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>

<style>
.set2 { font-size:10px !important; 
       width:60px !important; display:inline-block; 
	  padding-top:1px !important;
	  padding-bottom: 1px !important;
	  padding-left:1px !important;
	  height:25px !important; 
	  margin-top:7px;}
	  
.set3 { font-size:10px !important; 
       width:120px !important; display:inline-block; 
	  padding-top:1px !important;
	  padding-bottom: 1px !important;
	  padding-left:1px !important;
	  height:25px !important; 
	  margin-top:7px;}	  
	  
#fancybox-wrap {z-index:9999999;} 

.dtpic {
	width:65px !important;
	padding-top:1px !important;
	padding-bottom:1px !important;	
}
	  
</style>

<script language="javascript">
function add_procedure()
{
	var viewurl = "{{$BASE_URL}}customer_complete_followup_report.view_procedure"+ "/random/" + Math.random();	

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

function add_occupancy()
{
	var viewurl = "{{$BASE_URL}}roofing_report.view_occupancy"+ "/random/" + Math.random();	

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
&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
</div>


<div style="float:right; text-align:right;"> 
&nbsp; &nbsp;<input type="submit" name="hidden" value ="Show Hidden" />
</div>
</form>


<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">URN.</th>  
                   <th class="topmenu" align="center" valign="middle" width="18%">Project Address </th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Handover Date</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Number of days</th>  
                   <th class="topmenu" align="center" valign="middle" width="8%">Customer Vcard</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Appointment Booked</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Appointment Date </th>
                   <th class="topmenu" align="center" valign="middle" width="15%">Meeting Result </th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Hide</th>
                     
            </tr>
        </thead>

        
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{counter}}</td>
        <td>{{$item.bsn_name}}</td> 
        <td>
        <input type="text" name="han_dt[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.bsn_id}}" value="{{$item.bsn_ccf_handover_date}}" onfocus = "update_hod({{$item.bsn_id}}, this.value);" /> 
           
           <script>
 	   
        function update_hod(id,value)
		{
		var tana10 = "#nod"+id;
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}customer_complete_followup_report.update_hod/bsn_id/"+id+"/value/"+value,
				   success: function(result){
					    $(tana10).html(result);
			   }
			 });
		}
	
       </script>   
        
        </td> 
        <td> <div id="nod{{$item.bsn_id}}">{{$item.dayscount}} </div></td>
         
       <td>
       <a href="{{$BASE_URL}}js/vcard/index.php?fname={{$item.bcust_fname}}&lname={{$item.bcust_lname}}&email1={{$item.bcust_misc_email1}}&email2={{$item.bcust_misc_email2}}&mobile={{$item.bcust_misc_moble}}&business={{$item.bcust_misc_business}}&home={{$item.bcust_misc_home}}" class="action_new" title="Download Vcard">
       <img style="height: 17px; width:22px" src="{{$BASE_URL}}images/vcard.png"/></a>
       </td>
     <td><form name ="recmet3" method="post" action="">
     	<input type="hidden" name="app_book[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="app_book[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bsn_ccf_app_booked eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>
       
       </td>
     
	<td>
         <input type="text" name="han_dt[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo3_{{$item.bsn_id}}" value="{{$item.bsn_ccf_app_date}}" onfocus = "update_app_date({{$item.bsn_id}}, this.value);" /> 
           
           <script>
 	   
        function update_app_date(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}customer_complete_followup_report.update_app_date/bsn_id/"+id+"/value/"+value,
				   success: function(result){
					    
			   }
			 });
		}
	
       </script>   
        
        
        </td>
       <td>
        <form name="cal" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="bsn_id" value="{{$item.bsn_id}}"  />
        <input type="file" name="meeting_result" /><br />
        {{if $item.bsn_ccf_meet_result}}
        <div style="text-align:center;">
     <!--    <a href="https://deckquote.s3.amazonaws.com/files/complete_followup/{{$item.bsn_ccf_meet_result}}" target="_blank">Download</a>-->
         <a href="/customer_complete_followup_report.download_content?file_name={{$item.bsn_ccf_meet_result}}&module_name=customer_complete_followup_report.home" >
         Download</a>
        <a href="{{$BASE_URL}}customer_complete_followup_report.delete_mr/bsn_id/{{$item.bsn_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
         <br /> 
         </div> 
         {{/if}}
         
        <input type= "submit" name="save_mr" title="Save" value="Upload" class="set2"> &nbsp; 
     
        </form>
        </td>
        
        <td>
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bsn_ccf_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
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
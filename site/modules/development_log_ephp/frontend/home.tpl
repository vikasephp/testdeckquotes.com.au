<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{include file=$jdata}}
{{include file=$tiny_basic}} 
<script>

		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');

	</script> 
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<h3 class="page-title">{{$title}}</h3>
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

.grid-container {
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-gap: 20px;
}

</style>
<script type="text/javascript" >  

		$(document).ready(function() {

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
	var viewurl = "{{$BASE_URL}}development_log_ephp.view_procedure"+ "/random/" + Math.random();	

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


function add_sub_type()
{

	var viewurl = "{{$BASE_URL}}development_log_ephp.view_sub_type"+ "/random/" + Math.random();	

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
<div style="float:left; margin-left:3px; text-align:left;">
<form name="filt" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
</div>
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
  <div style="float:left; text-align:left;"> &nbsp;
    <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
    &nbsp;
    <input type="button" name="sub_type" value="Sub Type Admin" onclick="javascript:add_sub_type();" />
    <br />
    &nbsp;<strong>Search From :</strong>
    <input type="text" name="dt_date1" class="w16em dateformat-d-ds-m-ds-Y" value="{{$dt_date1_ss}}" style="width:70px;" />
    To
    <input type="text" name="dt_date2" class="w16em dateformat-d-ds-m-ds-Y" value="{{$dt_date2_ss}}" style="width:70px;" />
    <input type="submit" value="Search" name="date_search" />
    &nbsp; &nbsp;
    <input type="submit" value="Clear Filter" name="clearall"   />
    <br />
    &nbsp;<strong>Search Month & Year :</strong>
    <select name="month"  >
      <option value="0">Please Select </option>
      <option value="01" {{if $month eq '01'}} selected="selected" {{/if}}>January</option>
      <option value="02" {{if $month eq '02'}} selected="selected" {{/if}}>February</option>
      <option value="03" {{if $month eq '03'}} selected="selected" {{/if}}>March</option>
      <option value="04" {{if $month eq '04'}} selected="selected" {{/if}}>April</option>
      <option value="05" {{if $month eq '05'}} selected="selected" {{/if}}>May</option>
      <option value="06" {{if $month eq '06'}} selected="selected" {{/if}}>June</option>
      <option value="07" {{if $month eq '07'}} selected="selected" {{/if}}>July</option>
      <option value="08" {{if $month eq '08'}} selected="selected" {{/if}}>August</option>
      <option value="09" {{if $month eq '09'}} selected="selected" {{/if}}>September</option>
      <option value="10" {{if $month eq '10'}} selected="selected" {{/if}}>October</option>
      <option value="11" {{if $month eq '11'}} selected="selected" {{/if}}>November</option>
      <option value="12" {{if $month eq '12'}} selected="selected" {{/if}}>December</option>
    </select>
    <select name="year"  >
      <option value="0">Please Select </option>
      <option value="2025" {{if $year eq '2025'}}  selected="selected" {{/if}}>2025</option>
      <option value="2026" {{if $year eq '2026'}}  selected="selected" {{/if}}>2026</option>
      <option value="2027" {{if $year eq '2027'}}  selected="selected" {{/if}}>2027</option>
      <option value="2028" {{if $year eq '2028'}}  selected="selected" {{/if}}>2028</option>
      <option value="2029" {{if $year eq '2029'}}  selected="selected" {{/if}}>2029</option>
    </select>
    <input type="submit" value="Search" name="month_search" />
    &nbsp; &nbsp;
    <input type="submit" value="Clear Filter" name="clearall"   />
    &nbsp; &nbsp; <strong>Value US $ :</strong>
    <input type="text" name="dd_dollar_value" value="{{$dollar_value.dd_dollar_value}}" style="width:40px" />
    <input type="submit" value="Update" name="dollar_value" />
    {{if $month && $year || $dt_date1_ss && $dt_date2_ss}} <span style="background:#FF9; color:#F30; padding:5px; border:1px solid #06F; display:inline-grid;"> <strong> Development/Others Hours : {{$dev_tot}} &nbsp; &nbsp; Testing Hours : {{$test_tot|number_format:2:".":","}} &nbsp; &nbsp; Total Hours : {{$total_hours|number_format:2:".":","}} <br />
    Server Task Hours : {{$ser_hour}} </strong> </div>
  {{/if}} </span>
  </div>
  <div style="float:right;">
    <input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
    &nbsp;&nbsp; </div>
</form>
<div id="">
  <table id="list-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="5%">Date</th>
        <th class="topmenu" align="center" valign="middle" width="22%">What</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Who</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Total Dev Hours</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Cost</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Task Type</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Sub Type</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Fully Tested</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Re Tested</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Approved<br />(Client)</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Testing Hours</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Testing By</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Test Video Link</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Link To <br /> Dev Doc</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Paid/Unpaid</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Action</th>
      </tr>
    </thead>
    <tbody>
    
    {{assign var=countn value= $total}}
    
    {{foreach from=$list key="key" item="item"}}
    <tr bgcolor="#FFFFFF">
      <td>{{$item.de_date}}</td>
      <td>{{$item.de_what}}</td>
      <td>{{$item.de_who}}</td>
      <td><input type="text" name="de_total_hours" value="{{$item.de_total_hours}}" onkeyup="update_hours({{$item.de_id}},this.value)" style="width:50px;" />
        <script>

        function update_hours(id,value)
		{
		 $.ajax({
					   type: "GET",

					   url: "{{$BASE_URL}}development_log_ephp.update_hours/de_id/"+id+"/value/"+value,

						   success: function(result){

					   }

					 });

		}

		</script>
        </td>
        
        <td>${{$item.cost}}</td>
        
      <td><select name="de_status" onchange="update_status({{$item.de_id}},this.value)" >
          <option value="0">Please Select </option>
          <option value="In Progress" {{if $item.de_status eq 'In Progress'}} selected="selected" {{/if}}>In Progress</option>
          <option value="Completed"   {{if $item.de_status eq 'Completed'}} selected="selected" {{/if}}>Completed</option>
        </select>
        <script type="text/javascript">

			function update_status(id,value)
			{

		    	 $.ajax({

					   type: "GET",

					   url: "{{$BASE_URL}}development_log_ephp.update_status/de_id/"+id+"/value/"+value,
						   success: function(result){
					   }

					 });
			}

		</script>
        </td>
        
      <td>
      <select name="de_type" onchange="update_type({{$item.de_id}},this.value)" >
          <option value="0">Please Select </option>
          <option value="Gcon Task" {{if $item.de_type eq 'Gcon Task'}} selected="selected" {{/if}}>Gcon Task</option>
          <option value="BES Task" {{if $item.de_type eq 'BES Task'}} selected="selected" {{/if}}>BES Task</option>
          <option value="Website Task"  {{if $item.de_type eq 'Website Task'}} selected="selected" {{/if}}>Website Task</option>
          <option value="Server Task" {{if $item.de_type eq 'Server Task'}} selected="selected" {{/if}}>Server Task</option>
          <option value="Other Task" {{if $item.de_type eq 'Other Task'}} selected="selected" {{/if}}>Other Task</option>
        </select>
        
        <script type="text/javascript">

			function update_type(id,value)
			{
		    	 $.ajax({

					   type: "GET",

					   url: "{{$BASE_URL}}development_log_ephp.update_type/de_id/"+id+"/value/"+value,
						   success: function(result){
					   }

					 });
			}

		</script></td>
        
      <td><select name="de_sub_type" onchange="update_sub_type({{$item.de_id}},this.value)" >
          <option value="0">Please Select </option>
     
                {{foreach from=$subtypedata key="key2" item="item2"}}
             
          <option value="{{$item2.st_id}}" {{if $item.de_sub_type eq $item2.st_id}} selected="selected" {{/if}}>{{$item2.st_option}}</option>
                {{/foreach}}
      
        </select>
        <script type="text/javascript">

	
			function update_sub_type(id,value)
			{

		    	 $.ajax({

					   type: "GET",

					   url: "{{$BASE_URL}}development_log_ephp.update_sub_type/de_id/"+id+"/value/"+value,

						   success: function(result){

					   }

					 });
			}

		</script></td>
        
      <td><form name ="recmet3" method="post" action="">
          <input type="hidden" name="de_full_tested[{{$item.de_id}}]" value="0" />
          <label class="switch">
            <input class="switch-input" type="checkbox"  name="de_full_tested[{{$item.de_id}}]" value="1"  onclick="this.form.submit();" {{if $item.de_full_tested eq 1 }} checked="checked" {{/if}} />
            <span class="switch-label" data-on="Yes" data-off="No"></span> <span class="switch-handle"></span> <br />
          </label>
        </form>
     {{$item.de_full_tested_user}}   
     </td>
        
      <td>
        <form name ="recmet3" method="post" action="">
          <input type="hidden" name="de_re_tested[{{$item.de_id}}]" value="0" />
          <label class="switch">
            <input class="switch-input" type="checkbox"  name="de_re_tested[{{$item.de_id}}]" value="1"  onclick="this.form.submit();" {{if $item.de_re_tested eq 1 }} checked="checked" {{/if}} />
            <span class="switch-label" data-on="Yes" data-off="No"></span> <span class="switch-handle"></span> <br />
          </label>
        </form>
        {{$item.de_re_tested_user}} 
        </td>
        
        <td> 
        <form name ="recmet5" method="post" action="">
          <input type="hidden" name="approved[{{$item.de_id}}]" value="0" />
          <label class="switch">
            <input class="switch-input" type="checkbox"  name="approved[{{$item.de_id}}]" value="1"  onclick="this.form.submit();" {{if $item.de_approved eq 1 }} checked="checked" {{/if}} />
            <span class="switch-label" data-on="Yes" data-off="No"></span> <span class="switch-handle"></span> <br />
          </label>
        </form>
        {{if $item.de_approved eq 1}} {{$item.de_approved_user}} {{/if}}
        </td>
        
      <td>
      <input type="text" name="de_testing_hours" value="{{$item.de_testing_hours}}" onkeyup="update_testing_hours({{$item.de_id}},this.value)" style="width:50px;" />
        <script>

        function update_testing_hours(id,value)
		{

		 $.ajax({

					   type: "GET",

					   url: "{{$BASE_URL}}development_log_ephp.update_testing_hours/de_id/"+id+"/value/"+value,

						   success: function(result){

					   }

					 });

		}

		</script></td>
      <td><input type="text" name="de_tested_by" value="{{$item.de_tested_by}}" onkeyup="update_tested_by({{$item.de_id}},this.value)" style="width:120px;" />
        <script>

        function update_tested_by(id,value)
		{
		 $.ajax({

					   type: "GET",

					   url: "{{$BASE_URL}}development_log_ephp.update_tested_by/de_id/"+id+"/value/"+value,
						   success: function(result){
					   }

					 });

		}

		</script></td>
      <td> 
        
        {{foreach from=$item.video_data key="key1" item="item1"}} <a href="/development_log_ephp.download_content?file_name={{$item1.dv_video}}&module_name=development_log_ephp.home" target="_blank"/> Download</a> <br />
        {{/foreach}}
        <form name="ps" method="post" enctype="multipart/form-data">
          <input type="hidden" name="de_id" value="{{$item.de_id}}"  />
          <input type="file" name="video_file" />
          <br />
          <input type= "submit" name="save_video" title="Save" value="Upload" class="but">
          &nbsp;
        </form></td>
      <td>{{if $item.de_doc_link}}<a href ="{{$item.de_doc_link}}" target="_blank">Link</a>{{/if}}</td>
      <td><select name="de_pu" onchange="update_pu({{$item.de_id}},this.value)" >
          <option value="0" {{if $item.de_paid eq '0'}} selected="selected" {{/if}}>Unpaid</option>
          <option value="1"   {{if $item.de_paid eq '1'}} selected="selected" {{/if}}>Paid</option>
        </select>
        <script type="text/javascript">
	

			function update_pu(id,value)
			{

		    	 $.ajax({

					   type: "GET",

					   url: "{{$BASE_URL}}development_log_ephp.update_pu/de_id/"+id+"/value/"+value,
						   success: function(result){
					   }

					 });
			}

		</script></td>
      <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp; <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"> <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp </td>
    </tr>
    {{assign var=countn value=$countn-1}}
    
    {{/foreach}}
      </tbody>
    
  </table>
  {{if $last > 1}}
  <table width="90%" border="0" cellpadding="0" cellspacing="0">
    <tr> {{if $list}}
      <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&#171; previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">&#171; previous</a> {{/if}}
          
          
          
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
          
          {{if $pagenum == $last}} <span class='disabled'>next &#187;</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next &#187;</a></div>
        {{/if}} </td>
      {{else}}
      <td align="center" height="300">Record Not found... </td>
      {{/if}} </tr>
  </table>
  {{/if}} </div>
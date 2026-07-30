<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />
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


function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
	

function add_procedure()
        {
	var viewurl = "{{$BASE_URL}}email_list_builder.view_procedure"+ "/random/" + Math.random();	

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


var expanded = false;

function showCheckboxes() {
  var checkboxes = document.getElementById("checkboxes");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}
	
	
</script>

<style>
		  
#fancybox-wrap {z-index:9999999;} 

.multiselect {
  width: 230px;
  display:inline-block;
}

.selectBox {
  position: relative;
  
}

.selectBox select {
  width: 100%;
  font-weight: bold;
}

.overSelect {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
}

#checkboxes {
  display: none;
  border: 1px #dadada solid;
  height: 100px;
  overflow-y:scroll;
}

#checkboxes label {
  display: block;
}

#checkboxes label:hover {
  background-color: #1e90ff;
}

	  
</style>




<br />
<h3 class="page-title">{{$title}}</h3>
<br /><br />
<form name="emlist" method="post" action="">
<div style="float:left; width:100%; text-align:left; margin-left:20px;">
&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp;&nbsp;&nbsp;&nbsp;
<div class="multiselect" >
    <div class="selectBox" onclick="showCheckboxes()" >
      <select>
        <option>Select Status</option>
      </select>
      <div class="overSelect"></div>
    </div>
    <div id="checkboxes">
    
    {{foreach from=$statusdetail key="key15" item="item15"}}
    	<label for="four{{$item15.si_id}}">
        <input type="checkbox" id="four{{$item15.si_id}}" name="status[{{$item15.si_id}}]" value="{{$item15.st_id}}" />{{$item15.st_name}}</label>
    {{/foreach}}
    </div>
</div>&nbsp;&nbsp;
<input type="submit" value="Export TO Excel" name="search_status"  /> 
</div>
</form>


  <!--<table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Task Id</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Task Type</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Task Name</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Question</th>
        <th class="topmenu" align="center" valign="middle" width="20%">Who to answer it</th>
        
        </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
    
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{counter}} </td>
        <td>{{$item.ps_task_id}}</td>
        <td>{{$item.task_type}}</td>
        <td>{{$item.bst_task_name}}</td>
        <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
         <td>{{$item.ps_question}} </td>
         <td>
<input type="text" name="ans[{{$item.ps_id}}" value="{{$item.ps_who_to_answer_it}}" style="width:400px;" onkeyup="update_whotoanswer({{$item.ps_id}},'{{$item.task_type}}',this.value)" />
         <script>
        
	function update_whotoanswer(id,type,value)
		{
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}pp_task_unasnwerd_qa_report.update_who_to/id/"+id+"/type/"+type+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>	
         
          </td> 
      </tr>
  
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
</div>-->
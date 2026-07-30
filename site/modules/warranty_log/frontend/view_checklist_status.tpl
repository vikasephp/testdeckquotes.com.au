
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

<style>
input {
    width: 68px;
    overflow:hidden;
}
</style>


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<script type="application/javascript">

function add_new(url)
 {
	
 var viewurl = url;
 $(document).ready(function () {
        $.fancybox({
				'width': '99%',
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


<div align="center" style="min-height:350px; z-index:9999999;">
    <h3 class="page-title">Mini Checklist</h3>    
 <div style="float:left; text-align:left; margin-left:10px; ">
 <strong> {{$wa_project}} <br />
 Log : {{$wa_id}} <br />
 {{$wa_type}}
 </strong>
 <br /><br />
 <form name="detail" method="post" action=""  enctype="multipart/form-data">
 <input type="hidden" name = "wa_id" value="{{$wa_id}}">
 <input type="submit" name = "mark" value = "Mark all as Doesn't Apply" onclick="javascript:if(!confirm('Are you sure?')) return false;" /> 
 </form>
 </div>  

<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="99%" cellpadding="10">
<tr>
<th style="width:20%">Task Name1</th>
<th style="width:35%">Task Description</th>
<th style="width:20%">Status</th>
<th style="width:15%">Due Date</th>
<th style="width:10%">Link To Procedure</th>
<!--<th style="width:15%">Notes</th>-->
</tr>

{{foreach from=$data key="key" item="item"}}
<tr>
<td>{{$item.wc_task_name}}</td>
<td>{{$item.wc_task}}</td>
<td>
    <select name="status{{$item.wc_id}}" Onchange = "update_status({{$item.ch_id}},this.value)">
    <option value="">Please Select</option>
    <option value="Complete" {{if $item.ch_status eq  'Complete'}} selected="selected" {{/if}}>Complete</option>
   <!-- <option value="Incomplete" {{if $item.ch_status eq  'Incomplete'}} selected="selected" {{/if}}>Incomplete</option>-->
    <option value="Doesnt Apply" {{if $item.ch_status eq  'Doesnt Apply'}} selected="selected" {{/if}}>Doesn't Apply</option>
    </select><br />
   <div id="usr{{$item.ch_id}}"> {{$item.ch_user}}<br />{{$item.ch_date}} </div>
   <script>
	   
		function update_status(id,value)
		{
			var tana = "#usr"+id;	
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}warranty_log.update_checklist_status/ch_id/"+id+"/value/"+value,
					   success: function(result){
						    $(tana).html(result);
					}
				});
		}
	</script>
</td>
<td>

 <input type="text" name="due_date[{{$item.ch_id}}]"  class="w16em dateformat-d-ds-m-ds-Y"  id="demo_{{$item.ch_id}}" value="{{$item.ch_due_date}}" onfocus ="update_due_date({{$item.ch_id}}, this.value);"  /> 
 
 
 <script>
 	function update_due_date(id,value)
		{
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}warranty_log.update_due_date/ch_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
					
		}
 </script>
 
</td>
<td>{{if $item.wc_link}}<a href="{{$item.wc_link}}" target="_blank">Link</a>{{/if}}</td>
<!--<td style="width:15%"> <a href="{{$BASE_URL}}warranty_log.view_notes_checklist/ch_id/{{$item.ch_id}}/wa_id/{{$wa_id}}" class="various">Notes</a></td>-->
</tr>

{{/foreach}}
</table><br /><br />

<input type="button" name="btnCancelDetail" value="Close and Refresh" onclick="javascript:closepop();" class="vsml" />
<input type="button" name="btnCancelDetail2" value="Close without refresh" onclick="close2();" class="vsml" />

    
        <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		//window.location.href = "{{$BASE_URL}}construction_alert_report.view_scar/sup_email/{{$sup_email}}";
		}
		
		function close2()
		{
		
		parent.$.fancybox.close();
		}
	     </script>	
</div>
</form>
<script>
	initSample();
</script>

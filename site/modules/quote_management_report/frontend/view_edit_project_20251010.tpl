<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />-->
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; z-index:9999999;">
    <h3 class="page-title"><br />View Edit Project</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<div style="display:none; float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}quote_management_report.add_component/qb_id/{{$qb_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;"> Add New Edit Project </a>
</div>

<style>
#list-table2 tr *{
	border: 1px solid #C1DAD7;
    border-collapse: collapse;
    font-weight: normal;
    text-align: left;
    font-size: 12px;
    padding: 5px;
}
</style>

<table id="list-table2" width="99%">
	<tr>
		<th width="30%">Select Project</th>
		<td width="70%">
		<datalist id='project'>
		   {{foreach from=$projdetail key="key3" item="item_project"}}
			<option value="{{$item_project.bsn_name}}">
				{{$item_project.bsn_name}}
			</option>
			{{/foreach}}
		 </datalist>
         <input type="text" id="projectIn" list='project' name="qmr[qm_project]" style ="width:100%;" value="{{$detail.qm_project}}" />
		</td>
	</tr>
</table><br/>
<table id="list-table" width="99%" style="display:none;">
	<tr> 
		<th width="60%">Component Name</th>
		<th width="40%">Action Required</th>
	</tr> 
   {{foreach from=$componentData key="key" item="item"}}
   <tr pro="{{$project_get}}">
	<td>{{$item.qb_component}}</td>
	<td>
		<!--<select name="component_action_required" Onchange="update_action_required({{$item.qb_id}},this.value)">
			<option value="-1">Please Select Action</option>
			<option value="1" {{if $item.qb_component_action eq 1 }}selected{{/if}}>Required</option>
			<option value="2" {{if $item.qb_component_action eq 2 }}selected{{/if}}>Not Required</option>
		</select>
		<script>
			function update_action_required(id, value) {

				$.ajax({
					type: "GET",
					url: "{{$BASE_URL}}quote_management_report.update_component_action_required/qb_id/" + id + "/value/" + value,
					success: function (result) {
					}
				});
			}
		</script>-->
		{{assign var="saved_action" value="-1"}}
    
		{{foreach from=$qmrData item="qmr"}}
			{{if $qmr.qm_project eq $detail.qm_project && $qmr.qm_component eq $item.qb_id}}
				{{assign var="saved_action" value=$qmr.qm_component_action}}
			{{/if}}
		{{/foreach}}

		<select data-check="{{$detail.qm_project}}" name="qmr[components][{{$item.qb_id}}]">
			<option value="-1" {{if $saved_action eq "-1"}}selected{{/if}}>Please Select Action</option>
			<option value="1" {{if $saved_action eq "1"}}selected{{/if}}>Required</option>
			<option value="2" {{if $saved_action eq "2"}}selected{{/if}}>Not Required</option>
		</select>
	</td>
   </tr> 
  {{/foreach}}

</table><br /><br />
<input type="submit" name="subAddDetail" value="Save" class="vsml" />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
	<script>
	document.addEventListener('DOMContentLoaded', function () {
		const projectInput = document.querySelector('input[list="project"]');
		const componentTable = document.getElementById('list-table');

		const validProjects = Array.from(document.querySelectorAll('#project option'))
			.map(opt => opt.value.trim().toLowerCase());

		function checkProjectValidity() {
			const inputValue = projectInput.value.trim().toLowerCase();
			componentTable.style.display = (inputValue && validProjects.includes(inputValue)) ? 'table' : 'none';
		}

		checkProjectValidity(); // On page load
		projectInput.addEventListener('input', checkProjectValidity);
	});
	</script>


	<script>
	document.getElementById('projectIn').addEventListener('change', function () {
		const projectName = encodeURIComponent(this.value.trim());
		if (projectName) {
			window.location.href = "{{$BASE_URL}}quote_management_report.view_edit_project?selected_project=" + projectName;
		}
	});
	</script>



    <script>
		function closepop(){
			setTimeout('parent.close_win();', 500);
		}
	</script>
	
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			//frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
			
    </script>
</div>

<script>
	initSample();
</script>
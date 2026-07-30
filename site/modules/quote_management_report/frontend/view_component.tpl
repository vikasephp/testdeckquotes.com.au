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

<script type="application/javascript">


function add_new(url)
 {
//var viewurl = "{{$BASE_URL}}designer_tracker.detail"+ "/random/" + Math.random();	
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
    <h3 class="page-title"><br />View Component</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}quote_management_report.add_component/qb_id/{{$qb_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;"> Add New Component </a>
</div>


<table id="list-table" width="99%">
<tr> 
		<th width="5%">Component ID</th>
		<th width="35%">Component Name </th>
		<th width="10%">Component Procedure</th>
		<th width="10">Email Link</th>
		<th width="15">Responsible Staff</th>
		<th width="15">Due Date</th>
		<th width="10">Action</th>
       {{foreach from=$componentData key="key" item="item"}}
       <tr>
      	 
        <td>{{$item.qb_id}}</td>
        <td>{{$item.qb_component}}</td>
		<td style="text-align: center;">
			{{if $item.qb_component_procedure_link}}
			<a href="{{$item.qb_component_procedure_link}}" target="_blank">Link</a>
			{{/if}}
		</td>
		<td>{{$item.eml_code}}</td>
        <td>{{$item.qb_sup_position}} - {{$item.qb_sup_name}} {{if $item.qb_sup_email}}- {{$item.qb_sup_email}}{{/if}}</td>
        <td>{{if $item.qb_due_date_week}}
        {{$item.qb_due_date_week}} Week &nbsp;{{if $item.qb_due_date_sod eq 1}} Before {{else}} After {{/if}}</td>
       {{/if}}
        <td> <a href="{{$BASE_URL}}quote_management_report.add_component/qb_id/{{$item.qb_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             
         <a href="{{$BASE_URL}}quote_management_report.delete_component/qb_id/{{$item.qb_id}}" onclick="javascript:if(!confirm('Are you sure want to delete the Task?')) return false;" title="Delete">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
         </td>    
       </tr> 
      {{/foreach}}

</table><br /><br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
			
    </script>
</div>

<script>
	initSample();
</script>
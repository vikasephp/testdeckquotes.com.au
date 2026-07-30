<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />-->
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>
	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;"><br /><br />
    <h3 class="page-title">Action Steps</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.design_team}}"  enctype="multipart/form-data">
<table id="list-table" width="80%">
<tr> 
<th>Description</th><th>Action</th>
       {{foreach from=$catlist key="key" item="item"}}
       <tr>
      	 
        <td>{{$item.ap_description}}</td>
  
        <td> <a href="{{$BASE_URL}}construction_alert_report.add_steps/ap_id/{{$item.ap_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             
         <a href="{{$BASE_URL}}construction_alert_report.delete_steps/ap_id/{{$item.ap_id}}" onclick="javascript:if(!confirm('Are you sure want to delete the action step?')) return false;" title="Delete">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
         </td>    
       </tr> 
      {{/foreach}}

</table>
<br />
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
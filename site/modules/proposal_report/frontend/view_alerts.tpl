<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />



{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:20px;">
    <h3 class="page-title">Proposal Alerts</h3>    
   <br /><br />
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="95%">
<tr> 
            <th width="18%">Who</th>
            <th width="8%">When</th>
            <th width="35%">What</th>
            <th width="16%">Assign To</th>
            <th width="8%">Active</th>
            <th width="12%">Action Date</th>
            
       </tr>
       
        {{foreach from=$list key="key" item="item"}}
         <tr>
        
			<td>{{$item.user_name}}</td>
            <td>{{$item.be_created_date|date_format:"%d-%m-%Y"}}</td>
         
            <td>{{$item.be_alert_text}}</td>
            <td>{{$item.be_assign_to}} </td>
            {{if $item.be_action_date}}
            <td style="background:#093;">
            {{else}}
            <td style="background:#F00;">
            {{/if}}
            {{$item.be_alert_active}}</td>
            <td> {{$item.be_action_date}} &nbsp;&nbsp;  
            <a href="{{$BASE_URL}}presented_but_not_signed_report.proposal_alert_action/be_id/{{$item.be_id}}/bsn_id/{{$bsn_id}}">
	<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png" title="Task Edit"/></a> </td>
            
       <!--  <td><input type="checkbox" {{if $item.be_answer_required == 1}} checked="checked" {{/if}} disabled="disabled"/></td>-->
         </tr>
         {{/foreach}}	

</table>
</form>
    <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />  
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
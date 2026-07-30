<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Predecessors and Lags</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="pre_lag[pl_cs_id]" value="{{$detail.pl_cs_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
   <tr>
   <th style="width:10%">Row #</th>
   <th style="width:50%">Event</th>
   <th style="width:25%">Type</th>
   <th style="width:15%">Lag</th>
   </tr>
   
    <tr>
    <td></td>
    
    <td>
        <select name="pre_lag[pl_ev_id]" >
        {{foreach from = $eventData key="key" item="item"}}
        <option value="{{$item.cs_id}}" {{if $item.cs_id eq $detail.pl_ev_id}} selected="selected" {{/if}}>{{$item.cs_event_name}}</option>        
        {{/foreach}}
        </select>
    </td>
    
    <td>
     <select name="pre_lag[pl_type]" >
      <option value="FS" {{if $detail.pl_type eq 'FS'}} selected="selected" {{/if}}>Start after the predecessor finishes</option>
      <option value="FF" {{if $detail.pl_type eq 'FF'}} selected="selected" {{/if}}>Finish at the same time that the predecessor finishes</option>
      <option value="SS" {{if $detail.pl_type eq 'SS'}} selected="selected" {{/if}}>Start at the same time that the predecessor starts</option>
      <option value="SF" {{if $detail.pl_type eq 'SF'}} selected="selected" {{/if}}>Finish before the predecessor starts</option>
     </select>
    </td>
    <td><input type="text" name="pre_lag[pl_lag]" style="width:90px;" value="{{$detail.pl_lag}}" /></td>
    
    </tr>
   
  
          
    <tr>
        <td colspan="4" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
        <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		//window.location.href = "{{$BASE_URL}}letterboxing_planning.view_procedure";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	 var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[wt_task_name]","req", "Please specify task.");
	</script>
</div>
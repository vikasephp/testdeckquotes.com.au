<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
//window.location.href = "{{$BASE_URL}}watch_list_report.print_pdf";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Generate Watch List PDF Report</h3>    
   <br />
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="90%">
    <input type="hidden" name="task[pr_id]" value="{{$detail.pr_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th style="width:25%;">Filter By Rating </th>
     <td> From : &nbsp;
        <select name="from"  >
       <option value="0" {{if $item.bsn_rating eq 0}} selected="selected" {{/if}}> 0 </option>
       <option value="1" {{if $item.bsn_rating eq 1}} selected="selected" {{/if}}> 1 </option>
       <option value="2" {{if $item.bsn_rating eq 2}} selected="selected" {{/if}}> 2 </option>
       <option value="3" {{if $item.bsn_rating eq 3}} selected="selected" {{/if}}> 3 </option>
       <option value="4" {{if $item.bsn_rating eq 4}} selected="selected" {{/if}}> 4 </option>
       <option value="5" {{if $item.bsn_rating eq 5}} selected="selected" {{/if}}> 5 </option>
       <option value="6" {{if $item.bsn_rating eq 6}} selected="selected" {{/if}}> 6 </option>
       <option value="7" {{if $item.bsn_rating eq 7}} selected="selected" {{/if}}> 7 </option>
       <option value="8" {{if $item.bsn_rating eq 8}} selected="selected" {{/if}}> 8 </option>
       <option value="9" {{if $item.bsn_rating eq 9}} selected="selected" {{/if}}> 9 </option>
       <option value="10" {{if $item.bsn_rating eq 10}} selected="selected" {{/if}}> 10 </option>
       </select> &nbsp; &nbsp; &nbsp; &nbsp; 
       
       To : &nbsp;
        <select name="to"  >
       <option value="0" {{if $item.bsn_rating eq 0}} selected="selected" {{/if}}> 0 </option>
       <option value="1" {{if $item.bsn_rating eq 1}} selected="selected" {{/if}}> 1 </option>
       <option value="2" {{if $item.bsn_rating eq 2}} selected="selected" {{/if}}> 2 </option>
       <option value="3" {{if $item.bsn_rating eq 3}} selected="selected" {{/if}}> 3 </option>
       <option value="4" {{if $item.bsn_rating eq 4}} selected="selected" {{/if}}> 4 </option>
       <option value="5" {{if $item.bsn_rating eq 5}} selected="selected" {{/if}}> 5 </option>
       <option value="6" {{if $item.bsn_rating eq 6}} selected="selected" {{/if}}> 6 </option>
       <option value="7" {{if $item.bsn_rating eq 7}} selected="selected" {{/if}}> 7 </option>
       <option value="8" {{if $item.bsn_rating eq 8}} selected="selected" {{/if}}> 8 </option>
       <option value="9" {{if $item.bsn_rating eq 9}} selected="selected" {{/if}}> 9 </option>
       <option value="10" {{if $item.bsn_rating eq 10}} selected="selected" {{/if}}> 10 </option>
       </select> 
      </td>
    </tr>
   
  <tr>
     <th>Days Count</th>
     <td>
          <input type="text"  name="days" style ="width:200px" />
      </td>
    </tr>
   
  
       
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Generate PDF" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
        <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		//window.location.href = "{{$BASE_URL}}watch_list_report.view_procedure";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	 	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[wt_task_name]","req", "Please specify task.");
	</script>
</div>
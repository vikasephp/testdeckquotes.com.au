<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);
window.location.href = "{{$BASE_URL}}quote_tracking_report.view_status_po";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Add/Edit New Status Option</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="task[qs_id]" value="{{$detail.qs_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Status Option </th>
     <td>
          <input type="text"  name="task[qs_name]" style ="width:700px" value="{{$detail.qs_name}}"  required="required"/>
      </td>
    </tr>
   
  <tr>
     <th>Color Code</th>
     <td><select  name="task[qs_color]">
       <option value ="" {{if $detail.qs_color eq ''}} selected="selected" {{/if}}>No Color</option>
       <option value ="#1ecf52" {{if $detail.qs_color eq '#1ecf52'}} selected="selected" {{/if}}>Green</option>
      
       <option value ="#f70000" {{if $detail.qs_color eq '#f70000'}} selected="selected" {{/if}}>Red</option>
       <option value ="#6d6e70" {{if $detail.qs_color eq '#6d6e70'}} selected="selected" {{/if}}>Grey</option>
       <option value= "#f7f700" {{if $detail.qs_color eq '#f7f700'}} selected="selected" {{/if}}>Yellow</option>
   
        </select>
          
      </td>
    </tr>
   
  
       
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
        <script type="text/javascript">
		function closepop()
		{
		//setTimeout('parent.close_win();', 500);
		window.location.href = "{{$BASE_URL}}quote_tracking_report.view_status_po";
		}
	</script>
    
</div>
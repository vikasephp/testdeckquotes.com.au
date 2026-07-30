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
    <h3 class="page-title">Insert PO To Existing Delivery</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="90%">
    <input type="hidden" name="task[pr_id]" value="{{$detail.pr_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th style="width:30%">Select UIDD </th>
     <td>

        <datalist id="uidd">
        {{foreach from = $uidddetail key="key2" item="item2"}}
        <option value="{{$item2.ds_uidd}}">{{$item2.ds_uidd}}</option>
        {{/foreach}}
        </datalist>
  
      <input type="text" list="uidd" name="insert[ds_uidd]" />
      </td>
    </tr>
   
    <tr>
     <th>Number of PO to be inserted</th>
     <td>
          
          <select name="insert[ds_sub_number]" style="width:100px;">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          </select>
      </td>
    </tr>
    
     <tr>
     <th style="width:30%">Select Project </th>
     <td>
    	 <datalist id='project'>
           {{foreach from=$projdetail key="key" item="item"}}
            <option value="{{$item.bsn_name}}" {{if $bsnid eq $item.bsn_id}} selected="selected" {{/if}}>
            {{$item.bsn_name}}
            </option>
            {{/foreach}}
       
	   </datalist>
           <input type="text" list = 'project' name="insert[ds_project]" style ="width:700px" value="{{$detail.ds_project}}" />
      </td>
    </tr>
    
     <tr>
     <th style="width:30%">Select Delivery Component</th>
     <td>
    	<select name="insert[ds_delivery_event]">
        <option value="-1" {{if $item.po_delivery_event eq -1}} selected="selected" {{/if}}>Please Select </option>
        {{foreach from = $cdetail key="key3" item="item3"}}
        <option value="{{$item3.qb_id}}" {{if $item3.qb_id eq $item.ds_delivery_event }} selected="selected" {{/if}}>{{$item3.qb_component}}</option>
        {{/foreach}}
    </select>
      </td>
    </tr>
    
     <tr>
     <th style="width:30%">Enter PO Number</th>
     <td>
    	<datalist id='ponum'>
           {{foreach from=$podetail key="key4" item="item4"}}
            <option value="{{$item4.po_po_number}}" >
            {{$item4.po_po_number}}
            </option>
            {{/foreach}}
       
	   </datalist>
           <input type="text" list = 'ponum' name="insert[ds_po_number]" style ="width:200px" value="{{$detail.ds_po_number}}" />
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
			setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	 	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[wt_task_name]","req", "Please specify task.");
	</script>
</div>
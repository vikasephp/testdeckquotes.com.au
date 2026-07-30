<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" /> 
    
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key1" item="item1"}}
            <option value="{{$item1.bsn_name}}" {{if $bsnid eq $item1.bsn_id}} selected="selected" {{/if}}>
            {{$item1.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[dc_project]" style ="width:700px" value="{{$detail.dc_project}}" />
      </td>
    </tr>
   
    <tr>
     <th>Status </th>
     <td><select name="{{$TABLE}}[dc_status]" style="width:300px;"/>
      		 {{foreach from = $statusdetail key="key2" item="item2"}}
                <option value="{{$item2.st_id}}" {{if $item2.st_id eq $detail.dc_status}} selected="selected" {{/if}}>{{$item2.st_status}}</option>
                {{/foreach}}        
         </select>  
    </td>
    </tr>  
   
    <tr>
     <th>Owner </th>
     <td><select name="{{$TABLE}}[dc_owner]" style="width:300px;"/>
      		 {{foreach from = $ownerdetail key="key3" item="item3"}}
                <option value="{{$item3.ow_id}}" {{if $item3.st_id eq $detail.dc_owner}} selected="selected" {{/if}}>{{$item3.ow_owner}}</option>
                {{/foreach}}        
         </select>  
    </td>
    </tr>  
   
   <tr>
   <th>Event</th>
   <td> 
          <select name="{{$TABLE}}[dc_event]" style="width:300px;"/>
      		 {{foreach from = $eventdetail key="key4" item="item4"}}
                <option value="{{$item4.ev_id}}" {{if $item4.st_id eq $detail.dc_event}} selected="selected" {{/if}}>{{$item4.ev_event}}</option>
                {{/foreach}}        
         </select>  
   </td>
   </tr>
  
  
   <tr>
     <th>Purchase Order</th>
     <td>
   	<datalist id='po'>
           {{foreach from=$podetail key="key2" item="item2"}}
            <option value="{{$item2.po_po_number}}" {{if $detail.dc_purchase_order eq $item2.po_po_number}} selected="selected" {{/if}}>
            {{$item2.po_po_number}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'po' name="{{$TABLE}}[dc_purchase_order]" style ="width:700px" value="{{$detail.dc_purchase_order}}" />
      </td>
    </tr>
  
  
   
  
  <tr>
  <th> Delivery PDF </th> 
  <td> <input type="file" name="delivery_pdf" /> </td>      
  </tr> 
   
    <tr>
     <th>Delivery Date</th>
     <td><input  type="text" name="{{$TABLE}}[dc_date]"  value="{{$detail.dc_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
  
   <tr>
     <th>Schedule Date</th>
     <td><input  type="text" name="{{$TABLE}}[dc_schedule_date]"  value="{{$detail.dc_schedule_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
    
     <tr>
     <th>Confirmation Date</th>
     <td><input  type="text" name="{{$TABLE}}[dc_confirmation_date]"  value="{{$detail.dc_confirmation_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
   
  
    <tr>
     <th>Who</th>
     <td>
         <select name="{{$TABLE}}[dc_who]" style="width:300px;"/>
      		 {{foreach from = $whodetail key="key5" item="item5"}}
                <option value="{{$item5.wo_id}}" {{if $item5.wo_id eq $detail.dc_who}} selected="selected" {{/if}}>{{$item5.wo_who}}</option>
                {{/foreach}}        
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
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[wa_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>
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
     <th>Date</th>
     <td><input  type="text" name="{{$TABLE}}[rl_date]"  value="{{$detail.rl_date|default:$currdate}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
   
     <tr>
     <th>Referred Customer</th>
     <td><input  type="text" name="{{$TABLE}}[rl_reffered_customer]"  value="{{$detail.rl_reffered_customer}}" style="width:700px;"  /> </td>
    </tr>
   
   
     <tr>
     <th>Customer Reffered Address</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_id}}|{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[rl_reffered_address]" style ="width:700px" value="{{$detail.rl_reffered_address}}" />
      </td>
    </tr>
   
      <tr>
     <th>Needs Analysis Survey Linked</th>
     <td><input  type="text" name="{{$TABLE}}[rl_need_analysis_link]"  value="{{$detail.rl_need_analysis_link}}" style="width:700px;"  /> </td>
    </tr>
   
   <tr>
     <th>Referring Customer</th>
     <td><input  type="text" name="{{$TABLE}}[rl_reffering_customer]"  value="{{$detail.rl_reffering_customer}}" style="width:700px;"  /> </td>
    </tr>
   
   
    <tr>
     <th>Reffering Customer Address</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key2" item="item2"}}
            <option value="{{$item2.bsn_id}}|{{$item2.bsn_name}}" {{if $bsnid eq $item2.bsn_id}} selected="selected" {{/if}}>
            {{$item2.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[rl_reffering_address]" style ="width:700px" value="{{$detail.rl_reffering_address}}" />
      </td>
    </tr>
   

   
 
   

   
    <tr>
     <th>Referring Customer Email</th>
     <td><input  type="text" name="{{$TABLE}}[rl_referring_cust_email]"  value="{{$detail.rl_referring_cust_email}}" style="width:700px;"  /> </td>
    </tr>
   
    <tr>
     <th>Referring Customer Phone</th>
     <td><input  type="text" name="{{$TABLE}}[rl_referring_cust_phone]"  value="{{$detail.rl_referring_cust_phone}}" style="width:700px;"  /> </td>
    </tr>
   
     <tr>
     <th>Referral Gift Sent</th>
     <td><input  type="checkbox" name="{{$TABLE}}[rl_ref_gift_sent]"  {{if $detail.rl_ref_gift_sent eq 1}} checked="checked" {{/if}}  /> </td>
     </tr>
    
   
    <tr>
     <th>Referral Gift</th>
     <td><input  type="text" name="{{$TABLE}}[rl_ref_gift_cost]"  value="{{$detail.rl_ref_gift_cost}}" style="width:700px;" /> </td>
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
    

</div>


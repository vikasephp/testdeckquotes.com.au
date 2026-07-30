<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>

 <script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
 
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);

</script>
{{/if}}

<div align="center">
<h3 class="page-title">Add Project In Quote Tracking Report</h3><br /><br />
   <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">							
   
   {{if !$opr}}
   {{if $msg }} <div style="font-weight:bold; font-size:15px; color:#F00;"> {{$msg }}</div> {{/if}}
 
 <input type="hidden" name="{{$TABLE}}[qt_id]" value="{{$detail.qt_id}}" id="dh_id"/>
 
     <table id="list-table" width="100%" cellpadding="0" cellspacing="0">
     
        <tr>
            <th>Project Address:</th>
            <td> 
            
          <datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[qt_project_address]" style ="width:700px" value="{{$detail.qt_project_address}}" />
            
            </td>
        </tr>
        
       
        
<!--        <tr>
            <th>Supplier Name:</th>
            <td> <input type="text" name="purchse_order[po_supplier1]" value="{{$detail.po_supplier1}}" style="width:200px;"/></td>
        </tr>
 
        <tr>
            <th>Value ($):</th>
            <td> <input type="text" name="purchse_order[po_value1]" value="{{$detail.po_value1}}" style="width:200px;"/></td>
        </tr>-->
        
 
        
<!--        <tr>
        <th>PO Sent Date</th>
        <td>
        <input type="text" name="purchse_order[po_sent_date]" value="{{$detail.po_sent_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo7" maxlength="25" />
        </td>
       </tr>-->
        

        
<!--         <tr>
        <th>Approval</th>
        <td>
        
         <select name="purchse_order[po_approval]">
             {{foreach from=$asdetail key="key" item="item"}}
             <option value="{{$item.to_option}}" {{if $detail.po_approval eq $item.to_option }} selected="selected" {{/if}}>{{$item.to_option}}</option>
             {{/foreach}}
        </select>
        
           </td>
       </tr>-->
        
        <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
        </tr>
           
            
		</table>
     
       
     {{else}}
     	<div style="font-size:24px; height:99px; padding-top:150px;">{{$opr}}</div> 
{{/if}}
</div>
   </form>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("purchse_order[project_name]","req", "Please specify project address.");
    frmvalidator.addValidation("purchse_order[po_component_name]","req", "Please specify component.");
    frmvalidator.addValidation("purchse_order[po_supplier1]","req", "Please specify supplier name.");
    frmvalidator.addValidation("purchse_order[po_value1]","req", "Please specify value.");

</script>


<script>
	initSample();
</script>
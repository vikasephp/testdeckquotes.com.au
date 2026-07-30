<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>

 <script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
 
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center">
<h3 class="page-title">Add/Edit Schedule Delivery</h3><br /><br />
   <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">							
   
   {{if !$opr}}
   {{if $msg }} <div style="font-weight:bold; font-size:15px; color:#F00;"> {{$msg }}</div> {{/if}}
 
 <input type="hidden" name="delivery[ds_id]" value="{{$detail.ds_id}}" id="dh_id"/>
 
     <table id="list-table" width="100%" cellpadding="0" cellspacing="0">
     
       <tr>
        <th>Scheduled Date</th>
        <td>
        <input type="text" name="delivery[ds_date_of_delivery]" value="{{$detail.ds_date_of_delivery}}" class="w16em dateformat-d-ds-m-ds-Y"  maxlength="25" />
        </td>
       </tr>
     
      <tr>
        <th>Status</th>
        <td>
             <select name="delivery[ds_status]">
             <option value="">Please Select </option>
             {{foreach from=$stdetail key="key" item="item"}}
             <option value="{{$item.st_id}}" {{if $detail.ds_status eq $item.st_id}} selected="selected" {{/if}}>{{$item.st_status}}</option>
             {{/foreach}}
             </select>
       </td>
       </tr>
     
     
        <tr>
            <th>Project Address:</th>
            <td> 
            
            <datalist id='project'>
           {{foreach from=$projdetail key="key" item="item"}}
            <option value="{{$item.bsn_name}}" {{if $bsnid eq $item.bsn_id}} selected="selected" {{/if}}>
            {{$item.bsn_name}}
            </option>
            {{/foreach}}
       
	   </datalist>
           <input type="text" list = 'project' name="delivery[ds_project]" style ="width:700px" value="{{$detail.ds_project}}" />
            
            </td>
        </tr>
        
        <tr>
        <th>Delivery Component:</th>
        <td> <select name="delivery[ds_delivery_event]">
           {{foreach from=$compdetail key="key2" item="item2"}}
            <option value="{{$item2.qb_id}}" {{if $detail.ds_delivery_event eq $item2.qb_id}} selected="selected" {{/if}}>
            {{$item2.qb_component}}
            </option>
            {{/foreach}}
	    </select>
 	</td>
        
        <tr>
            <th>Number of PO:</th>
            <td> <!--<input type="text" name="delivery[ds_num_of_po]" value="{{$detail.ds_num_of_po}}" style="width:200px;"/>-->
            	 <select name="delivery[ds_num_of_po]">
                 <option value="1" {{if $detail.ds_num_of_po eq 1}} selected="selected" {{/if}}>1</option>
                 <option value="2" {{if $detail.ds_num_of_po eq 2}} selected="selected" {{/if}}>2</option>
                 <option value="3" {{if $detail.ds_num_of_po eq 3}} selected="selected" {{/if}}>3</option>
                 <option value="4" {{if $detail.ds_num_of_po eq 4}} selected="selected" {{/if}}>4</option>
                 <option value="5" {{if $detail.ds_num_of_po eq 5}} selected="selected" {{/if}}>5</option>
                 <option value="6" {{if $detail.ds_num_of_po eq 6}} selected="selected" {{/if}}>6</option>
                 <option value="7" {{if $detail.ds_num_of_po eq 7}} selected="selected" {{/if}}>7</option>
                 <option value="8" {{if $detail.ds_num_of_po eq 8}} selected="selected" {{/if}}>8</option>
                 <option value="9" {{if $detail.ds_num_of_po eq 9}} selected="selected" {{/if}}>9</option>
                 <option value="10" {{if $detail.ds_num_of_po eq 10}} selected="selected" {{/if}}>10</option>
                 </select>
            </td>
        </tr>
     
        <tr>
        <th>Supplier</th>
        <td>
        
         <select name="delivery[ds_supplier]">
              <option value="">Please Select </option>
             {{foreach from=$supdetail key="key" item="item"}}
             <option value="{{$item.co_company_name}}" {{if $detail.ds_supplier eq $item.co_company_name }} selected="selected" {{/if}}>{{$item.co_company_name}}</option>
             {{/foreach}}
        </select>
        
           </td>
       </tr>
       
        <tr>
        <th>DCF pdf File</th>
        <td>
        <input type="file" name="dcf_pdf" />
        </td>
        </tr>
       
        <tr>
        <th>DCF Word File</th>
        <td>
        <input type="file" name="delivery_request" />
        </td>
        </tr>
       
        
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
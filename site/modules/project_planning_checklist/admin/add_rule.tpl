<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>


<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Rule Admin Section</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="98%" >
    <input type="hidden" name="rule[ppr_id]" value="{{$detail.ppr_id}}" />
    <input type="hidden" name="rule[ppc_id]" value="{{$ppc_id}}" />
   
   {{if $opr}} <tr><th colspan="2" style="color:#FF0000;">{{$opr}}</th></tr>{{/if}}
   
   <div style="float:left; text-align:left; margin-left:10%; font-size:14px; margin-bottom:10px;">
    Document Name : {{$data.ppc_document}}  <br />
    Link to Best Example :  <input type="text" name="rule[ppr_best_example]" value="{{$detail.ppr_best_example}}" style="width:800px;"  />
   {{if $detail.ppr_best_example}} <a href="{{$detail.ppr_best_example}}" target="_blank">Open Link</a> {{/if}}
   </div>
   <br />
   
   
   <tr>
   <th style="width:50%;">New Single Dwelling</th>
   <td><select name="rule[ppr_new_single]">
       <option value="">Please Select</option>
       <option value="Mandatory" {{if $detail.ppr_new_single eq 'Mandatory' }} selected="selected" {{/if}}>Mandatory</option>
       <option value="Possible" {{if $detail.ppr_new_single eq 'Possible' }} selected="selected" {{/if}}>Possible</option>
       <option value="Not Required" {{if $detail.ppr_new_single eq 'Not Required'}} selected="selected" {{/if}}>Not Required</option>
       </select>
    </td>
   </tr>
   
  <tr>
   <th>Alterations To A Single Dwelling </th>
   <td><select name="rule[ppr_alterations]">
       <option value="">Please Select</option>
       <option value="Mandatory" {{if $detail.ppr_alterations eq 'Mandatory' }} selected="selected" {{/if}}>Mandatory</option>
       <option value="Possible" {{if $detail.ppr_alterations eq 'Possible' }} selected="selected" {{/if}}>Possible</option>
       <option value="Not Required" {{if $detail.ppr_alterations eq 'Not Required'}} selected="selected" {{/if}}>Not Required</option>
       </select>
    </td>
   </tr>   
   
   <tr>
   <th>Secondary Residence  </th>
   <td><select name="rule[ppr_secondary]">
       <option value="">Please Select</option>
       <option value="Mandatory" {{if $detail.ppr_secondary eq 'Mandatory' }} selected="selected" {{/if}}>Mandatory</option>
       <option value="Possible" {{if $detail.ppr_secondary eq 'Possible' }} selected="selected" {{/if}}>Possible</option>
       <option value="Not Required" {{if $detail.ppr_secondary eq 'Not Required'}} selected="selected" {{/if}}>Not Required</option>
       </select>
    </td>
   </tr>   
   
   <tr>
   <th>Class 10 Structure</th>
   <td><select name="rule[ppr_class10]">
       <option value="">Please Select</option>
       <option value="Mandatory" {{if $detail.ppr_class10 eq 'Mandatory' }} selected="selected" {{/if}}>Mandatory</option>
       <option value="Possible" {{if $detail.ppr_class10 eq 'Possible' }} selected="selected" {{/if}}>Possible</option>
       <option value="Not Required" {{if $detail.ppr_class10 eq 'Not Required'}} selected="selected" {{/if}}>Not Required</option>
       </select>
    </td>
   </tr> 
   
    <tr>
   <th>Dual Occupancy</th>
   <td><select name="rule[ppr_dual_occ]">
       <option value="">Please Select</option>
       <option value="Mandatory" {{if $detail.ppr_dual_occ eq 'Mandatory' }} selected="selected" {{/if}}>Mandatory</option>
       <option value="Possible" {{if $detail.ppr_dual_occ eq 'Possible' }} selected="selected" {{/if}}>Possible</option>
       <option value="Not Required" {{if $detail.ppr_dual_occ eq 'Not Required'}} selected="selected" {{/if}}>Not Required</option>
       </select>
    </td>
   </tr> 
   
   <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="parent.$.fancybox.close();" class="vsml" />
        </td>
    </tr>
 </table>  
</form>
   <br />
<form name="detail" method="post" action=""  enctype="multipart/form-data">

 <input type="hidden" name="rule_qa[pqa_ppc_id]" value="{{$ppc_id}}" />
<table id="list-table" width="98%" style="font-weight:bold !important;">   
 <tr >
   <th style="width:48%">Rule/Question</th>
   <th style="width:48%">Answer</th>
   <th style="width:4%">Delete</th>
  </tr> 

{{foreach from=$dataqa item="item" key="key"}}
<tr>
<td style="font-weight:bold !important;">{{$item.pqa_question}} </td>
<td style="font-weight:bold !important;">{{$item.pqa_answer}} </td>
<td><a href="{{$BASE_URL}}{{$XFA.delete_qa}}/pqa_id/{{$item.pqa_id}}/ppc_id/{{$ppc_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a> </td>
</tr>
{{/foreach}}
  
  
   <tr>
   <td><input type="text" name="rule_qa[pqa_question]" value="{{$detail.ppr_que1}}" style="width:600px;" required="required" /></td>
   <td><input type="text" name="rule_qa[pqa_answer]" value="{{$detail.ppr_ans1}}" style="width:600px;" /></td>
  </tr> 
  
 </table> 
  <input type="submit" name="queansDetail" value="Add New Question Answer" class="vsml" /> 
    

</form>
    
        <script type="text/javascript">
		function closepop()
		{
			window.location.href = "{{$BASE_URL}}project_planning_checklistAdmin.view_ppt";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	 	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("section[wt_section_name]","req", "Please specify section.");
	</script>
</div>
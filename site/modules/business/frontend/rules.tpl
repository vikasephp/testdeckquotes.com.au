<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Rule Section</h3>    
   
<table id="list-table" width="98%" >
  
   {{if $opr}} <tr><th colspan="2" style="color:#FF0000;">{{$opr}}</th></tr>{{/if}}
   
   <div style="float:left; text-align:left; margin-left:10%; font-size:14px; margin-bottom:10px;">
    Document Name : {{$data.ppc_document}} &nbsp; &nbsp; &nbsp; &nbsp;
    Procedure Link :{{if $data.ppc_procedure}} <a href="{{$data.ppc_procedure}}" target="_blank">Link</a>{{/if}} 
    <br />
    Link to Best Example : {{if $datarule.ppr_best_example}} <a href="{{$datarule.ppr_best_example}}" target="_blank">Link</a> {{/if}}
    </div>
   <br />
    
   
   <tr>
   <th style="width:50%;">New Single Dwelling</th>
   <td>{{$datarule.ppr_new_single}}</td>
   </tr>
   
  <tr>
   <th>Alterations To A Single Dwelling </th>
   <td>{{$datarule.ppr_alterations}}</td>
   </tr>   
   
   <tr>
   <th>Secondary Residence  </th>
 <td>{{$datarule.ppr_secondary}}</td>
   </tr>   
   
   <tr>
   <th>Class 10 Structure</th>
   <td>{{$datarule.ppr_class10}}</td>
   </tr> 
   
   <tr>
   <th>Dual Occupancy</th>
   <td>{{$datarule.ppr_dual_occ}}</td>
   </tr> 

 </table>  
</form>
   <br />

<table id="list-table" width="98%" style="font-weight:bold !important;">   
 <tr >
   <th style="width:48%">Rule/Question</th>
   <th style="width:48%">Answer</th>
 
  </tr> 

{{foreach from=$dataqa item="item" key="key"}}
<tr>
<td style="font-weight:bold !important;">{{$item.pqa_question}} </td>
<td style="font-weight:bold !important;">{{$item.pqa_answer}} </td>

</tr>
{{/foreach}}
  
 </table>  <br />
      <input type="button" name="btnCancelDetail" value="Close" onclick="parent.$.fancybox.close();" class="vsml" />
        <script type="text/javascript">
		function closepop()
		{
			window.location.href = "{{$BASE_URL}}project_planning_checklistAdmin.view_ppt";
		}
	</script>
    
	
</div>
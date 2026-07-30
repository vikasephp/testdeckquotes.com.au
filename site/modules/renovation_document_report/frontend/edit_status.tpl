<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:20px;">
    <h3 class="page-title">Proposal Options Options List</h3>    
   <br /><br />
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="80%">
<tr> 
<th>Letter Code </th><th>Action</th>
       {{foreach from=$statuslist key="key" item="item"}}
       <tr>
      	 
        <th>{{$item.pr_status}}</th>
        <th> <a href="{{$BASE_URL}}proposal_report.add_status/pr_id/{{$item.pr_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             
         <a href="{{$BASE_URL}}proposal_report.delete_status/pr_id/{{$item.pr_id}}" onclick="javascript:if(!confirm('Are you sure want to delete this status option?')) return false;" title="Delete"><img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
         </th>    
       </tr> 
      {{/foreach}}

</table>
</form>
    <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />  
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    	
</div>
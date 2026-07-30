<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<script type="application/javascript">
function add_new(url)
 {
//var viewurl = "{{$BASE_URL}}designer_tracker.detail"+ "/random/" + Math.random();	
var viewurl = url;
 $(document).ready(function () {
        $.fancybox({
				'width': '99%',
				'height': '99%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
			
        });
});
}


</script>


<div align="center" style="min-height:350px; z-index:9999999;">
    <h3 class="page-title"><br />Onboarding Standard Procedure</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}prospect_list.add_onboarding_procedure/bsn_id/{{$bsn_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;"> Add New Procedure </a>
</div>


<table id="list-table" width="99%">
	<tr> 
		<th width="15%">Document Sequence</th>
		<th width="20%">Document Link</th>
		<th width="42%">Document Description</th>
		<th width="15%">Person Responsible</th>
		<th width="8%">Action</th>
	</tr>
		{{if $proceduredata}}
       {{foreach from=$proceduredata key="key" item="item"}}
       <tr>
      	 
        <td>{{$item.osp_doc_sequence}}</td>
        <td style="text-align:center;">{{if $item.osp_doc_link}} <a href="{{$item.osp_doc_link}}" target="_blank">Link</a>{{/if}}</td>
		
		<td>{{$item.osp_description}}</td>
		<td>{{$item.osp_person_responsible}}</td>

        <td> <a href="{{$BASE_URL}}prospect_list.add_onboarding_procedure/osp_id/{{$item.osp_id}}/bsn_id/{{$bsn_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             
         <a href="{{$BASE_URL}}prospect_list.delete_onboarding_procedure/osp_id/{{$item.osp_id}}/bsn_id/{{$bsn_id}}" onclick="javascript:if(!confirm('Are you sure want to delete the Task?')) return false;" title="Delete">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
         </td>    
       </tr> 
      {{/foreach}}
	  {{else}}
	  <tr>
		<td colspan="5" style="text-align:center">No Data Available</td>
	  </tr>
	  {{/if}}

</table><br /><br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
    <script type="text/javascript">
		function closepop()
		{
		//setTimeout('parent.close_win();', 500);
		parent.$.fancybox.close();
		}
	</script>
    
	
</div>

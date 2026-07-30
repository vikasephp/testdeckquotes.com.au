<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

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
    <h3 class="page-title"><br />Procedure Panel Construction Alert Report</h3>    
    
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}construction_alert_report.add_procedure" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;"> Add New Procedure </a>
</div>

<table id="list-table" width="99%">
<tr> 
<th width="50%">Procedure</th><th width="25%">Relevant Staff</th><th width="10%">Link </th><th width="10%">Action</th>
       {{foreach from=$proceduredata key="key" item="item"}}
       <tr>
      	 
        <td>{{$item.pr_procedure}}</td>
        <td id="chk_{{$item.pr_id}}">

          {{foreach from=$rsdata key="keyrs" item="itemrs"}}
        	{{if $item.pr_id eq $itemrs.rs_pr_id}}
                     {{$itemrs.rs_relevant_staff}}
                     <a href="{{$BASE_URL}}construction_alert_report.view_procedure/rs_id/{{$itemrs.rs_id}}" onclick="javascript:if(!confirm('Are you sure want to remove - {{$itemrs.rs_relevant_staff}}')) return false;" title="Delete">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
       		     <br />	
                {{/if}}     
          {{/foreach}}
       
                 
          <script type="text/javascript">
		var x=0;
		
		function appendRowRS(id)
		{
		 var show = "#chk_"+id;	
		 x=x+1;
		 row =  '<select name="key" id="kf'+x+'" onchange="this.form.submit()" ><option value="">Please Select </option>{{foreach from=$staffdata key="key1" item ="item1"}}';
		 row =  row + '<option value="{{$item1.po_name_eml}}">{{$item1.po_name_eml}}</option>' ;
		 row =  row + '{{/foreach}}</select>';
		 row = row +'<input type="hidden" name="pr_id" value='+id+'>';
		 $(show).append(row);
		}
	    </script>  
        
         <a href="javascript:appendRowRS({{$item.pr_id}})"  value="Add New Relevent Staff" title="Add Relevant Staff">
                <img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/addnew.png"/></a>         
                  
        </td>
        
        <td style="text-align:center;">{{if $item.pr_link}} <a href="{{$item.pr_link}}" target="_blank">Link</a>{{/if}}</td>
           
        <td> <a href="{{$BASE_URL}}construction_alert_report.add_procedure/pr_id/{{$item.pr_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             
         <a href="{{$BASE_URL}}construction_alert_report.delete_procedure/pr_id/{{$item.pr_id}}" onclick="javascript:if(!confirm('Are you sure want to delete the Task?')) return false;" title="Delete">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
         </td>    
       </tr> 
      {{/foreach}}

</table><br /><br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
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
	frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
        </script>
</div>

<script>
	initSample();
</script>
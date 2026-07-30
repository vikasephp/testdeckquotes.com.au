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
    <h3 class="page-title"><br />Structural Engineer Pre-Sheet Inspection - Required Documents</h3>    

<div style="float:left; margin-bottom:10px; font-size:14px;">
<strong>Project Address : {{$proj_name}}</strong>
</div>
  
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}certifier_structural_engineer.add_doc/bsn_id/{{$bsn_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;"> Add New Document </a>
</div>

<table id="list-table" width="99%">

      <th width="40%">Document Name</th><th width="25%">Required/Not Required </th><th width="25%">Include Supplier </th><th width="15">Action</th>
       {{foreach from=$docdata key="key" item="item"}}
        
        <tr>
        <td>{{$item.ss_document}}</td>
        <td {{if  $item.doc_not_required eq 1}} style="background:#999;"
            {{elseif $item.doc_file_name}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "floorf{{$item.bsn_id}}">
            
        {{if $item.doc_file_name}}
        <a href="/certifier_structural_engineer.download_content?file_name={{$item.doc_file_name}}&module_name=certifier_structural_engineer.home" target="_blank">Download</a><br />
        {{/if}}  
            
        <select name="slab_insp[cse_comm_notice]" >
        <option value="0" {{if $item.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select> 
        </td>   
        <td style="width:40%"> 
        {{ $item.ss_include_supplier }} <br />
        <a href="{{$BASE_URL}}certifier_structural_engineer.include_suppliers_ss/car_id/{{$item.ss_doc_id}}" class="various kill_others">Include Supplier</a><br><br>
        </td>
        
        <td> 
             
         <a href="{{$BASE_URL}}certifier_structural_engineer.delete_doc/ss_id/{{$item.ss_id}}/bsn_id/{{$bsn_id}}" onclick="javascript:if(!confirm('Are you sure want to delete the Doc?')) return false;" title="Delete">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
         </td> 
         
        </tr>
     {{/foreach}}
       
     

</table><br /><br />
 <input type="submit" name="savedrop" value="submit"   />
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
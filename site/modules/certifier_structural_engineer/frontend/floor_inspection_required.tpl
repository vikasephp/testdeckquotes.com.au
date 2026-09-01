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
    <h3 class="page-title"><br />Floor Inspections - Required Documents</h3>    

<div style="float:left; margin-bottom:10px; font-size:14px;">
<strong>Project Address : {{$proj_name}}</strong>
</div>
<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;">
<a href="{{$BASE_URL}}certifier_structural_engineer.add_doc/bsn_id/{{$bsn_id}}/cse_id/{{$cse_id}}/insp_type/{{$insp_type}}/return/{{$return_fuse}}" style="color:#FFF; text-decoration:none; font-size:14px;"> Add New Document</a>
</div>
<div style="clear:both;"></div>
  
<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="99%">

 		<tr>
        <th>Document</th>
        <th>Required / Not Required</th>
        <th>Supplier</th>
        </tr>
        
                          
        <tr>
        <td style="width:40%">Footing Inspection </td> 
        <td {{if  $data148.doc_not_required eq 1}} style="background:#999;"
            {{elseif $data148.doc_file_name}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "cond148">
          
          {{if $data148.doc_file_name}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$data148.doc_file_name}}&module_name=certifier_structural_engineer.home">Download</a><br />
            {{/if}}    
            
        <select name="floor_frame[cse_slab_fi]" onChange="update_doc_checklist({{$bsn_id}}, this.value, 148)" >
        <option value="0" {{if $data148.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $data148.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>
        
         <td style="width:40%"> 
        {{foreach from=$dataSupplier148 item=row148}}
			{{$row148.sa_include_supplier}}<br>
		{{/foreach}}
        <a href="{{$BASE_URL}}certifier_structural_engineer.include_suppliers/car_id/148/bsn_id/{{$bsn_id}}" class="various kill_others">Include Supplier</a><br><br>
        </td>
        
        </tr>
        
        <tr>
        <td>Commencement Notice </td>
        <td {{if  $data235.doc_not_required eq 1}} style="background:#999;"
            {{elseif $data235.doc_file_name}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "cond235">
            
          {{if $data235.doc_file_name}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$data235.doc_file_name}}&module_name=certifier_structural_engineer.home">Download</a><br />
            {{/if}}    
            
        <select name="floor_frame[cse_comm_notice]" onChange="update_doc_checklist({{$bsn_id}}, this.value, 235)">
        <option value="0" {{if $data235.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $data235.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select> 
        </td>    
        
         <td style="width:40%"> 
        {{foreach from=$dataSupplier235 item=row235}}
			{{$row235.sa_include_supplier}}<br>
		{{/foreach}}
        <a href="{{$BASE_URL}}certifier_structural_engineer.include_suppliers/car_id/235/bsn_id/{{$bsn_id}}" class="various kill_others">Include Supplier</a><br><br>
        </td>
        
        
        
        </tr>
     

        {{foreach from=$docdata key="key" item="item"}}
        <tr>
        <td>{{$item.ss_document}}</td>
        <td {{if $item.doc_not_required eq 1}} style="background:#999;"
            {{elseif $item.doc_file_name}} style="background:#00CC33;" {{else}} style="background:#F00;" {{/if}} id="cond{{$item.doc_name_id}}">
            {{if $item.doc_file_name}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$item.doc_file_name}}&module_name=certifier_structural_engineer.home">Download</a><br />
            {{/if}}
        <select onChange="update_doc_checklist({{$bsn_id}}, this.value, {{$item.doc_name_id}})">
        <option value="0" {{if $item.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>
        <td style="width:40%">
		{{foreach from=$item.suppliers item=rowS}}
			{{$rowS.sa_include_supplier}}<br>
		{{/foreach}}
        <a href="{{$BASE_URL}}certifier_structural_engineer.include_suppliers/car_id/{{$item.ss_doc_id}}/bsn_id/{{$bsn_id}}" class="various kill_others">Include Supplier</a><br><br>
        <a href="{{$BASE_URL}}certifier_structural_engineer.delete_doc/ss_id/{{$item.ss_id}}/bsn_id/{{$bsn_id}}/cse_id/{{$cse_id}}/return/{{$return_fuse}}" onclick="javascript:if(!confirm('Are you sure want to delete the Doc?')) return false;" title="Delete"><img style="height:16px; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
        </td>
        </tr>
        {{/foreach}}

</table><br /><br />

 <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
<script>
			function update_doc_checklist(id,value,docid)
			{
				 var cond = '#cond'+docid;
				 
				
				
				 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}certifier_structural_engineer.update_doc_checklist/bsn_id/"+id+"/value/"+value+"/doc_id/"+docid+"/insp_type/{{$insp_type}}",
						   success: function(result){
							
							if(value == 0 ) {
								$(cond).css("background","#F00");
							} else {
								$(cond).css("background","#999"); 
							}
							if (parent.cseRefreshSummary) {
								parent.cseRefreshSummary(id);
							}
						}
						
					});
			}
			$(function(){
				$.ajax({
					type: "GET",
					url: "{{$BASE_URL}}certifier_structural_engineer.update_doc_checklist/bsn_id/{{$bsn_id}}/insp_type/{{$insp_type}}/list/1",
					dataType: "json",
					success: function(flags){
						if (!flags) { return; }
						$.each(flags, function(docid, notreq){
							var cond = '#cond'+docid;
							if (!$(cond).length) { return; }
							$(cond).find('select').val(String(notreq));
							if(notreq == 1 || notreq == '1') {
								$(cond).css("background","#999");
							} else if ($(cond).find('a').length) {
								$(cond).css("background","#00CC33");
							} else {
								$(cond).css("background","#F00");
							}
						});
					}
				});
			});
		</script>
    
    
    <script type="text/javascript">
		
		
		function closepop()
		{
			if (parent.close_win) {
				parent.close_win();
			} else if (parent.location) {
				parent.location.reload();
			}
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
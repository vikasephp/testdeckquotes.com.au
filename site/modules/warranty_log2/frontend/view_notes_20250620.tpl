<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
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
    <h3 class="page-title"><br />View Notes</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}warranty_log.add_notes/wa_id/{{$wa_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;"> Add New Notes </a>
</div>


<table id="list-table" width="99%">
<tr> 
<th width="4%">SrNo</th>
<th width="65%">Notes</th><th width="15%">Added By</th><th width="8%">Date Added </th><th>Due Date</th>
<th>Attachment</th><th>Resolved</th><th width="8%">Action</th>
      
       {{assign var="ctr" value=$total}}
       
       {{if $top eq 1}}
       {{foreach from=$notesdata key="key" item="item"}}
       <tr>
      	 
        <td  {{ if $item.wn_resolved eq 1}} style="background:#FFF;" {{elseif $item.diff_wn lt 0 }}  style="background:#F00;"  {{/if}}>{{$ctr}}</td> 
        <td>{{$item.wn_notes}}</td>
        <td>{{$item.wn_added_by}}</td>
        <td>{{$item.wn_date}} </td>
        <td><input type="text" name="due_date[{{$item.wn_id}}]" value="{{$item.wn_due_date}}"  class="w16em dateformat-d-ds-m-ds-Y"  id="demo1_{{$item.wn_id}}" onfocus ="update_due_date_wn({{$item.wn_id}}, this.value);" style="width:80px;"/> 
        <script>
			function update_due_date_wn(id,value)
				{
					$.ajax({
						   type: "GET",
						   url: "{{$BASE_URL}}warranty_log.update_due_date_wn/wn_id/"+id+"/value/"+value,
							   success: function(result){
							}
						});
							
				}
		 </script>
        
        
        </td>
        <td>{{if $item.wn_attachment}}
               <a href="{{$BASE_URL}}files/uploads/{{$item.wn_attachment}}" target="_blank">Download</a>
            {{/if}}   
        </td>
          
        <td>
         <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="resolved[{{$item.wn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="resolved[{{$item.wn_id}}]"  onclick="update_resolved({{$item.wn_id}},this.checked)" {{if $item.wn_resolved eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
       
       <script>
	   
		function update_resolved(id,value)
		{
		
		var val = 0;
		if(value==true) { val = 1; } 
		if(value==false) { val = 0; } 
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}warranty_log.update_resolved/wn_id/"+id+"/value/"+val,
				   success: function(result){
			   }
			 });
		}
	   </script>
        </td>  
           
        <td> <a href="{{$BASE_URL}}warranty_log.add_notes/wn_id/{{$item.wn_id}}/wa_id/{{$wa_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
              <a href="{{$BASE_URL}}warranty_log.delete_notes/wn_id/{{$item.wn_id}}/wa_id/{{$wa_id}}" onclick="javascript:if(!confirm('Are you sure want to delete the Task?')) return false;" title="Delete">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
         </td>    
       </tr> 
       {{assign var="ctr" value=$ctr-1}}
      {{/foreach}}
 
       {{foreach from=$sudata key="key1" item="item1"}}
         <tr {{ if $item1.ws_resolved eq 1}} style="background:#FFF;" {{elseif $item1.diff_ws lt 0 }}  style="background:#F00;"  {{/if}}>
        <td>{{$ctr}}</td> 
        <td>{{$item1.ws_update_text}}</td>
        <td>{{$item1.ws_supplier_name}}</td>
        <td>{{if $item1.ws_date ne '0000-00-00 00:00:00'}} {{$item1.ws_date}}{{/if}}</td>
         <td><input type="text" name="due_date[{{$item1.ws_id}}]" value="{{$item1.ws_due_date}}"  class="w16em dateformat-d-ds-m-ds-Y"  id="demo2_{{$item1.ws_id}}" onfocus ="update_due_date_ws({{$item1.ws_id}}, this.value);" style="width:80px;"/> 
          <script>
			function update_due_date_ws(id,value)
				{
					$.ajax({
						   type: "GET",
						   url: "{{$BASE_URL}}warranty_log.update_due_date_ws/ws_id/"+id+"/value/"+value,
							   success: function(result){
							}
						});
							
				}
		 </script>
         
         </td>
        <td>
        {{if $item1.ws_attachment}}
             <!--  <a href="https://www.warrantyreport.com.au/files/uploads/{{$item1.ws_attachment}}" target="_blank">Download</a>-->
                <a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/{{$item1.ws_attachment}}" target="_blank">Download</a>
            {{/if}}
            
         {{if $item1.ws_attachment_2}}
                <a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/{{$item1.ws_attachment_2}}" target="_blank">Download</a>
          {{/if}}  
          
          {{if $item1.ws_attachment_3}}
                <a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/{{$item1.ws_attachment_3}}" target="_blank">Download</a>
          {{/if}}
          
          {{if $item1.ws_attachment_4}}
                <a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/{{$item1.ws_attachment_4}}" target="_blank">Download</a>
          {{/if}}  
          
          {{if $item1.ws_attachment_5}}
                <a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/{{$item1.ws_attachment_5}}" target="_blank">Download</a>
          {{/if}}
            
       </td>
            
         <td>{{$item1.ws_resolved}}
         <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="resolved[{{$item1.ws_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="resolved[{{$item1.ws_id}}]"  onclick="update_resolved_ws({{$item1.ws_id}},this.checked)" {{if $item1.ws_resolved eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
       
       <script>
	   
		function update_resolved_ws(id,value)
		{
		
		var val = 0;
		if(value==true) { val = 1; } 
		if(value==false) { val = 0; } 
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}warranty_log.update_resolved/ws_id/"+id+"/value/"+val,
				   success: function(result){
			   }
			 });
		}
	   </script>
        </td>      
            
            
      </tr>
      {{assign var="ctr" value=$ctr-1}}
      {{/foreach}}
      
      {{else}}
      
      
      {{foreach from=$sudata key="key1" item="item1"}}
         <tr  {{ if $item1.ws_resolved eq 1}} style="background:#FFF;" {{elseif $item1.diff_ws lt 0 }}  style="background:#F00;"  {{/if}}>
        <td>{{$ctr}}</td> 
        <td>{{$item1.ws_update_text}}</td>
        <td>{{$item1.ws_supplier_name}}</td>
        <td>{{if $item1.ws_date ne '0000-00-00 00:00:00'}} {{$item1.ws_date}}{{/if}}</td>
         <td>
    <input type="text" name="due_date_ws[{{$item1.ws_id}}]" value="{{$item1.ws_due_date}}"  class="w16em dateformat-d-ds-m-ds-Y"  
    id="demo3_{{$ctr}}" onfocus = "update_due_date_ws({{$item1.ws_id}}, this.value);" style="width:80px;"/> 
    
         <script>
			function update_due_date_ws(id,value) 
			{
				
				
					$.ajax({
						   type: "GET",
						   url: "{{$BASE_URL}}warranty_log.update_due_date_ws/ws_id/"+id+"/value/"+value,
							   success: function(result){
							}
						});
							
				}
		 </script>
         
         
         </td>
        <td>{{if $item1.ws_attachment}}
                <a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/{{$item1.ws_attachment}}" target="_blank">Download</a>
            {{/if}}
            
              {{if $item1.ws_attachment_2}}
                <a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/{{$item1.ws_attachment_2}}" target="_blank">Download</a>
          {{/if}}  
          
          {{if $item1.ws_attachment_3}}
                <a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/{{$item1.ws_attachment_3}}" target="_blank">Download</a>
          {{/if}}
          
          {{if $item1.ws_attachment_4}}
                <a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/{{$item1.ws_attachment_4}}" target="_blank">Download</a>
          {{/if}}  
          
          {{if $item1.ws_attachment_5}}
                <a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/{{$item1.ws_attachment_5}}" target="_blank">Download</a>
          {{/if}}
            </td>
            
      <td> 
         <form name ="recmet4" method="post" action="">
     	<input type="hidden" name="resolved[{{$item1.ws_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="resolved[{{$item1.ws_id}}]"  onclick="update_resolved_ws({{$item1.ws_id}},this.checked)" {{if $item1.ws_resolved eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
       
       <script>
	   
		function update_resolved_ws(id,value)
		{
		
		var val = 0;
		if(value==true) { val = 1; } 
		if(value==false) { val = 0; } 
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}warranty_log.update_resolved/ws_id/"+id+"/value/"+val,
				   success: function(result){
			   }
			 });
		}
	   </script>
        </td>            
            
      </tr>
      {{assign var="ctr" value=$ctr-1}}
      {{/foreach}}
      
      {{foreach from=$notesdata key="key" item="item"}}
       <tr  {{ if $item.wn_resolved eq 1}} style="background:#FFF;" {{elseif $item.diff_wn lt 0 }}  style="background:#F00;"  {{/if}}>
      	 
        <td>{{$ctr}}</td> 
        <td>{{$item.wn_notes}}</td>
        <td>{{$item.wn_added_by}}</td>
        <td>{{$item.wn_date}} </td>
         <td><input type="text" name="due_date[{{$item.wn_id}}]" value="{{$item.wn_due_date}}"  class="w16em dateformat-d-ds-m-ds-Y"  id="demo2_{{$item.wn_id}}" onfocus ="update_due_date_wn({{$item.wn_id}}, this.value);" style="width:80px;"/> 
         
         <script>
			function update_due_date_wn(id,value)
				{
					
					$.ajax({
						   type: "GET",
						   url: "{{$BASE_URL}}warranty_log.update_due_date_wn/wn_id/"+id+"/value/"+value,
							   success: function(result){
							}
						});
							
				}
		 </script>
         
         </td>
        <td>{{if $item.wn_attachment}}
               <a href="{{$BASE_URL}}files/uploads/{{$item.wn_attachment}}" target="_blank">Download</a>
            {{/if}}   
        </td>
        
        
        <td>
         <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="resolved[{{$item.wn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="resolved[{{$item.wn_id}}]"  onclick="update_resolved({{$item.wn_id}},this.checked)" {{if $item.wn_resolved eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
       
       <script>
	   
		function update_resolved(id,value)
		{
		
		var val = 0;
		if(value==true) { val = 1; } 
		if(value==false) { val = 0; } 
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}warranty_log.update_resolved/wn_id/"+id+"/value/"+val,
				   success: function(result){
			   }
			 });
		}
	   </script>
        </td>      
        
           
        <td> <a href="{{$BASE_URL}}warranty_log.add_notes/wn_id/{{$item.wn_id}}/wa_id/{{$wa_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
              <a href="{{$BASE_URL}}warranty_log.delete_notes/wn_id/{{$item.wn_id}}/wa_id/{{$wa_id}}" onclick="javascript:if(!confirm('Are you sure want to delete the Task?')) return false;" title="Delete">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
         </td>    
       </tr> 
       {{assign var="ctr" value=$ctr-1}}
      {{/foreach}}
      
      {{/if}}
 
</table><br /><br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
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
<style type="text/css">
.spr-pre-footing-link { color: inherit; text-decoration: underline; cursor: pointer; }
.spr-pre-footing-link:hover { color: inherit; text-decoration: none; }
</style>
<div style="float:right;"> 
<form name="filt" method="post" action="">   
<input type="submit" name="showhidden" value ="Show Hidden" />
<input type="submit" name="hidden" value ="Show Stage Completed" />&nbsp;
</form>
</div>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">SrNo.</th> 
                   <th class="topmenu" align="center" valign="middle" width="3%">QA</th> 
                   <th class="topmenu" align="center" valign="middle" width="14%">Project Address</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Location</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Pier Inspection</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Footing Inspection</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Slab Inspection</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Floor Frame Inspection</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Summary</th> 
                   <th class="topmenu" align="center" valign="middle" width="4%">Stage Completion</th>
                   <th class="topmenu" align="center" valign="middle" width="4%">Hide</th>
				   <th class="topmenu" align="center" valign="middle" width="4%">Action</th>   
            </tr>
        </thead>
           
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{counter}}</td>
        <td {{if $item.cse_qa eq 0}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "qa{{$item.cse_id}}">
        <select  name="qa2[{{$item.cse_id}}]" onChange="update_qa({{$item.cse_id}}, this.value)" >
        <option value="0" {{if $item.cse_qa  eq 0 }} selected="selected" {{/if}}>Yes</option>
        <option value="1" {{if $item.cse_qa  eq 1 }} selected="selected" {{/if}}>No</option>
        </select>
        <div id='tana{{$item.cse_id}}'> {{$item.cse_qa_user}} <br />{{$item.cse_qa_date}}</div>
         <script>
			function update_qa(id,value)
			{
				 var qa = '#qa'+id;
				 var tana = '#tana'+id;
				
				 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}certifier_structural_engineer.update_qa/cse_id/"+id+"/value/"+value,
						   success: function(result){
							$(tana).html(result);
							if(value == 0 ) {
								$(qa).css("background","#00CC33");
							} else {
								$(qa).css("background","#F00"); 
							}
						}
						
					});
			}
		</script>
        
        </td>
        <td><a href="{{$item.link}}" target="_blank">{{$item.cse_project}}</a></td> 
        <td>{{$item.cse_location}} </td>
        
        <td {{if  $item.doc_not_required653 eq 1}} style="background:#999;"
          {{elseif $item.doc_file_name653}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "cond{{$item.bsn_id}}">
          
                     
        <div {{if $item.doc_not_required653 eq 1 }} style="background:#999;" {{elseif $item.doc_not_required653 eq 0 && $item.setcolor eq 1 }} style="background:#F00; padding:3px" {{else}}  style="background:#00CC33;" {{/if}} >  
        <a href="{{$BASE_URL}}certifier_structural_engineer.pier_inspection_required/cse_id/{{$item.cse_id}}/bsn_id/{{$item.bsn_id}}" class="various">Required Document</a><br />
        </div>
        
        
        <select name name="cons_cond[{{$item.cse_id}}]" onChange="update_pier({{$item.bsn_id}}, this.value)" >
        <option value="0" {{if $item.doc_not_required653 eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.doc_not_required653 eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        
        {{if $item.doc_file_name653}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$item.doc_file_name653}}&module_name=certifier_structural_engineer.home">Inspection Document</a><br />
        {{/if}}
       
        <script>
			function update_pier(id,value)
			{
				 var cond = '#cond'+id;
				
				 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}certifier_structural_engineer.update_pier/bsn_id/"+id+"/value/"+value,
						   success: function(result){
							
							if(value == 0 ) {
								$(cond).css("background","#F00");
							} else {
								$(cond).css("background","#999"); 
							}
						}
						
					});
			}
		</script>
        
        
        
        </td>
        <td {{if  $item.doc_not_required148 eq 1}} style="background:#999;"
            {{elseif $item.doc_file_name148}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "foot{{$item.bsn_id}}">
                <table width="100%">
                <tr>
                <td colspan="2">
                    <select name name="cons_cond[{{$item.cse_id}}]" onChange="update_flooting({{$item.bsn_id}}, this.value)" >
                    <option value="0" {{if $item.doc_not_required148 eq 0 }} selected="selected" {{/if}}>Required</option>
                    <option value="1" {{if $item.doc_not_required148 eq 1 }} selected="selected" {{/if}}>Not Required</option>
                    </select> 
                    <script>
						function update_flooting(id,value)
						{
							 var foot = '#foot'+id;
							 var foot2 = '#foot2'+id;
							 var foot3 = '#foot3'+id;
							 var footcert = '#footcert'+id;
							
							 $.ajax({
								   type: "GET",
								   url: "{{$BASE_URL}}certifier_structural_engineer.update_footing/bsn_id/"+id+"/value/"+value,
									   success: function(result){
										
										if(value == 0 ) {
											$(foot).css("background","#F00");
											$(foot2).css("background","#F00");
											$(foot3).css("background","#F00");
											$(footcert).css("background","#F00");
										} else {
											$(foot).css("background","#999"); 
											$(foot2).css("background","#999"); 
											$(foot3).css("background","#999"); 
											$(footcert).css("background","#999"); 
										}
										
									}
									
								});
						}
				  </script>   
							
                    
                </td>
                <td colspan="2">
                {{if $item.doc_file_name148}}
					<a href="/certifier_structural_engineer.download_content?file_name={{$item.doc_file_name148}}&module_name=certifier_structural_engineer.home">Inspections Document</a>
                 {{else}}    
                 Inspections Document     
                 {{/if}}
                </td>
                </tr>
                
                <td {{ if $item.doc_not_required148 eq 1}} style="background:#999;" {{elseif $item.doc_not_required148 eq 0 && $item.setcolorFI eq 1 }} style="background:#F00;" {{else}}  style="background:#00CC33;" {{/if}} id = "foot2{{$item.bsn_id}}">
                
                
                <a href="{{$BASE_URL}}certifier_structural_engineer.flooting_inspection_required/cse_id/{{$item.cse_id}}/bsn_id/{{$item.bsn_id}}" class="various">Required Document</a>
                </td>
                <td> <span class="spr-pre-footing-link" onclick="this.parentNode.getElementsByTagName('form')[0].submit();">SPR Pre Footing Inspection</span>
                <form method="POST" action="{{$BASE_URL}}certifier_structural_engineer.home" style="display:none;">
                    <input type="hidden" name="pagenum" value="{{$pagenum}}" />
                    <input type="hidden" name="sp_bsn_id" value="{{$item.bsn_id}}" />
                    <input type="hidden" name="print_merge_footing" value="1" />
                    <input type="hidden" name="spr_report_type" value="Pre-Footing Inspection" />
                </form>
                </td> 
                   
                <td  {{if $item.doc_not_required148 eq 1}} style="background:#999;" 
                     {{elseif $item.doc_not_required148 eq 0 &&  !empty($item.doc_file_name148) && $item.openfooting eq 0 }} style="background:#00CC33;" 
                     {{else}} style="background:#F00;"  {{/if}} id = "footcert{{$item.bsn_id}}">

                <a href="{{$BASE_URL}}certifier_structural_engineer.flooting_inspection_certifier/cse_id/{{$item.cse_id}}" class="various">Certifier Comments</a></td>
               
                <td {{if  $item.doc_not_required728 eq 1 || $item.doc_not_required148 eq 1}} style="background:#999;"
              {{elseif $item.doc_file_name728}} style="background:#00CC33;"  {{else}} style="background:#F00;"  {{/if}} id = "foot3{{$item.bsn_id}}">
              
              {{if $item.doc_file_name728}}
              <a href="/certifier_structural_engineer.download_content?file_name={{$item.doc_file_name728}}&module_name=certifier_structural_engineer.home" target="_blank">
              Certificate to proceed - Footing</a>
              {{else}}
              Certificate to proceed - Footing
              {{/if}}
              </td>      
                    
                </tr>  
                
                           
            	</table>
                
                
      
        
      
        
             
                
        </td>
        <td {{if  $item.doc_not_required240 eq 1}} style="background:#999;"
            {{elseif $item.doc_file_name240}} style="background:#00CC33;"  {{else}} style="background:#F00;"  {{/if}} id = "slab{{$item.bsn_id}}">
                <table width="100%">
                
                <td colspan="2">
                    <select name name="cons_cond[{{$item.cse_id}}]" onChange="update_slab({{$item.bsn_id}}, this.value)" >
                    <option value="0" {{if $item.doc_not_required240 eq 0 }} selected="selected" {{/if}}>Required</option>
                    <option value="1" {{if $item.doc_not_required240 eq 1 }} selected="selected" {{/if}}>Not Required</option>
                    </select>
                    <script>
						function update_slab(id,value)
						{
							 var slab  = '#slab'+id;
							 var slab2 = '#slab2'+id;
							 var slab3 = '#slab3'+id;  
							 var slabcert = '#slabcert'+id;
							
							 $.ajax({
								   type: "GET",
								   url: "{{$BASE_URL}}certifier_structural_engineer.update_slab/bsn_id/"+id+"/value/"+value,
									   success: function(result){
										
										if(value == 0 ) {
											$(slab).css("background","#F00");
											$(slab2).css("background","#F00");
											$(slab3).css("background","#F00");
											$(slabcert).css("background","#F00");
										} else {
											$(slab).css("background","#999"); 
											$(slab2).css("background","#999"); 
											$(slab3).css("background","#999"); 
											$(slabcert).css("background","#999"); 
										}
										
									}
									
								});
						}
					</script>  		
                    
                </td>
                
                
                <td colspan="2">
                 
         {{if $item.doc_file_name240}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$item.doc_file_name240}}&module_name=certifier_structural_engineer.home">Inspections Document</a>
         {{else}}
             Inspections Document
         {{/if}}
        
            
                </td>
                </tr>
                <tr>
                <td {{if $item.doc_not_required240 eq 1 }} style="background:#999;" {{elseif $item.doc_not_required240 eq 0 && $item.setcolorSI eq 1 }} style="background:#F00;" {{else}}  style="background:#00CC33;" {{/if}} id = "slab2{{$item.bsn_id}}">
                
              <a href="{{$BASE_URL}}certifier_structural_engineer.slab_inspection_required/cse_id/{{$item.cse_id}}/bsn_id/{{$item.bsn_id}}" class="various">Required Document</a></td>
              <td> <span class="spr-pre-footing-link" onclick="this.parentNode.getElementsByTagName('form')[0].submit();">SPR Pre Slab Inspection</span>
                <form method="POST" action="{{$BASE_URL}}certifier_structural_engineer.home" style="display:none;">
                    <input type="hidden" name="pagenum" value="{{$pagenum}}" />
                    <input type="hidden" name="sp_bsn_id" value="{{$item.bsn_id}}" />
                    <input type="hidden" name="print_merge_footing" value="1" />
                    <input type="hidden" name="spr_report_type" value="Pre-Slab Inspection" />
                </form>
              </td>   
                    
               <td {{if $item.doc_not_required240 eq 1}} style="background:#999;" 
                     {{elseif $item.doc_not_required240 eq 0 &&  !empty($item.doc_file_name240) && $item.openslab eq 0 }} style="background:#00CC33;" 
                     {{else}} style="background:#F00;"  {{/if}} id = "slabcert{{$item.bsn_id}}">
                     
               <a href="{{$BASE_URL}}certifier_structural_engineer.slab_inspection_certifier/cse_id/{{$item.cse_id}}" class="various">Certifier Comments</a></td>
               
               
               <td {{if  $item.doc_not_required730 eq 1 || $item.doc_not_required240 eq 1}} style="background:#999;"
              {{elseif $item.doc_file_name730}} style="background:#00CC33;"  {{else}} style="background:#F00;"  {{/if}} id = "slab3{{$item.bsn_id}}">
              
              
              
              {{if $item.doc_file_name730}}
              <a href="/certifier_structural_engineer.download_content?file_name={{$item.doc_file_name730}}&module_name=certifier_structural_engineer.home" target="_blank" >
              Certificate to proceed - Slab</a>
              {{else}}
              Certificate to proceed - Slab
              {{/if}} 
              
              
              </td>            
                    
                </tr>
            	</table>
                
       
       
                   
                
                
        </td>
        
        <td {{if  $item.doc_not_required648 eq 1}} style="background:#999;"
            {{elseif $item.doc_file_name648}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "floorf{{$item.bsn_id}}">
                <table width="100%">
                
                <td colspan="2">
                        <select name name="cons_cond[{{$item.cse_id}}]" onChange="update_floor({{$item.bsn_id}}, this.value)" >
                        <option value="0" {{if $item.doc_not_required648 eq 0 }} selected="selected" {{/if}}>Required</option>
                        <option value="1" {{if $item.doc_not_required648 eq 1 }} selected="selected" {{/if}}>Not Required</option>
                        </select>
                        
                   <script>
						function update_floor(id,value)
						{
							 var floorf  = '#floorf'+id;
							 var floorf2 = '#floorf2'+id;
							 var floorf3 = '#floorf3'+id;  
							 var floorcert = '#floorcert'+id; 
							
							 $.ajax({
								   type: "GET",
								   url: "{{$BASE_URL}}certifier_structural_engineer.update_floor/bsn_id/"+id+"/value/"+value,
									   success: function(result){
										
										if(value == 0 ) {
											$(floorf).css("background","#F00");
											$(floorf2).css("background","#F00");
											$(floorf3).css("background","#F00");
											$(floorcert).css("background","#F00");
										} else {
											$(floorf).css("background","#999"); 
											$(floorf2).css("background","#999"); 
											$(floorf3).css("background","#999"); 
											$(floorcert).css("background","#999"); 
										}
									
									}
									
								});
						}
				</script>         
                        
                </td>
                
                <td colspan="2">
         {{if $item.doc_file_name648}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$item.doc_file_name648}}&module_name=certifier_structural_engineer.home">Inspections Document</a>
        
        {{else}}
       		 Inspections Document
        {{/if}}
        
                </td>
                </tr>
                
                <tr>
                    <td {{if $item.doc_not_required648 eq 1 }} style="background:#999;" {{elseif $item.doc_not_required648 eq 0 && $item.setcolorFL eq 1}} style="background:#F00;" {{else}}  style="background:#00CC33;" {{/if}}  id = "floorf2{{$item.bsn_id}}"> 
                    
             <a href="{{$BASE_URL}}certifier_structural_engineer.floor_inspection_required/cse_id/{{$item.cse_id}}/bsn_id/{{$item.bsn_id}}" class="various">Required Document</a></td>
               
                <td> <span class="spr-pre-footing-link" onclick="this.parentNode.getElementsByTagName('form')[0].submit();">SPR Pre-Floor Frame Inspection</span>
                <form method="POST" action="{{$BASE_URL}}certifier_structural_engineer.home" style="display:none;">
                    <input type="hidden" name="pagenum" value="{{$pagenum}}" />
                    <input type="hidden" name="sp_bsn_id" value="{{$item.bsn_id}}" />
                    <input type="hidden" name="print_merge_footing" value="1" />
                    <input type="hidden" name="spr_report_type" value="Pre-Floor Frame Inspection" />
                </form>
                </td>  
              
               <td {{if $item.doc_not_required648 eq 1}} style="background:#999;" 
                     {{elseif $item.doc_not_required648 eq 0 &&  !empty($item.doc_file_name648) && $item.openfloor eq 0 }} style="background:#00CC33;" 
                     {{else}} style="background:#F00;"  {{/if}} id = "floorcert{{$item.bsn_id}}">
                     
               <a href="{{$BASE_URL}}certifier_structural_engineer.floor_inspection_certifier/cse_id/{{$item.cse_id}}" class="various">Certifier Comments</a></td>
               
                <td {{if  $item.doc_not_required729 eq 1 || $item.doc_not_required648 eq 1}} style="background:#999;"
              {{elseif $item.doc_file_name729}} style="background:#00CC33;"  {{else}} style="background:#F00;"  {{/if}} id = "floorf3{{$item.bsn_id}}">
             
               {{if $item.doc_file_name729}}
              <a href="/certifier_structural_engineer.download_content?file_name={{$item.doc_file_name729}}&module_name=certifier_structural_engineer.home" target="_blank" >
               Certificate to proceed - Floor Frames</a>
              {{else}}
               Certificate to proceed - Floor Frames
              {{/if}} 
              
              
              
              </td>            
                </tr>
            	</table>
                
 
        
        
      
               
                
                
        </td>
        
           
        <td> 
        	Pending Documents :{{$item.tot}} <br />
            Unresolved Certifier Comments : {{$item.dataOA}}
        
        </td>   
        
        <td> 
               
               <form name="recmet3" method="post" action="">
                <input type="hidden" name="move_cal[{{$item.cse_id}}]" value="0"  />
            
                <label class="switch">
                    <input
                        class="switch-input"
                        type="checkbox"
                        name="move_cal[{{$item.cse_id}}]"
                        value="2" {{if ($item.next ne 0) }} disabled="disabled" {{/if}}
                        {{if $item.cse_stage eq 2 || $item.cse_stage eq 4 }} checked="checked"{{/if}}
                        onclick="return confirmToggle(this);"
                    />
            
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span>
                    <br />
                </label>
               </form>

			<script>
            function confirmToggle(el) {
                if (confirm("Are you sure you want to MOVE to Next Stage?")) {
                    el.form.submit();
                } else {
                    // Revert checkbox state
                    el.checked = !el.checked;
                }
                return false;
            }
            </script>
            
      </td> 
      
      
      <td> 
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.cse_id}}]" value="0" />
        <label class="switch">
        <input class="switch-input" type="checkbox"  name="hide[{{$item.cse_id}}]" value="1"  onclick="this.form.submit();" {{if $item.cse_hide eq 1 }} checked="checked" {{/if}} />
                <span class="switch-label" data-on="Yes" data-off="No"></span> 
                <span class="switch-handle"></span> <br />
       </label> 
       </form> 	
            
      </td> 
              
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
            
        </td>
    </tr>  
  {{/foreach}}
  </tbody>
  </table>

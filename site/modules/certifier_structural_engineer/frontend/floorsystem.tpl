
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">SrNo.</th> 
                   <th class="topmenu" align="center" valign="middle" width="14%">Project Address</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Location</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Pier Inspection</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Footing Inspection</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Slab Inspection</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Floor Frame Inspection</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Summary</th> 
                   <th class="topmenu" align="center" valign="middle" width="4%">Stage Completion</th>
				   <th class="topmenu" align="center" valign="middle" width="4%">Action</th>   
            </tr>
        </thead>
           
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.cse_id}}</td>
       
        <td><a href="{{$item.link}}" target="_blank">{{$item.cse_project}}</a></td> 
        <td>{{$item.cse_location}} </td>
        
        <td {{if  $item.doc_not_required653 eq 1}} style="background:#999;"
          {{elseif $item.doc_file_name653}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "cond{{$item.bsn_id}}">
          
        <a href="{{$BASE_URL}}certifier_structural_engineer.pier_inspection_required/cse_id/{{$item.cse_id}}/bsn_id/{{$item.bsn_id}}" class="various">Required Document</a><br />
        
        <select name name="cons_cond[{{$item.cse_id}}]" onChange="update_pier({{$item.bsn_id}}, this.value)" >
        <option value="0" {{if $item.doc_not_required653 eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.doc_not_required653 eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        
       
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
                    <td><a href="{{$BASE_URL}}certifier_structural_engineer.flooting_inspection_required/cse_id/{{$item.cse_id}}/bsn_id/{{$item.bsn_id}}" class="various">Required Document</a></td>
                    <td><a href="{{$BASE_URL}}certifier_structural_engineer.flooting_inspection_certifier/cse_id/{{$item.cse_id}}" class="various">Certifier Comments</a></td>
                </tr>             
            	</table>
                
                
        <select name name="cons_cond[{{$item.cse_id}}]" onChange="update_flooting({{$item.bsn_id}}, this.value)" >
        <option value="0" {{if $item.doc_not_required148 eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.doc_not_required148 eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select> 
        
         <script>
			function update_flooting(id,value)
			{
				 var foot = '#foot'+id;
				
				 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}certifier_structural_engineer.update_footing/bsn_id/"+id+"/value/"+value,
						   success: function(result){
							
							if(value == 0 ) {
								$(foot).css("background","#F00");
							} else {
								$(foot).css("background","#999"); 
							}
						}
						
					});
			}
		</script>       
                
        </td>
        <td {{if  $item.doc_not_required240 eq 1}} style="background:#999;"
            {{elseif $item.doc_file_name240}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "slab{{$item.bsn_id}}">
                <table width="100%">
                <tr>
                    <td><a href="{{$BASE_URL}}certifier_structural_engineer.slab_inspection_required/cse_id/{{$item.cse_id}}/bsn_id/{{$item.bsn_id}}" class="various">Required Document</a></td>
                    <td><a href="{{$BASE_URL}}certifier_structural_engineer.slab_inspection_certifier/cse_id/{{$item.cse_id}}" class="various">Certifier Comments</a></td>
                </tr>
            	</table>
                
        <select name name="cons_cond[{{$item.cse_id}}]" onChange="update_slab({{$item.bsn_id}}, this.value)" >
        <option value="0" {{if $item.doc_not_required240 eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.doc_not_required240 eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select> 
        
         <script>
			function update_slab(id,value)
			{
				 var slab = '#slab'+id;
				
				 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}certifier_structural_engineer.update_slab/bsn_id/"+id+"/value/"+value,
						   success: function(result){
							
							if(value == 0 ) {
								$(slab).css("background","#F00");
							} else {
								$(slab).css("background","#999"); 
							}
						}
						
					});
			}
		</script>            
                
                
        </td>
        
        <td {{if  $item.doc_not_required648 eq 1}} style="background:#999;"
            {{elseif $item.doc_file_name648}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "floorf{{$item.bsn_id}}">
                <table width="100%">
                <tr>
                    <td><a href="{{$BASE_URL}}certifier_structural_engineer.floor_inspection_required/cse_id/{{$item.cse_id}}/bsn_id/{{$item.bsn_id}}" class="various">Required Document</a></td>
                    <td><a href="{{$BASE_URL}}certifier_structural_engineer.floor_inspection_certifier/cse_id/{{$item.cse_id}}" class="various">Certifier Comments</a></td>
                </tr>
            	</table>
                
        <select name name="cons_cond[{{$item.cse_id}}]" onChange="update_floor({{$item.bsn_id}}, this.value)" >
        <option value="0" {{if $item.doc_not_required648 eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.doc_not_required648 eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select> 
        
         <script>
			function update_floor(id,value)
			{
				 var floorf = '#floorf'+id;
				
				 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}certifier_structural_engineer.update_floor/bsn_id/"+id+"/value/"+value,
						   success: function(result){
							
							if(value == 0 ) {
								$(floorf).css("background","#F00");
							} else {
								$(floorf).css("background","#999"); 
							}
						}
						
					});
			}
		</script>          
                
                
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
                        {{if $item.cse_stage eq 2 }} checked="checked"{{/if}}
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
              
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
            
        </td>
    </tr>  
  {{/foreach}}
  </tbody>
  </table>

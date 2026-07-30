<div style="float:right;"> 
<form name="filt" action="{{$BASE_URL}}{{$XFA.home}}" method="post">   
<input type="submit" name="hidden" value ="Show Hidden" />
</form>
</div>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">SrNo.</th> 
                   <th class="topmenu" align="center" valign="middle" width="18%">Project Address</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Location</th> 
                   <th class="topmenu" align="center" valign="middle" width="15%">Final Inspection</th> 
                   <th class="topmenu" align="center" valign="middle" width="15%">Summary</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Stage Completion/Hide</th>
				     
            </tr>
        </thead>
           
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.cse_id}}</td>
       
        <td><a href="{{$item.link}}" target="_blank">{{$item.cse_project}}</a></td> 
        <td>{{$item.cse_location}} </td>
        
        
        <td {{if  $item.doc_not_required169 eq 1}} style="background:#999;"
            {{elseif $item.doc_file_name169}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "final{{$item.bsn_id}}">
                <table width="100%">
                <tr>
                    <td><a href="{{$BASE_URL}}certifier_structural_engineer.final_inspection_required/cse_id/{{$item.cse_id}}/bsn_id/{{$item.bsn_id}}" class="various">Required Document</a></td>
                    <td><a href="{{$BASE_URL}}certifier_structural_engineer.final_inspection_certifier/cse_id/{{$item.cse_id}}" class="various">Certifier Comments</a></td>
                </tr>             
            	</table>
                
                
        <select name name="cons_cond[{{$item.cse_id}}]" onChange="update_final({{$item.bsn_id}}, this.value)" >
        <option value="0" {{if $item.doc_not_required169 eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.doc_not_required169 eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select> 
        
         <script>
			function update_final(id,value)
			{
				 var foot = '#final'+id;
				
				 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}certifier_structural_engineer.update_final/bsn_id/"+id+"/value/"+value,
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
       
        
           
        <td> 
        	Pending Documents :{{$item.finsum}} <br />
            Unresolved Certifier Comments : {{$item.alertfinal}}
        
        </td>   
        
        <td> 
               
               <form name="recmet3" method="post" action="">
                <input type="hidden" name="move_final[{{$item.cse_id}}]" value="3"  />
            
                <label class="switch">
                    <input
                        class="switch-input"
                        type="checkbox"
                        name="move_final[{{$item.cse_id}}]"
                        value="4" {{if ($item.finstage ne 0) }} disabled="disabled" {{/if}}
                        {{if $item.cse_stage  eq 4 }} checked="checked"{{/if}}
                        onclick="return confirmToggle(this);"
                    />
            
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span>
                    <br />
                </label>
               </form>

			<script>
            function confirmToggle(el) {
                if (confirm("Are you sure you want to finish the Stage?")) {
                    el.form.submit();
                } else {
                    // Revert checkbox state
                    el.checked = !el.checked;
                }
                return false;
            }
            </script>
            
      </td> 
              
        
    </tr>  
  {{/foreach}}
  </tbody>
  </table>

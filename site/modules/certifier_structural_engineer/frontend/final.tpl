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
                   <th class="topmenu" align="center" valign="middle" width="18%">Project Address</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Location</th> 
                   <th class="topmenu" align="center" valign="middle" width="25%">Final Inspection</th> 
                   <th class="topmenu" align="center" valign="middle" width="11%">Summary</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Stage Completion</th>
                   <th class="topmenu" align="center" valign="middle" width="4%">Hide</th>
				     
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
       
       
        <td><a href="{{$item.link}}" target="_blank">{{$item.cse_project}}</a></td> 
        <td>{{$item.cse_location}} </td>
        
        
        <td {{if  $item.doc_not_required169 eq 1}} style="background:#999;"
            {{elseif $item.doc_file_name169}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "final{{$item.bsn_id}}">
                <table width="100%">
                  <tr>
                <td colspan="2">
                        <select name name="cons_cond[{{$item.cse_id}}]" onChange="update_final({{$item.bsn_id}}, this.value)" >
                        <option value="0" {{if $item.doc_not_required169 eq 0 }} selected="selected" {{/if}}>Required</option>
                        <option value="1" {{if $item.doc_not_required169 eq 1 }} selected="selected" {{/if}}>Not Required</option>
                        </select> 
                        
                        <script>
							function update_final(id,value)
							{
								 var final  = '#final'+id;
								 var final2 = '#final2'+id;
								 var final3 = '#final3'+id;
								 var finalin = '#finalin'+id;
								
								 $.ajax({
									   type: "GET",
									   url: "{{$BASE_URL}}certifier_structural_engineer.update_final/bsn_id/"+id+"/value/"+value,
										   success: function(result){
											
											if(value == 0 ) {
												$(final).css("background","#F00");
												$(final2).css("background","#F00");
												$(final3).css("background","#F00");
												$(finalin).css("background","#F00");
											} else {
												$(final).css("background","#999");
												$(final2).css("background","#999"); 
												$(final3).css("background","#999"); 
												$(finalin).css("background","#999");  
											}
											
										}
										
									});
							}
					   </script>  
                        
                </td>
                <td colspan="2">
        {{if $item.doc_file_name169}}
				<a href="/certifier_structural_engineer.download_content?file_name={{$item.doc_file_name169}}&module_name=certifier_structural_engineer.home">Inspections Document</a>
        {{else}}
        		Inspections Document
        {{/if}}
        
                
                </td>
                </tr>
                
                <tr>
              <td {{if $item.doc_not_required169 eq 1 }} style="background:#999;" {{elseif $item.doc_not_required169 eq 0 && $item.setcolorFNL eq 1}} style="background:#F00;" {{else}}  style="background:#00CC33;" {{/if}} id = "final2{{$item.bsn_id}}"> 
                    <a href="{{$BASE_URL}}certifier_structural_engineer.final_inspection_required/cse_id/{{$item.cse_id}}/bsn_id/{{$item.bsn_id}}" class="various">Required Document</a></td>
                    
                    <td> <span class="spr-pre-footing-link" onclick="this.parentNode.getElementsByTagName('form')[0].submit();">SPR Pre-Final Inspection</span>
                <form method="POST" action="{{$BASE_URL}}certifier_structural_engineer.home" style="display:none;">
                    <input type="hidden" name="pagenum" value="{{$pagenum}}" />
                    <input type="hidden" name="sp_bsn_id" value="{{$item.bsn_id}}" />
                    <input type="hidden" name="print_merge_footing" value="1" />
                    <input type="hidden" name="spr_report_type" value="Pre-Final Inspection" />
                </form>
                    </td> 
                    
                    <td {{if $item.doc_not_required169 eq 1}} style="background:#999;" 
                     {{elseif $item.doc_not_required169 eq 0 &&  !empty($item.doc_file_name169) && $item.alertfinal eq 0 }} style="background:#00CC33;" 
                     {{else}} style="background:#F00;"  {{/if}} id = "finalin{{$item.bsn_id}}">
                    
                    <a href="{{$BASE_URL}}certifier_structural_engineer.final_inspection_certifier/cse_id/{{$item.cse_id}}" class="various">Certifier Comments</a></td>
                    
                     <td {{if  $item.doc_not_required785 eq 1 || $item.doc_not_required169 eq 1}} style="background:#999;"
        {{elseif $item.doc_file_name785}} style="background:#00CC33;"  {{else}} style="background:#F00;"  {{/if}} id = "final3{{$item.bsn_id}}">Certificate to proceed - Final</td>      
                </tr>             
            	</table>
                
                

        
        
       
        
              
                
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
    </tr>  
  {{/foreach}}
  </tbody>
  </table>

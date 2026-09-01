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
                   <th class="topmenu" align="center" valign="middle" width="15%">Pre-Sheet Inspection </th> 
                   <th class="topmenu" align="center" valign="middle" width="15%">Structural Engineer Pre-Sheet Inspection </th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Summary</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Stage Completion</th>
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
       </td>
       
       
        <td><a href="{{$item.link}}" target="_blank">{{$item.cse_project}}</a></td> 
        <td>{{$item.cse_location}} </td>
        
        
        <td {{if  $item.doc_not_required152 eq 1}} style="background:#999;"
            {{elseif $item.doc_file_name152}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "ps{{$item.bsn_id}}">
                <table width="100%">
                <tr>
                <td colspan="2">
                    <select name name="cons_cond[{{$item.cse_id}}]" onChange="update_presheet({{$item.bsn_id}}, this.value)" >
                    <option value="0" {{if $item.doc_not_required152 eq 0 }} selected="selected" {{/if}}>Required</option>
                    <option value="1" {{if $item.doc_not_required152 eq 1 }} selected="selected" {{/if}}>Not Required</option>
                    </select> 
                    
                    <script>
						function update_presheet(id,value)
						{
							 var ps = '#ps'+id;
							 var ps2 = '#ps2'+id;
							 var ps3 = '#ps3'+id;
							 var pspre = '#pspre'+id;
							
							 $.ajax({
								   type: "GET",
								   url: "{{$BASE_URL}}certifier_structural_engineer.update_pre_sheet/bsn_id/"+id+"/value/"+value,
									   success: function(result){
										
										if(value == 0 ) {
											$(ps).css("background","#F00");
											$(ps2).css("background","#F00");
											$(ps3).css("background","#F00");	
											$(pspre).css("background","#F00");	
										} else {
											$(ps).css("background","#999"); 
											$(ps2).css("background","#999"); 
											$(pspre).css("background","#999"); 	
											
										}
									}
									
								});
						}
				</script>   
                    
                </td>
                <td colspan="2">
                
        
        {{if $item.doc_file_name152}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$item.doc_file_name152}}&module_name=certifier_structural_engineer.home">Inspections Document</a>
        {{else}}
            Inspections Document
        {{/if}}
        
      
                </td>
              
                </tr>
                <tr>
              <td {{if $item.doc_not_required152 eq 1 }} style="background:#999;" {{elseif $item.doc_not_required152 eq 0 && $item.setcolorPS eq 1}} style="background:#F00;" {{else}}  style="background:#00CC33;" {{/if}} id = "ps2{{$item.bsn_id}}"> 
           <a href="{{$BASE_URL}}certifier_structural_engineer.presheet_inspection_required/cse_id/{{$item.cse_id}}/bsn_id/{{$item.bsn_id}}" class="various">Required Document</a></td>
             <td> <span class="spr-pre-footing-link" onclick="this.parentNode.getElementsByTagName('form')[0].submit();">SPR Pre – Pre Sheet Inspection</span>
                <form method="POST" action="{{$BASE_URL}}certifier_structural_engineer.home" style="display:none;">
                    <input type="hidden" name="pagenum" value="{{$pagenum}}" />
                    <input type="hidden" name="sp_bsn_id" value="{{$item.bsn_id}}" />
                    <input type="hidden" name="print_merge_footing" value="1" />
                    <input type="hidden" name="spr_report_type" value="Pre - Pre Sheet Inspection" />
                </form>
             </td>    
                   
           <td {{if $item.doc_not_required152 eq 1}} style="background:#999;" 
                     {{elseif $item.doc_not_required152 eq 0 &&  !empty($item.doc_file_name152) && $item.openps eq 0 }} style="background:#00CC33;" 
                     {{else}} style="background:#F00;"  {{/if}} id = "pspre{{$item.bsn_id}}">
                     
           <a href="{{$BASE_URL}}certifier_structural_engineer.presheet_inspection_certifier/cse_id/{{$item.cse_id}}" class="various">Certifier Comments</a></td>
         
         <td {{if  $item.doc_not_required731 eq 1 || $item.doc_not_required152 eq 1}} style="background:#999;"
        {{elseif $item.doc_file_name731}} style="background:#00CC33;"  {{else}} style="background:#F00;"  {{/if}} id = "ps3{{$item.bsn_id}}">
        
        
              {{if $item.doc_file_name731}}
              <a href="/certifier_structural_engineer.download_content?file_name={{$item.doc_file_name731}}&module_name=certifier_structural_engineer.home" target="_blank" >
              	 Certificate to proceed - Pre Sheet</a>
              {{else}}
             	 Certificate to proceed - Pre Sheet
              {{/if}} 
              
        
        </td>       
         
         
                </tr>             
            	</table>
                
                
    
                
        </td>
        <td {{if  $item.doc_not_required667 eq 1}} style="background:#999;"
            {{elseif $item.doc_file_name667}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "ss{{$item.bsn_id}}">
             <table width="100%">
             <tr>
             <td>
             <a href="{{$BASE_URL}}certifier_structural_engineer.view_doc/cse_id/{{$item.cse_id}}/bsn_id/{{$item.bsn_id}}" class="various">Required Document</a>
             </td>
                   
            </tr>
            </table>
                
        <select name name="cons_cond[{{$item.cse_id}}]" onChange="update_ss({{$item.bsn_id}}, this.value)" >
        <option value="0" {{if $item.doc_not_required667 eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.doc_not_required667 eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select> 
        
        {{if $item.doc_file_name667}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$item.doc_file_name667}}&module_name=certifier_structural_engineer.home">Inspection Document</a><br />
        {{/if}}
        
         <script>
			function update_ss(id,value)
			{
				 var ss = '#ss'+id;
				
				 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}certifier_structural_engineer.update_ssps/bsn_id/"+id+"/value/"+value,
						   success: function(result){
							
							if(value == 0 ) {
								$(ss).css("background","#F00");
							} else {
								$(ss).css("background","#999"); 
							}
						}
						
					});
			}
		</script>            
                
                
        </td>
        
        
           
        <td> 
        	Pending Documents :{{$item.dataOB}} <br />
            Unresolved Certifier Comments : {{$item.openps}}
        
        </td>   
        
        <td> 
               
               <form name="recmet3" method="post" action="">
                <input type="hidden" name="move_last[{{$item.cse_id}}]" value="0"  />
            
                <label class="switch">
                    <input
                        class="switch-input"
                        type="checkbox"
                        name="move_last[{{$item.cse_id}}]"
                        value="3" {{if ($item.dataOB ne 0) }} disabled="disabled" {{/if}}
                        {{if $item.cse_stage eq 3 || $item.cse_stage eq 4 }} checked="checked"{{/if}}
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
       
    </tr>  
  {{/foreach}}
  </tbody>
  </table>

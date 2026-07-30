<form name="ch" method="post" action="">
<input type="submit" name="conhand" value="Show Hidden"  /> 
</form>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">SrNo.</th>
                   <th class="topmenu" align="center" valign="middle" width="3%">QA</th>   
                   <th class="topmenu" align="center" valign="middle" width="15%">Address</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Nth/Sth</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Type</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Starting Onsite date</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Construction Conditions Summary</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">COU Requirement</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Commencement Notice</th>
				   <th class="topmenu" align="center" valign="middle" width="5%">Secondary Driveway</th>				   
                   <th class="topmenu" align="center" valign="middle" width="10%">Electrical Service Mark</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Electrical Upgrade PO</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Windows & Doors Quote</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Wall And Roof Frames Quote</th>
                   
                   <th class="topmenu" align="center" valign="middle" width="10%">Construction Package</th> 
				   <th class="topmenu" align="center" valign="middle" width="10%">Approved – Exterior Colours and Materials</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Renovations Construction Package</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Move to Calendar</th>
				   <th class="topmenu" align="center" valign="middle" width="9%">Action</th>   
            </tr>
        </thead>
        
        
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.cs_id}}</td>
        <td {{if $item.cs_ch_user}} style="background: #0C3;" {{/if}}>
          <a href="{{$BASE_URL}}construction_scheduler_report.qa_ch/cs_id/{{$item.cs_id}}" class="various">QA</a><br />
         {{if $item.cs_ch_user}} {{$item.cs_ch_user}} <br />{{$item.cs_ch_date}} {{/if}}
        </td>
        <td><a href="{{$item.link}}" target="_blank">{{$item.cs_project}}</a></td> 
        <td>
          <select name="{{$TABLE}}[cs_nth_sth]"  Onchange = "update_ns({{$item.cs_id}},this.value)">
                <option value=" " {{if $item.cs_nth_sth eq ''}} selected="selected" {{/if}}>Please Select</option>
                <option value="North" {{if $item.cs_nth_sth  eq 'North'}} selected="selected" {{/if}}>North</option>
          	<option value="South" {{if $item.cs_nth_sth  eq 'South'}} selected="selected" {{/if}}>South</option>
        </select>
       
        <script>
		function update_ns(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_ns/cs_id/"+id+"/value/"+value,
					   success: function(result){
						 
					}
					
				});
		}
	</script>
        
        </td> 
        <td>{{$item.pt_name}}</td>
        <td>
			{{$item.bsn_starting_onsite_date|date_format:"%d-%m-%Y"}}
        <!--<input type="text" name="sod_ch[{{$item.cs_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.cs_id}}" value="{{$item.cs_ch_sod}}" onfocus = "update_onsite({{$item.cs_id}}, this.value);" /> 
           
        <script>
        function update_onsite(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}construction_scheduler_report.update_onsite/cs_id_ch/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}	
       </script>-->
       </td>
        
   <!--     <td  {{if $item.cs_ch_cons_cond eq 0 }} style="background:#F00" {{else}} style="background:#999" {{/if}} id = "cond{{$item.cs_id}}">
    -->    
          <td {{if $item.doc_file_name_660}} style="background:#00CC33;" 
          {{elseif $item.cs_ch_cons_cond eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "cond{{$item.cs_id}}">
    
        
        {{if $item.doc_file_name_660}}
       <!--  <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_660}}" target="_blank">Download</a>-->
         <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_660}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
         
        {{else}}
         <select name name="cons_cond[{{$item.cs_id}}]" onChange="update_cons_cond({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_ch_cons_cond eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_ch_cons_cond eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        
       
        <script>
		function update_cons_cond(id,value)
		{
			var cond = '#cond'+id;
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_cons_hand/cs_id_3/"+id+"/value_3/"+value,
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
 {{/if}}
        
        </td>
    
        <td {{if $item.doc_file_name_655}} style="background:#00CC33;" 
          {{elseif $item.cs_ch_cou_req eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "cou{{$item.cs_id}}">
    
     
        {{if $item.doc_file_name_655}}
       <!--  <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_655}}" target="_blank">Download</a>-->
           <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_655}}&module_name=construction_scheduler_report.home" target="_blank">Download</a> 
         
          {{else}}
          <select name name="cou[{{$item.cs_id}}]" onChange="update_cou_req({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_ch_cou_req eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_ch_cou_req eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
     
       
        <script>
		function update_cou_req(id,value)
		{
			var cou = '#cou'+id;
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_cons_hand/cs_id_4/"+id+"/value_4/"+value,
					   success: function(result){
						
						if(value == 0 ) {
							$(cou).css("background","#F00");
						} else {
							$(cou).css("background","#999"); 
						}
					}
					
				});
		}
	</script>
 {{/if}}
         </td>
         
     	<td  {{if $item.doc_file_name_235}} style="background:#00CC33" 
        {{elseif $item.cs_comm_notice eq 0}} style="background:#F00;"  {{else}} style="background:#999" {{/if}} id = "cn{{$item.cs_id}}">
        
        
       
        {{if $item.doc_file_name_235}}
      <!--   <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_235}}" target="_blank">Download</a>-->
         <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_235}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>   
         {{else}}
        <select name name="comm_notice[{{$item.cs_id}}]" onChange="update_cons_hand({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_comm_notice eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_comm_notice eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        
        <script>
		function update_cons_hand(id,value)
		{
			var cn = '#cn'+id;
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_cons_hand/cs_id_1/"+id+"/value_1/"+value,
					   success: function(result){
						
						if(value == 0 ) {
							$(cn).css("background","#F00");
						} else {
							$(cn).css("background","#999"); 
						}
					}
					
				});
		}
	</script>
       {{/if}}
       
        </td>
		
		<td {{if $item.doc_file_name_272}} style="background:#00CC33;" 
          {{elseif $item.cs_ch_ele_mark eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "ele272_{{$item.cs_id}}">
      
        {{if $item.doc_file_name_272}}
         <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_272}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>   
         
        {{else}} 
         
        <select name name="ele_mark[{{$item.cs_id}}]" onChange="update_elect_mark({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_ch_ele_mark eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_ch_ele_mark eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
     
        <script>
		function update_elect_mark(id,value)
		{
			var ele = '#ele272_'+id;
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_cons_hand/cs_id_10/"+id+"/value_5/"+value,
					   success: function(result){
						
						if(value == 0 ) {
							$(ele).css("background","#F00");
						} else {
							$(ele).css("background","#999"); 
						}
					}
					
				});
			}
		</script>
         {{/if}}
         </td>
      
       <td {{if $item.doc_file_name_421}} style="background:#00CC33;" 
          {{elseif $item.cs_ch_ele_mark eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "ele{{$item.cs_id}}">
      
        {{if $item.doc_file_name_421}}
         <!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_421}}" target="_blank">Download</a>-->
         <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_421}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>   
         
        {{else}} 
         
         <select name name="ele_mark[{{$item.cs_id}}]" onChange="update_elect_mark({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_ch_ele_mark eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_ch_ele_mark eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
     
       
        <script>
		function update_elect_mark(id,value)
		{
			var ele = '#ele'+id;
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_cons_hand/cs_id_5/"+id+"/value_5/"+value,
					   success: function(result){
						
						if(value == 0 ) {
							$(ele).css("background","#F00");
						} else {
							$(ele).css("background","#999"); 
						}
					}
					
				});
		}
	</script>
         {{/if}}
         </td>
       
        <td id = "eu{{$item.cs_id}}" {{if $item.cs_elect_upgrade eq '0' }} style="background:#F00" 
         {{elseif $item.cs_elect_upgrade eq '1' }} style="background:#999" {{else}} style="background:#00CC33"  {{/if}}>
      
      <select name name="elect_up[{{$item.cs_id}}]" onChange="update_ele_up({{$item.cs_id}}, this.value)">
        <option value="0" {{if $item.cs_elect_upgrade eq '0' }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_elect_upgrade eq '1' }} selected="selected" {{/if}}>Not Required</option>
     
     {{foreach from=$podetail key="key2" item="item2"}}
     <option value="{{$item2.po_po_number}}" {{if  $item2.po_po_number eq $item.cs_elect_upgrade}} selected="selected" {{/if}}>{{$item2.po_po_number}}</option>
     {{/foreach}}
        
        </select>  
        <script>
		function update_ele_up(id,value)
		{
			var eu = '#eu'+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_cons_hand/cs_id_2/"+id+"/value_2/"+value,
					   success: function(result){
						if(value == 0 ) {
							$(eu).css("background","#F00");
						} else if (value == 1) {
							$(eu).css("background","#999"); 
						} else {
							$(eu).css("background","#00CC33"); 
						}
 
					}
					
				});
		}
	</script>
           
       </td>
       
      
       
       <td id = "wd{{$item.cs_id}}" {{if $item.cs_wind_door_quote eq '0' }} style="background:#F00" 
         {{elseif $item.cs_wind_door_quote eq '1' }} style="background:#999" {{else}} style="background:#00CC33"  {{/if}}>
      
      <select name name="elect_up[{{$item.cs_id}}]" onChange="update_wind_door({{$item.cs_id}}, this.value)">
        <option value="0" {{if $item.cs_wind_door_quote eq '0' }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_wind_door_quote eq '1' }} selected="selected" {{/if}}>Not Required</option>
     
     {{foreach from=$podetail key="key3" item="item3"}}
     <option value="{{$item3.po_po_number}}" {{if  $item3.po_po_number eq $item.cs_wind_door_quote}} selected="selected" {{/if}}>{{$item3.po_po_number}}</option>
     {{/foreach}}
        
        </select>  
        <script>
		function update_wind_door(id,value)
		{
			var wd = '#wd'+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_cons_hand/cs_id_8/"+id+"/value_8/"+value,
					   success: function(result){
						if(value == 0 ) {
							$(wd).css("background","#F00");
						} else if (value == 1) {
							$(wd).css("background","#999"); 
						} else {
							$(wd).css("background","#00CC33"); 
						}
 
					}
					
				});
		}
	</script>
           
       </td>
       
       <td id = "wrq{{$item.cs_id}}" {{if $item.cs_wall_roof_quote eq '0' }} style="background:#F00" 
         {{elseif $item.cs_wall_roof_quote eq '1' }} style="background:#999" {{else}} style="background:#00CC33"  {{/if}}>
      
      <select name name="wall_roof_quote[{{$item.cs_id}}]" onChange="update_wall_roof_quote({{$item.cs_id}}, this.value)">
        <option value="0" {{if $item.cs_wall_roof_quote eq '0' }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_wall_roof_quote eq '1' }} selected="selected" {{/if}}>Not Required</option>
     
     {{foreach from=$podetail key="key4" item="item4"}}
     <option value="{{$item4.po_po_number}}" {{if  $item4.po_po_number eq $item.cs_wall_roof_quote}} selected="selected" {{/if}}>{{$item4.po_po_number}}</option>
     {{/foreach}}
        
        </select>  
        <script>
		function update_wall_roof_quote(id,value)
		{
			var wrq = '#wrq'+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_cons_hand/cs_id_9/"+id+"/value_9/"+value,
					   success: function(result){
						if(value == 0 ) {
							$(wrq).css("background","#F00");
						} else if (value == 1) {
							$(wrq).css("background","#999"); 
						} else {
							$(wrq).css("background","#00CC33"); 
						}
 
					}
					
				});
		}
	</script>
           
       </td>
     
     <td {{if $item.doc_file_name_142}} style="background:#00CC33;" 
          {{elseif $item.cs_ch_cons_package eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "cp{{$item.cs_id}}">
    
      
       {{if $item.doc_file_name_142}}
        <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_142}}" target="_blank">Download</a>-->
         <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_142}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>   
        {{else}} 
        
        <select name name="cp[{{$item.cs_id}}]" onChange="update_co_pac({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_ch_cons_package eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_ch_cons_package eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
     
       
        <script>
		function update_co_pac(id,value)
		{
			var cp = '#cp'+id;
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_cons_hand/cs_id_6/"+id+"/value_6/"+value,
					   success: function(result){
						
						if(value == 0 ) {
							$(cp).css("background","#F00");
						} else {
							$(cp).css("background","#999"); 
						}
					}
					
				});
		}
	</script>
         {{/if}}
         
         </td>
		 
		<td {{if $item.doc_file_name_258}} style="background:#00CC33;" 
          {{elseif $item.cs_appr_exterior_col eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "aec{{$item.cs_id}}">
  
       {{if $item.doc_file_name_258}}
         <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_258}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>   
        {{else}} 
        
        <select name="aec[{{$item.cs_id}}]" onChange="update_aec({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_appr_exterior_col eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_appr_exterior_col eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
     
       
        <script>
		function update_aec(id,value)
		{
			var aec = '#aec'+id;
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_cons_hand/cs_id_11/"+id+"/value_11/"+value,
					   success: function(result){
						
						if(value == 0 ) {
							$(aec).css("background","#F00");
						} else {
							$(aec).css("background","#999"); 
						}
					}
					
				});
		}
	</script>
         {{/if}}
         
         </td>
        
 
      <td {{if $item.doc_file_name_615}} style="background:#00CC33;" 
          {{elseif $item.cs_reno_cons eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "cp{{$item.cs_id}}">
  
    
         {{if $item.doc_file_name_615}}
        
          <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_615}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>  
            
         {{else}}
         <select name name="reno[{{$item.cs_id}}]" onChange="update_reno_cons({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_reno_cons eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_reno_cons eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
     
       
        <script>
		function update_reno_cons(id,value)
		{
			var reno = '#reno'+id;
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_cons_hand/cs_id_7/"+id+"/value_7/"+value,
					   success: function(result){
						
						if(value == 0 ) {
							$(reno).css("background","#F00");
						} else {
							$(reno).css("background","#999"); 
						}
					}
					
				});
		}
	</script>
          {{/if}}
            
      </td>
        <td>
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="move_cal[{{$item.cs_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="move_cal[{{$item.cs_id}}]" value="2"  onclick="this.form.submit();" {{if $item.cs_stage eq 2 }} checked="checked" {{/if}} />
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

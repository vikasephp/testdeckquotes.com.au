<form name="ch" method="post" action="">
<input type="submit" name="closeupshow" value="Show Hidden"  /> 
</form>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
				<th class="topmenu" align="center" valign="middle" width="3%">SrNo.</th>
				<th class="topmenu" align="center" valign="middle" width="3%">QA</th>   
				<th class="topmenu" align="center" valign="middle" width="15%">Address</th> 
				<th class="topmenu" align="center" valign="middle" width="5%">Nth/Sth</th> 
				<th class="topmenu" align="center" valign="middle" width="10%">Type</th>  
				<th class="topmenu" align="center" valign="middle" width="5%">Pre-sheet Clean Report</th> 
				<th class="topmenu" align="center" valign="middle" width="5%">Wall and Roof Frame Detail Drawings</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Pre-sheet Inspection</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Pre-sheet Quality Assurance Report</th> 
				<th class="topmenu" align="center" valign="middle" width="10%">Close Up Quality Assurance Report</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Fixings Quality Assurance Report</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Painting Quality Assurance Report</th> 
				<th class="topmenu" align="center" valign="middle" width="10%">Box Gutter Certificate</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Driveway/Verge Crossing Formwork Inspection Report</th>

                <th class="topmenu" align="center" valign="middle" width="8%">Move To Walkthrough</th>
				<th class="topmenu" align="center" valign="middle" width="9%">Action</th>   
            </tr>
        </thead>       
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.cs_id}}</td>
        <td {{if $item.cs_cu_user}} style="background: #0C3;" {{/if}}>
        <a href="{{$BASE_URL}}construction_scheduler_report.qa_closeup/cs_id/{{$item.cs_id}}" class="various">QA</a><br />
         {{if $item.cs_cu_user}} {{$item.cs_cu_user}} <br />{{$item.cs_cu_date}} {{/if}}
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
        
       
         <td {{if $item.doc_file_name_649}} style="background:#00CC33;" 
          {{elseif $item.cs_cu_pre_sheet_clean eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "psc{{$item.cs_id}}">
     
        
        {{if $item.doc_file_name_649}}
         
           <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_649}}&module_name=construction_scheduler_report.home" target="_blank">Download</a> 
         
         {{else}}
        
        <select name name="fs_sw[{{$item.cs_id}}]" onChange="update_site_work({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_cu_pre_sheet_clean eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_cu_pre_sheet_clean eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_site_work(id,value)
		{
			var psc = '#psc'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_close_up/cs_id_1/"+id+"/value_1/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(psc).css("background","#F00");
						    } else {
							$(psc).css("background","#999"); 
						    }
					}
				});
		}
		</script>
         
         {{/if}}
         
         </td>
         
       <!--  <td {{if $item.cs_cu_wall_roof eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="wr{{$item.cs_id}}">
      -->   
          <td {{if $item.doc_file_name_289}} style="background:#00CC33;" 
          {{elseif $item.cs_cu_wall_roof eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "wr{{$item.cs_id}}">
     
         {{if $item.doc_file_name_289}}
      <!--   <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_289}}" target="_blank">Download</a>-->
          <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_289}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>  
          
         {{else}}
        
        <select name name="fs_sw[{{$item.cs_id}}]" onChange="update_wall_roof({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_cu_wall_roof eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_cu_wall_roof eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_wall_roof(id,value)
		{
			var wr = '#wr'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_close_up/cs_id_2/"+id+"/value_2/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(wr).css("background","#F00");
						    } else {
							$(wr).css("background","#999"); 
						    }
					}
				});
		}
	</script>
         
         
         {{/if}}
         </td>
        
    
        
         <td {{if $item.doc_file_name_152}} style="background:#00CC33;" 
          {{elseif $item.cs_su_pre_sheet eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "psi{{$item.cs_id}}">
     
        
        {{if $item.doc_file_name_152}}
  
            <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_152}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
        {{else}}
        
        <select name name="fs_sw[{{$item.cs_id}}]" onChange="update_pre_sheet({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_su_pre_sheet eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_su_pre_sheet eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_pre_sheet(id,value)
		{
			var psi = '#psi'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_close_up/cs_id_3/"+id+"/value_3/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(psi).css("background","#F00");
						    } else {
							$(psi).css("background","#999"); 
						    }
					}
				});
		}
	</script>
       
       
         {{/if}}
        </td>
        
       
         <td {{if $item.bsn_qar_pre_sheet}} style="background:#00CC33;" 
          {{elseif $item.cs_cu_ps_qa eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "psqa{{$item.cs_id}}">
     
        
        {{if $item.bsn_qar_pre_sheet}}
       <!--  <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.bsn_qar_pre_sheet}}" target="_blank">Download</a>-->
            <a href="/construction_scheduler_report.download_content?file_name={{$item.bsn_qar_pre_sheet}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
         {{else}}
        
        <select name name="fs_sw[{{$item.cs_id}}]" onChange="update_qa({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_cu_ps_qa eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_cu_ps_qa eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_qa(id,value)
		{
			var psqa = '#psqa'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_close_up/cs_id_4/"+id+"/value_4/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(psqa).css("background","#F00");
						    } else {
							$(psqa).css("background","#999"); 
						    }
					}
				});
		}
	</script>
         
         {{/if}}
         </td>
       
      <!-- <td {{if $item.cs_cu_cuqa eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="cuqa{{$item.cs_id}}">
     -->  
        <td {{if $item.close_up}} style="background:#00CC33;" 
          {{elseif $item.cs_cu_cuqa eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "cuqa{{$item.cs_id}}">
     
     
       {{if $item.close_up}}
         <!--<a href="https://deckquote.s3.amazonaws.com/files/progress_payment_doc/{{$item.close_up}}" target="_blank">Download</a>-->
            <a href="/construction_scheduler_report.download_content?file_name={{$item.close_up}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
         {{else}}
        
        <select name name="fssw[{{$item.cs_id}}]" onChange="update_cuqa({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_cu_cuqa eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_cu_cuqa eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_cuqa(id,value)
		{
			var cuqa = '#cuqa'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_close_up/cs_id_5/"+id+"/value_5/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(cuqa).css("background","#F00");
						    } else {
							$(cuqa).css("background","#999"); 
						    }
					}
				});
		}
	</script>
         
         
         {{/if}}
       
       </td>
         
       <!--  <td {{if $item.cs_cu_fixing eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "fix{{$item.cs_id}}">
       -->
         <td {{if $item.fixing}} style="background:#00CC33;" 
          {{elseif $item.cs_cu_fixing eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "fix{{$item.cs_id}}">
     
       
         {{if $item.fixing}}
        <!-- <a href="https://deckquote.s3.amazonaws.com/files/progress_payment_doc/{{$item.fixing}}" target="_blank">Download</a>-->
           <a href="/construction_scheduler_report.download_content?file_name={{$item.fixing}}&module_name=construction_scheduler_report.home" target="_blank">Download</a> 
         {{else}}
        
        <select name name="fssw[{{$item.cs_id}}]" onChange="update_fix({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_cu_fixing eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_cu_fixing eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_fix(id,value)
		{
			var fix = '#fix'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_close_up/cs_id_6/"+id+"/value_6/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(fix).css("background","#F00");
						    } else {
							$(fix).css("background","#999"); 
						    }
					}
				});
		}
	</script>
         
         
         {{/if}}
         </td>
        
     
       <td {{if $item.painting}} style="background:#00CC33;" 
          {{elseif $item.cs_cu_painting eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "pai{{$item.cs_id}}">
       
        
        {{if $item.painting}}
         <!-- <a href="https://deckquote.s3.amazonaws.com/files/progress_payment_doc/{{$item.painting}}" target="_blank">Download</a>-->
           <a href="/construction_scheduler_report.download_content?file_name={{$item.painting}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>  
         
         {{else}}
        
        <select name name="fssw[{{$item.cs_id}}]" onChange="update_painting({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_cu_painting eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_cu_painting eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_painting(id,value)
		{
			var pai = '#pai'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_close_up/cs_id_7/"+id+"/value_7/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(pai).css("background","#F00");
						    } else {
							$(pai).css("background","#999"); 
						    }
					}
				});
		}
	</script>
         
         
         
         {{/if}}   
      </td>
      
          <td {{if $item.doc_file_name_626}} style="background:#00CC33;" 
          {{elseif $item.cs_box_gutter eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "bgc{{$item.cs_id}}">
     
        
        {{if $item.doc_file_name_626}}
         
           <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_626}}&module_name=construction_scheduler_report.home" target="_blank">Download</a> 
         
         {{else}}
        
        <select name name="fs_sw[{{$item.cs_id}}]" onChange="update_gutter_box({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_box_gutter eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_box_gutter eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_gutter_box(id,value)
		{
			var bgc = '#bgc'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_close_up/cs_id_8/"+id+"/value_8/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(bgc).css("background","#F00");
						    } else {
							$(bgc).css("background","#999"); 
						    }
					}
				});
		}
		</script>
         
         {{/if}}
         
         </td>
		 
		 <td {{if $item.doc_file_name_783}} style="background:#00CC33;" 
          {{elseif $item.cs_driveway_verge eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "dv{{$item.cs_id}}">

        {{if $item.doc_file_name_783}}
         
           <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_783}}&module_name=construction_scheduler_report.home" target="_blank">Download</a> 
         
         {{else}}
        
        <select name="fs_sw[{{$item.cs_id}}]" onChange="update_driveway_verge({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_driveway_verge eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_driveway_verge eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_driveway_verge(id,value)
		{
			var dv = '#dv'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_close_up/cs_id_9/"+id+"/value_9/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(dv).css("background","#F00");
						    } else {
							$(dv).css("background","#999"); 
						    }
					}
				});
		}
		</script>
         
         {{/if}}
         
         </td>
      
        <td>
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="move_walk[{{$item.cs_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="move_walk[{{$item.cs_id}}]" value="5"  onclick="this.form.submit();" {{if $item.cs_stage eq 5 }} checked="checked" {{/if}} />
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

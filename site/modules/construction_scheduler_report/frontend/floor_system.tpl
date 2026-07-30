<form name="ch" method="post" action="">
<input type="submit" name="floorshow" value="Show Hidden"  /> 
</form> 

<div style="display: inline-block; vertical-align: bottom; margin-left: -80px;">
	<a href="javascript:void(0)" style="color: #000; text-decoration: none; line-height: 29px;" onclick="$('#toggleSystem').removeAttr('checked').change()">Show More</a>
	<label class="switch" for="toggleSystem" style="display: inline-block; margin: 0;">
		<input class="switch-input" onchange="toggleColumn()" id="toggleSystem" type="checkbox">
		<span class="switch-label" data-on="ON" data-off="OFF"></span>
		<span class="switch-handle"></span>
	</label>
	<a href="javascript:void(0)" style="color: #000; text-decoration: none; line-height: 29px;" onclick="$('#toggleSystem').attr('checked', 'checked').change()">Show COU Requirements</a>
</div>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
				<th class="topmenu other-column" align="center" valign="middle" width="3%">SrNo.</th>  
				<th class="topmenu other-column" align="center" valign="middle" width="3%">QA</th> 
				<th class="topmenu other-column" align="center" valign="middle" width="15%">Address</th> 
				<th class="topmenu other-column" align="center" valign="middle" width="5%">Nth/Sth</th> 
				<th class="topmenu other-column" align="center" valign="middle" width="10%">Type</th>  
				<th class="topmenu other-column" align="center" valign="middle" width="5%">Surveyor Site Set Out</th> 
				<th class="topmenu other-column" align="center" valign="middle" width="5%">Site Setup Report</th> 
				<th class="topmenu" align="center" valign="middle" width="8%">Footings Inspection</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Pier Inspection</th>
				<th class="topmenu other-column" align="center" valign="middle" width="8%">Drainage Report</th> 
				<th class="topmenu" align="center" valign="middle" width="8%">Floor Frame Detail Drawings (Ground Floor)</th> 
				<th class="topmenu" align="center" valign="middle" width="8%">Floor Frame Detail Drawings (First Floor)</th> 
				<th class="topmenu" align="center" valign="middle" width="8%">Floor Frame Inspection</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Termite protection Certificate – Penetrations</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Termite Protection Certificate - Perimeter</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Slab Inspection</th>
				<th class="topmenu other-column" align="center" valign="middle" width="8%">Floor System Quality Assurance Report</th>
				<th class="topmenu other-column" align="center" valign="middle" width="8%">Post Slab Clean Report</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Survey ID Document</th> 
				<th class="topmenu other-column" align="center" valign="middle" width="8%">Site Works Complete Report</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Under Slab Insulation Certificate</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Termite Notice</th>
				<th class="topmenu other-column" align="center" valign="middle" width="8%">Move To Close Up</th>
				<th class="topmenu other-column" align="center" valign="middle" width="9%">Action</th>   
            </tr>
        </thead>       
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td class="other-column">{{$item.cs_id}}</td>
        <td class="other-column" {{if $item.cs_fs_user}} style="background: #0C3;" {{/if}}>
        <a href="{{$BASE_URL}}construction_scheduler_report.qa_floor_system/cs_id/{{$item.cs_id}}" class="various">QA</a><br />
        {{if $item.cs_fs_user}}{{$item.cs_fs_user}}<br />{{$item.cs_fs_date}}{{/if}}
        </td>
        <td class="other-column"><a href="{{$item.link}}" target="_blank">{{$item.cs_project}}</a></td>
        <td class="other-column">
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
        <td class="other-column">{{$item.pt_name}}</td>
        <td class="other-column" {{if $item.doc_file_name_254}} style="background:#00CC33;"  
        {{elseif $item.cs_cal_ss_out eq 0 }} style="background:#F00" {{else}} style="background:#999" {{/if}} id="cout{{$item.cs_id}}">
       
        {{if $item.doc_file_name_254}}
         <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_254}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
         
        {{else}}
        
        <select name name="csout[{{$item.cs_id}}]" onchange="update_ss_out({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_cal_ss_out eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_cal_ss_out eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_ss_out(id,value)
		{
			var cout = '#cout'+id;
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_14/"+id+"/value_14/"+value,
					   success: function(result){
						   
						   if(value == 0 ) {
							$(cout).css("background","#F00");
						    } else {
							$(cout).css("background","#999"); 
						    }
						 
						}
				});
		}
	</script> 
         
         {{/if}}
         </td>
         
        <td class="other-column" {{if $item.doc_file_name_647}} style="background:#00CC33;" 
         {{elseif $item.cs_cal_ss_repo eq 0 }} style="background:#F00" {{else}} style="background:#999" {{/if}} id="repo{{$item.cs_id}}" >
      
        {{if $item.doc_file_name_647}}
        
            <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_647}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
        
        {{else}}
        
        <select name name="repo[{{$item.cs_id}}]" onchange="update_ss_repo({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_cal_ss_repo eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_cal_ss_repo eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_ss_repo(id,value)
		{
			var repo = '#repo'+id;
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_15/"+id+"/value_15/"+value,
					   success: function(result){
						   
						   if(value == 0 ) {
							$(repo).css("background","#F00");
						    } else {
							$(repo).css("background","#999"); 
						    }
						 
						}
				});
		}
	</script> 
        
         {{/if}}
        </td>
        
        <td {{if $item.doc_file_name_148}} style="background:#00CC33;" 
        {{elseif $item.cs_footing_inspection eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "fi{{$item.cs_id}}">
         
          {{if $item.doc_file_name_148}}
        
            <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_148}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
        
        {{else}}
    
        <select name name="footing_insp[{{$item.cs_id}}]" onchange="update_footing({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_footing_inspection eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_footing_inspection eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        {{/if}}
        <script>
		function update_footing(id,value)
		{
			var fi = '#fi'+id;
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_1/"+id+"/value_1/"+value,
					   success: function(result){
						   
						   if(value == 0 ) {
							$(fi).css("background","#F00");
						    } else {
							$(fi).css("background","#999"); 
						    }
						 
						}
				});
		}
	</script>
       
         
       
         </td>
       
       <td {{if $item.doc_file_name_653}} style="background:#00CC33;" 
       {{elseif $item.cs_fs_pierinsp eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "fs{{$item.cs_id}}">

    
       {{if $item.doc_file_name_653}}
        <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_653}}" target="_blank">Download</a>-->
        <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_653}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
         {{else}}
       
       <select name name="fs_pier[{{$item.cs_id}}]" onChange="update_pier({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_fs_pierinsp eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_fs_pierinsp eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_pier(id,value)
		{
			 var fs = '#fs'+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_2/"+id+"/value_2/"+value,
					   success: function(result){
						   
						   if(value == 0 ) {
							$(fs).css("background","#F00");
						    } else {
							$(fs).css("background","#999"); 
						    }
					}
				});
		}
	</script>
         {{/if}}

       </td>
     
   	 <td class="other-column" {{if $item.doc_file_name_654}} style="background:#00CC33;" 
         {{elseif $item.cs_fs_drain_report eq 0}} style="background:#F00;" {{else}} style="background:#999;"{{/if}} id = "dr{{$item.cs_id}}">
         
    
         {{if $item.doc_file_name_654}}
         <!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_654}}" target="_blank">Download</a>-->
            <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_654}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
         
         {{else}}
        <select name name="fs_drain[{{$item.cs_id}}]" onChange="update_drain({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_fs_drain_report eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_fs_drain_report eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_drain(id,value)
		{
			 var dr = '#dr'+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_3/"+id+"/value_3/"+value,
					   success: function(result){
						   
						   if(value == 0 ) {
							$(dr).css("background","#F00");
						    } else {
							$(dr).css("background","#999"); 
						    }
					}
				});
		}
	</script>
       
       
         {{/if}}
         </td>
        
        <td {{if $item.doc_file_name_478}} style="background:#00CC33;" 
        {{elseif $item.cs_fs_ff_ground eq 0}} style="background:#F00;"  {{else}} style="background:#999;" {{/if}} id = "ff{{$item.cs_id}}">
        

        
        {{if $item.doc_file_name_478}}
       <!--  <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_478}}" target="_blank">Download</a>-->
           <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_478}}&module_name=construction_scheduler_report.home" target="_blank">Download</a> 
         
         {{else}}
       
       
       <select name name="fs_drain[{{$item.cs_id}}]" onChange="update_ff_ground({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_fs_ff_ground eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_fs_ff_ground eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_ff_ground(id,value)
		{
			 var ff = '#ff'+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_4/"+id+"/value_4/"+value,
					   success: function(result){
						   
						    if(value == 0 ) {
							$(ff).css("background","#F00");
						    } else {
							$(ff).css("background","#999"); 
						    }
					}
				});
		}
	</script>
       
         {{/if}}
        </td>
        
        <td {{if $item.doc_file_name_534}} style="background:#00CC33;" 
        {{elseif $item.cs_fs_ff_first eq 0}} style="background:#F00;"  {{else}} style="background:#999;" {{/if}} id = "fir{{$item.cs_id}}">
        

        
        {{if $item.doc_file_name_534}}
   
           <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_534}}&module_name=construction_scheduler_report.home" target="_blank">Download</a> 
         
         {{else}}
        
         <select name name="fs_first[{{$item.cs_id}}]" onChange="update_ff_first({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_fs_ff_first eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_fs_ff_first eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_ff_first(id,value)
		{
			 var fir = '#fir'+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_5/"+id+"/value_5/"+value,
					   success: function(result){
						   
						    if(value == 0 ) {
							$(fir).css("background","#F00");
						    } else {
							$(fir).css("background","#999"); 
						    }
					}
				});
		}
	</script>
         {{/if}}
        </td>
        
       <td {{if $item.doc_file_name_648}} style="background:#00CC33;" 
       {{elseif $item.cs_fs_ff_insp eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "ffi{{$item.cs_id}}"> 
       
       
        {{if $item.doc_file_name_648}}
      
          <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_648}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>  
         
         {{else}}
        
        <select name name="fs_insp[{{$item.cs_id}}]" onChange="update_ff_insp({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_fs_ff_insp eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_fs_ff_insp eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_ff_insp(id,value)
		{
			 var ffi = '#ffi'+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_6/"+id+"/value_6/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(ffi).css("background","#F00");
						    } else {
							$(ffi).css("background","#999"); 
						    }
						   
					}
				});
		}
	</script>
       
         {{/if}}      
      </td>
      
      <!--<td {{if $item.cs_termite_pro eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "tp{{$item.cs_id}}">-->
      
       <td {{if $item.doc_file_name_155}} style="background:#00CC33;" 
       {{elseif $item.cs_termite_pro eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "tp{{$item.cs_id}}">  
         
         {{if $item.doc_file_name_155}} 
         
               <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_155}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>  
         
         {{else}}
         
        <select name name="fs_tp[{{$item.cs_id}}]" onChange="update_ter_pro({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_termite_pro eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_termite_pro eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
      {{/if}}

        <script>
		function update_ter_pro(id,value)
		{
			 var tp = '#tp'+id; 
			 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_7/"+id+"/value_7/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(tp).css("background","#F00");
						    } else {
							$(tp).css("background","#999"); 
						    }
						   
					}
				});
		}
	</script>
       
      </td>
     
  <!--    <td {{if $item.cs_termite_pro_para eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "tpp{{$item.cs_id}}"> -->
      
        <td {{if $item.doc_file_name_295}} style="background:#00CC33;" 
       {{elseif $item.cs_termite_pro_para eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "tpp{{$item.cs_id}}">  
       
       
         {{if $item.doc_file_name_295}} 
         
               <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_295}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>  
         
         {{else}}
       
       <select name name="fs_tepp[{{$item.cs_id}}]" onChange="update_ter_pro_para({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_termite_pro_para eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_termite_pro_para eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    {{/if}}
    
        <script>
		function update_ter_pro_para(id,value)
		{
			 var tpp = '#tpp'+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_8/"+id+"/value_8/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(tpp).css("background","#F00");
						    } else {
							$(tpp).css("background","#999"); 
						    }
					}
				});
		}
	</script>
       
      </td>
     
      
       <td {{if $item.doc_file_name_240}} style="background:#00CC33;" 
       {{elseif $item.cs_slab_insp eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "si{{$item.cs_id}}">
       
       
      {{if $item.doc_file_name_240}}
       
            <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_240}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
         
        {{else}}
        
        <select name="fs_slab[{{$item.cs_id}}]" onChange="update_slab_insp({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_slab_insp eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_slab_insp eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_slab_insp(id,value)
		{
			 var si = '#si'+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_9/"+id+"/value_9/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(si).css("background","#F00");
						    } else {
							$(si).css("background","#999"); 
						    }
					}
				});
		}
	</script>
        
         {{/if}} 
       
       </td>
       <td class="other-column" {{if $item.floor_system}} style="background:#00CC33;" 
       {{elseif $item.cs_fs_quality_ass eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "fq{{$item.cs_id}}">
       
       
       {{if $item.floor_system}}
   
          <a href="/construction_scheduler_report.download_content?file_name={{$item.floor_system}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
       
       {{else}}
      
       
       <select name="fs_qa[{{$item.cs_id}}]" onChange="update_qa_ass({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_fs_quality_ass eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_fs_quality_ass eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_qa_ass(id,value)
		{
			 var fq = '#fq'+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_10/"+id+"/value_10/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(fq).css("background","#F00");
						    } else {
							$(fq).css("background","#999"); 
						    }
					}
				});
		}
	</script>
       {{/if}}
       
       </td>
       
      <!-- <td  {{if $item.cs_fs_postslab eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "psc{{$item.cs_id}}">-->
       
       <td class="other-column" {{if $item.doc_file_name_665}} style="background:#00CC33;" 
       {{elseif $item.cs_fs_postslab eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "psc{{$item.cs_id}}"> 
       
          {{if $item.doc_file_name_665}}
       
            <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_665}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
         
        {{else}}
      
       <select name="fs_qa[{{$item.cs_id}}]" onChange="update_post_slab({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_fs_postslab eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_fs_postslab eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
      {{/if}}
    
        <script>
		function update_post_slab(id,value)
		{
			  var psc = '#psc'+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_11/"+id+"/value_11/"+value,
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
       
       </td>
       
       <td {{if $item.doc_file_name_261}} style="background:#00CC33;" 
       {{elseif $item.cs_survey_id eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "sid{{$item.cs_id}}">
       

       
        {{if $item.doc_file_name_261}}
         
            <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_261}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
         
         {{else}}
        
        <select name="fs_survid[{{$item.cs_id}}]" onChange="update_survey_id({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_survey_id eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_survey_id eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_survey_id(id,value)
		{
			  var sid = '#sid'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_12/"+id+"/value_12/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(sid).css("background","#F00");
						    } else {
							$(sid).css("background","#999"); 
						    }
					}
				});
		}
	</script>
         
         {{/if}}
       </td>
       
       <td class="other-column" {{if $item.doc_file_name_656}} style="background:#00CC33;" 
       {{elseif $item.cs_site_works eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "sw{{$item.cs_id}}">
       

         {{if $item.doc_file_name_656}}
        
            <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_656}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
         
          {{else}}
        
        <select name="fs_sw[{{$item.cs_id}}]" onChange="update_site_work({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_site_works eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_site_works eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_site_work(id,value)
		{
			var sw = '#sw'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_13/"+id+"/value_13/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(sw).css("background","#F00");
						    } else {
							$(sw).css("background","#999"); 
						    }
					}
				});
		}
	</script>
         
         {{/if}}
       </td>
	   
	   <td {{if $item.doc_file_name_795}} style="background:#00CC33;" 
       {{elseif $item.cs_un_slab_ins eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="cond795{{$item.cs_id}}">
       
		{{if $item.doc_file_name_795}}
			<a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_795}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
		{{else}}
        
        <select name="usi[{{$item.cs_id}}]" onChange="update_un_slab_ins({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_un_slab_ins eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_un_slab_ins eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_un_slab_ins(id,value)
		{
			var cond795 = '#cond795'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_795/"+id+"/value_795/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(cond795).css("background","#F00");
						    } else {
							$(cond795).css("background","#999"); 
						    }
					}
				});
		}
		</script>
         
        {{/if}}
       </td>
	   
       <td {{if $item.doc_file_name_798}} style="background:#00CC33;" 
       {{elseif $item.cs_termite_notice eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="cond798{{$item.cs_id}}">
       
		{{if $item.doc_file_name_798}}
			<a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_798}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
		{{else}}
        
        <select name="termite_notice[{{$item.cs_id}}]" onChange="update_termite_notice({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_termite_notice eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_termite_notice eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_termite_notice(id,value)
		{
			var cond798 = '#cond798'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_floor_system/cs_id_798/"+id+"/value_798/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(cond798).css("background","#F00");
						    } else {
							$(cond798).css("background","#999"); 
						    }
					}
				});
		}
		</script>
         
        {{/if}}
       </td> 
      
        <td class="other-column">
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="move_close[{{$item.cs_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="move_close[{{$item.cs_id}}]" value="4"  onclick="this.form.submit();" {{if $item.cs_stage eq 4 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>
      
       </td>
	   
	  
        <td class="other-column"> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
            
        </td>
    </tr>  
  {{/foreach}}
  </tbody>
  </table>

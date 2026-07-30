<form name="ch" method="post" action="">
<input type="submit" name="show_hidden" value="Show Hidden"  /> 
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
				<th class="topmenu" align="center" valign="middle" width="5%">Pre-paint Clean Report</th> 
				<th class="topmenu" align="center" valign="middle" width="5%">Pre-floor Clean Report</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Builders Clean Report</th> 
				<th class="topmenu" align="center" valign="middle" width="10%">Pre-walkthrough Quality Assuarance Report</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Driveway/Verge Crossing Formwork Inspection Report</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Glazing Certificate - Shower Screens</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Glazing Certificate- Glass Wardrobe Doors</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Glazing Certificate- Glass Mirror & Splashback</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Glazing Certificate- Glass Balustrade</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Waterproofing Certificate</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Smoke Alarm Certificate</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Slip Resistance Certificate - Interior Stairs</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Slip Resistance Certificate - Exterior Stairs and Landing</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Amended Development Approval</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Building Approval Amendment Authorisation</th>
				<th class="topmenu other-column" align="center" valign="middle" width="8%">Hide</th>
				<th class="topmenu other-column" align="center" valign="middle" width="9%">Action</th>   
            </tr>
        </thead>       
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td class="other-column">{{$item.cs_id}}</td>
        <td class="other-column" {{if $item.cs_walk_user}} style="background: #0C3;" {{/if}}>
        <a href="{{$BASE_URL}}construction_scheduler_report.qa_walkthrough/cs_id/{{$item.cs_id}}" class="various">QA</a><br />
        {{if $item.cs_walk_user}} {{$item.cs_walk_user}} <br />{{$item.cs_walk_date}} {{/if}}
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
         
    <!--     <td {{if $item.cs_walk_prepaint eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="prep{{$item.cs_id}}">
    -->     
           <td {{if $item.doc_file_name_650}} style="background:#00CC33;" 
          {{elseif $item.cs_walk_prepaint eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "prep{{$item.cs_id}}">
    
         
         {{if $item.doc_file_name_650}}
        <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_650}}" target="_blank">Download</a>-->
         <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_650}}&module_name=construction_scheduler_report.home" target="_blank">Download</a> 
         
         {{else}}
        
        <select name name="fssw3[{{$item.cs_id}}]" onChange="update_painting({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_walk_prepaint eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_walk_prepaint eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_painting(id,value)
		{
			var prep = '#prep'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_walkthrough/cs_id_1/"+id+"/value_1/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(prep).css("background","#F00");
						    } else {
							$(prep).css("background","#999"); 
						    }
					}
				});
		}
	</script>
         
         {{/if}}
         </td>
         
     <!--   <td {{if $item.cs_walk_preclean eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="prcl{{$item.cs_id}}">
    -->   
        <td {{if $item.doc_file_name_651}} style="background:#00CC33;" 
          {{elseif $item.cs_walk_preclean eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "prcl{{$item.cs_id}}">
    
       
        {{if $item.doc_file_name_651}}
        <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_651}}" target="_blank">Download</a>-->
           <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_651}}&module_name=construction_scheduler_report.home" target="_blank">Download</a> 
         
         {{else}}
        
        <select name name="fssw3[{{$item.cs_id}}]" onChange="update_pre_clean({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_walk_preclean eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_walk_preclean eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_pre_clean(id,value)
		{
			var prcl = '#prcl'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_walkthrough/cs_id_2/"+id+"/value_2/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(prcl).css("background","#F00");
						    } else {
							$(prcl).css("background","#999"); 
						    }
					}
				});
		}
	</script>
         
         {{/if}}
        </td>
        
     <!--   <td {{if $item.cs_walk_builder eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="buil{{$item.cs_id}}">
    -->  
       <td {{if $item.doc_file_name_652}} style="background:#00CC33;" 
          {{elseif $item.cs_walk_builder eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "buil{{$item.cs_id}}">
    
      
        {{if $item.doc_file_name_652}}
       <!--  <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_652}}" target="_blank">Download</a>-->
            <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_652}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
         
         {{else}}
        
        <select name name="fssw3[{{$item.cs_id}}]" onChange="update_builder({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_walk_builder eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_walk_builder eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_builder(id,value)
		{
			var buil = '#buil'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_walkthrough/cs_id_3/"+id+"/value_3/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(buil).css("background","#F00");
						    } else {
							$(buil).css("background","#999"); 
						    }
					}
				});
		}
	</script>
         
         {{/if}}
         </td>
       
     <!--  <td {{if $item.cs_walk_pwqa eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="pwqa{{$item.cs_id}}">
      --> 
        <td {{if $item.bsn_qar_pre_walk}} style="background:#00CC33;" 
          {{elseif $item.cs_walk_pwqa eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "pwqa{{$item.cs_id}}">
    
       
        {{if $item.bsn_qar_pre_walk}}
        <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.bsn_qar_pre_walk}}" target="_blank">Download</a>-->
           <a href="/construction_scheduler_report.download_content?file_name={{$item.bsn_qar_pre_walk}}&module_name=construction_scheduler_report.home" target="_blank">Download</a> 
         
         {{else}}
        
        <select name name="fssw3[{{$item.cs_id}}]" onChange="update_pwqa({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_walk_pwqa eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_walk_pwqa eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_pwqa(id,value)
		{
			var pwqa = '#pwqa'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_walkthrough/cs_id_4/"+id+"/value_4/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(pwqa).css("background","#F00");
						    } else {
							$(pwqa).css("background","#999"); 
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
				   url: "{{$BASE_URL}}construction_scheduler_report.update_walkthrough/cs_id_9/"+id+"/value_9/"+value,
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
		 
		<td {{if $item.doc_file_name_413}} style="background:#00CC10;" 
       {{elseif $item.cs_gla_showr_screen eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="cond413{{$item.cs_id}}">
       
		{{if $item.doc_file_name_413}}
			<a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_413}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
		{{else}}
        
        <select name name="glz_shower[{{$item.cs_id}}]" onChange="update_glz_shower({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_gla_showr_screen eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_gla_showr_screen eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_glz_shower(id,value)
		{
			var cond413 = '#cond413'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_walkthrough/cs_id_413/"+id+"/value_413/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(cond413).css("background","#F00");
						    } else {
							$(cond413).css("background","#999"); 
						    }
					}
				});
		}
		</script>
         
        {{/if}}
       </td>
		
		<td {{if $item.doc_file_name_735}} style="background:#00CC10;" 
       {{elseif $item.cs_gla_ward_doors eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="cond735{{$item.cs_id}}">
       
		{{if $item.doc_file_name_735}}
			<a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_735}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
		{{else}}
        
        <select name name="gla_ward_doors[{{$item.cs_id}}]" onChange="update_gla_ward_doors({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_gla_ward_doors eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_gla_ward_doors eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_gla_ward_doors(id,value)
		{
			var cond735 = '#cond735'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_walkthrough/cs_id_735/"+id+"/value_735/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(cond735).css("background","#F00");
						    } else {
							$(cond735).css("background","#999"); 
						    }
					}
				});
		}
		</script>
         
        {{/if}}
       </td>
		
		<td {{if $item.doc_file_name_736}} style="background:#00CC10;" 
       {{elseif $item.cs_glass_mirr_splash eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="cond736{{$item.cs_id}}">
       
		{{if $item.doc_file_name_736}}
			<a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_736}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
		{{else}}
        
        <select name name="gla_mirr[{{$item.cs_id}}]" onChange="update_gla_mirro({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_glass_mirr_splash eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_glass_mirr_splash eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_gla_mirro(id,value)
		{
			var cond736 = '#cond736'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_walkthrough/cs_id_736/"+id+"/value_736/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(cond736).css("background","#F00");
						    } else {
							$(cond736).css("background","#999"); 
						    }
					}
				});
		}
		</script>
         
        {{/if}}
       </td>
		
		<td {{if $item.doc_file_name_738}} style="background:#00CC10;" 
       {{elseif $item.cs_glass_balustrade eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="cond738{{$item.cs_id}}">
       
		{{if $item.doc_file_name_738}}
			<a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_738}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
		{{else}}
        
        <select name name="gla_balu[{{$item.cs_id}}]" onChange="update_gla_balu({{$item.cs_id}}, this.value)" >
			<option value="0" {{if $item.cs_glass_balustrade eq 0 }} selected="selected" {{/if}}>Required</option>
			<option value="1" {{if $item.cs_glass_balustrade eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_gla_balu(id,value)
		{
			var cond738 = '#cond738'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_walkthrough/cs_id_738/"+id+"/value_738/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(cond738).css("background","#F00");
						    } else {
							$(cond738).css("background","#999"); 
						    }
					}
				});
		}
		</script>
         
        {{/if}}
       </td>
		
		<td {{if $item.doc_file_name_163}} style="background:#00CC10;" 
       {{elseif $item.cs_watrproof_cert eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="cond163{{$item.cs_id}}">
       
		{{if $item.doc_file_name_163}}
			<a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_163}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
		{{else}}
        
        <select name name="watrproof_cert[{{$item.cs_id}}]" onChange="update_watrproof_cert({{$item.cs_id}}, this.value)" >
			<option value="0" {{if $item.cs_watrproof_cert eq 0 }} selected="selected" {{/if}}>Required</option>
			<option value="1" {{if $item.cs_watrproof_cert eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_watrproof_cert(id,value)
		{
			var cond163 = '#cond163'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_walkthrough/cs_id_163/"+id+"/value_163/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(cond163).css("background","#F00");
						    } else {
							$(cond163).css("background","#999"); 
						    }
					}
				});
		}
		</script>
         
        {{/if}}
       </td>
		
		<td {{if $item.doc_file_name_296}} style="background:#00CC10;" 
       {{elseif $item.cs_smoke_alarm_cert eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="cond296{{$item.cs_id}}">
       
		{{if $item.doc_file_name_296}}
			<a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_296}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
		{{else}}
        
        <select name name="smoke_alarm_cert[{{$item.cs_id}}]" onChange="update_smoke_alarm_cert({{$item.cs_id}}, this.value)" >
			<option value="0" {{if $item.cs_smoke_alarm_cert eq 0 }} selected="selected" {{/if}}>Required</option>
			<option value="1" {{if $item.cs_smoke_alarm_cert eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_smoke_alarm_cert(id,value)
		{
			var cond296 = '#cond296'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_walkthrough/cs_id_296/"+id+"/value_296/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(cond296).css("background","#F00");
						    } else {
							$(cond296).css("background","#999"); 
						    }
					}
				});
		}
		</script>
         
        {{/if}}
       </td>
		
		<td {{if $item.doc_file_name_713}} style="background:#00CC10;" 
       {{elseif $item.cs_slip_resist_cert eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="cond713{{$item.cs_id}}">
       
		{{if $item.doc_file_name_713}}
			<a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_713}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
		{{else}}
        
        <select name name="slip_resist_cert[{{$item.cs_id}}]" onChange="update_slip_resist_cert({{$item.cs_id}}, this.value)" >
			<option value="0" {{if $item.cs_slip_resist_cert eq 0 }} selected="selected" {{/if}}>Required</option>
			<option value="1" {{if $item.cs_slip_resist_cert eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_slip_resist_cert(id,value)
		{
			var cond713 = '#cond713'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_walkthrough/cs_id_713/"+id+"/value_713/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(cond713).css("background","#F00");
						    } else {
							$(cond713).css("background","#999"); 
						    }
					}
				});
		}
		</script>
         
        {{/if}}
       </td>
		
		<td {{if $item.doc_file_name_714}} style="background:#00CC10;" 
       {{elseif $item.cs_slip_ext_cert eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="cond714{{$item.cs_id}}">
       
		{{if $item.doc_file_name_714}}
			<a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_714}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
		{{else}}
        
        <select name name="slip_ext_cert[{{$item.cs_id}}]" onChange="update_slip_ext_cert({{$item.cs_id}}, this.value)" >
			<option value="0" {{if $item.cs_slip_ext_cert eq 0 }} selected="selected" {{/if}}>Required</option>
			<option value="1" {{if $item.cs_slip_ext_cert eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_slip_ext_cert(id,value)
		{
			var cond714 = '#cond714'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_walkthrough/cs_id_714/"+id+"/value_714/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(cond714).css("background","#F00");
						    } else {
							$(cond714).css("background","#999"); 
						    }
					}
				});
		}
		</script>
         
        {{/if}}
       </td>
		
		<td {{if $item.doc_file_name_694}} style="background:#00CC10;" 
       {{elseif $item.cs_amend_appr eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="cond694{{$item.cs_id}}">
       
		{{if $item.doc_file_name_694}}
			<a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_694}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
		{{else}}
        
        <select name name="amend_appr[{{$item.cs_id}}]" onChange="update_amend_appr({{$item.cs_id}}, this.value)" >
			<option value="0" {{if $item.cs_amend_appr eq 0 }} selected="selected" {{/if}}>Required</option>
			<option value="1" {{if $item.cs_amend_appr eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_amend_appr(id,value)
		{
			var cond694 = '#cond694'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_walkthrough/cs_id_694/"+id+"/value_694/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(cond694).css("background","#F00");
						    } else {
							$(cond694).css("background","#999"); 
						    }
					}
				});
		}
		</script>
         
        {{/if}}
       </td>
		
		<td {{if $item.doc_file_name_637}} style="background:#00CC10;" 
       {{elseif $item.cs_ba_amnd_auth eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id="cond637{{$item.cs_id}}">
       
		{{if $item.doc_file_name_637}}
			<a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_637}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
		{{else}}
        
        <select name name="ba_amnd_auth[{{$item.cs_id}}]" onChange="update_ba_amnd_auth({{$item.cs_id}}, this.value)" >
			<option value="0" {{if $item.cs_ba_amnd_auth eq 0 }} selected="selected" {{/if}}>Required</option>
			<option value="1" {{if $item.cs_ba_amnd_auth eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
    
        <script>
		function update_ba_amnd_auth(id,value)
		{
			var cond637 = '#cond637'+id; 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_walkthrough/cs_id_637/"+id+"/value_637/"+value,
					   success: function(result){
						   if(value == 0 ) {
							$(cond637).css("background","#F00");
						    } else {
							$(cond637).css("background","#999"); 
						    }
					}
				});
		}
		</script>
         
        {{/if}}
       </td>
      
        <td class="other-column">
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.cs_id}}]" value="5" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.cs_id}}]" value="0"  onclick="this.form.submit();" {{if $item.cs_stage eq 0 }} checked="checked" {{/if}} />
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

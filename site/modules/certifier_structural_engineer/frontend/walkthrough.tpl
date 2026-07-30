<form name="ch" method="post" action="">
<input type="submit" name="show_hidden" value="Show Hidden"  /> 
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
                   <th class="topmenu" align="center" valign="middle" width="5%">Pre-paint Clean Report</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Pre-floor Clean Report</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Builders Clean Report</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Pre-walkthrough Quality Assuarance Report</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Hide</th>
          	   <th class="topmenu" align="center" valign="middle" width="9%">Action</th>   
            </tr>
        </thead>       
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.cs_id}}</td>
        <td {{if $item.cs_walk_user}} style="background: #0C3;" {{/if}}>
        <a href="{{$BASE_URL}}construction_scheduler_report.qa_walkthrough/cs_id/{{$item.cs_id}}" class="various">QA</a><br />
        {{if $item.cs_walk_user}} {{$item.cs_walk_user}} <br />{{$item.cs_walk_date}} {{/if}}
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
      
        <td>
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.cs_id}}]" value="5" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.cs_id}}]" value="0"  onclick="this.form.submit();" {{if $item.cs_stage eq 0 }} checked="checked" {{/if}} />
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

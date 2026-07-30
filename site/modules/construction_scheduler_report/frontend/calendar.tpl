<form name="ch" method="post" action="">
<input type="submit" name="calshow" value="Show Hidden"  /> 
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
                   <th class="topmenu" align="center" valign="middle" width="5%">Construction Commencement Report</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Calendar Link</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Move To Floor System</th>
          	   <th class="topmenu" align="center" valign="middle" width="9%">Action</th>   
            </tr>
        </thead>
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.cs_id}}</td>
         <td {{if $item.cs_cal_user}} style="background: #0C3;" {{/if}}>
          <a href="{{$BASE_URL}}construction_scheduler_report.qa_calendar/cs_id/{{$item.cs_id}}" class="various">QA</a><br />
          {{if $item.cs_cal_user}} {{$item.cs_cal_user}} <br />{{$item.cs_cal_date}} {{/if}}
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
         <input type="text" name="sod_cal[{{$item.cs_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.cs_id}}" value="{{$item.cs_cal_sod}}" onfocus = "update_onsite({{$item.cs_id}}, this.value);" /> 
           
        <script>
 	   
        function update_onsite(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}construction_scheduler_report.update_onsite/cs_id_cal/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>  
        
        </td>  
        
        
       <!-- <td  {{if $item.cs_cal_con_notes eq 0 }} style="background:#F00" {{else}} style="background:#999" {{/if}} id = "cn{{$item.cs_id}}">
    -->
      <td {{if $item.doc_file_name_625}} style="background:#00CC33;" 
          {{elseif $item.cs_cal_con_notes eq 0}} style="background:#F00;" {{else}} style="background:#999;" {{/if}} id = "cn{{$item.cs_id}}">
    
    
   
       {{if $item.doc_file_name_625}}
         <!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_625}}" target="_blank">Download</a>-->
            <a href="/construction_scheduler_report.download_content?file_name={{$item.doc_file_name_625}}&module_name=construction_scheduler_report.home" target="_blank">Download</a>
       {{else}}  
         
         <select name name="cp[{{$item.cs_id}}]" onChange="update_com_notes({{$item.cs_id}}, this.value)" >
        <option value="0" {{if $item.cs_cal_con_notes eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $item.cs_cal_con_notes eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
     
       
        <script>
		function update_com_notes(id,value)
		{
			var cn = '#cn'+id;
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_scheduler_report.update_ns/cs_id_1/"+id+"/value_1/"+value,
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
        
        <td>{{if $item.calendar_link}}<a href="{{$item.calendar_link}}" target="_blank">Link</a>{{/if}}</td>
    
        <td>
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="move_floor[{{$item.cs_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="move_floor[{{$item.cs_id}}]" value="3"  onclick="this.form.submit();" {{if $item.cs_stage eq 3 }} checked="checked" {{/if}} />
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

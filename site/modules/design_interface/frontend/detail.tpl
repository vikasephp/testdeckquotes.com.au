<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{include file=$jdata}}
{{include file=$tiny_basic}}
{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<script type="text/javascript" >  
		$(document).ready(function() {
			/*
			*   Examples - images
			*/
			$(".variousnew").fancybox({
				'width': '70%',
				'height': '100%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'scrolling': 'yes' 
			});

		
		});
</script>


<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

		<style>
/*        input[type="checkbox"] {
          display: none;
        }*/
		
		.hid {display:none; }
        
        input[type="checkbox"] + label:before {
          background: #F00 ;	
          border: 1px solid #7f83a2;
          content: "\00a0";
          display: inline-block;
          font: 16px/1em sans-serif;
          height: 16px;
          margin: 0.4em .25em 0 0;
          padding: 0;
          vertical-align: top;
          width: 16px;
        }
        input[type="checkbox"]:checked + label:before {
          background: #FFF ;
          color: #666;
          content: "\2713";
          text-align: center;
          cursor:pointer;
        }
	
	#bfp table td th {border:1px solid #999; }
	#bfp  td  {border:1px solid #999; padding:5px; }
	#bfp  th {border:1px solid #999; padding:5px; }
	#bfp {border:1px solid #999; }
        </style>


<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>   
     
    {{if $opr}}
	<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}
    
     <form name="detail" id="myForm" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
        <table id="di-table" width="90%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
            {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
            <tr>
                <th width="18%" >Design Number:</th>
                <td width="18"><input type="text"  name="{{$TABLE}}[di_design_number]" value="{{$detail.di_design_number}}" /></td>
            
            
            <th width="60%" rowspan="9" colspan="2" style="vertical-align:top;">
               
                <table width="98%" id="lp" cellspacing="0" style="border-collapse:collapse;">
                 
                <tr>
                <th width="3" style="border:1px !important;"></th>
                <th width="15%"> Key Features </th> <th width="10%"> Number </th>
                <th width="15%">Notes</th><th width="12%">Icon </th><th>Add Text</th><th>Text</th> </tr>
                {{foreach from=$di_features key="keyf" item="itemf"}}
                <tr id="dr{{$itemf.dif_id}}">
                <th width="3" style="border:0px !important;">
                 <a href="javascript:delete_feature({{$itemf.dif_id}});" value="Delete Fearure" title="Delete" >
                 <img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/deletecross.png"/>
                 </a>
                 </th>
             
                <td> 
                
                <input type="hidden" name="did" value="{{$detail.di_id}}" />
                    
                     <select name="key2[{{$itemf.dif_id}}]" id="kf" onchange="this.form.submit()"  >
                    <option value="0">Please Select </option>
                        {{foreach from=$keyfeatures key="key" item ="item"}}
                               <option value="{{$item.dik_keyfeature}}" {{if $item.dik_keyfeature eq $itemf.dif_key_feature}} selected="selected" {{/if}}>{{$item.dik_keyfeature}}</option>
                         {{/foreach}}
                    </select>
                                
                </td>
                 
                <td><input type="text" value = "{{$itemf.dif_number}}" size="3" onkeyup="editnumber(this.value, {{$itemf.dif_id}});"  /> </td>
                <td><input type="text" value = "{{$itemf.dif_notes}}" size="20" onkeyup="editnotes(this.value, {{$itemf.dif_id}});"  /> </td>
              <td><img src="{{$BASE_URL}}files/asset_list/{{$itemf.dif_icon_file}}" style="width:30px" /></td>
               
               <th> 
                <form name ="recmet3" method="post" action="">
                <input type="hidden" name="addtext[{{$itemf.dif_id}}]" value="0" />
                <label class="switch">
        <input class="switch-input" type="checkbox"  name="addtext[{{$itemf.dif_id}}]" value="1"  onclick="this.form.submit();" {{if $itemf.di_add_text eq 1 }} checked="checked" {{/if}} />
                <span class="switch-label" data-on="Yes" data-off="No"></span> 
                <span class="switch-handle"></span> <br />
               </label> 
               </form>  
               </th>
               <th>{{$itemf.dif_text}}</th>
               
                </tr>
                {{/foreach}}
                </table>
                
                <div style="text-align:left;">
                {{if $this_id}}
                <a href="javascript:appendRowLp({{$detail.$ID}})"  value="Add New Feature" title="Add Feature">
                <img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/addnew.png"/></a>
                {{else}}
                
                <a href="javascript:savefirst();"  value="Add New Feature" title="Add Feature">
                <img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/addnew.png"/></a>
                {{/if}}
                </div>
                
                
<script type="text/javascript">
		var x=0;
		function appendRowLp(id)
		{
		 x=x+1;
		 var row = '<tr id="r'+x+'">';
		 
		 row =  row + '<th width="3" style="border:0px !important;"><input type="hidden" name="did" value='+id+'>';
 row =  row + '<a href="javascript:delete_feature_row('+x+');" value="Delete Fearure" title="Delete" >';
 row =  row + '<img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a></th>';
						  
		 row =  row + '<td><select name="key" id="kf'+x+'" onchange="this.form.submit()" ><option value="0">Please Select </option>{{foreach from=$keyfeatures key="key" item ="item"}}';
		 row =  row + '<option value="{{$item.dik_keyfeature}}"> {{$item.dik_keyfeature}}</option>' ;
		 row =  row + '{{/foreach}}</td>';
		 
		 row =  row + '<td width="10%"> <input type="text" size="3" disabled="disabled" onkeyup=savenumber(this.value,'+id+','+x+'); />';
		 row =  row + '<td width="30%"> <input type="text" size="30" disabled="disabled" onkeyup=savenotes(this.value,'+id+','+x+'); />';
		 
		 row =  row +'<td> </td>';
		
		 row =  row + '</tr>';
		 
		 $("#lp").append(row);
		}
				
				function savefirst()
				{
					alert("Please first save this design interface");	
				}
				
				function savekey(value,id,x)
				{
			    		
					$("input").removeAttr('disabled');
					var kf = '#kf'+x;
					$(kf).attr('disabled','disabled');
					
					  $.ajax({
						   type: "GET",
						   url: "{{$BASE_URL}}design_interface.update_features/key/"+id+"/value/"+value,
							   success: function(result){
						   }
						 });
				}
			
			      function savenumber(value,id,x)
				{
					
				var kf = '#kf'+x;
				var feature = $(kf).val();
				
						
				  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/design_interface.update_features/number/"+id+"/value/"+value+"/feature/"+feature,
						   success: function(result){
					   }
					 });
				}
				
				function savenotes(value,id,x)
				{
				
				var kf = '#kf'+x;
				var feature = $(kf).val();
				
				  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/design_interface.update_features/notes/"+id+"/value/"+value+"/feature/"+feature,
						   success: function(result){
					   }
					 });
				}
				
	
				function editnotes(value,id)
				{
				  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/design_interface.edit_notes/id/"+id+"/value/"+value,
						   success: function(result){
					   }
					 });
				}
				
				function editnumber(value,id)
				{
				  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/design_interface.edit_number/id/"+id+"/value/"+value,
						   success: function(result){
					   }
					 });
				}
			
			
				function update_key(kfid, value)
				{
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/design_interface.update_features/kfid/"+kfid+"/value/"+value,
						   success: function(result){
					   }
					 });
					
				}
				
				
				function delete_feature(dif_id)
				{
					dr = '#dr'+dif_id;
					$(dr).remove();
				
					$.ajax({
				    type: "GET",
				 			  
				    url: "{{$BASE_URL}}design_interface.delete_feature/dif_id/"+dif_id,
				   // data: "bsn_id =" + id,
				   success: function(result){
					// $("#somewhere").html(result);
				   }
				 });
			
				}
				
				function delete_feature_row(x)
				{
					dr = '#r'+ x;
					$(dr).remove();
				}
				
				
				</script>
                </th>
                  
            </tr>   
               
            
             <tr>
                <th>Design Type:</th>
                <td><select name="{{$TABLE}}[di_design_type]">
               	<option value="FPE" {{if $detail.di_design_type eq 'FPE'}} selected="selected" {{/if}}>FPE </option>
               	<option value="2ndR" {{if $detail.di_design_type eq '2ndR'}} selected="selected" {{/if}}>2ndR </option>
               	<option value="Con" {{if $detail.di_design_type eq 'Con'}} selected="selected" {{/if}}>Con </option> 
                <option value="Add" {{if $detail.di_design_type eq 'Add'}} selected="selected" {{/if}}>Add </option>   
                <option value="Cl 10" {{if $detail.di_design_type eq 'Cl 10'}} selected="selected" {{/if}}>Cl 10 </option>  
               </select></td>
            </tr>
            
            <tr>
            <th>Active:</th>
            <td>
             <select name="{{$TABLE}}[di_active]">
             <option value="Yes" {{if $detail.di_active eq 'Yes'}} selected="selected" {{/if}}>Yes</option>
             <option value="No"  {{if $detail.di_active eq 'No'}} selected="selected" {{/if}}>No</option>
             </select>
            </td>
</tr>
         
          <tr> 
          <th>Live www </th>
          <td> <a href = "{{$detail.di_cgfb_design_link}}" target="_blank" > {{$detail.di_cgfb_design_link}} </a> </td>
          </tr> 


  			<tr>
            <th>Last Priced: </th>
           <td> {{$last_priced_date}} </td>
           </tr>

         <tr> 
          <th> Total Price </th>
          <td>  {{$total_price}}</tr>
          
          
         <tr>
         <th>GP Value: </th>
         <td> {{$gp_value}} </td>
         </tr>
          
         <tr>
        <th>Audited:</th>
        <td><input type="text" name="{{$TABLE}}[di_audited]" value="{{$detail.di_audited}}" size="20" maxlength="25" id="demo4" class="w16em dateformat-d-ds-m-ds-Y" readonly="readonly"/> </td>
        </tr>
      
         <tr>
         <th>Relevant Checklist Number </th>
         <td id="chk">
         <input type="text"  name="{{$TABLE}}[di_checklist_number]" value="{{$detail.di_checklist_number}}" />
         
         <a href="javascript:appendRowCheklist({{$detail.$ID}})"  value="Add New Feature" title="Add checklist">
                <img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/addnew.png"/></a>
            
              <script type="text/javascript">
		var x=0;
		function appendRowCheklist(id)
		{
		 x=x+1;
		 row =  '<br><input type="hidden" name="did" value='+id+'>';
 		 /*row =  row + '<a href="javascript:delete_feature_row('+x+');" value="Delete Fearure" title="Delete" >';
 		 row =  row + '<img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>';*/
						  
		 row =  row + '<input type="text"  name="chk[]'+x+'" size="30"  />';
		 
		 $("#chk").append(row);
		}
		</script>    
                
                
          </td>
         </tr>
      
        <tr>
         <th>Project Link</th>
         <td>
         <input type="text"  name="{{$TABLE}}[di_project_link]" value="{{$detail.di_project_link}}" style="width:400px;" /> </td>
         <td><strong>Project Address </strong>&nbsp; &nbsp; <input type="text"  name="{{$TABLE}}[di_project_address]" value="{{$detail.di_project_address}}" style="width:500px;" /></td>
          
      </tr>
      
        <tr>
       <th>Proposal</th>
          <td colspan="2"><input type= "file" name="proposal"  />
          <input type="text" name="{{$TABLE}}[di_proposal_date]" value="{{$detail.di_proposal_date}}" size="20" maxlength="25" id="demo10" class="w16em dateformat-d-ds-m-ds-Y"/>&nbsp;&nbsp;
          
          {{if $detail.di_proposal}} User: {{$detail.di_proposal_user|default:'None'}} &nbsp;&nbsp;
        <!--  <a href="https://deckquote.s3.amazonaws.com/files/design_interface/{{$detail.di_proposal}}" target="_blank"> {{$detail.di_proposal}}</a>-->
          
          <a href="/design_interface.download_content?file_name={{$detail.di_proposal}}&module_name=design_interface.home" target="_blank"> {{$detail.di_proposal}}</a>
          
          &nbsp;<a href = "{{$BASE_URL}}design_interface.detail/di_id/{{$this_id}}/di_doc/di_proposal">
          <img src="{{$BASE_URL}}images/delete-icon.png" /></a>{{/if}}
           </td>

          </tr>
      
            <tr>
       <th>Brochure</th>
          <td colspan="2"><input type= "file" name="brochure"  />
          <input type="text" name="{{$TABLE}}[di_brochure_date]" value="{{$detail.di_brochure_date}}" size="20" maxlength="25" id="demo11" class="w16em dateformat-d-ds-m-ds-Y"/>&nbsp;&nbsp;
           
          {{if $detail.di_brochure}} User: {{$detail.di_brochure_user|default:'None'}} &nbsp;&nbsp;
          
          <!--<a href="https://deckquote.s3.amazonaws.com/files/design_interface/{{$detail.di_brochure}}" target="_blank"> {{$detail.di_brochure}}</a>-->
          
          <a href="/design_interface.download_content?file_name={{$detail.di_brochure}}&module_name=design_interface.home" target="_blank"> {{$detail.di_brochure}}</a>
          
          &nbsp;<a href = "{{$BASE_URL}}design_interface.detail/di_id/{{$this_id}}/di_doc/di_brochure"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>{{/if}}
           </td>

          </tr>  
          
          <tr>
       <th>Full Brochure</th>
          <td colspan="2"><input type= "file" name="full_brochure"  />
           <input type="text" name="{{$TABLE}}[di_full_brochure_date]" value="{{$detail.di_full_brochure_date}}" size="20" id="demo12" class="w16em dateformat-d-ds-m-ds-Y"/>&nbsp;&nbsp;
          {{if $detail.di_full_brochure}}  User: {{$detail.di_full_brochure_user|default:'None'}} &nbsp;&nbsp;
          
          <!--<a href="https://deckquote.s3.amazonaws.com/files/design_interface/{{$detail.di_full_brochure}}" target="_blank"> {{$detail.di_full_brochure}}</a>-->
          
   <a href="/design_interface.download_content?file_name={{$detail.di_full_brochure}}&module_name=design_interface.home" target="_blank"> {{$detail.di_full_brochure}}</a>         
          
          &nbsp;<a href = "{{$BASE_URL}}design_interface.detail/di_id/{{$this_id}}/di_doc/di_full_brochure"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>{{/if}}
           </td>

          </tr>  
         
         
         <tr>
           <th>Design Summary</th>
          <td colspan="2"><input type= "file" name="designsummary" />
          <input type="text" name="{{$TABLE}}[di_design_summary_date]" value="{{$detail.di_design_summary_date}}" size="20" maxlength="25" id="demo22" class="w16em dateformat-d-ds-m-ds-Y"/>&nbsp;&nbsp;
          {{if $detail.di_design_summary}}
           User: {{$detail.di_design_summary_user|default:'None'}} &nbsp;&nbsp;
           
<!--   <a href="https://deckquote.s3.amazonaws.com/files/design_interface/{{$detail.di_design_summary}}" target="_blank">{{$detail.di_design_summary}}</a>-->
   <a href="/design_interface.download_content?file_name={{$detail.di_design_summary}}&module_name=design_interface.home" target="_blank">{{$detail.di_design_summary}}</a>
       
          &nbsp;<a href = "{{$BASE_URL}}design_interface.detail/di_id/{{$this_id}}/di_doc/di_design_summary" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>{{/if}} <br>
          </td>
          </tr>
         
         
          <tr>
           <th>Operations Calculator</th>
           <td colspan="2"><input type= "file" name="opercalc" />
            <input type="text" name="{{$TABLE}}[di_operations_calculator_date]" value="{{$detail.di_operations_calculator_date}}" size="20" id="demo13" class="w16em dateformat-d-ds-m-ds-Y"/>
           &nbsp;&nbsp;
           {{if $detail.di_operations_calculator}}
           User: {{$detail.di_operations_calculator_user|default:'None'}} &nbsp;&nbsp;
           
<!--            <a href="https://deckquote.s3.amazonaws.com/files/design_interface/{{$detail.di_operations_calculator}}" target="_blank">{{$detail.di_operations_calculator}}</a>--> 
            
              <a href="/design_interface.download_content?file_name={{$detail.di_operations_calculator}}&module_name=design_interface.home" target="_blank">{{$detail.di_operations_calculator}}</a>
  
            
           &nbsp;<a href = "{{$BASE_URL}}design_interface.detail/di_id/{{$this_id}}/di_doc/di_operations_calculator" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a> <br> {{/if}}
          </tr>
          
      
         <tr>
           <th>Master Calculator</th>
          <td colspan="2"><input type= "file" name="masprojcalc" />
          <input type="text" name="{{$TABLE}}[di_master_project_calculator_date]" value="{{$detail.di_master_project_calculator_date}}" size="20" id="demo14" class="w16em dateformat-d-ds-m-ds-Y"/>
          &nbsp;&nbsp;
         {{if $detail.di_master_project_calculator}}
          User: {{$detail.di_master_project_calculator_user|default:'None'}} &nbsp;&nbsp;
          
<!--         <a href="https://deckquote.s3.amazonaws.com/files/design_interface/{{$detail.di_master_project_calculator}}" target="_blank"> {{$detail.di_master_project_calculator}} </a>-->
         
          <a href="/design_interface.download_content?file_name={{$detail.di_master_project_calculator}}&module_name=design_interface.home" target="_blank"> {{$detail.di_master_project_calculator}} </a> 
         
          
          &nbsp;<a href = "{{$BASE_URL}}design_interface.detail/di_id/{{$this_id}}/di_doc/di_master_project_calculator"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>{{/if}}
        
          </td>
     </tr>      
     
     <tr>
     <th>MSTeams:</th>
     <td colspan="2"><a href ="{{$deatil.di_msteam_link}}" target="_blank">{{$detail.di_msteam_link}} </a> </td>
     </tr>
     
      <tr>
     <th>Graphics Indesign:</th>
     <td colspan="2"><a href ="{{$detail.di_brochure_link}}" target="_blank">{{$detail.di_brochure_link}} </a> </td>
     </tr>  
       
        </table>
        
        <h2 class="page-title" style="margin:8px 0;">Design Images Gallery</h2> 
        <table width="90%" id="list-table" border="1">
        <tr>
        <th width="15%"> Upload Design Image</th>
        <td> 
        <input type="hidden" name="d_id" value="{{$this_id}}" /> 
        <input type= "file" name="design_img"> 
        <input type="submit" name="uploaddesign" value="Upload" />
        </td>
        </tr>
        <tr>
        <th> </th>
        
        <td> 
         {{foreach from = $designDetail key = key item = item}}
         <div style="border:1px solid #00CCFF; display:inline-block; padding:3px; margin-right:25px; margin-bottom:10px;">
         <a href="{{$BASE_URL}}design_interface.show/dd_id/{{$item.dd_id}}" class="variousnew" title="Show">
         
       <!--  <img src="https://deckquote.s3.amazonaws.com/files/design_interface/{{$item.di_design_image}}" height="110" /> -->
         <img src="{{$item.di_design_img_data}}" height="110" />
         </a>
        
       <!--  <a href="https://deckquote.s3.amazonaws.com/files/design_interface/{{$item.di_design_image}}" download style="padding:5px;" title="download">
    -->    
         <a href="/design_interface.download_content?file_name={{$item.di_design_image}}&module_name=design_interface.home" download style="padding:5px;" title="download">
            <img src="{{$BASE_URL}}images/download.png" width="16" />
         </a>
         
         
<a href = "{{$BASE_URL}}design_interface.detail/di_id/{{$this_id}}/dd_id_del/{{$item.dd_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
<img src="{{$BASE_URL}}images/delete-icon.png" style="padding-right:3px;" /></a>
         </div>
         {{/foreach}}
        
        </td>
        </tr>
        </table>
        
        <h2 class="page-title" style="margin:8px 0;">Marketing Documents</h2> 
        <table width="90%" id="list-table" border="1">
        <tr> 
        <th width="20%">Design Poster </th> <td> <input type= "file" name="design_poster"  />
        {{if $detail.di_design_poster}}
        
        <!--   <a href="https://deckquote.s3.amazonaws.com/files/design_interface/{{$detail.di_design_poster}}" target="_blank">-->
         <a href="/design_interface.download_content?file_name={{$detail.di_design_poster}}&module_name=design_interface.home" target="_blank"> 
         {{$detail.di_design_poster}}</a>
          &nbsp;<a href = "{{$BASE_URL}}design_interface.detail/di_id/{{$this_id}}/di_doc/di_design_poster"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>{{/if}}
        </td>
        <th>Design Flyer </th> <td> <input type= "file" name="a4_flyer"  />
         {{if $detail.di_a4_flyer}}
        <!-- <a href="https://deckquote.s3.amazonaws.com/files/design_interface/{{$detail.di_a4_flyer}}" target="_blank">-->
         <a href="/design_interface.download_content?file_name={{$detail.di_a4_flyer}}&module_name=design_interface.home" target="_blank">  
         {{$detail.di_a4_flyer}}</a>
          &nbsp;<a href = "{{$BASE_URL}}design_interface.detail/di_id/{{$this_id}}/di_doc/di_a4_flyer"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>{{/if}}
        </td>
        </tr>
        <tr> 
        <th>Design Postcard </th> <td> <input type= "file" name="design_postcard"  />
        {{if $detail.di_design_postcard}}
        
        <!--<a href="https://deckquote.s3.amazonaws.com/files/design_interface/{{$detail.di_design_postcard}}" target="_blank">-->
        <a href="/design_interface.download_content?file_name={{$detail.di_design_postcard}}&module_name=design_interface.home" target="_blank">
         
         {{$detail.di_design_postcard}}</a>
          &nbsp;<a href = "{{$BASE_URL}}design_interface.detail/di_id/{{$this_id}}/di_doc/di_design_postcard"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>{{/if}}
        
        </td>
        <th>Website Add </th> <td><input type= "file" name="website_add"  />
          {{if $detail.di_website_add}}
          
          <!--<a href="https://deckquote.s3.amazonaws.com/files/design_interface/{{$detail.di_website_add}}" target="_blank"> -->
           <a href="/design_interface.download_content?file_name={{$detail.di_website_add}}&module_name=design_interface.home" target="_blank"> 
          
         {{$detail.di_website_add}}</a>
          &nbsp;<a href = "{{$BASE_URL}}design_interface.detail/di_id/{{$this_id}}/di_doc/di_website_add"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>{{/if}}
        
        </td>
        </tr>
        <tr> 
        <th>Graphics Indesign </th>
         <td colspan="3"> <input type="text"  name="{{$TABLE}}[di_brochure_link]" value="{{$detail.di_brochure_link}}" style="width:500px;" /></td>
        
        </tr>
        <tr> 
        <th>CGFB Design Link </th>
         <td colspan="3"> <input type="text"  name="{{$TABLE}}[di_cgfb_design_link]" value="{{$detail.di_cgfb_design_link}}" style="width:500px;" /></td>
        
        </tr>
        
         <th>MS Team Link </th>
         <td colspan="3"> <input type="text"  name="{{$TABLE}}[di_msteam_link]" value="{{$detail.di_msteam_link}}" style="width:500px;" /></td>
        
        </tr>
        
        </table>
        
        <h2 class="page-title" style="margin:8px 0;">Electronic Dropbox Files</h2> 
        
        <!-------Electronic Dropbox New Starts -------->
        
        <table width="90%" id="list-table" border="1">
                 
                <tr>
                <th width="35%"> Folder Name</th><th> EDF's Available </th> <th>QE'd </th><th>File Path  </th><th width="10%"> Action </th></tr>
                {{if $di_dropbox}}
                {{foreach from = $di_dropbox key = key item = item}}
                 <tr id="delrow{{$item.didb_id}}">
                 <th width="35%"><input type="text" size="70" value="{{$item.didb_foldername}}" onkeyup="update_edropbox1(this.value,{{$item.didb_id}})"  /> </th>
                 <th width="10%"><input type="checkbox" onclick="update_edropbox2(this.checked,{{$item.didb_id}})" {{if $item.didb_edf_available eq 1}} checked="checked" {{/if}} /> </th>
         	   <th width="10%"><input type="checkbox" onclick="update_edropbox3(this.checked,{{$item.didb_id}})" {{if $item.didb_qed eq 1}} checked="checked" {{/if}} /> </th>
          	   <th width="35%"><input type="text" size="90" onkeyup="update_edropbox4(this.value,{{$item.didb_id}})" value="{{$item.didb_filepath}}" /> </th>
 
                 <th width="10%"> <a href="javascript:delete_row({{$item.didb_id}});" value="Delete Fearure" title="Delete" >
					<img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a> </th>
                </tr>
                
                {{/foreach}}
                {{/if}}
                </table>
                <div style="text-align:left; margin-top:5px; width:80%">
                              
               <input type="button" onclick="appendRowdb({{$this_id}})" value="Add New"  /> <br />
               <p id="myElem1" style="color:#F00; font-style:italic; margin:5px; display:none;">Enter the Key Feature Please.... </p>
                </div>
                
                <script type="text/javascript">
				var x=0;
				var v=1;
				function appendRowdb(id)
				{
				
				var e = "#em" + x;
				v = $(e).val();
				
				if( v !== "" || x==0)
				{
				    $(e).attr("disabled", "disabled"); 
					x=x+1;
					var row = '<tr id="r'+x+'">';
					row =  row + '<th width="35%"><input type="text" id="em'+x+'" size="70" onkeyup=folder(this.value,'+id+','+x+'); /></th>';
					
					row =  row + '<th width="10%"><input type="checkbox" id="av'+x+'" size="10" disabled="disabled" onclick=save_edf(this.value,'+id+','+x+'); /></th>';
				    row =  row + '<th width="10%" align="center"><input type="checkbox" id="qd'+x+'" size="10" disabled="disabled" onclick=save_qed(this.value,'+id+','+x+'); /></th>';
 					row =  row + '<th width="35%"><input type="text" id="fp'+x+'" size="90" disabled="disabled" onkeyup=save_filepath(this.value,'+id+','+x+'); /></th>';

					row =  row + '<th width="5%">';
					row =  row + '<a href="javascript:delete_folder('+x+');" value="Delete Fearure" title="Delete" >';
					row =  row + '<img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a></td>';
					row =  row + '</tr>';
					 
					 $("#list-table").append(row);
					 
					 var insert="true";
					  $.ajax({
						   type: "GET",
						   url: "{{$BASE_URL}}/design_interface.save_edropbox/insert/"+insert+"/di_id/"+id,
							   success: function(result){
						   }
						 });
				  }
				  	else { 
							$("#myElem1").show();
			    			setTimeout(function() { $("#myElem1").hide(); }, 2000);
				  }
				}
					
			  function folder(value,id,x)
				{
				var kf = '#kf'+x;
				$("input").removeAttr('disabled');						
				  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/design_interface.save_edropbox/value/"+value,
						   success: function(result){
					   }
					 });
				}
				
				function save_edf(value,id,x)
				{
				var edf = '#av'+x;
			
				if($(edf).is(':checked')) {
					var edf_value = 1;
				}
				else { 
					var edf_value = 2;
				 }
				
				var fdi = '#em'+x;
				var fdv = $(fdi).val();
				
				  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/design_interface.save_edropbox/edf_value/"+edf_value+"/fdv/"+fdv,
						   success: function(result){
					   }
					 });
				}
						
				function save_qed(value,id,x)
				{
				var qd = '#qd'+x;
				if($(qd).is(':checked')) {
					var qed_value = 1;
				}
				else { var qed_value = 2; }
				
				var fdi = '#em'+x;
				var fdv = $(fdi).val();
		
				  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/design_interface.save_edropbox/qed_value/"+qed_value+"/fdv/"+fdv,
						   success: function(result){
					   }
					 });
				}
			
				function save_filepath(value,id,x)
				{
				var fpv = '#fp'+x;
				var fp_value = $(fpv).val();
				
				var fp_value = fp_value.replace(/\\/g,'=');
				var fp_value = fp_value.replace(/\//g,'!');
				//alert(fp_value);
				
				var fdi = '#em'+x;
				var fdv = $(fdi).val();
				//alert(fp_value);
				  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/design_interface.save_edropbox/fp_value/"+fp_value+"/fdv/"+fdv,
						   success: function(result){
					   }
					 });
				}
			
				
				function update_edropbox1(fovalue,id)
				{
					  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/design_interface.update_edropbox/fovalue/"+fovalue+"/id/"+id,
						   success: function(result){
					   }
					 });
				}
				
				function update_edropbox2(fovalue,id)
				{
					if(fovalue == true) {   var edavalue = 1; 
					   }
					 else if(fovalue==false) {  var edavalue = 2;
					 }
						
					  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/design_interface.update_edropbox/edavalue/"+edavalue+"/id/"+id,
						   success: function(result){
					   }
					 });
				}
				
				
				function update_edropbox3(fovalue,id)
				{
					if(fovalue == true) {   var qedvalue = 1; 
					   }
					 else if(fovalue==false) {  var qedvalue = 2;
					 }
						
					  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/design_interface.update_edropbox/qedvalue/"+qedvalue+"/id/"+id,
						   success: function(result){
					   }
					 });
				}
				
				function update_edropbox4(fpvalue,id)
				{
					var fpvalue = fpvalue.replace(/\\/g,'=');
					var fpvalue = fpvalue.replace(/\//g,'!');
					
					  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/design_interface.update_edropbox/fpvalue/"+fpvalue+"/id/"+id,
						   success: function(result){
					   }
					 });
				}
				
				
				
				function delete_row(del_id)
				{
					var v = '#delrow'+del_id;
					
					//value = $(v).val();
					//dr = '#r'+row;
					$(v).remove();
				
					$.ajax({
				    type: "GET",
				 			  
				    url: "{{$BASE_URL}}design_interface.update_edropbox/del_id/"+del_id,
				   // data: "bsn_id =" + id,
				   success: function(result){
					// $("#somewhere").html(result);
				   }
				 });
			
				}
				
			function delete_folder(id)
				{
					var v = "#em"+id;
					dv =  $(v).val();
					dr = '#r'+id;
					$(dr).remove();
				
					$.ajax({
				    type: "GET",
				 			  
				    url: "{{$BASE_URL}}design_interface.update_edropbox/dv/"+dv,
				   // data: "bsn_id =" + id,
				   success: function(result){
					// $("#somewhere").html(result);
				   }
				 });
			
				}
				
								
				</script>
        
        
        
   <script type="text/javascript"> 
    
        function save_edropbox(value,row,di_id,col)
        {
        if(value == true) { value = 1; }	
        else if(value == false) { value = 0; }	
		
		if(col==4) {			
			var value = value.replace(/\\/g,'=');
		}
				
          $.ajax({
               type: "GET",
               url: "{{$BASE_URL}}design_interface.save_edropbox/value/"+value+"/row/"+row+"/di_id/"+di_id+"/col/"+col,
                  // data: "bsn_id =" + id,
               success: function(result){
                // $("#somewhere").html(result);
                  }
             });
        }
   </script> 
        
        
        <h2 class="page-title" style="margin:8px 0;">Design Interface Pricing Table</h2> 
        <table width="90%" id="di-table">
        <tr> <th> Component </th> <th> Value </th> <th width="12%"> Approved </th> <th width="10%">Date Update </th> <th width="14%"> User </th></tr>
        
        {{if $dipDetail}}
        
            {{foreach from=$dipDetail key="key" item="item"}}
            
             {{if $item.dip_approved eq 0 }}
                <tr id="rd{{$item.dip_id}}" style="background:#F00">
             {{else}}
                <tr id="rd{{$item.dip_id}}" style="background:#FFF;">
             {{/if}}                  
                    <td>
                    <input type="hidden" name="diprmid" value="{{$detail.$ID}}" />
                    <input type="hidden" name="pricing[{{$item.dip_id}}][dip_id]" value="{{$item.dip_id}}" />
                    <input type="text" name="pricing[{{$item.dip_id}}][dip_component]" value="{{$item.dip_component}}" size="110" />
                    
                    </td>
                    <td> <select name="pricing[{{$item.dip_id}}][dip_value]" id="webrd">
                    <option value="$" {{if $item.dip_value eq '$'}} selected="selected" {{/if}}>$ </option>
                    <option value="%" {{if $item.dip_value eq '%'}} selected="selected" {{/if}}>% </option>
                   </select>
                   <input type="text" name="pricing[{{$item.dip_id}}][dip_value_entered]" value="{{$item.dip_value_entered}}" />
                   </td>
<td><input type="checkbox" name="pricing[{{$item.dip_id}}][dip_approved]" id="apr{{$item.dip_id}}" {{if $item.dip_approved eq 1 }} checked="checked" {{/if}} onclick="process({{$detail.$ID}},{{$item.dip_id}})" />
<p id="myElem{{$item.dip_id}}" style="display:none;"><strong>Confirmed...</strong> </p>
</td>
                    <td><input type="text" name="pricing[{{$item.dip_id}}][dip_date]" value="{{$item.dip_date}}"  id="tae{{$item.dip_id}}" maxlength="25" size="11" class="w16em dateformat-d-ds-m-ds-Y" /> </td>
              <td>{{$item.user_name}} </td>     
                </tr>  
            {{/foreach}} 
         {{else}}
         
        		 {{foreach from=$dipmDetail key="key2" item="item2"}}
                     <tr>
                                   
                        <td>
                         <input type="hidden" name="diprmid" value="{{$detail.$ID}}" />
                         <input type="hidden" name="pricing[{{$item2.dipm_id}}][dip_id]" value="{{$item2.dipm_id}}" />
                        <!-- <input type="hidden" name="pricing[{{$item2.dipm_id}}][dip_component]" value="{{$item2.dipm_component}}" />-->
                         <input type="text"   name="pricing[{{$item2.dipm_id}}][dip_component]" value="{{$item2.dipm_component}}" size="110" />
                       </td>
                        <td> <select name="pricing[{{$item2.dipm_id}}][dip_value]" id="webrd">
                             <option value="$">$ </option>
                             <option value="%">% </option>
                             </select>
                         <input type="text" name="pricing[{{$item2.dipm_id}}][dip_value_entered]" value="{{$item2.dipm_value_entered}}" />     
                        </td>
                        <td><input type="checkbox" name="pricing[{{$item2.dipm_id}}][dip_approved]" />
                        
                        </td>
                        <td><input type="text" name="pricing[{{$item2.dipm_id}}][dip_date]" value="{{$item2.dipm_date}}" id="tae{{$item2.dipm_id}}" maxlength="25" size="11" class="w16em dateformat-d-ds-m-ds-Y" /> </td>
                       <td>{{$item2.user_name}} </td>
                    </tr>  
                {{/foreach}} 
         {{/if}}       
        </table>
        
     
        
               <script type="text/javascript"> 
	  		
				function savetotalprice(di_id)
				{
				 value = $("#tp").val();
					
				  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/design_interface.updatetotalprice/di_id/"+di_id+"/value/"+value,
						  // data: "bsn_id =" + id,
					   success: function(result){
						// $("#somewhere").html(result);
						  }
					 });
				}
		       </script> 
        
      
         <h2 class="page-title" style="margin:30px 0 20px 0;">Brochure Floor Plan Legend</h2> 
       
        
          <table width="90%" id="bfp" cellspacing="0"  cellspacing="5" style="border-collapse:collapse; border:1px solid #999;">
              
                <tr>
                <th width="4%" style="border:1px !important;"></th>
                <th width="25%">Legend </th> <th width="20%"> Icon </th>
                <th width="20%">Value</th><th width="31%">Notes </th> </tr>
                {{foreach from=$di_legend key="keybf" item="itembf"}}
                <tr id="dbl{{$itembf.dib_id}}">
                <th width="3" style="border:0px !important;">
                 <a href="javascript:delete_legend({{$itembf.dib_id}});" value="Delete Fearure" title="Delete" >
                 <img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/deletecross.png"/>
                 </a>
                 </th>
             
                <td> 
               
                  {{$itembf.dib_legend}}
                                
                </td>
                <td><img src="{{$BASE_URL}}files/asset_list/{{$itembf.dib_icon}}" style="width:30px" /></td>
                
                <td><input type="text" value = "{{$itembf.dib_value}}" style="width:200px;" onkeyup="updatevalue(this.value, {{$itembf.dib_id}});"  /> </td>
                <td><input type="text" value = "{{$itembf.dib_notes}}" style="width:350px;" onkeyup="updatenotes(this.value, {{$itembf.dib_id}});"  /> </td>
                
                </tr>
                
                {{/foreach}}
                
               
                </table>
             
                <div style="text-align:left; width:90%">
                {{if $this_id}}
                <a href="javascript:appendRowBp({{$detail.$ID}})"  value="Add New Brochure" title="Add Brochure Plan">
                <img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/addnew.png"/></a>
                {{else}}
                
                <a href="javascript:savefirst();"  value="Add New Feature" title="Add Feature">
                <img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/addnew.png"/></a>
                {{/if}}
                </div>
          
        
        <script type="text/javascript">
		var x=0;
		function appendRowBp(id)
		{
			
		 x=x+1;
		 var row = '<tr id="r2'+x+'">';
		 
		 row =  row + '<th width="3" style="border:0px !important;"><input type="hidden" name="did_bf" value='+id+'>';
 row =  row + '<a href="javascript:delete_feature_row('+x+');" value="Delete Fearure" title="Delete" >';
 row =  row + '<img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a></th>';
						  
		 row =  row + '<td><select name="plan" id="bf'+x+'" onchange="update_plan(this.value,'+id+','+x+')" ><option value="0">Please Select </option>{{foreach from=$icon_list key="key100" item ="item100"}}';
		 row =  row + '<option value="{{$item100.ic_icon_name}}">{{$item100.ic_icon_name}}</option>' ;
		 row =  row + '{{/foreach}}</td>';
		 
		 row =  row +'<td><div id="icn"> </div></td>';
		  
		 row =  row + '<td width="10%"> <input type="text" style="width:200px;" disabled="disabled" onkeyup=savenumber(this.value,'+id+','+x+'); />';
		 row =  row + '<td width="30%"> <input type="text" style="width:350px;" disabled="disabled" onkeyup=savenotes(this.value,'+id+','+x+'); />';
		 
		 row =  row + '</tr>';
		 
		 $("#bfp").append(row);
		}
		
		
			function update_plan(value2, id, x)
			{
				 //var lo = "#icn";
				 
				 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}design_interface.update_plan/id/"+id+"/value2/"+value2,
					   success: function(result){
						   //$('icn').html(result);
						   location.reload(true);
						    
				   }
				 });
				 	
			}
				
			
		
			function updatenotes(value,id)
			{
				
				
			  $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}design_interface.update_notes/id/"+id+"/value/"+value,
					   success: function(result){
				   }
				 });
			}
			
			function updatevalue(value,id)
			{
			  $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}design_interface.update_value/id/"+id+"/value/"+value,
					   success: function(result){
				   }
				 });
			}
			
			function delete_legend(dib_id)
			{
			      dr = '#dbl'+dib_id;
			     $(dr).remove();
				
		            $.ajax({
				    type: "GET",
				    url: "{{$BASE_URL}}design_interface.delete_legend/dib_id/"+dib_id,
		                    success: function(result){
				   }
				 });
			
			}
			
			
			
		</script>
        
         
           <h2 class="page-title" style="margin:20px 0 20px 0;">QR Code Upload</h2> 
         
         <table width="90%" id="bfp" cellspacing="0"  cellspacing="5" style="border-collapse:collapse; border:1px solid #999;">
         <tr>
         <td style="width:10%;">QR Code</td>
         <td style="width:30%;"><input type="file" name="qrcode" /></td>
         <td style="width:20%;">Date : &nbsp; &nbsp; 
         <input type="text"  name="{{$TABLE}}[di_qr_code_date]" value="{{$detail.di_qr_code_date}}" class="w16em dateformat-d-ds-m-ds-Y" />  </td>
         <td style="width:20%;">User : {{$detail.di_qr_code_user}} </td>
         <td style="width:15%;">{{if $detail.di_qr_code}}
         
        <!-- <a href="https://deckquote.s3.amazonaws.com/files/design_interface/{{$detail.di_qr_code}}">QR Code Link</a>-->
        <a href="/design_interface.download_content?file_name={{$detail.di_qr_code}}&module_name=design_interface.home">QR Code Link</a>  
         
            &nbsp;<a href = "{{$BASE_URL}}design_interface.detail/di_id/{{$this_id}}/di_doc/di_qr_code" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
            <img src="{{$BASE_URL}}images/delete-icon.png" /></a> <br> {{/if}}
       
         </td>
         </tr>
         </table>
         
         
        
    <table width="30%" id="di-table" style="margin:10px 0">
    <tr>
    <th width="50%"> Price Approved </th>
    <td><input type="checkbox" name="{{$TABLE}}[di_price_approved]" {{if $detail.di_price_approved eq 1}} checked="checked" {{/if}} id="diprap" onclick="savepraproved({{$detail.$ID}})" />
    &nbsp; &nbsp;<span id="confirm" style="display:none;"><strong>Confirmed...</strong> </span>
     </td>
     </tr>
    </table>
        
        
         <table width="90%" id="di-table">
        
         <tr>
                <td colspan="4" style="text-align:center;">
            
                <input type="checkbox" value="1" id="c2" class="hid" name="{{$TABLE}}[di_qed]" {{if $detail.di_qed eq 1}} checked="checked" {{/if}} />
           QE'D : <label for="c2"></label> &nbsp; &nbsp;
                
             <a class="various" href="{{$BASE_URL}}design_interface.addtext/di_id/{{$this_id}}">
             <input type="button" value="Advertising Script" /></a> &nbsp;  &nbsp; &nbsp;
                
                    <input type="submit" name="subAddDetail" value="Save" class="vsml"/>
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}';javascript:parent.$.fancybox.close();" class="vsml" />
               
				</td>
            </tr>
                
        </table>
        
    </form>
    
    <script type="text/javascript"> 
	  		
		function process(di_id, dip_id)
		{
			
			var idv = '#apr'+ dip_id;
			var gr = '#rd'+dip_id
			var sa = '#myElem'+dip_id;
				$(sa).show();
			    setTimeout(function() { $(sa).hide(); }, 3000);
				
				if($(idv).is(':checked')) {
					var value = 1;
						$(gr).css('background', '#FFF')	
						$(sa).css('color', '#0C0' );
						$(sa).show();
			   			setTimeout(function() { $(sa).hide(); }, 4000);
						
										
					}
				else {
					var value = 0;
				    	$(gr).css('background', '#F00')
						$(sa).css('color', '#0C0');
						$(sa).show();
			   			setTimeout(function() { $(sa).hide(); }, 4000);
				}
			
			
		 $.ajax({
			   type: "GET",
			   url: "http://www.deckquotes.com.au/design_interface.price_approved_save/di_id/"+di_id+"/dip_id/"+dip_id+"/value/"+value,
			   // data: "bsn_id =" + id,
			   success: function(result){
				// $("#somewhere").html(result);
			   }
			 });
			
		}
		
		$("#myElem").show().delay(3000).fadeOut();
		
		
		function savepraproved(di_id)
		{
			    setTimeout(function() { $('#confirm').hide(); }, 3000);
				
				if($('#diprap').is(':checked')) {
					var pavalue = 1;
						$('#confirm').css('color', '#0C0' );
						$('#confirm').show();
			   			setTimeout(function() { $('#confirm').hide(); }, 4000);
					}
				else {
					var pavalue = 0;
						$('#confirm').css('color', '#F00');
						$('#confirm').show();
			   			setTimeout(function() { $('#confirm').hide(); }, 4000);
				}
			
			
		 $.ajax({
			   type: "GET",
			   url: "http://www.deckquotes.com.au/design_interface.di_price_approved_save/di_id/"+di_id+"/value/"+pavalue,
			   // data: "bsn_id =" + id,
			   success: function(result){
				// $("#somewhere").html(result);
			   }
			 });
			
		}

 </script> 
   
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[di_design_number]","req", "Please specify Design Number");
			frmvalidator.addValidation("{{$TABLE}}[answer]","req", "Please specify answer.");
    </script>
  <!-- {{/if}} -->
</div>
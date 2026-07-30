<br /><div style="float:left; text-align:left;">
&nbsp; &nbsp <strong>Filter By :</strong>
<select name='stagefilter'>
<option value="">Please Select</option>
{{foreach from=$stagedetail key="key" item="item"}}
<option value="{{$item.st_id}}">{{$item.st_option}}</option>
{{/foreach}}
&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
<input type="submit" value="Search" name="search"  /> &nbsp;

<input type="submit" name="clear" value = "Clear Search" /><br />
</div>

<div style="float:right; margin-right:20px;">  
<input type="submit" name="hidden_stage" value ="Show Hidden Stage" />
<input type="submit" name="hidden" value ="Show Hidden" />
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
         
                   <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th> 
                   <th class="topmenu" align="center" valign="middle" width="25%">Project (Property Address)</th> 
                   <th class="topmenu" align="center" valign="middle" width="35%">Stage</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Porject Hide</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
    <tbody>

  {{assign var=countn value= $total}}
 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">


        <td>{{$item.ps_id}}</td>
        <td><a href="{{$item.link}}" target="_blank">{{$item.ps_project}}</a></td>
     
     <td  id="chk_{{$item.ps_id}}">
       <form name="cu" method="post" action="">
       <a href="javascript:appendRowLink({{$item.ps_id}})"  value="Add New Link" title="Add Link">
       <img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/addnew.png"/></a>
        <p id="myElem" style="display:none; color:#F00; font-style:italic; margin:5px;">First save the link name and link .... </p>    
	   
        <script type="text/javascript">
		var x=0;
		function appendRowLink(id)
		{
		 x=x+1;
		 var sid = "#chk_" +id;
		 var e = "#em";
		 v = $("#em").val();
		
		 if( v !== "")
		 {
			 row = '<form name="cu" method="post" action="">';
			 row =  row + '<br><input type="hidden" name="ps_id"  value='+id+'>';
	         row =  row + '<select name="stage">';
        			
             row =  row + '<option value="0" >Please Select </option>';
             row =  row + '{{foreach from = $stagedetail key="key2" item="item2"}}';
             row =  row + '<option value="{{$item2.st_id}}" >{{$item2.st_option}}</option>';
             row =  row + '{{/foreach}}';
                     
             row =  row + '</select>';
         
			 row =  row + '<input type="submit" value="Save" name="save_link" size="50"  />';
			 row =  row + '</form>';
			 $(sid).append(row);
		 }
		 else {
			$("#myElem").show();
			setTimeout(function() { $("#myElem").hide(); }, 2000); 
		 }
		}
		</script>  
        <br />
      <table id="list-table"  width="100%"> 
       
      {{foreach from=$item.stage key="key2" item="item2"}}
      <tr>
      <td style="width:35%">{{$item2.st_option}}</td>
      <td style="width:20%">
      <a href="{{$BASE_URL}}property_sale_project_tracker.update_task/ps_id/{{$item.ps_id}}/st_id/{{$item2.st_id}}" >Click To Update Task</a>
      </td>
      
      <td style="width:15%">{{$item2.percomp}}% Completed</td>
      <td style="width:8%">
        
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hidestage[{{$item2.sd_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hidestage[{{$item2.sd_id}}]" value="1"  onclick="this.form.submit();" {{if $item2.sd_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
       
       </td>
      
      <td> <a href="{{$BASE_URL}}property_sale_project_tracker.delete_stage/sd_id/{{$item2.sd_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a></td>
     
      </tr>
      {{/foreach}}
      </table> 
       </td>
        
          
        
        <td>
        
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.ps_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.ps_id}}]" value="1"  onclick="this.form.submit();" {{if $item.ps_hide eq 1 }} checked="checked" {{/if}} />
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
    {{assign var=countn value=$countn-1}}
  {{/foreach}}
  </tbody>
  </table>
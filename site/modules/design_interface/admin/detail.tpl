<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>

<div align="center">

    <h3 class="page-title">{{$title}}</h3>
    
    <form name="detail" method="post" action="{{$XFA.detail}}">
        
      <table width="98%" id="list-table" border="1">
                 
                <tr>
                <th> Key Features </th> <th width="10%"> Action </th></tr>
                {{if $detail}}
                {{foreach from = $detail key = key item = item}}
                 <tr id="pre{{$item.dik_id}}">
                 <th> <input type="text" value="{{$item.dik_keyfeature}}" onkeyup="update_feature_pre(this.value,{{$item.dik_id}})"  /> </th>
                 
                 <th width="10%"> <a href="javascript:delete_feature_pre({{$item.dik_id}});" value="Delete Fearure" title="Delete" >
					<img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a> </th>
                </tr>
                
                {{/foreach}}
                {{/if}}
                </table>
                <div style="text-align:left; margin-top:5px;">
                              
               <input type="button" onclick="appendRowLp()" value="Add New"  /> <br />
               <p id="myElem" style="display:none; color:#F00; font-style:italic; margin:5px;">Enter the Key Feature Please.... </p>
                </div>
                
                <script type="text/javascript">
				var x=0;
				var v=1;
				function appendRowLp()
				{
				
				id=1;
				var e = "#em" + x;
				v = $(e).val();
			
				if( v !== "" || x==0)
				{
				    $(e).attr("disabled", "disabled"); 
					x=x+1;
					var row = '<tr id="r'+x+'">';
					row =  row + '<td> <input type="text" id="em'+x+'" size="100" onkeyup=savefeature(this.value,'+id+','+x+'); /></td>';
					row =  row + '<td>';
					row =  row + '<a href="javascript:delete_feature('+x+');" value="Delete Fearure" title="Delete" >';
					row =  row + '<img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a></td>';
					row =  row + '</tr>';
					 
					 $("#list-table").append(row);
					 
					 var insert="true";
					  $.ajax({
						   type: "GET",
						   url: "{{$BASE_URL}}/design_interfaceAdmin.save_feature/insert/"+insert,
							   success: function(result){
						   }
						 });
				  }
				  	else { 
							$("#myElem").show();
			    			setTimeout(function() { $("#myElem").hide(); }, 2000);
				  }
				}
					
			  function savefeature(value,id,x)
				{
				//alert(x);
				var kf = '#kf'+x;
				
				var value = value.replace(/\\/g,'=');
				var value = value.replace(/\//g,'!');
						
				  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/design_interfaceAdmin.save_feature/value/"+value,
						   success: function(result){
					   }
					 });
				}
				
				function update_feature_pre(fvalue,id)
				{
				
				var fvalue = fvalue.replace(/\\/g,'=');
				var fvalue = fvalue.replace(/\//g,'!');
				
				  $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/design_interfaceAdmin.save_feature/fvalue/"+fvalue+"/id/"+id,
						   success: function(result){
					   }
					 });
				}
				
				
				function delete_feature(row)
				{
					var v = '#em'+row;
					
					value = $(v).val();
					dr = '#r'+row;
					$(dr).remove();
				
					$.ajax({
				    type: "GET",
				 			  
				    url: "{{$BASE_URL}}design_interfaceAdmin.delete_feature/value/"+value,
				   // data: "bsn_id =" + id,
				   success: function(result){
					// $("#somewhere").html(result);
				   }
				 });
			
				}
				
			function delete_feature_pre(id)
				{
					dr = '#pre'+id;
					$(dr).remove();
				
					$.ajax({
				    type: "GET",
				 			  
				    url: "{{$BASE_URL}}design_interfaceAdmin.delete_feature/id/"+id,
				   // data: "bsn_id =" + id,
				   success: function(result){
					// $("#somewhere").html(result);
				   }
				 });
			
				}
				
								
				</script>
        
    </form>
    
    
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("f","req", "Please specify Keyword");
</script>
    
    
</div>
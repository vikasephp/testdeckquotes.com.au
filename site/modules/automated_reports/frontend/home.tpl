{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>
{{if $msg}} <h3 style="font-size:18px; color:#639; padding-bottom:15px;"> {{$msg}} </h3> {{/if}}
<div id="">
    <table id="list-table" class="nav-back" width="99%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="2%">SrNo</th>   
                <th class="topmenu" align="center" valign="middle" width="25">Report Name</th> 
                <th class="topmenu" align="center" valign="middle" width="12%">Action</th>  
                <th class="topmenu" align="center" valign="middle" width="20%">Report Rule</th>  
                <th class="topmenu" align="center" valign="middle" width="25%">Rules Document</th>  
                <th class="topmenu" align="center" valign="middle" width="15%">Setting</th> 
            </tr>
        </thead>
<tbody>
 {{foreach from=$reports key="key" item="item"}}
 
 	 <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
 
    <td style="color:#000; text-align:center;">{{$item.ar_id}}</td>
    <td style="color:#000;">{{$item.ar_report_name}}</td> 
    <td style="text-align:center;"><a href="{{$BASE_URL}}{{$XFA.home}}/ar_id/{{$item.ar_id}}" title="Edit">
    <img  src="{{$BASE_URL}}images/email.png"/></a></td>
    <td><input type="text" name="{{$TABLE}}[bsn_name]" value="{{$item.ar_report_rules}}" style="width:520px;"  onkeyup="updaterule({{$item.ar_id}},this.value)" placeholder="Type slowly since it is autosaving" /> 
   <span id="myElem{{$item.ar_id}}" style="display:none; padding-left:10px; text-align:center;"><strong>Saving...</strong> </span>
    </td>
    <td> <a href="{{$BASE_URL}}files/meeting_minutes_doc/{{$item.ar_rules_doc}}" target="_blank" >{{$item.ar_rules_doc}}</a>
    
    <td style="text-align:center;"><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
        <img  src="{{$BASE_URL}}/images/setting.png"/></a>  </td>
 </tr>  
      {{/foreach}}
</tbody>
    </table>
 </div>
 
  <script type="text/javascript">
			 
		   function updaterule(ar_id,value)
		   {
			//alert(ar_id);
			var sa = '#myElem'+ar_id;
			$(sa).css('color', '#00CC66' );
	
		        if(value == 1) {
						$(sa).show();
			   			setTimeout(function() { $(sa).hide(); }, 1000);	
						}
				else {
						$(sa).show();
			   			setTimeout(function() { $(sa).hide(); }, 1000);
		   		     }
		
					
		$.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}automated_reports.update_reportrule_data/ar_id/"+ar_id+"/value/"+value,
			  // data: "bsn_id =" + id,
			   success: function(result){
				// $("#somewhere").html(result);
				//alert("Open Closed updated successfully");
			   }
			 });
		}
			 
			 
	 </script>
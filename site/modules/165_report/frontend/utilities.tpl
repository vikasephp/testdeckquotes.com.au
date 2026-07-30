<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<script type="application/javascript">


function add_new(url)
 {
//var viewurl = "{{$BASE_URL}}designer_tracker.detail"+ "/random/" + Math.random();	
 var viewurl = url;
 $(document).ready(function () {
        $.fancybox({
				'width': '99%',
				'height': '99%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
			
        });
});
}


</script>


<div align="center" style="min-height:350px; z-index:9999999;">
    <h3 class="page-title"><br />View Utilities</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="99%">
<tr> 
<th width="33%">Items</th><th width="33%">Document </th><th width="33%">Status</th>
</tr>
   
<tr>
      	 
        <td>Icon Water</td> 
        <td>{{if $link_627}}
            <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$link_627}}" target="_blank">Link</a>
            {{/if}}
        </td>
        
        <td> 
        
        <select name="icon_water"  Onchange = "update_utilities({{$os_id}},1,this.value)" />
        <option value="1" {{if $data.os_icon_water eq 1}} selected="selected" {{/if}}>Yes</option>
        <option value="2" {{if $data.os_icon_water eq 2}} selected="selected" {{/if}}>No</option>
        <option value="3" {{if $data.os_icon_water eq 3}} selected="selected" {{/if}}>Conditionally Accepted</option>
        </select>
    
        </td>
        
</tr>  


<tr>
      	 
        <td>Evo Gas</td> 
        <td>{{if $link_629}}
            <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$link_629}}" target="_blank">Link</a>
            {{/if}}</td>
            
        <td>
         <select name="icon_water"  Onchange = "update_utilities({{$os_id}},2,this.value)" />
        <option value="1" {{if $data.os_evo_gas eq 1}} selected="selected" {{/if}}>Yes</option>
        <option value="2" {{if $data.os_evo_gas eq 2}} selected="selected" {{/if}}>No</option>
        <option value="3" {{if $data.os_evo_gas eq 3}} selected="selected" {{/if}}>Conditionally Accepted</option>
        </select>
         </td>
        
</tr>


<tr>
      	 
        <td>Evo Energy</td> 
        <td>
        {{if $link_628}}
            <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$link_628}}" target="_blank">Link</a>
            {{/if}}
        </td>
        <td> 
        <select name="icon_water"  Onchange = "update_utilities({{$os_id}},3,this.value)" />
        <option value="1" {{if $data.os_evo_energy eq 1}} selected="selected" {{/if}}>Yes</option>
        <option value="2" {{if $data.os_evo_energy eq 2}} selected="selected" {{/if}}>No</option>
        <option value="3" {{if $data.os_evo_energy eq 3}} selected="selected" {{/if}}>Conditionally Accepted</option>
        </select>
        </td>
        
</tr>  


<tr>
      	 
        <td>Storm Water</td> 
        <td>{{if $link_630}}
            <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$link_630}}" target="_blank">Link</a>
            {{/if}}
        </td>
       
        <td>
         <select name="icon_water"  Onchange = "update_utilities({{$os_id}},4,this.value)" />
        <option value="1" {{if $data.os_storm_water eq 1}} selected="selected" {{/if}}>Yes</option>
        <option value="2" {{if $data.os_storm_water eq 2}} selected="selected" {{/if}}>No</option>
        <option value="3" {{if $data.os_storm_water eq 3}} selected="selected" {{/if}}>Conditionally Accepted</option>
        </select>
        
         </td>
        
</tr>    
           
 <script>
	   
		function update_utilities(id,itm,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}165_report.update_utilities/os_id/"+id+"/item/"+itm+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>


</table>
<br /><br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />

</form>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
			
    </script>
</div>

<script>
	initSample();
</script>
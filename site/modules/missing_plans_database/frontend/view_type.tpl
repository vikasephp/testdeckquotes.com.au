<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />-->
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

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
<h3 class="page-title"><br />{{ $page_title }} - Type</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<!--<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}{{ $BASEFOLDER }}.add_type" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;">Add New Type</a>
</div>-->


<table id="list-table" width="99%">
    <tr> 
        <th width="5%" style="text-align: left;">Type Id</th>
        <th width="35%" style="text-align: left;">Plan</th>
        <th width="25%" style="text-align: left;">Type</th>
        <th width="35%" style="text-align: left;">Position</th>
    </tr>
    {{ if !empty($ppcdocdetail) }}
    {{foreach from=$ppcdocdetail key="key" item="item"}}
    <tr>
        <td>{{ counter }}</td>
        <td>{{$item.ppc_document}}</td>
        <td data-value-option="{{$item.ppc_mpd_type}}">
            <select name="task[ppc_mpd_type]" onChange="updateMpdType('{{ $item.ppc_id }}', this.value)">
				<option value="">Please Select</option>
                <option value="Unique Document" {{if $item.ppc_mpd_type eq 'Unique Document'}} selected="selected" {{/if}}>Unique Document</option>
                <option value="Latest Merge Plans" {{if $item.ppc_mpd_type eq 'Latest Merge Plans'}} selected="selected" {{/if}}>Latest Merge Plans</option>
			</select>
			<script type="text/javascript">
    			function updateMpdType(id, value)
    			{
    					 $.ajax({
    					   type: "GET",
    					   url: "{{$BASE_URL}}missing_plans_database.updateMpdType/ppc_id/"+id+"/value/"+value,
    						   success: function(result){
    							
    						}
    					});
    			}
    	     </script> 
        </td>
        <td>
           <select name="task[ppc_mpd_position]" onChange="updateMpdPosition('{{ $item.ppc_id }}', this.value)">
				<option value="">Please Select</option>
                <option value="OS Architect" {{if $item.ppc_mpd_position eq 'OS Architect'}} selected="selected" {{/if}}>OS Architect</option>
                <option value="Planning Manager" {{if $item.ppc_mpd_position eq 'Planning Manager'}} selected="selected" {{/if}}>Planning Manager</option>
			    <option value="Support" {{if $item.ppc_mpd_position eq 'Support'}} selected="selected" {{/if}}>Support</option>
                <option value="Customer Designer" {{if $item.ppc_mpd_position eq 'Customer Designer'}} selected="selected" {{/if}}>Customer Designer</option>
                <option value="Unkown" {{if $item.ppc_mpd_position eq 'Unkown'}} selected="selected" {{/if}}>Unkown</option>
             
            </select>
			<script type="text/javascript">
    			function updateMpdPosition(id, value)
    			{
    					 $.ajax({
    					   type: "GET",
    					   url: "{{$BASE_URL}}missing_plans_database.updateMpdPosition/ppc_id/"+id+"/value/"+value,
    						   success: function(result){
    							
    						}
    					});
    			}
    	     </script> 
        
        </td>
    </tr> 
    {{/foreach}}
    {{else}}
    <tr>
        <td colspan="3" style="text-align: center;">No Data Available</td>
    </tr>
    {{/if}}

</table><br /><br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
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
    </script>
</div>

<script>
	initSample();
</script>
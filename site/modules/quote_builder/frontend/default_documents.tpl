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
    <h3 class="page-title"><br />Default Documents</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="90%">
<tr> 
<th width="10%">Component ID</th><th width="70%">Document Name</th><th width="20%">Select As Default</th>

       {{foreach from=$dodData key="key" item="item"}}
       <tr>
      	 
        <td>{{$item.admin_doc_id}}</td>
        <td>{{$item.admin_doc_name}}</td>
        <td>
         <input name="defa_doc" type="checkbox" {{if $item.admin_qb_default eq 1}} checked="checked" {{/if}}  onclick="update_defa_doc({{$item.admin_doc_id}},this.checked)" />
           <script>
	   
		function update_defa_doc(id,value)
		{
		
		var val = 0;
		if(value==true) { val = 1; } 
		if(value==false) { val = 2; } 
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}quote_builder.update_default_doc/admin_doc_id/"+id+"/value/"+val,
				   success: function(result){
			   }
			 });
		}
	</script>
        
        
        </td>
        
       </tr> 
      {{/foreach}}

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
			frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
       </script>
</div>

<script>
	initSample();
</script>
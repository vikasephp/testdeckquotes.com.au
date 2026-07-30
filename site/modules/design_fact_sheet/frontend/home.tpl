<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript" >  
		$(document).ready(function() {
			/*
			*   Examples - images
			*/
			$(".various").fancybox({
				'width': '95%',
				'height': '95%',
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


function add_new()
 {
var viewurl = "{{$BASE_URL}}design_fact_sheet.detail"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '95%',
				'height': '90%',
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
  
  
  function add_procedure()
{
	var viewurl = "{{$BASE_URL}}design_fact_sheet.view_procedure"+ "/random/" + Math.random();	

 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
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
function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
</script>

<style>
#fancybox-wrap {z-index:9999999;} 
</style>

<h3 class="page-title">{{$title}}</h3><br />

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left; text-align:left;">
 &nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
<br />
</div>
<div style="float:right;"> <input type="button" name="Add New " value="Add New" onclick="javascript:add_new();" /> </div>
</form>
<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%" cellspacing="10">
    <thead>
      <tr style="color:#FC0 !important; background:#339;">
        <th align="center" valign="middle" width="50%">Document Name</th>
        <th align="center" valign="middle" width="30%">Generate / Download</th>
        <th align="center" valign="middle" width="20%">Upload / Delete</th>
      </tr>
      
      {{foreach from=$documents key="key" item="item"}}
      
      <tr>
      <th class="topmenu" width="50%">{{$item.doc_name}}</th>
      <th class="topmenu" valign="middle" >
    
      <input type="button" value="Generate" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export2/{{$item.doc_id}}'" /> 
     
      {{if $doc_download eq $item.doc_id }} &nbsp; <a href ='{{$BASE_URL}}files/design_fact_sheet_doc/{{$fn}}'>  Download </a> {{/if}}   
      </th>
      <th> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
    <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
  
    <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
    <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
     </th>  
      </tr>
      
      {{/foreach}}

  </table>

</div>
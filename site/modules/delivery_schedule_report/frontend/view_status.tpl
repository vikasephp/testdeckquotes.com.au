<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

{{if $opr}}
<script type="text/javascript">
window.location.href = "{{$BASE_URL}}delivery_schedule_report.view_status";
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
    <h3 class="page-title"><br />Status List</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}delivery_schedule_report.add_status" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;">Add New Status</a>
</div>


<table id="list-table" width="99%">
<tr> 
<th width="10%">SrNo</th><th width="50%">Status</th><th width="12%">Color</th><th width="15%">Hide</th><th width="10%">Action</th>
       {{foreach from=$statusdata key="key" item="item"}}
       <tr>
      	 
        <td>{{counter}}</td>
        <td>{{$item.st_status}}</td>
        {{ if $item.st_color eq 1}}
       <td style="background:#00CC33";>
       <a href="{{$BASE_URL}}delivery_schedule_report.status_color/st_id/{{$item.st_id}}" class="various">Color</a>
       </td>
       {{ elseif  $item.st_color eq 2}}
       <td style="background: #ff7f27";>
       <a href="{{$BASE_URL}}delivery_schedule_report.status_color/st_id/{{$item.st_id}}" class="various">Color</a>
       </td>
       {{ elseif  $item.st_color eq 3}}
       <td style="background: #F00";>
       <a href="{{$BASE_URL}}delivery_schedule_report.status_color/st_id/{{$item.st_id}}" class="various">Color</a>
        </td>
       {{else }}
       <td>
       <a href="{{$BASE_URL}}delivery_schedule_report.status_color/st_id/{{$item.st_id}}" class="various">Color</a></td>
       {{/if}}
        <td>
        
        <form name ="recmet33" method="post" action="">
     	<input type="hidden" name="hide[{{$item.st_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.st_id}}]" value="1"  onclick="this.form.submit();" {{if $item.st_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
        </td>   
        <td> <a href="{{$BASE_URL}}delivery_schedule_report.add_status/st_id/{{$item.st_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             
         <a href="{{$BASE_URL}}delivery_schedule_report.delete_status/st_id/{{$item.st_id}}" onclick="javascript:if(!confirm('Are you sure want to delete the Task?')) return false;" title="Delete">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
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
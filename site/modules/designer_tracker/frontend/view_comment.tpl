<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />


<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>
	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<script type="application/javascript">

function view_task(id)
{
	var viewurl = "{{$BASE_URL}}designer_tracker.view_task"+ "/dt_id/" + id;	
	
 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
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


<div align="center" style="min-height:350px; z-index:999;">
    <h3 class="page-title"><br />View Comments</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.design_team}}"  enctype="multipart/form-data">
<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}designer_tracker.add_comment/tc_task_id/{{$tc_task_id}}/dt_id/{{$dt_id}}/tdt_dt_id/{{$tdt_dt_id}}/bsn_id/{{$bsn_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;"> Add New Comment </a>
</div>

<div style="text-align:left; margin-left:10px; font-size:16px; margin-bottom:5px;"><strong>Project Name : {{$bsn_name}}</strong></div>
<table id="list-table" width="99%">
<div style="text-align:left; margin-left:10px; font-size:16px;"><strong>Task Description : {{$tdesc.tdt_task_desc}}</strong></div>
<table id="list-table" width="99%">
<tr> 
<th width="5%">Comment Date</th>
<th width="8%">User</th>
<th width="40%">Comment</th>
<th width="20%">Response</th>
<th width="7%">Document Attachment</th>
<th width="7%">Image Attachment</th>
<th width="5%">Link</th>
<th width="8%">Action</th>
       {{foreach from=$taskdata key="key" item="item"}}
       <tr>
      	 
        <td>{{$item.tc_comment_date|date_format:"%d-%m-%Y"}}</td>
        <td>{{$item.tc_user}}</td>
        <td>{{$item.tc_comment}}</td>
        <td>{{$item.tc_response}} </td>
        <td>
        {{if $item.tc_doc_attachment}}
        <div style="text-align:center;"> 
         <!--<a href="{{$BASE_URL}}files/uploads/{{$item.tc_doc_attachment}}" target="_blank">Download</a>-->
      <a href="/designer_tracker.download_content?file_name={{$item.tc_doc_attachment}}&module_name=designer_tracker.home" target="_blank"/>Download</a>
        </div>
        {{/if}}
        
        </td>
       <td>
       {{if $item.tc_image_attachment}}
        <div style="text-align:center;"> 
        <!-- <a href="{{$BASE_URL}}files/uploads/{{$item.tc_image_attachment}}" target="_blank">Download</a>-->
      <a href="/designer_tracker.download_content?file_name={{$item.tc_image_attachment}}&module_name=designer_tracker.home" target="_blank"/>Download</a>
        </div>
        {{/if}}
      
       </td>
       <td>{{if $item.tc_link}}<a href="{{$item.tc_link}}" target="_blank">Link</a>{{/if}}</td>
       
        <td> <a href="{{$BASE_URL}}designer_tracker.add_comment/tc_id/{{$item.tc_id}}/tc_task_id/{{$item.tc_task_id}}/dt_id/{{$dt_id}}/tdt_dt_id/{{$tdt_dt_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             
         <a href="{{$BASE_URL}}designer_tracker.delete_comment/tc_id/{{$item.tc_id}}/tc_task_id/{{$item.tc_task_id}}/tdt_dt_id/{{$tdt_dt_id}}" onclick="javascript:if(!confirm('Are you sure want to delete the Task?')) return false;" title="Delete">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
        <a href="{{$BASE_URL}}designer_tracker.add_response/tc_id/{{$item.tc_id}}/tc_task_id/{{$item.tc_task_id}}/dt_id/{{$dt_id}}" class="various" title="Edit Response"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/sub.png"/></a>&nbsp;&nbsp;
        
         </td>    
       </tr> 
      {{/foreach}}

</table><br /><br />
<input type="button" name="btnCancelDetail" value="Return / Cancel" onclick="javascript:closepop({{$all}});" class="vsml" />
</form>
    
    <script type="text/javascript">
		function closepop(a)
		{
		if(!a) {	
		setTimeout('parent.close_win();', 500);
		} else {
			
		window.location.href = "{{$BASE_URL}}designer_tracker.view_task/dt_id/{{$dt_id}}";
		}
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
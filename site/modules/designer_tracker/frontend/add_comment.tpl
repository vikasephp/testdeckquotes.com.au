<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);

window.location.href = "{{$BASE_URL}}designer_tracker.view_comment/tc_task_id/{{$tc_task_id}}/tdt_dt_id/{{$tdt_dt_id}}";
</script>
{{/if}}

<div align="center" style="min-height:350px;"><br />
    <h3 class="page-title">Add/Edit New Comment</h3> <br />   
    
<form name="detail" method="post" action="{{$XFA.add_comment}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="comment[tc_id]" value="{{$detail.tc_id}}" />
    <input type="hidden" name="comment[tc_task_id]" value="{{$tc_task_id}}" />
    <input type="hidden" name="comment[tdt_dt_id]" value="{{$tdt_dt_id}}" />
    <input type="hidden" name="comment[bsn_id]" value="{{$bsn_id}}" />
    <input type="hidden" name="comment[dt_id]" value="{{$dt_id}}" />
    
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    
     <!--<tr>
     <th>Comment Date </th>
     <td><input type="text" name="comment[tc_comment_date]" value="{{$detail.tc_comment_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>-->
    
    <tr>
     <th>User </th>
     <td>
          <input type="text"  name="comment[tc_user]" style ="width:700px" value="{{$user_name}}" readonly="readonly" />
      </td>
    </tr>
   
   <tr>
     <th>Comment </th>
     <td><input  type="text" name="comment[tc_comment]"  value="{{$detail.tc_comment}}" style="width:700px;" /> </td>
    </tr>
   
    <tr>
     <th>Document Attachment</th>
     <td><input type="file" name="docatt" /></td>
    </tr>
   
    <tr>
     <th>Image Attachment </th>
     <td><input type="file" name="imgatt" /></td>
    </tr>
 
    </tr>
     <tr>
     <th>Link </th>
     <td><input  type="text" name="comment[tc_link]"  value="{{$detail.tc_link}}" style="width:700px;" /> </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
    
</table>


</form>
    
        <script type="text/javascript">
		function closepop()
		{
		//setTimeout('parent.close_win();', 500);
	
		window.location.href = "{{$BASE_URL}}designer_tracker.view_comment/tc_task_id/{{$tc_task_id}}/dt_id/{{$dt_id}}/tdt_dt_id/{{$tdt_dt_id}}";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        //var frmvalidator  = new Validator("detail");
	//		frmvalidator.EnableMsgsTogether();
	//		frmvalidator.addValidation("comment[dt_name]","req", "Please specify project.");
	//		
			
        </script>
</div>
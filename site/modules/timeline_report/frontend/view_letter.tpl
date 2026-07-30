
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:20px;">
    <h3 class="page-title">Letter Code List</h3>    
   <br /><br />
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="95%">
<tr> 
<th>Letter Code </th><th>Owner</th><th>Reason</th><th>Download</th><th>Upload</th><th>Last Uploaded</th><th>Action</th>
       {{foreach from=$catlist key="key" item="item"}}
       <tr>
      	 
        <th>{{$item.lc_letter_code }}</th>
        <th>{{$item.lc_owner}}</th>
        <th>{{$item.lc_reason}}</th>
        <th>{{$item.lc_download}}</th>
        
        <th>{{if $item.lc_upload}} 
        
        <!-- <a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.lc_upload}}" target="_blank">Download</a>-->
         <a href="/timeline_report.download_content?file_name={{$item.lc_upload}}&module_name=timeline_report.home" target="_blank">Download</a>
        
        {{/if}}</th>
        <th>{{$item.lc_last_updated}}</th>
        <th> <a href="{{$BASE_URL}}timeline_report.letter_upload/lc_id/{{$item.lc_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             

         </th>    
       </tr> 
      {{/foreach}}

</table>
</form>
    <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />  
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	
</div>


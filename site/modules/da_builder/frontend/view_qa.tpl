<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">View Rule Explained</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="rule[rr_id]" value="{{$detail.rr_id}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Text</th>
     <td>{{$detail.rr_text}}</td>
    </tr>
   
    <tr>
     <th>Question</th>
     <td>{{$detail.rr_question}}</td>
    </tr>
  
   
    <tr>
     <th>Answer</th>
     <td>{{$detail.rr_answer}}</td>
    </tr>
 
    <tr>
     <th>Images</th>
     <td>
     {{foreach  from=$imgdata key="key" item="item"}}
     <img src="{{$BASE_URL}}files/da_builder/{{$item.ri_image}}" width="200" /> &nbsp;  &nbsp;
    {{/foreach}} 
     </td>
    </tr>
      
     <tr>
        <td colspan="2" style="text-align:center;">
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
        <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	     </script>
    

</div>


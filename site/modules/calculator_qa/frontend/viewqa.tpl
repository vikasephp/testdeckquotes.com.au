
{{include file=$jdata}}
{{include file=$tiny_basic}}
{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />


<div align="center" style="min-height:350px;"><br /><br />
    <h3 class="page-title">{{$title}}</h3>    

      <form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}"  />
          
            <tr>
                <th width="100">Question:</th>
                  <td width="500">
                   <table  width="500" id="none-table22"><tr><td>
                <td><!--<textarea cols="120" name="{{$TABLE}}[qa_question]" readonly="readonly" >{{$detail.qa_question}} </textarea>-->
                {{$detail.qa_question}}
                </td></tr></table>
                 </td>
            </tr>        
            <tr>
                <th>Answer:</th>
                <td width="500">
                <table  width="500" id="none-table22"><tr><td>
               <!-- <textarea cols="120" rows="2"name="{{$TABLE}}[qa_answer]" id="tana" class="tinymce" style="height:10px;" readonly="readonly" disabled="disabled" >{{$detail.qa_answer|stripslashes}}</textarea>    
-->               
					{{$detail.qa_answer|stripslashes}}
 </td></tr></table>
                </td>
            </tr>

        </table>
        
    </form><br />
     <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
	  <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
  
</div>
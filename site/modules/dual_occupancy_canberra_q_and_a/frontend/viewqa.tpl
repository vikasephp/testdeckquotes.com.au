
{{include file=$jdata}}
{{include file=$tiny_basic}}
{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />


<style>
input[type="checkbox"] {
  display: none;
}

input[type="checkbox"] + label:before {
  background: #F00 ;	
  border: 1px solid #7f83a2;
  content: "\00a0";
  display: inline-block;
  font: 16px/1em sans-serif;
  height: 16px;
  margin: 0 .25em 0 0;
  padding: 0;
  vertical-align: top;
  width: 16px;
}
input[type="checkbox"]:checked + label:before {
  background: #FFF ;
  color: #666;
  content: "\2713";
  text-align: center;
  cursor:pointer;
}
</style>


<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    

      <form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}"  />
          
            <tr>
                <th width="100">Question:</th>
                  <td width="500">
                   <table  width="500" id="none-table22"><tr><td>
                <td>
                {{$detail.docqa_question}}
                </td></tr></table>
                 </td>
            </tr>        
            <tr>
                <th>Answer:</th>
                <td width="500">
                <table  width="500" id="none-table22">
					<tr>
						<td>               
						{{$detail.docqa_answer|stripslashes}}
						</td>
					</tr>
				</table>
                </td>
            </tr>

        </table>
    </form>
	
  
</div>
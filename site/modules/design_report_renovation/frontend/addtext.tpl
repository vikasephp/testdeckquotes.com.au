<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
{{include file=$jdata}}
{{include file=$tiny_basic}}
{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
		
<div align="center">
   <br /> <h3 class="page-title">Update Advertising Script</h3>   
     
    {{if $opr}}
		<div align="center" style="min-height:250px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}
    
     <form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
        <table id="di-table" width="90%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$this_id}}" />
            {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
                   
             <tr> <td> Advertising Script </td>
             <td> <textarea name="{{$TABLE}}[di_as_text]" cols="120" rows="15">{{$detail.di_as_text}} </textarea></td>    
             </tr>     
            
            <tr>
                <td colspan="4" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}';javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
            </tr>
        </table>
    </form>
	
   {{/if}} 
</div>